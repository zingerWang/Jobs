#include <atomic>
#include <cassert>
#include <iostream>
#include <thread>
bool buy(std::atomic<int>& tickets) {
    int expected = tickets.load();
    while (expected > 0) {
        if (tickets.compare_exchange_weak(expected, expected - 1)) return true;
    }
    return false;
}
int main() {
    std::atomic<int> tickets{1};
    std::atomic<int> sold{0};
    std::jthread a([&] { if (buy(tickets)) ++sold; });
    std::jthread b([&] { if (buy(tickets)) ++sold; });
    a.join(); b.join();
    assert(tickets == 0 && sold == 1);
    std::cout << "tickets=" << tickets << " sold=" << sold << '\n';
}
