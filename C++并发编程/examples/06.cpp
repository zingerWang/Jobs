#include <atomic>
#include <future>
#include <iostream>
#include <thread>
int main() {
    std::promise<void> started;
    auto ready = started.get_future();
    std::atomic<unsigned> steps{0};
    std::jthread worker([&](std::stop_token token) {
        started.set_value();
        while (!token.stop_requested()) {
            steps.fetch_add(1, std::memory_order_relaxed);
            std::this_thread::yield();
        }
    });
    ready.wait();
    worker.request_stop();
    worker.join();
    std::cout << "stopped, steps=" << steps.load() << '\n';
}
