#include <cassert>
#include <iostream>
#include <memory>
#include <stdexcept>
#include <utility>

struct Drink { virtual ~Drink() = default; virtual int cents() const = 0; };
struct Coffee final : Drink { int cents() const override { return 1000; } };
class Decorator : public Drink {
protected:
    std::unique_ptr<Drink> inner_;
public:
    explicit Decorator(std::unique_ptr<Drink> inner) : inner_(std::move(inner)) {
        if (!inner_) throw std::invalid_argument("null drink");
    }
};
class Milk final : public Decorator {
public:
    using Decorator::Decorator;
    int cents() const override { return inner_->cents() + 200; }
};
class Sugar final : public Decorator {
public:
    using Decorator::Decorator;
    int cents() const override { return inner_->cents() + 50; }
};
int main() {
    std::unique_ptr<Drink> drink = std::make_unique<Coffee>();
    drink = std::make_unique<Milk>(std::move(drink));
    drink = std::make_unique<Sugar>(std::move(drink));
    assert(drink->cents() == 1250);
    std::cout << "price=" << drink->cents() << " cents\n";
}
