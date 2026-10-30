#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif
#include <cerrno>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <sched.h>
#include <signal.h>
#include <sys/wait.h>
#include <unistd.h>

static int child_entry(void *) { return 7; }

int main(int argc, char **argv) {
    if (argc != 2 || (std::strcmp(argv[1], "vfork") != 0 &&
                      std::strcmp(argv[1], "clone") != 0)) {
        std::fprintf(stderr, "usage: %s vfork|clone\n", argv[0]);
        return 1;
    }
    const bool use_vfork = std::strcmp(argv[1], "vfork") == 0;
    void *stack = nullptr;
    pid_t child;
    if (use_vfork) {
        // 所有参数都在 vfork 前准备；子分支不打印、不分配、不返回 main。
        char path[] = "/bin/true";
        char name[] = "true";
        char *args[] = {name, nullptr};
        char *env[] = {nullptr};
        child = vfork();
        if (child == 0) {
            execve(path, args, env);
            _exit(127);
        }
    } else {
        // x86-64 Linux：栈向低地址增长，栈顶为分配块的高地址。
        // 教学简化：无保护页，且没有 CLONE_VM/CLONE_THREAD。
        const std::size_t stack_size = 1024 * 1024;
        stack = std::malloc(stack_size);
        if (!stack) { std::perror("malloc"); return 1; }
        child = clone(child_entry, static_cast<char*>(stack) + stack_size,
                      SIGCHLD, nullptr);
    }
    if (child == -1) {
        std::perror(use_vfork ? "vfork" : "clone");
        std::free(stack);
        return 1;
    }
    int status;
    pid_t result;
    do { result = waitpid(child, &status, 0); }
    while (result == -1 && errno == EINTR);
    std::free(stack);
    if (result == -1) { std::perror("waitpid"); return 1; }
    if (WIFEXITED(status)) {
        const int code = WEXITSTATUS(status);
        std::printf("child exit=%d\n", code);
        return code == (use_vfork ? 0 : 7) ? 0 : 1;
    }
    if (WIFSIGNALED(status))
        std::printf("child signal=%d\n", WTERMSIG(status));
    return 1;
}
