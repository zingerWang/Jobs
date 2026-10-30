#include <cassert>
#include <deque>
#include <future>
#include <iostream>
#include <utility>
int main() {
    std::packaged_task<int()> task([]{return 6*7;});
    auto answer=task.get_future();
    std::deque<std::packaged_task<int()>> queue;
    queue.push_back(std::move(task));
    auto next=std::move(queue.front());
    queue.pop_front();
    next();
    int value=answer.get();
    assert(value==42 && queue.empty());
    std::cout << value << '\n';
}
