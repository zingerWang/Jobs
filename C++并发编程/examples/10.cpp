#include <cassert>
#include <iostream>
#include <mutex>
#include <thread>
class Account {
    mutable std::mutex mutex_;
    int balance_ = 1000;
public:
    bool try_withdraw(int amount) {
        std::lock_guard<std::mutex> lock(mutex_);
        if (amount <= 0 || balance_ < amount) return false;
        balance_ -= amount;
        return true;
    }
    int balance() const {
        std::lock_guard<std::mutex> lock(mutex_);
        return balance_;
    }
};
int main() {
    Account account;
    int a = 0, b = 0;
    std::jthread t1([&] { for (int i=0;i<800;++i) a += account.try_withdraw(1); });
    std::jthread t2([&] { for (int i=0;i<800;++i) b += account.try_withdraw(1); });
    t1.join(); t2.join();
    assert(a+b == 1000 && account.balance() == 0);
    std::cout << "withdrawn=" << a+b << " balance=" << account.balance() << '\n';
}
