#include <cassert>
#include <iostream>
#include <memory>
#include <string>
#include <utility>

struct Image { virtual ~Image() = default; virtual std::string draw() = 0; };
class RealImage final : public Image {
    std::string file_;
public:
    inline static int loads = 0;
    explicit RealImage(std::string file) : file_(std::move(file)) { ++loads; }
    std::string draw() override { return file_; }
};
class LazyImage final : public Image {
    std::string file_;
    std::unique_ptr<RealImage> real_;
public:
    explicit LazyImage(std::string file) : file_(std::move(file)) {}
    std::string draw() override {
        if (!real_) real_ = std::make_unique<RealImage>(file_);
        return real_->draw();
    }
};
int main() {
    LazyImage image("photo.png");
    assert(RealImage::loads == 0);
    auto first = image.draw();
    auto second = image.draw();
    assert(first == second && RealImage::loads == 1);
    std::cout << "loads=" << RealImage::loads << " picture=" << first << '\n';
}
