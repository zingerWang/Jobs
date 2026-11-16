// 文件名：auto.cpp  编译：g++ -std=c++14 auto.cpp -o auto
#include <cstdio>
#include <vector>

int main() {
    int n = 7;
    const int cn = 9;
    int& ref = n;

    auto a1 = n;        // int  ：拷贝
    auto a2 = ref;      // int  ：引用被剥掉，得到拷贝
    auto a3 = cn;       // int  ：顶层 const 被丢掉
    auto& a4 = ref;     // int& ：显式写 & 才拿到引用
    const auto& a5 = n; // const int&

    a1 = 100;   // 不影响 n
    a4 = 200;   // 影响 n
    std::printf("auto：a1=%d n=%d a2=%d a3=%d a4=%d a5=%d\n", a1, n, a2, a3, a4, a5);

    // decltype 更「忠实」：保留值类别与顶层 const
    decltype(n)   d1 = 1;    // int
    decltype(cn)  d2 = 2;    // const int
    decltype(ref) d3 = n;    // int&
    d3 = 300;
    std::printf("decltype：d1=%d d2=%d d3=%d n=%d\n", d1, d2, d3, n);

    // 带括号的 decltype((x)) 是「表达式」：左值表达式 -> 引用类型
    decltype((n)) d4 = n;    // int&
    d4 = 400;
    std::printf("decltype((n)) 是引用，n=%d\n", n);

    // 代理对象陷阱：vector<bool> 的 operator[] 返回代理类，不是 bool&
    std::vector<bool> bits(3, false);
    auto b = bits[0];        // auto 推成代理类型，不是 bool！
    std::printf("sizeof(auto)=%zu  sizeof(bool)=%zu\n", sizeof(b), sizeof(bool));
    b = true;                // 通过代理写穿到容器
    std::printf("auto b = bits[0]; b = true 之后 bits[0]=%d（被改到了）\n", (int)bits[0]);
    bool c = bits[1];        // 显式写 bool 拿到的是真拷贝
    c = true;
    std::printf("bool c = bits[1]; c = true 之后 bits[1]=%d（没改到）\n", (int)bits[1]);
    return 0;
}
