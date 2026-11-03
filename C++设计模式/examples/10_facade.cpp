#include <cassert>
#include <iostream>
#include <string>

struct Projector { std::string on() const { return "projector"; } };
struct Speakers { std::string on() const { return "speakers"; } };
struct Player { std::string play(const std::string& movie) const { return "play:" + movie; } };
class HomeTheater {
    Projector projector_;
    Speakers speakers_;
    Player player_;
public:
    std::string watch(const std::string& movie) const {
        auto first = projector_.on();
        auto second = speakers_.on();
        auto third = player_.play(movie);
        return first + " -> " + second + " -> " + third;
    }
};
int main() {
    HomeTheater theater;
    auto result = theater.watch("demo");
    assert(result == "projector -> speakers -> play:demo");
    std::cout << result << '\n';
}
