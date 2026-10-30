#define _POSIX_C_SOURCE 200809L
#include <cerrno>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <fcntl.h>
#include <unistd.h>

int main(int argc, char **argv) {
    if (argc == 4 && std::strcmp(argv[1], "probe") == 0) {
        char *end = nullptr;
        long n = std::strtol(argv[2], &end, 10);
        if (!end || *end || n < 100 || n > 1000000) return 1;
        errno = 0;
        int flags = fcntl(static_cast<int>(n), F_GETFD);
        if (flags >= 0) {
            std::puts("fd is open after exec");
            close(static_cast<int>(n));
            return std::strcmp(argv[3], "keep") == 0 ? 0 : 1;
        }
        if (errno == EBADF) {
            std::puts("fd is closed after exec (EBADF)");
            return std::strcmp(argv[3], "close") == 0 ? 0 : 1;
        }
        std::perror("fcntl probe");
        return 1;
    }
    if (argc != 2 || (std::strcmp(argv[1], "keep") != 0 &&
                      std::strcmp(argv[1], "close") != 0)) {
        std::fprintf(stderr, "usage: %s keep|close\n", argv[0]);
        return 1;
    }
    int source = open("/dev/null", O_RDONLY | O_CLOEXEC);
    if (source == -1) { std::perror("open"); return 1; }
    bool keep = std::strcmp(argv[1], "keep") == 0;
    // 选择高编号，避免已关闭的低编号被新程序的动态加载器短暂复用。
    int fd = fcntl(source, keep ? F_DUPFD : F_DUPFD_CLOEXEC, 100);
    int saved = errno;
    close(source);
    if (fd == -1) { errno = saved; std::perror("fcntl duplicate"); return 1; }
    char number[32];
    std::snprintf(number, sizeof number, "%d", fd);
    // Linux /proc/self/exe 指向当前可执行文件，不依赖 argv[0] 的可信性。
    execl("/proc/self/exe", "cloexec_demo", "probe", number, argv[1],
          static_cast<char*>(nullptr));
    std::perror("execl");
    close(fd); // exec 失败，close-on-exec 没有替我们关闭它。
    return 1;
}
