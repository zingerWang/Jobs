#include <cassert>
#include <iostream>
#include <memory>
#include <stdexcept>
#include <string>
#include <unordered_map>
#include <utility>

using Context = std::unordered_map<std::string, bool>;
struct Expr { virtual ~Expr() = default; virtual bool eval(const Context&) const = 0; };
class Variable final : public Expr {
    std::string name_;
public:
    explicit Variable(std::string name) : name_(std::move(name)) {}
    bool eval(const Context& context) const override { return context.at(name_); }
};
class Not final : public Expr {
    std::unique_ptr<Expr> inner_;
public:
    explicit Not(std::unique_ptr<Expr> inner) : inner_(std::move(inner)) {
        if (!inner_) throw std::invalid_argument("null expression");
    }
    bool eval(const Context& context) const override { return !inner_->eval(context); }
};
class And final : public Expr {
    std::unique_ptr<Expr> left_, right_;
public:
    And(std::unique_ptr<Expr> left, std::unique_ptr<Expr> right)
        : left_(std::move(left)), right_(std::move(right)) {
        if (!left_ || !right_) throw std::invalid_argument("null expression");
    }
    bool eval(const Context& context) const override {
        return left_->eval(context) && right_->eval(context);
    }
};
int main() {
    // 教学 AST 由代码构造，所有子节点必须非空。
    And rule(std::make_unique<Variable>("raining"),
             std::make_unique<Not>(std::make_unique<Variable>("umbrella")));
    Context context{{"raining", true}, {"umbrella", false}};
    assert(rule.eval(context));
    bool rejected = false;
    try { Variable("missing").eval(context); }
    catch (const std::out_of_range&) { rejected = true; }
    assert(rejected);
    std::cout << "take_umbrella=" << std::boolalpha << rule.eval(context)
              << "\nunknown variable rejected\n";
}
