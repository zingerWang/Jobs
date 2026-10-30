#include <cassert>
#include <condition_variable>
#include <future>
#include <iostream>
#include <mutex>
#include <thread>
int main() {
    std::mutex mutex;
    std::condition_variable_any cv;
    std::promise<void> started;
    auto ready=started.get_future();
    bool interrupted=false;
    std::jthread worker([&](std::stop_token token) {
        std::unique_lock<std::mutex> lock(mutex);
        started.set_value();
        bool has_work=cv.wait(lock,token,[]{return false;});
        interrupted=!has_work && token.stop_requested();
    });
    ready.wait();
    worker.request_stop();
    worker.join();
    assert(interrupted);
    std::cout << "wait interrupted by stop\n";
}
