#include <atomic>
#include <cerrno>
#include <chrono>
#include <cstdio>
#include <thread>
#include <sys/wait.h>
#include <unistd.h>

int main() {
    // 提前准备好子进程要用的参数。
    char path[] = "/bin/sleep";
    char seconds[] = "2";
    char* args[] = {path, seconds, nullptr};
    char* env[] = {nullptr};

    std::atomic<bool> done{false};
    std::thread logger([&done] {
        while (!done.load()) {
            std::fprintf(stderr, "B: writing a log\n");
            std::this_thread::sleep_for(std::chrono::milliseconds(250));
        }
    });

    std::fprintf(stderr, "A: calling vfork\n");
    pid_t pid = vfork();
    if (pid == 0) {
        // 子进程暂用 A 的栈，只执行新程序；失败则直接终止。
        execve(path, args, env);
        _exit(127);
    }

    int result = 1;
    if (pid == -1) {
        std::perror("vfork");
    } else {
        std::fprintf(stderr, "A: vfork returned; calling waitpid\n");
        int status;
        pid_t waited;
        do {
            waited = waitpid(pid, &status, 0);
        } while (waited == -1 && errno == EINTR);
        if (waited == -1) {
            std::perror("waitpid");
        } else if (WIFEXITED(status)) {
            result = WEXITSTATUS(status);
            std::fprintf(stderr, "A: child exited with %d\n", result);
        } else if (WIFSIGNALED(status)) {
            std::fprintf(stderr, "A: child terminated by signal %d\n",
                         WTERMSIG(status));
        }
    }
    done.store(true);
    logger.join();
    return result;
}
