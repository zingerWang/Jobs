#include <cassert>
#include <condition_variable>
#include <iostream>
#include <mutex>
#include <queue>
#include <thread>
int main() {
    std::mutex mutex;
    std::condition_variable cv;
    std::queue<int> queue;
    bool closed=false;
    int total=0;
    std::jthread consumer([&] {
        for (;;) {
            std::unique_lock<std::mutex> lock(mutex);
            cv.wait(lock,[&]{return closed || !queue.empty();});
            if(queue.empty()) break; // 谓词为真且为空，只能是已关闭。
            int item=queue.front(); queue.pop();
            lock.unlock();
            total+=item;
        }
    });
    for(int i=1;i<=100;++i) {
        { std::lock_guard<std::mutex> lock(mutex); queue.push(i); }
        cv.notify_one();
    }
    { std::lock_guard<std::mutex> lock(mutex); closed=true; }
    cv.notify_all();
    consumer.join();
    assert(total==5050);
    std::cout << total << '\n';
}
