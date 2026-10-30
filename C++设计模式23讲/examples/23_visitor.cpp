#include <cassert>
#include <iostream>
#include <memory>
#include <string>
#include <utility>
#include <vector>

class Book;
class Fruit;
struct Visitor {
    virtual ~Visitor() = default;
    virtual void visit(const Book&) = 0;
    virtual void visit(const Fruit&) = 0;
};
struct Item { virtual ~Item() = default; virtual void accept(Visitor&) const = 0; };
class Book final : public Item {
public:
    std::string title;
    int cents;
    Book(std::string value, int price) : title(std::move(value)), cents(price) {}
    void accept(Visitor& visitor) const override { visitor.visit(*this); }
};
class Fruit final : public Item {
public:
    std::string name;
    int cents;
    Fruit(std::string value, int price) : name(std::move(value)), cents(price) {}
    void accept(Visitor& visitor) const override { visitor.visit(*this); }
};
struct PriceVisitor final : Visitor {
    int total = 0;
    void visit(const Book& book) override { total += book.cents; }
    void visit(const Fruit& fruit) override { total += fruit.cents; }
};
struct DescriptionVisitor final : Visitor {
    std::string text;
    void visit(const Book& book) override { text += "book:" + book.title + " "; }
    void visit(const Fruit& fruit) override { text += "fruit:" + fruit.name; }
};
int main() {
    std::vector<std::unique_ptr<Item>> cart;
    cart.push_back(std::make_unique<Book>("cpp", 1000));
    cart.push_back(std::make_unique<Fruit>("apple", 500));
    PriceVisitor prices;
    DescriptionVisitor descriptions;
    for (const auto& item : cart) { item->accept(prices); item->accept(descriptions); }
    assert(prices.total == 1500 && descriptions.text == "book:cpp fruit:apple");
    std::cout << "total=" << prices.total << '\n' << descriptions.text << '\n';
}
