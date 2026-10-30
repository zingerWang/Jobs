#include <iostream>
#include <thread>
int main() {
    unsigned hint = std::thread::hardware_concurrency();
    std::cout << "concurrency hint=" << hint << '\n';
    std::cout << "fallback=" << (hint ? hint : 1) << '\n';
    std::cout << "main=" << std::this_thread::get_id() << '\n';
    std::thread worker([] {
        std::cout << "worker=" << std::this_thread::get_id() << '\n';
    });
    worker.join();
}
