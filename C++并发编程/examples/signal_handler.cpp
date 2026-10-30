// Linux/POSIX, single-thread handler demonstration; not a cross-thread flag.
#include <signal.h>
#include <unistd.h>
#include <cerrno>
#include <cassert>
#include <iostream>

volatile sig_atomic_t observed = 0;
extern "C" void on_signal(int) {
    const int saved_errno = errno;
    observed = 1;
    const char message[] = "handler: notification only\n";
    // write is async-signal-safe; errors/short writes are deliberately ignored.
    (void)write(STDERR_FILENO, message, sizeof(message)-1);
    errno = saved_errno;
}
int main() {
    struct sigaction action{};
    action.sa_handler = on_signal;
    sigemptyset(&action.sa_mask);
    action.sa_flags = 0;
    if (sigaction(SIGUSR1, &action, nullptr) == -1) return 2;
    if (raise(SIGUSR1) != 0) return 3;
    assert(observed == 1);
    std::cout << "main: handler returned\n";
}
