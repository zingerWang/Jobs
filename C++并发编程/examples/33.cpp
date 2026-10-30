#include <array>
#include <atomic>
#include <cassert>
#include <iostream>
#include <thread>
int main() {
    std::array<int,2> values{0,0};
    std::atomic<bool> ready{false};
    std::atomic<int> visits{0};
    int sum=0;
    std::jthread producer([&]{values={20,22};ready.store(true,std::memory_order_release);});
    std::jthread reader([&]{
        while(!ready.load(std::memory_order_acquire)) std::this_thread::yield();
        sum=values[0]+values[1];
        visits.fetch_add(1,std::memory_order_relaxed);
    });
    producer.join();reader.join();
    assert(sum==42 && visits.load()==1);
    std::cout << "sum=" << sum << " visits=" << visits.load() << '\n';
}
