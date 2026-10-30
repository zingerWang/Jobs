#include <cassert>
#include <cstddef>
#include <iostream>
#include <memory>
#include <string>
#include <utility>
#include <vector>

struct Document {
    virtual ~Document() = default;
    virtual std::unique_ptr<Document> clone() const = 0;
    virtual void append(std::string paragraph) = 0;
    virtual std::size_t paragraphs() const = 0;
};
class TextDocument final : public Document {
    std::vector<std::string> paragraphs_;
public:
    std::unique_ptr<Document> clone() const override {
        return std::make_unique<TextDocument>(*this);
    }
    void append(std::string paragraph) override { paragraphs_.push_back(std::move(paragraph)); }
    std::size_t paragraphs() const override { return paragraphs_.size(); }
};
int main() {
    TextDocument original;
    original.append("template");
    const Document& base = original;
    auto copy = base.clone();
    copy->append("filled by Alice");
    assert(original.paragraphs() == 1 && copy->paragraphs() == 2);
    std::cout << "original=" << original.paragraphs() << " copy=" << copy->paragraphs() << '\n';
}
