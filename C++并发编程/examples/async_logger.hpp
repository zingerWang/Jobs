#pragma once
#include <algorithm>
#include <condition_variable>
#include <cstddef>
#include <exception>
#include <fstream>
#include <mutex>
#include <queue>
#include <stdexcept>
#include <string>
#include <thread>
#include <utility>
#include <vector>

// log 可多生产者调用；close 由外部拥有者串行调用。
// 析构前必须停止并回收全部生产者。
class AsyncLogger {
    std::mutex mutex_;
    std::condition_variable not_empty_,not_full_;
    std::queue<std::string> queue_;
    const std::size_t capacity_,batch_size_;
    bool closing_=false;
    std::exception_ptr error_;
    std::size_t accepted_=0,written_=0;
    std::ofstream output_;
    std::thread worker_;
    void run() noexcept {
        try {
            std::vector<std::string> batch;
            batch.reserve(batch_size_);
            for (;;) {
                batch.clear();
                {
                    std::unique_lock<std::mutex> lock(mutex_);
                    not_empty_.wait(lock,[this]{return closing_ || !queue_.empty();});
                    if(queue_.empty()) break;
                    const auto count=std::min(batch_size_,queue_.size());
                    for(std::size_t i=0;i<count;++i){
                        batch.push_back(std::move(queue_.front()));queue_.pop();
                    }
                }
                not_full_.notify_all();
                for(const auto& line:batch) output_<<line<<'\n';
                output_.flush();
                written_+=batch.size(); // 只由写线程修改，join 后读取。
            }
            output_.flush();
            output_.close();
        } catch (...) {
            {
                std::lock_guard<std::mutex> lock(mutex_);
                error_=std::current_exception();closing_=true;
                // 写出失败后不能承诺排空；释放尚未处理的内存。
                std::queue<std::string> abandoned;
                queue_.swap(abandoned);
            }
            not_full_.notify_all();not_empty_.notify_all();
        }
    }
    void finish() {
        {std::lock_guard<std::mutex> lock(mutex_);closing_=true;}
        not_full_.notify_all();not_empty_.notify_all();
        if(worker_.joinable()) worker_.join();
    }
public:
    AsyncLogger(const std::string& path,std::size_t capacity,std::size_t batch_size)
        :capacity_(capacity),batch_size_(batch_size){
        if(!capacity || !batch_size) throw std::invalid_argument("zero capacity or batch");
        output_.exceptions(std::ios::badbit|std::ios::failbit);
        output_.open(path,std::ios::out|std::ios::trunc);
        worker_=std::thread([this]{run();});
    }
    AsyncLogger(const AsyncLogger&)=delete;
    AsyncLogger& operator=(const AsyncLogger&)=delete;
    bool log(std::string line){
        if(line.find_first_of("\r\n")!=std::string::npos)
            throw std::invalid_argument("one record must be one line");
        std::unique_lock<std::mutex> lock(mutex_);
        not_full_.wait(lock,[this]{return closing_ || queue_.size()<capacity_;});
        if(error_) std::rethrow_exception(error_);
        if(closing_) return false;
        queue_.push(std::move(line));++accepted_;
        lock.unlock();not_empty_.notify_one();
        return true;
    }
    std::pair<std::size_t,std::size_t> close(){
        finish();
        std::lock_guard<std::mutex> lock(mutex_);
        if(error_) std::rethrow_exception(error_);
        return {accepted_,written_};
    }
    ~AsyncLogger(){finish();} // 析构兜底；I/O 故障应通过显式 close 观察。
};
