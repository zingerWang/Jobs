#include <atomic>
#include <cassert>
#include <iostream>
#include <string>
#include <thread>
struct Payload { std::string name; int value=0; };
int main() {
    Payload storage;
    std::atomic<Payload*> published{nullptr};
    std::string result;
    std::jthread producer([&]{
        storage.name="answer"; storage.value=42;
        published.store(&storage,std::memory_order_release);
    });
    std::jthread consumer([&]{
        Payload* p;
        while(!(p=published.load(std::memory_order_acquire))) std::this_thread::yield();
        result=p->name+":"+std::to_string(p->value);
    });
    producer.join();consumer.join();
    assert(result=="answer:42");
    std::cout << result << '\n';
}
