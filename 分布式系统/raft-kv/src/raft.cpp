#include "raft.h"

#include <iostream>

namespace {

// 选举超时范围：随机化是为了避免多个节点同时超时、同时竞选导致「永远选不出」。
constexpr std::chrono::milliseconds kElectionMin{150};
constexpr std::chrono::milliseconds kElectionMax{300};
constexpr std::chrono::milliseconds kHeartbeatInterval{50};

std::string stateToString(RaftNode::State s) {
    switch (s) {
        case RaftNode::State::Follower:  return "Follower";
        case RaftNode::State::Candidate: return "Candidate";
        case RaftNode::State::Leader:    return "Leader";
    }
    return "?";
}

std::mutex g_log_mutex;

}  // namespace

RaftNode::RaftNode(int id, int total, std::vector<RaftNode*>* peers)
    : id_(id), total_(total), peers_(peers), rng_(std::random_device{}()) {}

RaftNode::~RaftNode() {
    stop();
}

void RaftNode::start() {
    thread_ = std::thread(&RaftNode::run, this);
}

void RaftNode::stop() {
    stop_.store(true);
    cv_.notify_all();
    if (thread_.joinable()) {
        thread_.join();
    }
}

void RaftNode::deliver(const Message& msg) {
    {
        std::lock_guard<std::mutex> lk(mtx_);
        inbox_.push(msg);
    }
    cv_.notify_all();
}

void RaftNode::log(const std::string& s) const {
    std::lock_guard<std::mutex> lk(g_log_mutex);
    std::cout << "[节点 " << id_ << " term=" << term_ << "] " << s << std::endl;
}

void RaftNode::resetElectionDeadlineLocked() {
    std::uniform_int_distribution<int> dist(kElectionMin.count(), kElectionMax.count());
    auto ms = std::chrono::milliseconds(dist(rng_));
    deadline_ = std::chrono::steady_clock::now() + ms;
}

void RaftNode::run() {
    {
        std::lock_guard<std::mutex> lk(mtx_);
        resetElectionDeadlineLocked();
    }

    while (!stop_.load()) {
        std::vector<Message> outgoing;
        bool timed_out = false;

        {
            std::unique_lock<std::mutex> lk(mtx_);
            // 等待：有消息进来，或者选举/心跳超时
            if (cv_.wait_until(lk, deadline_, [this] {
                    return !inbox_.empty() || stop_.load();
                })) {
                if (stop_.load()) break;
                Message msg = inbox_.front();
                inbox_.pop();
                outgoing = processMessageLocked(msg);
            } else {
                timed_out = true;
                if (state_ == State::Leader) {
                    outgoing = sendHeartbeatsLocked();
                    deadline_ = std::chrono::steady_clock::now() + kHeartbeatInterval;
                } else {
                    outgoing = startElectionLocked();
                }
            }
        }  // 释放锁，再发消息，避免死锁

        for (const auto& m : outgoing) {
            if (m.to >= 0 && m.to < total_) {
                (*peers_)[m.to]->deliver(m);
            }
        }
    }
}

// 处理一条消息，返回需要回复/转发出去的消息。调用方保证持有 mtx_。
std::vector<Message> RaftNode::processMessageLocked(const Message& msg) {
    std::vector<Message> out;

    switch (msg.type) {
        case Message::RequestVote: {
            Message reply;
            reply.from = id_;
            reply.to = msg.from;
            reply.type = Message::RequestVoteReply;
            reply.term = term_;
            reply.granted = false;

            if (msg.term < term_) {
                // 对方任期太旧，拒绝
            } else if (msg.term > term_) {
                // 对方任期更新：更新任期、降级为 Follower、把票投给它
                term_ = msg.term;
                state_ = State::Follower;
                votedFor_ = msg.from;
                reply.term = term_;
                reply.granted = true;
                resetElectionDeadlineLocked();
            } else {
                // 任期相同：本任期没投过票，或已经投给同一候选人，才投
                if (votedFor_ == -1 || votedFor_ == msg.from) {
                    votedFor_ = msg.from;
                    reply.granted = true;
                    resetElectionDeadlineLocked();
                }
            }
            out.push_back(reply);
            break;
        }

        case Message::RequestVoteReply: {
            // 只有「还是候选人、任期一致」时才统计票数
            if (state_ == State::Candidate && msg.term == term_) {
                if (msg.granted) {
                    ++votesReceived_;
                    log("收到一票，当前 " + std::to_string(votesReceived_) + " 票");
                    if (votesReceived_ > total_ / 2) {
                        // 拿到多数派 → 成为领导者
                        state_ = State::Leader;
                        leaderId_ = id_;
                        log("成为 Leader（term=" + std::to_string(term_) + "）");
                        // 领导者改用「心跳间隔」作为周期，而不是继续用选举超时，
                        // 否则第一次周期心跳会拖 150~300ms 才发，导致 follower 超时、
                        // 反过来把 leader 拉下马（领导权反复易主）。
                        deadline_ = std::chrono::steady_clock::now() + kHeartbeatInterval;
                        // 立即广播一轮心跳，宣告领导地位
                        auto hb = sendHeartbeatsLocked();
                        out.insert(out.end(), hb.begin(), hb.end());
                    }
                }
            }
            break;
        }

        case Message::AppendEntries: {
            Message reply;
            reply.from = id_;
            reply.to = msg.from;
            reply.type = Message::AppendEntriesReply;
            reply.term = term_;
            reply.success = false;

            if (msg.term < term_) {
                // 过期领导者的心跳，拒绝
            } else {
                // 有效心跳：更新任期、降级为 Follower、记录领导者、重置超时
                term_ = msg.term;
                state_ = State::Follower;
                leaderId_ = msg.from;
                votedFor_ = -1;
                reply.term = term_;
                reply.success = true;
                resetElectionDeadlineLocked();
            }
            out.push_back(reply);
            break;
        }

        case Message::AppendEntriesReply: {
            // 阶段 2 里心跳的响应可以忽略；阶段 3 做日志复制时才会用到它
            break;
        }
    }
    return out;
}

// 发起选举：任期 +1、投自己一票、向其他节点要票。调用方保证持有 mtx_。
std::vector<Message> RaftNode::startElectionLocked() {
    std::vector<Message> out;

    ++term_;
    votedFor_ = id_;
    votesReceived_ = 1;  // 自己投自己
    state_ = State::Candidate;
    leaderId_ = -1;
    resetElectionDeadlineLocked();
    log("超时，发起选举，term=" + std::to_string(term_));

    for (int j = 0; j < total_; ++j) {
        if (j == id_) continue;
        Message req;
        req.from = id_;
        req.to = j;
        req.type = Message::RequestVote;
        req.term = term_;
        out.push_back(req);
    }
    return out;
}

// 领导者给所有其他节点发心跳（阶段 2 里 AppendEntries 不带日志）。调用方保证持有 mtx_。
std::vector<Message> RaftNode::sendHeartbeatsLocked() {
    std::vector<Message> out;
    for (int j = 0; j < total_; ++j) {
        if (j == id_) continue;
        Message hb;
        hb.from = id_;
        hb.to = j;
        hb.type = Message::AppendEntries;
        hb.term = term_;
        out.push_back(hb);
    }
    return out;
}
