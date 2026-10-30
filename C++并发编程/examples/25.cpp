#include "pool.hpp"
#include <cassert>
#include <iostream>
int main() {
    ThreadPool pool(3);
    std::vector<std::future<int>> results;
    for(int i=0;i<20;++i) results.push_back(pool.submit([i]{return i*i;}));
    auto failed=pool.submit([]()->int {throw std::runtime_error("task error");});
    int sum=0; for(auto& f:results) sum+=f.get();
    assert(sum==2470);
    bool caught=false;
    try { (void)failed.get(); } catch(const std::runtime_error&) { caught=true; }
    assert(caught);
    std::cout << "sum=" << sum << " exception propagated\n";
}
