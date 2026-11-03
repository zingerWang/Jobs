#include <cassert>
#include <iostream>
#include <memory>
#include <stdexcept>
#include <string>
#include <utility>

struct Channel {
    virtual ~Channel() = default;
    virtual std::string send(const std::string& message) const = 0;
};
struct Email final : Channel {
    std::string send(const std::string& message) const override { return "email:" + message; }
};
struct Sms final : Channel {
    std::string send(const std::string& message) const override { return "sms:" + message; }
};
class Notification {
    std::unique_ptr<Channel> channel_;
protected:
    virtual std::string prepare(const std::string& message) const { return message; }
public:
    explicit Notification(std::unique_ptr<Channel> channel) : channel_(std::move(channel)) {
        if (!channel_) throw std::invalid_argument("null channel");
    }
    virtual ~Notification() = default;
    std::string notify(const std::string& message) const { return channel_->send(prepare(message)); }
};
class UrgentNotification final : public Notification {
    std::string prepare(const std::string& message) const override { return "URGENT:" + message; }
public:
    using Notification::Notification;
};
int main() {
    Notification normal(std::make_unique<Email>());
    UrgentNotification urgent(std::make_unique<Sms>());
    assert(normal.notify("hello") == "email:hello");
    assert(urgent.notify("fire") == "sms:URGENT:fire");
    std::cout << normal.notify("hello") << '\n' << urgent.notify("fire") << '\n';
}
