#include "raft.h"

#include <chrono>
#include <iostream>
#include <memory>
#include <string>
#include <thread>
#include <vector>

namespace {
const char* stateShort(RaftNode::State s) {
    switch (s) {
        case RaftNode::State::Follower:  return "F";
        case RaftNode::State::Candidate: return "C";
        case RaftNode::State::Leader:    return "L";
    }
    return "?";
}
}  // namespace

int main() {
    const int N = 5;

    // RaftNode 含 std::mutex，不可拷贝/移动，所以用 unique_ptr 存。
    std::vector<RaftNode*> peers;
    std::vector<std::unique_ptr<RaftNode>> nodes;
    peers.reserve(N);
    nodes.reserve(N);
    for (int i = 0; i < N; ++i) {
        nodes.push_back(std::make_unique<RaftNode>(i, N, &peers));
    }
    for (int i = 0; i < N; ++i) {
        peers.push_back(nodes[i].get());
    }

    for (auto& n : nodes) n->start();

    auto print_states = [&]() {
        int leader = -1;
        for (auto& n : nodes) {
            if (!n->isStopped() && n->state() == RaftNode::State::Leader) leader = n->id();
        }
        std::cout << "领导者: " << (leader >= 0 ? std::to_string(leader) : "无")
                  << "   |  ";
        for (auto& n : nodes) {
            std::cout << "[" << n->id() << ":"
                      << (n->isStopped() ? "X" : stateShort(n->state()))
                      << " t" << n->term() << "] ";
        }
        std::cout << "\n";
        return leader;
    };

    std::cout << "=== 5 个节点启动，等待选出领导者 ===\n";
    for (int t = 0; t < 6; ++t) {
        std::this_thread::sleep_for(std::chrono::milliseconds(400));
        print_states();
    }

    int leader = -1;
    for (auto& n : nodes) {
        if (n->state() == RaftNode::State::Leader) leader = n->id();
    }

    if (leader >= 0) {
        std::cout << "\n=== 杀掉领导者节点 " << leader << "，观察重新选举 ===\n";
        nodes[leader]->stop();
        for (int t = 0; t < 8; ++t) {
            std::this_thread::sleep_for(std::chrono::milliseconds(400));
            print_states();
        }
    } else {
        std::cout << "\n（未能选出领导者）\n";
    }

    for (auto& n : nodes) n->stop();
    return 0;
}
