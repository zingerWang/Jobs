// Restricted teaching model: one reader, one writer, no address reuse/reinsert.
// All shared metadata uses seq_cst; not a general-purpose reclamation library.
#include <atomic>
#include <cassert>
#include <cstdint>
#include <future>
#include <iostream>
#include <memory>
#include <thread>

struct Node { const int value = 42; };
void hazard_demo() {
    auto owner = std::make_unique<Node>();
    std::atomic<Node*> head{owner.get()}, hazard{nullptr};
    std::promise<void> protected_now, release;
    auto ready = protected_now.get_future();
    auto gate = release.get_future();
    int observed = 0;
    std::jthread reader([&] {
        Node* p;
        do { p = head.load(); hazard.store(p); } while (p != head.load());
        // Only after revalidation may p be dereferenced.
        protected_now.set_value();
        gate.wait();
        assert(p != nullptr);
        observed = p->value;
        hazard.store(nullptr); // no access to p after releasing protection
    });
    ready.wait();
    Node* removed = head.exchange(nullptr);
    auto retired = std::move(owner);
    assert(removed == retired.get() && hazard.load() == removed);
    // scan sees protection: MUST retain retired ownership
    release.set_value();
    while (hazard.load() != nullptr) std::this_thread::yield();
    retired.reset(); // reclaimed before join, after protection has ended
    reader.join();
    assert(observed == 42);
    std::cout << "HP: protected node retained, then reclaimed\n";
}
void epoch_demo() {
    auto owner = std::make_unique<Node>();
    std::atomic<Node*> head{owner.get()};
    std::atomic<std::uint64_t> global_epoch{1}, announced{0}; // 0 = inactive
    std::promise<void> entered, release;
    auto ready = entered.get_future();
    auto gate = release.get_future();
    int observed = 0;
    std::jthread reader([&] {
        const auto e = global_epoch.load();
        announced.store(e); // announce BEFORE loading shared pointers
        Node* p = head.load();
        entered.set_value();
        gate.wait();
        assert(p != nullptr);
        observed = p->value;
        announced.store(0); // no protected-pointer use beyond this point
    });
    ready.wait();
    Node* removed = head.exchange(nullptr);
    auto retired = std::move(owner);
    const auto retired_epoch = global_epoch.fetch_add(1);
    auto can_reclaim = [&] {
        const auto e = announced.load();
        return e == 0 || e > retired_epoch;
    };
    assert(removed == retired.get() && !can_reclaim());
    release.set_value();
    while (!can_reclaim()) std::this_thread::yield();
    retired.reset();
    reader.join();
    assert(observed == 42);
    std::cout << "EBR: old reader delayed reclaim until quiescent\n";
}
int main() { hazard_demo(); epoch_demo(); }
