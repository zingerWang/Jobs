#include <cassert>
#include <iostream>
#include <memory>
#include <string>

struct Button { virtual ~Button() = default; virtual std::string draw() const = 0; };
struct Checkbox { virtual ~Checkbox() = default; virtual std::string draw() const = 0; };
struct DarkButton final : Button { std::string draw() const override { return "dark button"; } };
struct LightButton final : Button { std::string draw() const override { return "light button"; } };
struct DarkCheckbox final : Checkbox { std::string draw() const override { return "dark checkbox"; } };
struct LightCheckbox final : Checkbox { std::string draw() const override { return "light checkbox"; } };
struct ThemeFactory {
    virtual ~ThemeFactory() = default;
    virtual std::unique_ptr<Button> button() const = 0;
    virtual std::unique_ptr<Checkbox> checkbox() const = 0;
};
struct DarkFactory final : ThemeFactory {
    std::unique_ptr<Button> button() const override { return std::make_unique<DarkButton>(); }
    std::unique_ptr<Checkbox> checkbox() const override { return std::make_unique<DarkCheckbox>(); }
};
struct LightFactory final : ThemeFactory {
    std::unique_ptr<Button> button() const override { return std::make_unique<LightButton>(); }
    std::unique_ptr<Checkbox> checkbox() const override { return std::make_unique<LightCheckbox>(); }
};
std::string render(const ThemeFactory& factory) {
    auto button = factory.button();
    auto checkbox = factory.checkbox();
    return button->draw() + " + " + checkbox->draw();
}
int main() {
    DarkFactory dark;
    LightFactory light;
    assert(render(dark) == "dark button + dark checkbox");
    assert(render(light) == "light button + light checkbox");
    std::cout << render(dark) << '\n' << render(light) << '\n';
}
