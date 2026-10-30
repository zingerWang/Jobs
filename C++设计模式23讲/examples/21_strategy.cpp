#include <cassert>
#include <iostream>
#include <memory>
#include <stdexcept>
#include <utility>

struct Shipping { virtual ~Shipping() = default; virtual int cost(int kilometers) const = 0; };
struct Standard final : Shipping {
    int cost(int kilometers) const override { return kilometers * 100; }
};
struct Express final : Shipping {
    int cost(int kilometers) const override { return kilometers * 200 + 500; }
};
class Calculator {
    std::unique_ptr<Shipping> strategy_;
public:
    explicit Calculator(std::unique_ptr<Shipping> strategy) { setStrategy(std::move(strategy)); }
    void setStrategy(std::unique_ptr<Shipping> strategy) {
        if (!strategy) throw std::invalid_argument("null strategy");
        strategy_ = std::move(strategy);
    }
    int cost(int kilometers) const {
        if (kilometers < 0 || kilometers > 10000) throw std::invalid_argument("distance range");
        return strategy_->cost(kilometers);
    }
};
int main() {
    Calculator calculator(std::make_unique<Standard>());
    int ordinary = calculator.cost(3);
    calculator.setStrategy(std::make_unique<Express>());
    int urgent = calculator.cost(3);
    assert(ordinary == 300 && urgent == 1100);
    std::cout << "standard=" << ordinary << " express=" << urgent << '\n';
}
