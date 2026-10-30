#include <array>
#include <atomic>
#include <cassert>
#include <cstddef>
#include <iostream>
#include <thread>
#include "spsc_queue.hpp"

int main() {
    SpscQueue<3> small;
    int value=0;
    assert(!small.try_pop(value));
    assert(small.try_push(7) && small.try_push(8) && !small.try_push(9));
    assert(small.try_pop(value) && value==7);
    assert(small.try_pop(value) && value==8);
    SpscQueue<64> queue;
    constexpr int count=100000;
    std::jthread producer([&]{
        for(int i=0;i<count;++i)
            while(!queue.try_push(i)) std::this_thread::yield();
    });
    // 消费直接在主线程进行，避免第二条线程创建失败留下生产者等待。
    for(int i=0;i<count;++i) {
        while(!queue.try_pop(value)) std::this_thread::yield();
        assert(value==i);
    }
    producer.join();
    assert(!queue.try_pop(value));
    std::cout << "100000 items in FIFO order\n";
}
