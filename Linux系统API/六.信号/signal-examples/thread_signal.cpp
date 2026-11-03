#include <pthread.h>
#include <signal.h>
#include <cstdio>
#include <cstring>

struct Result { sigset_t set; int error; int signo; };
static void* receive(void* arg) {
    Result* r = static_cast<Result*>(arg);
    r->error = sigwait(&r->set, &r->signo);
    return nullptr;
}

static int fail(const char* where, int err) {
    std::fprintf(stderr, "%s: %s\n", where, std::strerror(err));
    return 1;
}

int main() {
    Result result{};
    sigemptyset(&result.set);
    sigaddset(&result.set, SIGUSR1);
    sigset_t old_mask;
    int err = pthread_sigmask(SIG_BLOCK, &result.set, &old_mask);
    if (err) return fail("pthread_sigmask", err);
    pthread_t receiver;
    err = pthread_create(&receiver, nullptr, receive, &result);
    if (err) return fail("pthread_create", err);
    err = pthread_kill(receiver, SIGUSR1);
    if (err) return fail("pthread_kill", err);
    err = pthread_join(receiver, nullptr);
    if (err) return fail("pthread_join", err);
    if (result.error) return fail("sigwait", result.error);
    err = pthread_sigmask(SIG_SETMASK, &old_mask, nullptr);
    if (err) return fail("restore mask", err);
    std::printf("receiver got SIGUSR1: %s\n",
                result.signo == SIGUSR1 ? "yes" : "no");
}
