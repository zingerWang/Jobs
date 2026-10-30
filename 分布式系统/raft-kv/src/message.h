#pragma once

// 节点间传递的 RPC 消息。
// 阶段 2 只用到了 RequestVote（选举投票）和 AppendEntries（先当心跳用）。
// 阶段 3 会给 AppendEntries 加上日志条目，做真正的日志复制。
struct Message {
    enum Type : int {
        RequestVote,        // 候选人 → 其他节点：请给我投票
        RequestVoteReply,   // 其他节点 → 候选人：投票结果
        AppendEntries,      // Leader → 其他节点：心跳（阶段 3 会带日志）
        AppendEntriesReply, // 其他节点 → Leader：心跳响应
    };

    int from = -1;       // 发送方节点 id
    int to = -1;         // 接收方节点 id
    Type type = AppendEntries;
    int term = 0;        // 发送方的任期

    bool granted = false; // RequestVoteReply 用：是否同意投票
    bool success = false; // AppendEntriesReply 用：是否接受
};
