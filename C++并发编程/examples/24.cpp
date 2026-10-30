#include "pool.hpp"
#include <cassert>
#include <chrono>
#include <cstdint>
#include <iostream>
#include <string>
#include <thread>
#include <vector>

std::uint64_t compute(unsigned seed) {
    std::uint64_t x = seed + 1;
    for (unsigned i = 0; i < 200000; ++i) x = x * 6364136223846793005ULL + 1;
    return x; // unsigned arithmetic has defined wraparound
}
int main(int argc, char** argv) {
    unsigned workers = argc > 1 ? static_cast<unsigned>(std::stoul(argv[1])) : 4;
    std::string mode = argc > 2 ? argv[2] : "cpu";
    if (workers == 0 || workers > 64 || (mode != "cpu" && mode != "io")) return 2;
    constexpr unsigned tasks = 32;
    ThreadPool pool(workers, tasks);
    std::vector<std::future<std::uint64_t>> results;
    auto task = [&](unsigned i) -> std::uint64_t {
        if (mode == "io") { std::this_thread::sleep_for(std::chrono::milliseconds(2)); return i+1; }
        return compute(i);
    };
    std::uint64_t expected = 0;
    for (unsigned i = 0; i < tasks; ++i) expected += mode == "cpu" ? compute(i) : i+1;
    auto start = std::chrono::steady_clock::now();
    for (unsigned i = 0; i < tasks; ++i) results.push_back(pool.submit([&, i] { return task(i); }));
    std::uint64_t sum = 0;
    for (auto& f : results) sum += f.get();
    auto end = std::chrono::steady_clock::now();
    assert(sum == expected);
    pool.shutdown();
    std::cout << "mode=" << mode << " workers=" << workers << " tasks=" << tasks
              << " checksum=" << sum << " elapsed_us="
              << std::chrono::duration<double,std::micro>(end-start).count() << '\n';
}
