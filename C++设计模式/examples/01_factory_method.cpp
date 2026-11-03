#include <cassert>
#include <iostream>
#include <memory>
#include <string>

struct Formatter {
    virtual ~Formatter() = default;
    virtual std::string format(const std::string& text) const = 0;
};
struct TextFormatter final : Formatter {
    std::string format(const std::string& text) const override { return text; }
};
struct JsonFormatter final : Formatter {
    std::string format(const std::string& text) const override {
        // 教学输入固定为 hello；通用 JSON 需要正确转义或使用序列化库。
        return "{\"text\":\"" + text + "\"}";
    }
};
class Exporter {
protected:
    virtual std::unique_ptr<Formatter> create() const = 0;
public:
    virtual ~Exporter() = default;
    std::string run(const std::string& text) const {
        auto formatter = create();
        return formatter->format(text);
    }
};
struct TextExporter final : Exporter {
    std::unique_ptr<Formatter> create() const override {
        return std::make_unique<TextFormatter>();
    }
};
struct JsonExporter final : Exporter {
    std::unique_ptr<Formatter> create() const override {
        return std::make_unique<JsonFormatter>();
    }
};
int main() {
    TextExporter text;
    JsonExporter json;
    assert(text.run("hello") == "hello");
    assert(json.run("hello") == "{\"text\":\"hello\"}");
    std::cout << "text=" << text.run("hello") << '\n';
    std::cout << "json=" << json.run("hello") << '\n';
}
