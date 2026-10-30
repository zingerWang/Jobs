#include "pool.hpp"
#include <cassert>
#include <iostream>
int main() {
    ThreadPool pool(1,1);
    std::promise<void> started,release;
    auto entered=started.get_future();
    auto gate=release.get_future().share();
    auto a=pool.submit([&started,gate]{started.set_value(); gate.wait(); return 1;});
    entered.wait();
    auto b=pool.submit([]{return 2;});
    bool rejected=false;
    try { (void)pool.submit([]{return 3;}); }
    catch(const std::runtime_error& e) { rejected=std::string(e.what())=="queue full"; }
    release.set_value();
    assert(rejected && a.get()+b.get()==3);
    pool.shutdown();
    std::cout << "capacity enforced\n";
}
