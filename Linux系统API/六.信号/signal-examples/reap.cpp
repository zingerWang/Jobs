#include <signal.h>
#include <sys/wait.h>
#include <unistd.h>
#include <cerrno>
#include <cstdio>

static volatile sig_atomic_t reaped = 0;
static volatile sig_atomic_t wait_error = 0;

static void reap(int) {
    int saved_errno = errno;
    int status;
    for (;;) {
        pid_t pid = waitpid(-1, &status, WNOHANG);
        if (pid > 0) {
            // 单线程实验，只有本处理函数更新计数，同类信号默认被屏蔽。
            reaped = reaped + 1;
            continue;
        }
        if (pid == -1 && errno == EINTR) continue;
        if (pid == -1 && errno != ECHILD) wait_error = 1;
        break;  // 返回 0：还有孩子在运行；ECHILD：没有可等待的孩子。
    }
    errno = saved_errno;
}

int main() {
    sigset_t blocked, old_mask;
    sigemptyset(&blocked);
    sigaddset(&blocked, SIGCHLD);
    if (sigprocmask(SIG_BLOCK, &blocked, &old_mask) == -1) {
        std::perror("sigprocmask"); return 1;
    }
    struct sigaction action{};
    action.sa_handler = reap;
    action.sa_flags = SA_NOCLDSTOP;
    sigemptyset(&action.sa_mask);
    if (sigaction(SIGCHLD, &action, nullptr) == -1) {
        std::perror("sigaction"); return 1;
    }

    int started = 0;
    for (; started < 3; ++started) {
        pid_t pid = fork();
        if (pid == 0) _exit(0);
        if (pid == -1) { std::perror("fork"); break; }
    }
    sigset_t wait_mask = old_mask;
    sigdelset(&wait_mask, SIGCHLD);
    while (!wait_error && reaped < started) {
        if (sigsuspend(&wait_mask) == -1 && errno != EINTR) {
            std::perror("sigsuspend"); return 1;
        }
    }
    if (sigprocmask(SIG_SETMASK, &old_mask, nullptr) == -1) {
        std::perror("restore mask"); return 1;
    }
    std::printf("started=%d reaped=%d\n", started, static_cast<int>(reaped));
    return started == 3 && !wait_error && reaped == started ? 0 : 1;
}
