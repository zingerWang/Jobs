#include <algorithm>
#include <cassert>
#include <cstddef>
#include <iostream>
#include <memory>
#include <stdexcept>
#include <utility>
#include <vector>

struct Observer { virtual ~Observer() = default; virtual void update(int price) = 0; };
class PriceSource {
    std::vector<std::weak_ptr<Observer>> observers_;
public:
    void subscribe(const std::shared_ptr<Observer>& observer) {
        if (!observer) throw std::invalid_argument("null observer");
        for (const auto& weak : observers_)
            if (weak.lock() == observer) return;  // 不重复订阅。
        observers_.push_back(observer);
    }
    void setPrice(int price) {
        std::vector<std::shared_ptr<Observer>> live;
        for (const auto& weak : observers_)
            if (auto observer = weak.lock()) live.push_back(std::move(observer));
        observers_.erase(std::remove_if(observers_.begin(), observers_.end(),
            [](const auto& weak) { return weak.expired(); }), observers_.end());
        // 先建立快照，再回调，避免回调中新订阅使原容器迭代器失效。
        for (const auto& observer : live) observer->update(price);
    }
    std::size_t subscriptions() const { return observers_.size(); }
};
struct Recorder final : Observer {
    std::vector<int> received;
    void update(int price) override { received.push_back(price); }
};
int main() {
    PriceSource source;
    auto chart = std::make_shared<Recorder>();
    auto alert = std::make_shared<Recorder>();
    source.subscribe(chart);
    source.subscribe(alert);
    source.setPrice(100);
    assert(chart->received.back() == 100 && alert->received.back() == 100);
    alert.reset();
    source.setPrice(120);
    assert(source.subscriptions() == 1 && chart->received.back() == 120);
    std::cout << "remaining=" << source.subscriptions()
              << " latest=" << chart->received.back() << '\n';
}
