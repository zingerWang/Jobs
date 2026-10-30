#include <atomic>
#include <cassert>
#include <iostream>
#include <thread>
#include <vector>
int main() {
    std::atomic<unsigned> completed{0};
    std::vector<std::jthread> workers;
    for(int k=0;k<4;++k) workers.emplace_back([&]{
        for(int i=0;i<10000;++i) completed.fetch_add(1,std::memory_order_relaxed);
    });
    for(auto& t:workers) t.join();
    auto count=completed.load(std::memory_order_relaxed);
    assert(count==40000);
    std::cout << count << '\n';
}
