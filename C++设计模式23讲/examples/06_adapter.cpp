#include <cassert>
#include <iostream>
#include <string>

struct Printer {
    virtual ~Printer() = default;
    virtual std::string print(const std::string& text) = 0;
};
class LegacyPrinter {
public:
    std::string write(const char* text) { return std::string("legacy:") + text; }
};
class PrinterAdapter final : public Printer {
    LegacyPrinter& legacy_;  // 借用：legacy 的生命周期必须更长。
public:
    explicit PrinterAdapter(LegacyPrinter& legacy) : legacy_(legacy) {}
    std::string print(const std::string& text) override {
        return legacy_.write(text.c_str());
    }
};
int main() {
    LegacyPrinter legacy;
    PrinterAdapter adapter(legacy);
    Printer& printer = adapter;
    assert(printer.print("hello") == "legacy:hello");
    std::cout << printer.print("hello") << '\n';
}
