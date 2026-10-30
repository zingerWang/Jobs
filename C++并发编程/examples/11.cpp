#include <cassert>
#include <iostream>
#include <mutex>
struct Account { std::mutex mutex; int balance = 100; };
bool transfer(Account& from, Account& to, int amount) {
    if (&from == &to || amount <= 0) return false;
    std::scoped_lock locks(from.mutex, to.mutex);
    if (from.balance < amount) return false;
    from.balance -= amount;
    to.balance += amount;
    return true;
}
int main() {
    Account a, b;
    assert(transfer(a,b,30));
    int snapshot;
    {
        std::unique_lock<std::mutex> lock(a.mutex, std::defer_lock);
        lock.lock();
        snapshot = a.balance;
        lock.unlock();
        assert(!lock.owns_lock());
    }
    assert(snapshot == 70);
    std::cout << "snapshot=" << snapshot << '\n';
}
