#include <atomic>
#include <cassert>
#include <iostream>
#include <thread>
int main() {
    int data=0,result=0;
    std::atomic<int> state{0};
    std::jthread consumer([&]{
        state.wait(0,std::memory_order_acquire);
        result=data;
    });
    data=42;
    state.store(1,std::memory_order_release);
    state.notify_one();
    consumer.join();
    assert(result==42);
    std::cout << result << '\n';
}
