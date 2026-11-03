#include <atomic>
#include <cassert>
#include <iostream>

class Metrics {
    std::atomic<int> count_{0};
    Metrics() = default;
    ~Metrics() = default;
public:
    Metrics(const Metrics&) = delete;
    Metrics& operator=(const Metrics&) = delete;
    Metrics(Metrics&&) = delete;
    Metrics& operator=(Metrics&&) = delete;
    static Metrics& instance() {
        static Metrics metrics;
        return metrics;
    }
    void record() { ++count_; }
    int count() const { return count_.load(); }
};
int main() {
    auto& first = Metrics::instance();
    auto& second = Metrics::instance();
    first.record();
    assert(&first == &second && second.count() == 1);
    std::cout << std::boolalpha << "same=" << (&first == &second)
              << " count=" << second.count() << '\n';
}
