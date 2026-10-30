#include <cassert>
#include <iostream>
#include <map>
#include <cstddef>
#include <memory>
#include <string>
#include <utility>

struct Style { std::string font; int size; };
class StylePool {
    std::map<std::pair<std::string, int>, std::shared_ptr<const Style>> styles_;
public:
    std::shared_ptr<const Style> get(const std::string& font, int size) {
        auto key = std::make_pair(font, size);
        auto it = styles_.find(key);
        if (it != styles_.end()) return it->second;
        auto style = std::make_shared<const Style>(Style{font, size});
        styles_.emplace(std::move(key), style);
        return style;
    }
    std::size_t count() const { return styles_.size(); }
};
struct Glyph {
    char32_t code;
    int x;
    int y;
    std::shared_ptr<const Style> style;
};
int main() {
    StylePool pool;
    Glyph first{U'A', 0, 0, pool.get("sans", 12)};
    Glyph second{U'B', 10, 0, pool.get("sans", 12)};
    Glyph third{U'C', 20, 0, pool.get("sans", 16)};
    assert(first.style == second.style && first.style != third.style);
    assert(pool.count() == 2);
    std::cout << "glyphs=3 styles=" << pool.count()
              << " shared=" << std::boolalpha << (first.style == second.style) << '\n';
}
