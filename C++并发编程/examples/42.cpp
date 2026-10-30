#include <atomic>
#include <cassert>
#include <chrono>
#include <functional>
#include <iostream>
#include <thread>
struct alignas(64) Packed { std::atomic<unsigned> a{0},b{0}; };
struct alignas(64) Cell { std::atomic<unsigned> value{0}; };
struct Padded { Cell a,b; };
long long measure(std::atomic<unsigned>& a,std::atomic<unsigned>& b) {
    a.store(0);b.store(0);
    std::atomic<bool> go{false};
    std::atomic<unsigned> ready{0};
    auto work=[&](std::atomic<unsigned>& counter){
        ready.fetch_add(1);
        go.wait(false,std::memory_order_acquire);
        for(unsigned i=0;i<300000;++i) counter.fetch_add(1,std::memory_order_relaxed);
    };
    std::jthread first(work,std::ref(a));
    std::jthread second;
    try {second=std::jthread(work,std::ref(b));}
    catch (...) {go.store(true,std::memory_order_release);go.notify_all();first.join();throw;}
    while(ready.load()!=2) std::this_thread::yield();
    auto begin=std::chrono::steady_clock::now();
    go.store(true,std::memory_order_release);go.notify_all();
    first.join();second.join();
    auto end=std::chrono::steady_clock::now();
    assert(a.load()==300000 && b.load()==300000);
    return std::chrono::duration_cast<std::chrono::microseconds>(end-begin).count();
}
int main() {
    Packed packed; Padded padded;
    std::cout << "packed addresses=" << &packed.a << ' ' << &packed.b << '\n';
    std::cout << "padded addresses=" << &padded.a.value << ' ' << &padded.b.value << '\n';
    for(int i=0;i<5;++i) {
        long long x,y;
        if(i%2==0){x=measure(packed.a,packed.b);y=measure(padded.a.value,padded.b.value);}
        else {y=measure(padded.a.value,padded.b.value);x=measure(packed.a,packed.b);}
        std::cout << "round=" << i << " packed_us=" << x << " padded_us=" << y << '\n';
    }
}
