#include <cassert>
#include <iostream>
#include <memory>
#include <stdexcept>
#include <string>
#include <utility>

struct State {
    virtual ~State() = default;
    virtual std::string name() const = 0;
    virtual std::unique_ptr<State> pay() const { throw std::logic_error("cannot pay"); }
    virtual std::unique_ptr<State> ship() const { throw std::logic_error("cannot ship"); }
};
struct Unpaid final : State {
    std::string name() const override { return "unpaid"; }
    std::unique_ptr<State> pay() const override;
};
struct Paid final : State {
    std::string name() const override { return "paid"; }
    std::unique_ptr<State> ship() const override;
};
struct Shipped final : State {
    std::string name() const override { return "shipped"; }
};
std::unique_ptr<State> Unpaid::pay() const { return std::make_unique<Paid>(); }
std::unique_ptr<State> Paid::ship() const { return std::make_unique<Shipped>(); }
class Order {
    std::unique_ptr<State> state_ = std::make_unique<Unpaid>();
public:
    void pay() {
        auto next = state_->pay();  // 当前方法先返回，再替换和销毁旧状态。
        state_ = std::move(next);
    }
    void ship() {
        auto next = state_->ship();
        state_ = std::move(next);
    }
    std::string state() const { return state_->name(); }
};
int main() {
    Order order;
    bool rejected = false;
    try { order.ship(); } catch (const std::logic_error&) { rejected = true; }
    assert(rejected && order.state() == "unpaid");
    order.pay();
    order.ship();
    assert(order.state() == "shipped");
    std::cout << "illegal transition rejected\nstate=" << order.state() << '\n';
}
