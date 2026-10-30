#include <atomic>
#include <cassert>
#include <iostream>
#include <mutex>
#include <thread>
class SpinMutex {
    std::atomic_flag flag_=ATOMIC_FLAG_INIT;
public:
    void lock() {
        while(flag_.test_and_set(std::memory_order_acquire)) std::this_thread::yield();
    }
    void unlock() {flag_.clear(std::memory_order_release);}
};
int main() {
    SpinMutex mutex;
    int counter=0;
    auto work=[&]{for(int i=0;i<10000;++i){std::lock_guard<SpinMutex> lock(mutex);++counter;}};
    std::jthread a(work),b(work);
    a.join();b.join();
    assert(counter==20000);
    std::cout << "counter=" << counter << "; algorithm uses a blocking spin lock\n";
}
