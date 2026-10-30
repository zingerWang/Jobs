#include <atomic>
#include <barrier>
#include <cassert>
#include <cstdlib>
#include <iostream>
#include <mutex>
#include <string>
#include <thread>

std::atomic<int> tickets{1}, sold{0};
// Named functions are stable breakpoint locations in an -O0 -g build.
void before_commit(int seen) { (void)seen; }
void before_second_lock() {}
void reproduce_race() {
    std::barrier both_read(2);
    auto buy = [&] {
        int seen = tickets.load();
        before_commit(seen);
        both_read.arrive_and_wait();
        if (seen > 0) { tickets.store(seen - 1); sold.fetch_add(1); }
    };
    std::jthread worker(buy);
    buy();
    worker.join();
    assert(tickets == 0 && sold == 2);
    std::cout << "logical race reproduced: tickets=0 sold=2\n";
}
void reproduce_deadlock() {
    std::mutex first, second;
    std::barrier each_has_one(2);
    std::jthread worker([&] {
        std::lock_guard a(first);
        each_has_one.arrive_and_wait();
        before_second_lock();
        std::lock_guard b(second);
    });
    std::lock_guard b(second);
    each_has_one.arrive_and_wait();
    before_second_lock();
    std::lock_guard a(first); // intentional wait cycle: requires debugger/timeout
}
int main(int argc, char** argv) {
    std::string mode = argc > 1 ? argv[1] : "--race";
    if (mode == "--race") reproduce_race();
    else if (mode == "--hang") reproduce_deadlock();
    else if (mode == "--crash") {
        // An intentional crash snapshot, NOT proof of a data race.
        std::jthread worker([] { std::abort(); });
    } else return 2;
}
