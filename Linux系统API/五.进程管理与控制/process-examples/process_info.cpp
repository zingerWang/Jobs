#define _POSIX_C_SOURCE 200809L
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <unistd.h>

extern char **environ;
int initialized = 7;
int zero_initialized;

int main(int argc, char **argv) {
    pid_t sid = getsid(0);
    if (sid == -1) { std::perror("getsid"); return 1; }
    std::printf("PID=%ld PPID=%ld PGID=%ld SID=%ld\n",
        static_cast<long>(getpid()), static_cast<long>(getppid()),
        static_cast<long>(getpgrp()), static_cast<long>(sid));
    for (int i = 0; i < argc; ++i)
        std::printf("argv[%d]=<%s>\n", i, argv[i]);
    bool found = false;
    // 只查看本实验变量，不把整份环境中的敏感信息打印出来。
    for (char **p = environ; *p; ++p) {
        if (std::strncmp(*p, "APP_MODE=", 9) == 0) {
            std::printf("environ: %s\n", *p);
            found = true;
        }
    }
    if (!found) std::puts("APP_MODE is not set");
    int local = 1;
    void *dynamic = std::malloc(64);
    if (!dynamic) { std::perror("malloc"); return 1; }
    std::printf("initialized=%p zero=%p local=%p allocated=%p\n",
        static_cast<void*>(&initialized), static_cast<void*>(&zero_initialized),
        static_cast<void*>(&local), dynamic);
    std::free(dynamic);
    return 0;
}
