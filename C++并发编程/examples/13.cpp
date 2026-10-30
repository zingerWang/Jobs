#include <cassert>
#include <iostream>
#include <mutex>
#include <numeric>
#include <vector>
class Samples {
    mutable std::mutex mutex_;
    std::vector<int> data_;
public:
    void append(int n) {
        std::lock_guard<std::mutex> lock(mutex_);
        data_.push_back(n);
    }
    long long snapshot_sum() const {
        std::vector<int> copy;
        {
            std::lock_guard<std::mutex> lock(mutex_);
            copy = data_;
        }
        return std::accumulate(copy.begin(),copy.end(),0LL);
    }
};
int main() {
    Samples s;
    for(int i=1;i<=100;++i) s.append(i);
    const auto result=s.snapshot_sum();
    assert(result==5050);
    std::cout << result << '\n';
}
