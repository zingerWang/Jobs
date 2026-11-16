// 文件名：constexpr.cpp  编译：g++ -std=c++20 constexpr.cpp -o constexpr
#include <cstdio>
#include <type_traits>

// C++11：constexpr 函数体只能有一条 return
constexpr int square(int x) { return x * x; }

// C++14：放宽为允许局部变量、循环、分支
constexpr int sum_to(int n) {
    int s = 0;
    for (int i = 1; i <= n; ++i) s += i;
    return s;
}

// C++20：consteval 强制「只在编译期求值」
consteval int must_be_compile_time(int x) { return x * 2; }

// C++20：is_constant_evaluated 区分两种求值场景
constexpr int f(int x) {
    if (std::is_constant_evaluated()) return x * 100;  // 编译期走这里
    return x + 1;                                      // 运行期走这里
}

// C++20：constinit 保证静态初始化在编译期完成（避免静态初始化顺序问题）
constinit int g_start = sum_to(10);

int main() {
    static_assert(square(5) == 25, "编译期就要算出来");
    static_assert(sum_to(100) == 5050);

    int runtime_n = 4;
    std::printf("square(5)      = %d（编译期常量）\n", square(5));
    std::printf("sum_to(100)    = %d（编译期常量）\n", sum_to(100));
    std::printf("must_be_compile_time(21) = %d\n", must_be_compile_time(21));
    constexpr int compile_time = f(3);   // 常量上下文：走 is_constant_evaluated 的编译期分支
    int runtime = f(runtime_n);          // 运行期调用：走另一分支
    std::printf("f(3) 在常量上下文 = %d\n", compile_time);
    std::printf("f(runtime_n) 在运行期 = %d\n", runtime);
    std::printf("constinit g_start = %d\n", g_start);
    return 0;
}
