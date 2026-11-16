// 文件名：modern23.cpp  编译：g++ -std=c++23 modern23.cpp -o modern23
// 说明：C++23 的 std::print/println 在本机 MinGW（GCC 16.1.0）能编译但链接失败
//       （缺 std::__open_terminal），所以示例改用 std::format + std::puts 输出。
#include <cstdio>
#include <expected>
#include <ranges>
#include <format>
#include <string>
#include <utility>
#include <vector>

enum class Err { DivByZero };

std::expected<int, Err> safe_div(int a, int b) {
    if (b == 0) return std::unexpected(Err::DivByZero);
    return a / b;
}

enum class Color : unsigned char { Red = 1, Green = 2 };

struct Widget {
    int x = 0;
    // C++23：显式对象参数（deducing this）。一个模板同时覆盖 const 与 非 const。
    template <class Self>
    auto&& get(this Self&& self) { return std::forward<Self>(self).x; }

    // C++23：静态 operator()。这里用普通静态成员函数演示同一类「不需要对象」的调用。
    static int scale(int v) { return v * 10; }
};

int main() {
    auto ok = safe_div(10, 2);
    auto bad = safe_div(1, 0);
    std::puts(std::format("10/2 -> {}", ok.value()).c_str());
    std::puts(std::format("1/0 有值吗：{}，错误码 {}", bad.has_value(), (int)bad.error()).c_str());

    // C++23 单子操作：链式处理，不用写 if
    auto chained = safe_div(9, 3).transform([](int v) { return v + 1; });
    std::puts(std::format("9/3 再 +1 = {}", chained.value_or(-1)).c_str());

    // std::to_underlying：枚举取底层值，替代 static_cast
    std::puts(std::format("Color::Green 底层值 = {}",
                          (int)std::to_underlying(Color::Green)).c_str());

    // string::contains（C++23）
    std::string s = "order-42-created";
    std::puts(std::format("contains(\"42\") = {}", s.contains("42")).c_str());

    // ranges::to（C++23）：范围直接构造容器
    std::vector<int> src{1, 2, 3, 4, 5};
    auto doubled = src | std::views::transform([](int v) { return v * 2; }) | std::ranges::to<std::vector>();
    std::puts(std::format("ranges::to 之后 size={}，末元素={}", doubled.size(), doubled.back()).c_str());

    std::puts(std::format("Widget::scale(4) = {}", Widget::scale(4)).c_str());
    Widget w{5};
    std::puts(std::format("deducing this 读取 x = {}", w.get()).c_str());
    const Widget cw{9};
    std::puts(std::format("const 对象也能调用同一个模板：{}", cw.get()).c_str());
    return 0;
}
