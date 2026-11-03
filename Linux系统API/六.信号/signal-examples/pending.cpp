#include <signal.h>
#include <cerrno>
#include <cstdio>

static volatile sig_atomic_t seen = 0;
static void remember(int) { seen = 1; }

static int fail(const char* where) { std::perror(where); return 1; }

int main() {
    sigset_t blocked, old_mask, pending;
    sigemptyset(&blocked);
    sigaddset(&blocked, SIGUSR1);
    if (sigprocmask(SIG_BLOCK, &blocked, &old_mask) == -1)
        return fail("sigprocmask");
    struct sigaction action{};
    action.sa_handler = remember;
    sigemptyset(&action.sa_mask);
    if (sigaction(SIGUSR1, &action, nullptr) == -1) return fail("sigaction");

    if (raise(SIGUSR1) != 0 || raise(SIGUSR1) != 0) return fail("raise");
    if (sigpending(&pending) == -1) return fail("sigpending");
    std::printf("before: pending=%d seen=%d\n",
                sigismember(&pending, SIGUSR1), static_cast<int>(seen));

    sigset_t wait_mask = old_mask;
    sigdelset(&wait_mask, SIGUSR1);
    while (!seen) {
        if (sigsuspend(&wait_mask) == -1 && errno != EINTR)
            return fail("sigsuspend");
    }
    if (sigpending(&pending) == -1) return fail("sigpending");
    std::printf("after:  pending=%d seen=%d\n",
                sigismember(&pending, SIGUSR1), static_cast<int>(seen));
    if (sigprocmask(SIG_SETMASK, &old_mask, nullptr) == -1)
        return fail("restore mask");
}
