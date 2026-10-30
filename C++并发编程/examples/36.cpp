#include <atomic>
#include <cassert>
#include <iostream>
#include <thread>
void atomic_max(std::atomic<int>& target,int candidate) {
    int observed=target.load(std::memory_order_relaxed);
    while(observed<candidate &&
          !target.compare_exchange_weak(observed,candidate,
                  std::memory_order_relaxed,std::memory_order_relaxed)) {}
}
int main() {
    std::atomic<int> maximum{0};
    std::jthread a([&]{for(int i=1;i<=1000;++i) atomic_max(maximum,i);});
    std::jthread b([&]{for(int i=2000;i>=1001;--i) atomic_max(maximum,i);});
    a.join();b.join();
    assert(maximum==2000);
    std::cout << maximum << '\n';
}
