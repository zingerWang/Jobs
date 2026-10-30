#pragma once

#include "message.h"

#include <atomic>
#include <chrono>
#include <condition_variable>
#include <mutex>
#include <queue>
#include <random>
#include <string>
#include <thread>
#include <vector>

// 一个 Raft 节点（阶段 2：只实现领导者选举 + 心跳）。
//
// 角色：Follower（跟随者）、Candidate（候选人）、Leader（领导者）。
// 选举流程：Follower 超时 → 变 Candidate、任期 +1 → 向其他节点要票 →
//           拿到多数派票 → 变 Leader → 周期发心跳维持地位。
//
// 并发模型：每个节点一个线程。所有 Raft 状态由 mtx_ 保护；
// 收件箱 inbox_ 也由 mtx_ + cv_ 保护（用同一个锁，配合 wait_until 实现「超时选举」）。
// 发送消息统一在「释放自己的锁之后」进行，避免两个节点互相持锁死锁。
class RaftNode {
public:
    enum class State : int { Follower, Candidate, Leader };

    // id: 节点编号（0 ~ total-1）；peers: 指向所有节点指针的共享数组（含自己）
    RaftNode(int id, int total, std::vector<RaftNode*>* peers);
    ~RaftNode();

    void start();
    void stop();

    // 由「网络层」调用：往本节点收件箱投递一条消息
    void deliver(const Message& msg);

    // 观察用（线程安全地读取状态）
    int id() const { return id_; }
    State state() const { return state_.load(); }
    int term() const { return term_.load(); }
    int leaderId() const { return leaderId_.load(); }
    bool isStopped() const { return stop_.load(); }

private:
    void run();
    void resetElectionDeadlineLocked();
    std::vector<Message> processMessageLocked(const Message& msg);
    std::vector<Message> startElectionLocked();
    std::vector<Message> sendHeartbeatsLocked();
    void log(const std::string& s) const;

    int id_;
    int total_;
    std::vector<RaftNode*>* peers_;

    // ---- Raft 状态 ----
    // state_ / term_ / leaderId_ 用原子类型：既在 mtx_ 下修改，也允许 main 线程无锁观察。
    // votedFor_ / votesReceived_ / deadline_ 只由 mtx_ 保护（内部一致性用）。
    std::atomic<State> state_{State::Follower};
    std::atomic<int> term_{0};
    std::atomic<int> leaderId_{-1};

    int votedFor_ = -1;      // 本任期投给了谁（-1 表示还没投）
    int votesReceived_ = 0;  // 候选人在本任期收到的票数

    std::chrono::steady_clock::time_point deadline_;  // 选举超时 / 心跳的截止时间

    // ---- 收件箱 + 并发 ----
    std::queue<Message> inbox_;
    std::mutex mtx_;
    std::condition_variable cv_;

    std::thread thread_;
    std::atomic<bool> stop_{false};

    std::mt19937 rng_;  // 生成随机选举超时（避免多个节点同时超时）
};
