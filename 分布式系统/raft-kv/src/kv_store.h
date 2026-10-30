#pragma once

#include <optional>
#include <string>
#include <unordered_map>

// 单节点内存 KV 存储（阶段 1）
//
// 这个类将来会演变成 Raft 的「状态机（state machine）」：
// 阶段 4 里，客户端的写请求会先被封装成「命令」，追加到 Raft 日志、
// 复制到多数派节点，提交后再 apply 到这个 KV 存储上。
// 所以现在把它单独抽成一个类，是为了将来好替换/扩展。
class KVStore {
public:
    // 写入或更新一个键值
    void Put(const std::string& key, const std::string& value);

    // 读取一个键的值；不存在则返回 std::nullopt
    std::optional<std::string> Get(const std::string& key) const;

    // 删除一个键
    void Delete(const std::string& key);

    // 当前键值对数量（调试用）
    size_t Size() const { return data_.size(); }

private:
    std::unordered_map<std::string, std::string> data_;
};
