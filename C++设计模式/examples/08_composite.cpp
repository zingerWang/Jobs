#include <cassert>
#include <cstddef>
#include <iostream>
#include <memory>
#include <stdexcept>
#include <utility>
#include <vector>

struct Node {
    virtual ~Node() = default;
    virtual std::size_t bytes() const = 0;
};
class File final : public Node {
    std::size_t size_;
public:
    explicit File(std::size_t size) : size_(size) {}
    std::size_t bytes() const override { return size_; }
};
class Folder final : public Node {
    std::vector<std::unique_ptr<Node>> children_;
public:
    void add(std::unique_ptr<Node> child) {
        if (!child) throw std::invalid_argument("null child");
        children_.push_back(std::move(child));
    }
    std::size_t bytes() const override {
        std::size_t result = 0;
        for (const auto& child : children_) result += child->bytes();
        return result;
    }
};
int main() {
    auto sub = std::make_unique<Folder>();
    sub->add(std::make_unique<File>(20));
    sub->add(std::make_unique<File>(30));
    Folder root;
    root.add(std::make_unique<File>(10));
    root.add(std::move(sub));
    assert(root.bytes() == 60);
    std::cout << "total=" << root.bytes() << '\n';
}
