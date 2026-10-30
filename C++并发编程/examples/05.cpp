#include <cassert>
#include <iostream>
#include <memory>
#include <string>
#include <thread>
int main() {
    auto snapshot = std::make_shared<const std::string>("immutable config");
    std::weak_ptr<const std::string> observer = snapshot;
    std::thread worker([snapshot] {
        assert(*snapshot == "immutable config");
        std::cout << *snapshot << '\n';
    });
    snapshot.reset();
    worker.join();
    // join 后线程的调用对象已结束使用快照。
    assert(observer.expired());
}
