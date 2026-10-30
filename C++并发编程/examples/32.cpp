#include <atomic>
#include <cassert>
#include <iostream>
#include <thread>
int main() {
    int data=0,observed=0;
    std::atomic<bool> ready{false};
    std::jthread producer([&]{data=42; ready.store(true,std::memory_order_release);});
    std::jthread consumer([&]{
        while(!ready.load(std::memory_order_acquire)) std::this_thread::yield();
        observed=data;
    });
    producer.join(); consumer.join();
    assert(observed==42);
    std::cout << observed << '\n';
}
