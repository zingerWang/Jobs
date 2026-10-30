#include <cassert>
#include <initializer_list>
#include <iostream>
#include <memory>
#include <stdexcept>
#include <string>
#include <utility>

class Handler {
    std::unique_ptr<Handler> next_;
protected:
    virtual bool canHandle(int amount) const = 0;
    virtual std::string name() const = 0;
public:
    virtual ~Handler() = default;
    void next(std::unique_ptr<Handler> handler) { next_ = std::move(handler); }
    std::string handle(int amount) const {
        if (amount < 0) throw std::invalid_argument("negative amount");
        if (canHandle(amount)) return name();
        return next_ ? next_->handle(amount) : "unhandled";
    }
};
class Lead final : public Handler {
    bool canHandle(int amount) const override { return amount <= 1000; }
    std::string name() const override { return "lead"; }
};
class Manager final : public Handler {
    bool canHandle(int amount) const override { return amount <= 10000; }
    std::string name() const override { return "manager"; }
};
int main() {
    Lead lead;
    lead.next(std::make_unique<Manager>());
    assert(lead.handle(500) == "lead");
    assert(lead.handle(5000) == "manager");
    assert(lead.handle(50000) == "unhandled");
    for (int amount : {500, 5000, 50000})
        std::cout << amount << '=' << lead.handle(amount) << '\n';
}
