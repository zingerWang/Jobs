#include <atomic>
#include <cassert>
#include <iostream>
#include <thread>
int main() {
    std::atomic<unsigned> count{0};
    auto work=[&]{for(unsigned i=0;i<100000;++i) count.fetch_add(1,std::memory_order_relaxed);};
    std::jthread a(work),b(work);
    a.join(); b.join();
    assert(count.load()==200000);
    std::cout << "count=" << count.load() << " lock_free=" << count.is_lock_free() << '\n';
}
