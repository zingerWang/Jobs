#pragma once
#include <condition_variable>
#include <cstddef>
#include <functional>
#include <future>
#include <memory>
#include <mutex>
#include <queue>
#include <stdexcept>
#include <thread>
#include <type_traits>
#include <utility>
#include <vector>

// submit 可并发；shutdown 和析构只能由外部拥有者串行调用。
// 不能从池中任务调用 shutdown，任务也不能销毁所属池。
class ThreadPool {
    std::mutex mutex_;
    std::condition_variable ready_;
    std::queue<std::function<void()>> tasks_;
    std::vector<std::thread> workers_;
    bool stopping_ = false;
    std::size_t capacity_; // 0 表示不限制排队数量。
    void worker() {
        for (;;) {
            std::function<void()> task;
            {
                std::unique_lock<std::mutex> lock(mutex_);
                ready_.wait(lock,[this]{return stopping_ || !tasks_.empty();});
                if(tasks_.empty()) return;
                task=std::move(tasks_.front());
                tasks_.pop();
            }
            task(); // packaged_task 将用户异常存入 future。
        }
    }
public:
    explicit ThreadPool(std::size_t count, std::size_t capacity=0)
        : capacity_(capacity) {
        if(count==0) throw std::invalid_argument("zero workers");
        try {
            for(std::size_t i=0;i<count;++i)
                workers_.emplace_back([this]{worker();});
        } catch (...) {
            { std::lock_guard<std::mutex> lock(mutex_); stopping_=true; }
            ready_.notify_all();
            for(auto& t:workers_) if(t.joinable()) t.join();
            throw;
        }
    }
    ThreadPool(const ThreadPool&)=delete;
    ThreadPool& operator=(const ThreadPool&)=delete;
    template<class F>
    auto submit(F&& f) -> std::future<std::invoke_result_t<std::decay_t<F>&>> {
        using R=std::invoke_result_t<std::decay_t<F>&>;
        auto packaged=std::make_shared<std::packaged_task<R()>>(std::forward<F>(f));
        auto future=packaged->get_future();
        {
            std::lock_guard<std::mutex> lock(mutex_);
            if(stopping_) throw std::runtime_error("pool stopped");
            if(capacity_ && tasks_.size()>=capacity_)
                throw std::runtime_error("queue full");
            tasks_.emplace([packaged]{(*packaged)();});
        }
        ready_.notify_one();
        return future;
    }
    void shutdown(bool drain=true) {
        std::queue<std::function<void()>> abandoned;
        {
            std::lock_guard<std::mutex> lock(mutex_);
            stopping_=true;
            if(!drain) tasks_.swap(abandoned);
        }
        ready_.notify_all();
        // 在锁外销毁未启动任务，使关联 future 以 broken_promise 就绪。
        while(!abandoned.empty()) abandoned.pop();
        for(auto& t:workers_) if(t.joinable()) t.join();
    }
    ~ThreadPool() { shutdown(); }
};
