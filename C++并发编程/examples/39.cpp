#include <atomic>
#include <cassert>
#include <cstdint>
#include <iostream>
std::uint64_t pack(std::uint32_t index,std::uint32_t version) {
    return (std::uint64_t(version)<<32)|index;
}
int main() {
    std::atomic<std::uint64_t> head{pack(1,0)};
    auto old=head.load();
    head.store(pack(2,1));
    head.store(pack(1,2)); // 索引再次为 1，版本已不同。
    bool changed=head.compare_exchange_strong(old,pack(3,1));
    assert(!changed && old==pack(1,2));
    std::cout << "stale CAS rejected; no reclamation implemented\n";
}
