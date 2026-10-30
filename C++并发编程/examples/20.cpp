// Linux/POSIX example. Default self-test; --serve waits for external SIGTERM.
#include <signal.h>
#include <pthread.h>
#include <unistd.h>
#include <cassert>
#include <cerrno>
#include <condition_variable>
#include <iostream>
#include <mutex>
#include <stdexcept>
#include <string>
#include <system_error>
#include <thread>

int main(int argc, char** argv) {
    bool serve = argc == 2 && std::string(argv[1]) == "--serve";
    if (argc > 1 && !serve) return 2;
    sigset_t set;
    sigemptyset(&set);
    sigaddset(&set, SIGINT);
    sigaddset(&set, SIGTERM);
    int error = pthread_sigmask(SIG_BLOCK, &set, nullptr);
    if (error) throw std::system_error(error, std::generic_category(), "pthread_sigmask");
    // Construct EVERY worker after blocking. New threads inherit this mask.
    std::mutex mutex;
    std::condition_variable_any cv;
    bool stopped = false;
    std::jthread worker([&](std::stop_token token) {
        std::unique_lock lock(mutex);
        cv.wait(lock, token, [] { return false; });
        stopped = token.stop_requested();
    });
    std::cout << "pid=" << getpid() << " waiting for SIGINT/SIGTERM" << std::endl;
    if (!serve && kill(getpid(), SIGTERM) == -1)
        throw std::system_error(errno, std::generic_category(), "kill");
    int received = 0;
    error = sigwait(&set, &received);
    if (error) throw std::system_error(error, std::generic_category(), "sigwait");
    assert(received == SIGINT || received == SIGTERM);
    // Ordinary thread context: locks, C++ I/O and request_stop are allowed here.
    worker.request_stop();
    worker.join();
    assert(stopped);
    std::cout << "signal received; worker joined\n";
    // This standalone process exits with termination signals still blocked.
}
