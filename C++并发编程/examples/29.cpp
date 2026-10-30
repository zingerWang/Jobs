#include "pool.hpp"
#include <cassert>
#include <cstdlib>
#include <exception>
#include <future>
#include <iostream>
#include <stdexcept>
#include <string>
#include <thread>

int main(int argc, char** argv) {
    if (argc == 2 && std::string(argv[1]) == "--terminate") {
        std::set_terminate([] { std::_Exit(86); });
        std::thread worker([] { throw std::runtime_error("uncaught worker error"); });
        worker.join(); // unreachable normal completion
        return 1;
    }
    std::promise<int> promise;
    auto future = promise.get_future();
    std::thread worker([p=std::move(promise)]() mutable {
        try { throw std::runtime_error("raw thread task failed"); }
        catch (...) { p.set_exception(std::current_exception()); }
    });
    worker.join(); // reclaim even when future.get() will throw
    bool raw_caught = false;
    try { (void)future.get(); }
    catch (const std::runtime_error&) { raw_caught = true; }
    assert(raw_caught);
    ThreadPool pool(1);
    auto failed = pool.submit([]() -> int { throw std::runtime_error("pool task failed"); });
    auto next = pool.submit([] { return 42; });
    bool task_caught = false;
    try { (void)failed.get(); }
    catch (const std::runtime_error&) { task_caught = true; }
    assert(task_caught && next.get() == 42);
    pool.shutdown();
    std::cout << "raw exception delivered; pool worker survived; next=42\n";
}
