#include <cassert>
#include <functional>
#include <iostream>
#include <memory>
#include <thread>
int main() {
    int value = 10;
    std::thread a([](int x) { ++x; std::cout << "copy=" << x << '\n'; }, value);
    a.join();
    assert(value == 10);
    std::thread b([](int& x) { x += 5; }, std::ref(value));
    b.join();
    assert(value == 15);
    std::unique_ptr<int> ptr(new int(42));
    std::thread c([](std::unique_ptr<int> p) {
        std::cout << "owned=" << *p << '\n';
    }, std::move(ptr));
    c.join();
    assert(!ptr);
    std::cout << "original=" << value << '\n';
}
