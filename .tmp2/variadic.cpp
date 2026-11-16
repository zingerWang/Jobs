// 文件名：variadic.cpp  编译：g++ -std=c++17 variadic.cpp -o variadic
#include <cstdio>
#include <functional>
#include <string>
#include <tuple>
#include <utility>

// C++11：可变参数模板；C++17：折叠表达式把参数「一次性」展开
template <class... Ts>
auto sum_all(Ts... xs) { return (xs + ... + 0); }

template <class... Ts>
void print_all(const Ts&... xs) {
    ((std::printf("%s ", std::to_string(xs).c_str())), ...);  // 逗号折叠
    std::printf("\n");
}

struct Counter {
    int base = 100;
    int add(int a, int b) const { return base + a + b; }
};

int main() {
    std::printf("sum_all(1,2,3,4) = %d\n", sum_all(1, 2, 3, 4));
    std::printf("sum_all()        = %d\n", sum_all());
    print_all(1, 2.5, 3);

    // std::apply：把 tuple 展开成实参列表
    auto args = std::make_tuple(3, 4);
    std::printf("apply(sum_all, (3,4)) = %d\n", std::apply([](int a, int b) { return a + b; }, args));

    // std::invoke：统一调用函数、成员函数指针、数据成员指针、可调用对象
    Counter c;
    std::printf("invoke(&Counter::add, c, 1, 2) = %d\n", std::invoke(&Counter::add, c, 1, 2));
    std::printf("invoke(&Counter::base, c)     = %d\n", std::invoke(&Counter::base, c));
    std::printf("invoke(lambda, 10)            = %d\n", std::invoke([](int x) { return x * x; }, 10));
    return 0;
}
