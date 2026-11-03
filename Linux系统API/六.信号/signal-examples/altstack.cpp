#include <signal.h>
#include <unistd.h>
#include <cstdio>
#include <vector>

static void diagnose(int) {
    const char message[] = "handler on alternate stack\n";
    (void)write(STDERR_FILENO, message, sizeof(message) - 1);
    _exit(1);
}

int main() {
    // 缓冲区在堆上，保持有效直到进程退出。
    std::vector<char> storage(static_cast<size_t>(SIGSTKSZ) + 65536);
    stack_t stack{};
    stack.ss_sp = storage.data();
    stack.ss_size = storage.size();
    if (sigaltstack(&stack, nullptr) == -1) {
        std::perror("sigaltstack"); return 2;
    }
    struct sigaction action{};
    action.sa_handler = diagnose;
    action.sa_flags = SA_ONSTACK;
    sigemptyset(&action.sa_mask);
    if (sigaction(SIGSEGV, &action, nullptr) == -1) {
        std::perror("sigaction"); return 2;
    }
    // 主动发送，单独验证交付路径，不制造真实的栈溢出。
    if (raise(SIGSEGV) != 0) { std::perror("raise"); return 2; }
    return 2;  // 正常演示会在处理函数内退出。
}
