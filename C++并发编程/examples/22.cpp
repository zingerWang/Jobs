#include <cassert>
#include <chrono>
#include <future>
#include <iostream>
int main() {
    auto lazy=std::async(std::launch::deferred,[]{return 7;});
    assert(lazy.wait_for(std::chrono::seconds(0))==std::future_status::deferred);
    assert(lazy.get()==7);
    auto a=std::async(std::launch::async,[]{return 20;});
    auto b=std::async(std::launch::async,[]{return 22;});
    int total=a.get()+b.get();
    assert(total==42);
    std::cout << total << '\n';
}
