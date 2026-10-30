#include "pool.hpp"
#include <cassert>
#include <iostream>
int main() {
    ThreadPool pool(1);
    std::promise<void> started,release;
    auto entered=started.get_future();
    auto gate=release.get_future().share();
    auto running=pool.submit([&started,gate]{started.set_value(); gate.wait(); return 1;});
    entered.wait();
    auto pending=pool.submit([]{return 2;});
    std::jthread closer([&]{pool.shutdown(false);});
    bool canceled=false;
    try { (void)pending.get(); }
    catch(const std::future_error& e) {
        canceled=e.code()==std::make_error_code(std::future_errc::broken_promise);
    }
    release.set_value();
    closer.join();
    assert(canceled && running.get()==1);
    bool rejected=false;
    try { (void)pool.submit([]{}); } catch(const std::runtime_error&) { rejected=true; }
    assert(rejected);
    std::cout << "queued canceled; running completed; submit rejected\n";
}
