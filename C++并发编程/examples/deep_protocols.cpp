// C++20: controlled protocol experiments; run with an external timeout.
#include <array>
#include <atomic>
#include <barrier>
#include <cassert>
#include <condition_variable>
#include <cstddef>
#include <future>
#include <iostream>
#include <mutex>
#include <optional>
#include <queue>
#include <stdexcept>
#include <thread>
#include "spsc_queue.hpp"

// int-only teaching queue. Ownership: callers must finish before destruction.
class BoundedQueue {
    std::mutex mutex_;
    std::condition_variable not_empty_, not_full_, observed_;
    std::queue<int> items_;
    const std::size_t capacity_;
    bool closed_ = false;
    std::size_t waiting_push_ = 0, waiting_pop_ = 0, peak_ = 0;
public:
    explicit BoundedQueue(std::size_t capacity) : capacity_(capacity) {
        if (!capacity) throw std::invalid_argument("zero capacity");
    }
    bool push(int value) {
        std::unique_lock lock(mutex_);
        if (!closed_ && items_.size() == capacity_) {
            ++waiting_push_;
            observed_.notify_all();
            not_full_.wait(lock, [&] { return closed_ || items_.size() < capacity_; });
            --waiting_push_;
        }
        if (closed_) return false;
        items_.push(value);
        if (items_.size() > peak_) peak_ = items_.size();
        lock.unlock();
        not_empty_.notify_one();
        return true;
    }
    std::optional<int> pop() {
        std::unique_lock lock(mutex_);
        if (!closed_ && items_.empty()) {
            ++waiting_pop_;
            observed_.notify_all();
            not_empty_.wait(lock, [&] { return closed_ || !items_.empty(); });
            --waiting_pop_;
        }
        if (items_.empty()) return std::nullopt;
        int value = items_.front();
        items_.pop();
        lock.unlock();
        not_full_.notify_one();
        return value;
    }
    void close() {
        { std::lock_guard lock(mutex_); closed_ = true; }
        not_empty_.notify_all();
        not_full_.notify_all();
    }
    // Test observation seam: proves a waiter reached its predicate wait.
    // Never used by the production push/pop/close protocol.
    void wait_for_blocked(bool producer) {
        std::unique_lock lock(mutex_);
        observed_.wait(lock, [&] { return producer ? waiting_push_ != 0 : waiting_pop_ != 0; });
    }
    std::size_t peak() {
        std::lock_guard lock(mutex_);
        return peak_;
    }
};

void test_queue_close() {
    BoundedQueue full(1);
    assert(full.push(7));
    bool accepted = true;
    std::jthread producer([&] { accepted = full.push(8); });
    full.wait_for_blocked(true);
    full.close();
    producer.join();
    assert(!accepted);
    assert(full.pop() == 7); // accepted work is drained after close
    assert(!full.pop());
    assert(!full.push(9));
    assert(full.peak() == 1);

    BoundedQueue empty(2);
    std::optional<int> result = 99;
    std::jthread consumer([&] { result = empty.pop(); });
    empty.wait_for_blocked(false);
    empty.close();
    consumer.join();
    assert(!result);
    std::cout << "queue: blocked producer rejected; consumer released; accepted item drained\n";
}

void test_reusable_mailbox() {
    int payload = 0;
    std::atomic<bool> full{false};
    constexpr int count = 20000;
    std::jthread producer([&] {
        for (int i = 1; i <= count; ++i) {
            while (full.load(std::memory_order_acquire)) std::this_thread::yield();
            payload = i;
            full.store(true, std::memory_order_release);
        }
    });
    for (int i = 1; i <= count; ++i) {
        while (!full.load(std::memory_order_acquire)) std::this_thread::yield();
        assert(payload == i);
        full.store(false, std::memory_order_release);
    }
    producer.join();
    std::cout << "mailbox: 20000 ordered handoffs, including slot return\n";
}

void test_release_sequence() {
    int payload = 0;
    std::atomic<int> state{0};
    std::jthread producer([&] {
        payload = 42;
        state.store(1, std::memory_order_release);
    });
    int expected = 1;
    while (!state.compare_exchange_weak(expected, 2,
                                       std::memory_order_relaxed,
                                       std::memory_order_relaxed)) {
        expected = 1;
    }
    // The relaxed relay did not acquire payload. This acquire reads its RMW.
    assert(state.load(std::memory_order_acquire) == 2);
    assert(payload == 42); // deliberately before join: proof uses release sequence
    producer.join();
    std::cout << "release sequence: payload published through relaxed RMW\n";
}

void test_sc_store_buffering() {
    std::atomic<int> x{0}, y{0};
    std::barrier phase(2);
    int r1 = -1, r2 = -1;
    constexpr int rounds = 1000;
    std::jthread worker([&] {
        for (int i = 0; i < rounds; ++i) {
            phase.arrive_and_wait();
            x.store(1, std::memory_order_seq_cst);
            r1 = y.load(std::memory_order_seq_cst);
            phase.arrive_and_wait();
        }
    });
    for (int i = 0; i < rounds; ++i) {
        x.store(0); y.store(0);
        phase.arrive_and_wait();
        y.store(1, std::memory_order_seq_cst);
        r2 = x.load(std::memory_order_seq_cst);
        phase.arrive_and_wait();
        assert(r1 != 0 || r2 != 0);
    }
    worker.join();
    std::cout << "seq_cst: no double-zero result in 1000 rounds\n";
}

template<std::size_t N>
void test_spsc() {
    SpscQueue<N> queue;
    int value = -1;
    assert(!queue.try_pop(value));
    for (std::size_t i = 0; i < N - 1; ++i) assert(queue.try_push(static_cast<int>(i)));
    assert(!queue.try_push(99));
    for (std::size_t i = 0; i < N - 1; ++i) {
        assert(queue.try_pop(value));
        assert(value == static_cast<int>(i));
    }
    constexpr int count = 100000;
    std::jthread producer([&] {
        for (int i = 0; i < count; ++i)
            while (!queue.try_push(i)) std::this_thread::yield();
    });
    for (int i = 0; i < count; ++i) {
        while (!queue.try_pop(value)) std::this_thread::yield();
        assert(value == i);
    }
    producer.join();
    assert(!queue.try_pop(value));
    std::cout << "SPSC N=" << N << ": 100000 items, capacity and FIFO checked\n";
}

void test_result_channels() {
    std::packaged_task<int()> failed([]() -> int { throw std::runtime_error("task failed"); });
    auto result = failed.get_future();
    failed();
    bool caught = false;
    try { (void)result.get(); }
    catch (const std::runtime_error&) { caught = true; }
    assert(caught);
    std::future<int> abandoned;
    {
        std::packaged_task<int()> canceled([] { return 1; });
        abandoned = canceled.get_future();
    }
    caught = false;
    try { (void)abandoned.get(); }
    catch (const std::future_error& e) {
        caught = e.code() == std::make_error_code(std::future_errc::broken_promise);
    }
    assert(caught);
    std::cout << "results: task exception and abandoned result distinguished\n";
}

int main() {
    test_queue_close();
    test_reusable_mailbox();
    test_release_sequence();
    test_sc_store_buffering();
    test_spsc<2>(); test_spsc<3>(); test_spsc<64>();
    test_result_channels();
}
