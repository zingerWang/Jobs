#include <array>
#include <cassert>
#include <barrier>
#include <iostream>
#include <latch>
#include <semaphore>
#include <thread>
int main() {
    std::binary_semaphore permit(1);
    permit.acquire(); permit.release();
    std::array<int,2> values{0,0};
    std::latch initialized(2);
    int phase=0,total=0;
    std::barrier sync(2,[&]() noexcept {
        ++phase;
        if(phase==2) total=values[0]+values[1];
    });
    auto work=[&](int i) {
        values[i]=i+1;
        initialized.count_down();
        sync.arrive_and_wait();
        values[i]*=2;
        sync.arrive_and_wait();
    };
    std::jthread a(work,0);
    std::jthread b;
    try { b=std::jthread(work,1); }
    catch (...) {
        // 撤销未启动参与者的 latch 和 barrier 份额。
        initialized.count_down();
        sync.arrive_and_drop();
        a.join();
        throw;
    }
    initialized.wait();
    a.join(); b.join();
    assert(total==6 && phase==2);
    std::cout << "phases=" << phase << " total=" << total << '\n';
}
