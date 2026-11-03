#include <cassert>
#include <iostream>
#include <string>
#include <utility>

class Editor {
    std::string text_;
public:
    class Snapshot {
        friend class Editor;
        std::string text_;
        explicit Snapshot(std::string text) : text_(std::move(text)) {}
    public:
        Snapshot(const Snapshot&) = default;
        Snapshot& operator=(const Snapshot&) = default;
    };
    void append(const std::string& text) { text_ += text; }
    const std::string& text() const { return text_; }
    Snapshot save() const { return Snapshot(text_); }
    void restore(const Snapshot& snapshot) { text_ = snapshot.text_; }
};
int main() {
    Editor editor;
    editor.append("hello");
    auto saved = editor.save();
    editor.append(" world");
    assert(editor.text() == "hello world");
    std::cout << "before restore=" << editor.text() << '\n';
    editor.restore(saved);
    assert(editor.text() == "hello");
    std::cout << "after restore=" << editor.text() << '\n';
}
