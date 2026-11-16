// 文件名：smart.cpp  编译：g++ -std=c++11 smart.cpp -o smart
#include <cstdio>
#include <memory>
#include <string>

struct Node {
    std::string name;
    std::shared_ptr<Node> next;      // 强引用
    std::weak_ptr<Node>   back;      // 弱引用，打破环
    explicit Node(std::string n) : name(std::move(n)) { std::printf("  构造 Node %s\n", name.c_str()); }
    ~Node() { std::printf("  析构 Node %s\n", name.c_str()); }
};

struct FileCloser {                      // 自定义删除器：RAII 管理 C 资源
    void operator()(std::FILE* f) const {
        if (f) { std::fclose(f); std::printf("  已 fclose\n"); }
    }
};

int main() {
    std::printf("1) unique_ptr 只能移动，不能拷贝：\n");
    std::unique_ptr<int> u1(new int(5));
    std::unique_ptr<int> u2 = std::move(u1);
    std::printf("  u1 是否为空：%s  *u2=%d\n", u1 ? "否" : "是", *u2);

    std::printf("2) make_shared 一次分配（控制块与对象同块内存）：\n");
    auto sp = std::make_shared<int>(10);
    std::printf("  use_count=%ld\n", (long)sp.use_count());
    {
        auto sp2 = sp;
        std::printf("  拷贝后 use_count=%ld\n", (long)sp.use_count());
    }
    std::printf("  离开作用域后 use_count=%ld\n", (long)sp.use_count());

    std::printf("3) 循环引用：\n");
    {
        auto a = std::make_shared<Node>("A");
        auto b = std::make_shared<Node>("B");
        a->next = b;          // A 强引用 B
        b->back = a;          // B 弱引用 A（若也写 next 就成环，谁都释放不掉）
        std::printf("  a.use_count=%ld b.use_count=%ld\n",
                    (long)a.use_count(), (long)b.use_count());
    }
    std::printf("  两个 Node 都析构了\n");

    std::printf("4) 自定义删除器：\n");
    {
        std::unique_ptr<std::FILE, FileCloser> fp(std::fopen("smart_probe.txt", "w"));
        if (fp) { std::fputs("x", fp.get()); std::printf("  已写入\n"); }
    }
    std::printf("5) shared_ptr 的线程安全边界：引用计数原子，所指对象不原子\n");
    return 0;
}
