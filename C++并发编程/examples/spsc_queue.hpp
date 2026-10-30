#pragma once
#include <array>
#include <atomic>
#include <cstddef>

template<std::size_t N>
class SpscQueue {
    static_assert(N>=2,"one slot is reserved");
    std::array<int,N> slots_{};
    alignas(64) std::atomic<std::size_t> head_{0};
    alignas(64) std::atomic<std::size_t> tail_{0};
public:
    bool try_push(int value) {
        auto head=head_.load(std::memory_order_relaxed);
        auto next=(head+1)%N;
        if(next==tail_.load(std::memory_order_acquire)) return false;
        slots_[head]=value;
        head_.store(next,std::memory_order_release);
        return true;
    }
    bool try_pop(int& value) {
        auto tail=tail_.load(std::memory_order_relaxed);
        if(tail==head_.load(std::memory_order_acquire)) return false;
        value=slots_[tail];
        tail_.store((tail+1)%N,std::memory_order_release);
        return true;
    }
};
