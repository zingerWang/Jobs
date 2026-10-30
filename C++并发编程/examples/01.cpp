#include <cassert>
#include <cstdint>
#include <iostream>
#include <thread>

std::uint64_t sum(std::uint64_t first, std::uint64_t last) {
    std::uint64_t result = 0;
    for (auto i = first; i <= last; ++i) result += i;
    return result;
}
int main() {
    std::uint64_t left = 0, right = 0;
    std::thread a([&] { left = sum(1, 500000); });
    // 若第二次创建失败，也必须回收已启动的线程。
    try {
        std::thread b([&] { right = sum(500001, 1000000); });
        b.join();
    } catch (...) { a.join(); throw; }
    a.join();
    assert(left + right == 500000500000ULL);
    std::cout << left + right << '\n';
}
