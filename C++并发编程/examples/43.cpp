// Allocator microbenchmark: identical bounded batches for each thread.
#include <cassert>
#include <chrono>
#include <cstdlib>
#include <future>
#include <iostream>
#include <memory>
#include <stdexcept>
#include <string>
#include <thread>
#include <vector>

using Block = std::unique_ptr<unsigned char, decltype(&std::free)>;
// Build with -fno-builtin-malloc -fno-builtin-free when comparing allocators.
// Volatile byte accesses retain real memory touches without claiming thread safety.
std::size_t batch_work(std::size_t rounds, std::size_t bytes) {
    constexpr std::size_t batch = 256;
    std::size_t checksum = 0;
    std::vector<Block> blocks;
    blocks.reserve(batch);
    for (std::size_t r = 0; r < rounds; ++r) {
        blocks.clear();
        for (std::size_t i = 0; i < batch; ++i) {
            auto* p = static_cast<unsigned char*>(std::malloc(bytes));
            if (!p) throw std::bad_alloc();
            Block block(p, &std::free);
            volatile unsigned char* touched = p;
            touched[0] = static_cast<unsigned char>(i);
            touched[bytes-1] = static_cast<unsigned char>(i);
            checksum += touched[0];
            blocks.push_back(std::move(block));
        }
    }
    return checksum;
}
int main(int argc, char** argv) {
    unsigned threads = argc > 1 ? static_cast<unsigned>(std::stoul(argv[1])) : 4;
    std::size_t bytes = argc > 2 ? std::stoull(argv[2]) : 64;
    std::size_t rounds = argc > 3 ? std::stoull(argv[3]) : 100;
    if (!threads || threads > 64 || !bytes || bytes > 1048576 || !rounds || rounds > 100000) return 2;
    std::vector<std::future<std::size_t>> results;
    auto begin = std::chrono::steady_clock::now();
    for (unsigned i=0; i<threads; ++i)
        results.push_back(std::async(std::launch::async, batch_work, rounds, bytes));
    std::size_t checksum = 0;
    for (auto& f : results) checksum += f.get();
    auto end = std::chrono::steady_clock::now();
    assert(checksum == static_cast<std::size_t>(threads)*rounds*32640);
    std::cout << "threads=" << threads << " bytes=" << bytes << " rounds=" << rounds
              << " allocations=" << static_cast<std::size_t>(threads)*rounds*256
              << " checksum=" << checksum << " elapsed_us="
              << std::chrono::duration<double,std::micro>(end-begin).count() << '\n';
}
