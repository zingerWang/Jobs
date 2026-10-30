#include <cassert>
#include <future>
#include <iostream>
#include <stdexcept>
#include <thread>
int main() {
    for(bool fail : {false,true}) {
        std::promise<int> promise;
        auto result=promise.get_future();
        std::jthread worker([p=std::move(promise),fail]() mutable {
            try {
                if(fail) throw std::runtime_error("task failed");
                p.set_value(42);
            } catch (...) { p.set_exception(std::current_exception()); }
        });
        try { int value=result.get(); assert(value==42); std::cout<<value<<'\n'; }
        catch(const std::runtime_error& e) { std::cout<<e.what()<<'\n'; }
    }
}
