#include <cassert>
#include <iostream>
#include <mutex>
#include <thread>
struct Account { std::mutex mutex; int balance = 1000; };
void move_one(Account& a, Account& b) {
    if (&a == &b) return;
    std::scoped_lock lock(a.mutex,b.mutex);
    --a.balance; ++b.balance; // 本例允许暂时负数，只验证锁顺序和总额。
}
int main() {
    Account a,b;
    std::jthread x([&] { for(int i=0;i<10000;++i) move_one(a,b); });
    std::jthread y([&] { for(int i=0;i<10000;++i) move_one(b,a); });
    x.join(); y.join();
    assert(a.balance == 1000 && b.balance == 1000);
    std::cout << "total=" << a.balance+b.balance << '\n';
}
