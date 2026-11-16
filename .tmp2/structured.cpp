// 文件名：structured.cpp  编译：g++ -std=c++17 structured.cpp -o structured
#include <cstdio>
#include <map>
#include <optional>
#include <string>
#include <string_view>
#include <tuple>
#include <variant>

struct Order { int id; std::string sku; double amount; };

int main() {
    // 1) 结构化绑定：pair / tuple / 数组 / 聚合体都能拆
    std::pair<int, std::string> p{7, "apple"};
    auto [pid, pname] = p;
    auto [tid, price, qty] = std::make_tuple(1, 9.9, 3);
    int arr[2] = {10, 20};
    auto [x, y] = arr;
    Order o{42, "SKU-1", 19.9};
    auto& [oid, sku, amount] = o;      // 引用绑定，改的是原对象
    amount = 29.9;
    std::printf("pair: %d %s | tuple: %d %.1f %d | array: %d %d\n", pid, pname.c_str(), tid, price, qty, x, y);
    std::printf("struct: %d %s %.1f（原对象 amount 已被改）\n", oid, sku.c_str(), o.amount);

    // 2) 遍历 map 时结构化绑定最有用
    std::map<std::string, int> stock{{"apple", 3}, {"pear", 5}};
    for (const auto& [key, value] : stock) std::printf("  %s -> %d\n", key.c_str(), value);

    // 3) CTAD：类模板参数推导，C++17 起可省掉模板实参
    std::pair ctad{1, 2.5};            // pair<int,double>
    std::tuple t{1, std::string("two")};
    std::printf("CTAD pair: %d %.1f\n", ctad.first, ctad.second);

    // 4) optional / variant / string_view
    std::optional<int> maybe = std::nullopt;
    std::printf("optional 有值吗：%s\n", maybe ? "有" : "无");
    maybe = 5;
    std::printf("value_or = %d\n", maybe.value_or(-1));

    std::variant<int, std::string> v = std::string("hello");
    std::printf("variant 当前持有 string：%s\n", std::get<std::string>(v).c_str());
    v = 42;
    std::printf("variant 切到 int：%d\n", std::get<int>(v));

    std::string_view sv = "view 不拷贝字符";
    std::printf("string_view[0..4] = %.*s，size=%zu\n", 4, sv.data(), sv.size());
    return 0;
}
