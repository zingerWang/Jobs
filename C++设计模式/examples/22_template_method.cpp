#include <cassert>
#include <iostream>
#include <string>

class Report {
protected:
    virtual std::string load() const = 0;
    virtual std::string format(const std::string& data) const = 0;
public:
    virtual ~Report() = default;
    std::string generate() const {
        auto data = load();
        auto body = format(data);
        return "BEGIN|" + body + "|END";
    }
};
class CsvReport final : public Report {
    std::string load() const override { return "data"; }
    std::string format(const std::string& data) const override { return "csv(" + data + ")"; }
};
class BracketReport final : public Report {
    std::string load() const override { return "data"; }
    std::string format(const std::string& data) const override { return "[" + data + "]"; }
};
int main() {
    CsvReport csv;
    BracketReport bracket;
    const Report& first = csv;
    const Report& second = bracket;
    assert(first.generate() == "BEGIN|csv(data)|END");
    assert(second.generate() == "BEGIN|[data]|END");
    std::cout << first.generate() << '\n' << second.generate() << '\n';
}
