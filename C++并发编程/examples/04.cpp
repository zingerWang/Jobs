#include <cassert>
#include <iostream>
#include <stdexcept>
#include <thread>
class join_guard {
    std::thread& thread_;
public:
    explicit join_guard(std::thread& t) noexcept : thread_(t) {}
    join_guard(const join_guard&) = delete;
    join_guard& operator=(const join_guard&) = delete;
    ~join_guard() { if (thread_.joinable()) thread_.join(); }
};
int main() {
    bool done = false;
    try {
        std::thread worker([&] { done = true; });
        join_guard guard(worker);
        throw std::runtime_error("main task failed");
    } catch (const std::exception& e) {
        assert(done);
        std::cout << e.what() << "; worker joined\n";
    }
}
