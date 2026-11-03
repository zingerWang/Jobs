#include <cassert>
#include <iostream>
#include <memory>
#include <stdexcept>
#include <utility>
#include <vector>

struct Speaker { int volume = 10; };
struct Command {
    virtual ~Command() = default;
    virtual void execute() = 0;
    virtual void undo() = 0;
};
class SetVolume final : public Command {
    Speaker& speaker_;
    int target_;
    int previous_ = 0;
    bool executed_ = false;
public:
    SetVolume(Speaker& speaker, int target) : speaker_(speaker), target_(target) {
        if (target < 0 || target > 100) throw std::invalid_argument("volume range");
    }
    void execute() override {
        if (executed_) throw std::logic_error("already executed");
        previous_ = speaker_.volume;
        speaker_.volume = target_;
        executed_ = true;
    }
    void undo() override {
        if (!executed_) throw std::logic_error("not executed");
        speaker_.volume = previous_;
        executed_ = false;
    }
};
class Remote {
    std::vector<std::unique_ptr<Command>> history_;
public:
    void run(std::unique_ptr<Command> command) {
        if (!command) throw std::invalid_argument("null command");
        // 先保存，避免执行成功后才因历史容器分配失败而丢失撤销记录。
        history_.push_back(std::move(command));
        try { history_.back()->execute(); }
        catch (...) { history_.pop_back(); throw; }
    }
    bool undo() {
        if (history_.empty()) return false;
        history_.back()->undo();
        history_.pop_back();
        return true;
    }
};
int main() {
    Speaker speaker;  // 比 Remote 和历史命令更早构造、更晚销毁。
    Remote remote;
    remote.run(std::make_unique<SetVolume>(speaker, 50));
    assert(speaker.volume == 50);
    std::cout << "after execute=" << speaker.volume << '\n';
    bool undone = remote.undo();
    assert(undone && speaker.volume == 10);
    bool empty = remote.undo();
    assert(!empty);
    std::cout << "after undo=" << speaker.volume << '\n';
}
