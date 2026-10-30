#include "pool.hpp"
#include "async_logger.hpp"
#include <atomic>
#include <cassert>
#include <filesystem>
#include <iostream>

int main() {
    bool invalid=false;
    try { ThreadPool pool(0); } catch(const std::invalid_argument&) { invalid=true; }
    assert(invalid);
    std::atomic<int> finished{0};
    {
        ThreadPool pool(3);
        for(int i=0;i<1000;++i) (void)pool.submit([&]{++finished;});
        pool.shutdown();
        pool.shutdown(); // 管理者重复串行关闭应安全。
    }
    assert(finished==1000);
    {
        AsyncLogger logger("empty.log",1,1);
        auto stats=logger.close();
        assert(stats.first==0 && stats.second==0);
        assert(!logger.log("rejected"));
        assert(logger.close()==stats);
    }
    {
        AsyncLogger logger("closing.log",1,1);
        std::atomic<int> accepted{0};
        auto produce=[&]{
            for(int i=0;i<10000;++i) {
                if(!logger.log("line")) break;
                accepted.fetch_add(1);
            }
        };
        auto a=std::async(std::launch::async,produce);
        auto b=std::async(std::launch::async,produce);
        // 关闭可能与满队列等待、提交或首次进入并发发生。
        auto stats=logger.close();
        a.get();b.get();
        assert(stats.first==stats.second);
        assert(stats.first==static_cast<std::size_t>(accepted.load()));
    }
    {
        // 路径使用已存在的目录，可靠地触发打开文件失败。
        std::filesystem::create_directory("not-a-log-file");
        bool failed=false;
        try { AsyncLogger logger("not-a-log-file",1,1); }
        catch(const std::ios_base::failure&) {failed=true;}
        assert(failed);
    }
    {
        AsyncLogger logger("validation.log",1,1);
        bool rejected=false;
        try {logger.log("two\nlines");}
        catch(const std::invalid_argument&) {rejected=true;}
        assert(rejected);
        auto stats=logger.close();
        assert(stats.first==0 && stats.second==0);
    }
    std::cout << "pool drain and logger lifecycle checks passed\n";
}
