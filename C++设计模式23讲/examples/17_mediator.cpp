#include <cassert>
#include <iostream>
#include <string>
#include <utility>

enum class Event { TextChanged, SubmitClicked };
struct Mediator { virtual ~Mediator() = default; virtual void notify(Event event) = 0; };
class TextField {
    Mediator& mediator_;
    std::string value_;
public:
    explicit TextField(Mediator& mediator) : mediator_(mediator) {}
    void set(std::string text) { value_ = std::move(text); mediator_.notify(Event::TextChanged); }
    const std::string& value() const { return value_; }
};
class Button {
    Mediator& mediator_;
public:
    bool enabled = false;
    explicit Button(Mediator& mediator) : mediator_(mediator) {}
    void click() { if (enabled) mediator_.notify(Event::SubmitClicked); }
};
class Form final : public Mediator {
    TextField field_;
    Button button_;
    std::string submitted_;
public:
    Form() : field_(*this), button_(*this) {}
    Form(const Form&) = delete;
    Form& operator=(const Form&) = delete;
    Form(Form&&) = delete;
    Form& operator=(Form&&) = delete;
    void notify(Event event) override {
        if (event == Event::TextChanged) button_.enabled = !field_.value().empty();
        else if (event == Event::SubmitClicked) submitted_ = field_.value();
    }
    void enter(std::string text) { field_.set(std::move(text)); }
    void submit() { button_.click(); }
    const std::string& submitted() const { return submitted_; }
};
int main() {
    Form form;
    form.submit();
    assert(form.submitted().empty());
    form.enter("hello");
    form.submit();
    assert(form.submitted() == "hello");
    std::cout << "submitted=" << form.submitted() << '\n';
}
