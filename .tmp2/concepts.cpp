// 文件名：concepts.cpp  编译：g++ -std=c++20 concepts.cpp -o concepts
#include <algorithm>
#include <concepts>
#include <format>
#include <iostream>
#include <ranges>
#include <string>
#include <vector>

// 自定义 concept：要求类型能比大小，并且可迭代出 int
template <class T>
concept IntRange = std::ranges::range<T> &&
                   std::same_as<std::ranges::range_value_t<T>, int>;

// 约束写法一：requires 子句
template <class T>
    requires std::integral<T>
T twice(T x) { return x + x; }

// 约束写法二：缩写的函数模板（abbreviated template）
std::string describe(std::integral auto x) { return std::format("整数 {}", x); }

// 满足 IntRange 才有这个重载
void dump(const IntRange auto& r) {
    std::cout << "  int 序列：";
    for (int v : r) std::cout << v << ' ';
    std::cout << '\n';
}

struct Version {
    int major, minor;
    auto operator<=>(const Version&) const = default;   // C++20 三向比较，编译器补全 < <= > >=
};

int main() {
    std::cout << "twice(21) = " << twice(21) << '\n';
    std::cout << describe(7) << '\n';

    std::vector<int> v{5, 3, 8, 1, 9, 2};
    dump(v);

    // ranges：惰性视图 + 管道
    auto pipeline = v | std::views::filter([](int x) { return x % 2 == 1; })
                      | std::views::transform([](int x) { return x * x; })
                      | std::views::take(2);
    std::cout << "奇数平方取前两个：";
    for (int x : pipeline) std::cout << x << ' ';
    std::cout << '\n';

    std::ranges::sort(v);
    std::cout << "ranges::sort 之后：";
    for (int x : v) std::cout << x << ' ';
    std::cout << '\n';

    Version a{1, 9}, b{2, 0};
    std::cout << std::format("1.9 < 2.0 ? {}\n", a < b);
    return 0;
}
