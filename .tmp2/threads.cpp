// 文件名：threads.cpp  编译：g++ -std=c++20 threads.cpp -o threads -pthread
#include <atomic>
#include <cstdio>
#include <latch>
#include <thread>
#include <vector>

int main() {
    // 1) C++20 jthread：析构时自动 request_stop + join，不需要手写 join 收尾
    std::atomic<int> total{0};
    std::latch start{1};                     // 让所有线程同时起跑，结果可复现
    {
        std::vector<std::jthread> pool;
        for (int t = 0; t < 4; ++t) {
            pool.emplace_back([&total, &start] {
                start.wait();
                for (int i = 0; i < 1000; ++i) total.fetch_add(1, std::memory_order_relaxed);
            });
        }
        start.count_down();                  // 发令
    }                                        // 离开作用域：jthread 自动 join
    std::printf("1) 4 个线程各加 1000 次，total = %d（无锁原子累加）\n", total.load());

    // 2) stop_token：协作式取消，线程自己决定何时退出
    std::atomic<bool> saw_stop{false};
    int loops = 0;
    {
        std::jthread worker([&saw_stop, &loops](std::stop_token st) {
            while (!st.stop_requested()) { ++loops; }
            saw_stop.store(true);
        });
        while (loops < 100000) { std::this_thread::yield(); }
        worker.request_stop();               // 请求停止，不是强杀
    }
    std::printf("2) stop_token：线程收到停止请求并自行退出 = %s\n", saw_stop.load() ? "是" : "否");

    // 3) atomic 的 wait / notify（C++20）：不用条件变量也能等待「值变了」
    std::atomic<int> flag{0};
    std::thread producer([&flag] {
        flag.store(1);
        flag.notify_one();                   // 唤醒等待者
    });
    flag.wait(0);                            // 等到 flag != 0 才继续
    producer.join();
    std::printf("3) atomic::wait 等到 flag = %d\n", flag.load());
    return 0;
}
