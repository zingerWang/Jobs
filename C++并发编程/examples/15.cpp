#include <cassert>
#include <chrono>
#include <condition_variable>
#include <iostream>
#include <mutex>
int main() {
    std::mutex mutex;
    std::condition_variable cv;
    bool ready=false;
    {
        std::unique_lock<std::mutex> lock(mutex);
        const auto past=std::chrono::steady_clock::now()-std::chrono::seconds(1);
        bool ok=cv.wait_until(lock,past,[&]{return ready;});
        assert(!ok);
    }
    { std::lock_guard<std::mutex> lock(mutex); ready=true; }
    cv.notify_all();
    std::unique_lock<std::mutex> lock(mutex);
    cv.wait(lock,[&]{return ready;});
    std::cout << "timeout checked; early notification safe\n";
}
