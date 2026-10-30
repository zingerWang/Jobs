#include <atomic>
#include <barrier>
#include <cassert>
#include <iostream>
#include <thread>
int main() {
    std::atomic<int> tickets{1},sold{0};
    std::barrier both_read(2);
    auto flawed=[&]{
        const int seen=tickets.load();
        both_read.arrive_and_wait();
        if(seen>0){tickets.store(seen-1);sold.fetch_add(1);}
    };
    std::jthread a(flawed);
    // 主线程作为另一个参与者，避免第二条线程创建失败使屏障悬挂。
    flawed();
    a.join();
    assert(sold==2 && tickets==0);
    std::cout << "BUG reproduced: sold=2 with initial stock=1\n";
}
