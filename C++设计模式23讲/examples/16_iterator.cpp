#include <cassert>
#include <initializer_list>
#include <iostream>
#include <vector>

class IntBag {
    std::vector<int> values_;
public:
    class Iterator {
        std::vector<int>::const_iterator current_;
    public:
        explicit Iterator(std::vector<int>::const_iterator current) : current_(current) {}
        int operator*() const { return *current_; }
        Iterator& operator++() { ++current_; return *this; }
        bool operator!=(const Iterator& other) const { return current_ != other.current_; }
    };
    IntBag(std::initializer_list<int> values) : values_(values) {}
    Iterator begin() const { return Iterator(values_.begin()); }
    Iterator end() const { return Iterator(values_.end()); }
};
int main() {
    IntBag bag{1, 2, 3};
    int sum = 0;
    for (int value : bag) sum += value;
    assert(sum == 6);
    std::cout << "sum=" << sum << '\n';
}
