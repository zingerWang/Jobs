// 文件名：move.cpp  编译：g++ -std=c++11 -O2 move.cpp -o move
#include <cstdio>
#include <cstring>
#include <utility>
#include <vector>

class Buffer {
public:
    explicit Buffer(std::size_t n) : n_(n), p_(new char[n]()) { std::printf("  构造 n=%zu\n", n_); }
    Buffer(const Buffer& o) : n_(o.n_), p_(new char[o.n_]) {
        std::memcpy(p_, o.p_, n_);
        std::printf("  拷贝 n=%zu（新分配 + memcpy）\n", n_);
    }
    Buffer(Buffer&& o) noexcept : n_(o.n_), p_(o.p_) {
        o.p_ = nullptr; o.n_ = 0;
        std::printf("  移动（只偷指针，不分配）\n");
    }
    Buffer& operator=(const Buffer&) = delete;
    Buffer& operator=(Buffer&&) = delete;
    ~Buffer() { delete[] p_; }
private:
    std::size_t n_;
    char* p_;
};

void sink(Buffer) { std::printf("  sink 收到一个 Buffer\n"); }

template <class T>
void relay(T&& v) {           // T&& 是转发引用，不是右值引用
    sink(std::forward<T>(v)); // 把值类别原样传下去
}

int main() {
    std::printf("1) 直接传临时对象：\n");
    sink(Buffer(16));

    std::printf("2) 传具名对象（左值）：\n");
    Buffer b(32);
    sink(b);

    std::printf("3) std::move(b)：\n");
    sink(std::move(b));

    std::printf("4) 完美转发：先传左值 c，再传右值：\n");
    Buffer c(64);
    relay(c);
    relay(Buffer(128));

    std::printf("5) vector 扩容（移动构造带 noexcept）：\n");
    std::vector<Buffer> v;
    v.push_back(Buffer(256));
    std::printf("  触发扩容：\n");
    v.push_back(Buffer(512));
    std::printf("  完成，size=%zu\n", v.size());
}
