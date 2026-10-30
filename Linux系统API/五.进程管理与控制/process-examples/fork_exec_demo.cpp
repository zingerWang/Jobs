#define _POSIX_C_SOURCE 200809L
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
    if (argc < 2) {
        fprintf(stderr, "Usage: %s command [args...]\n", argv[0]);
        return EXIT_FAILURE;
    }

    printf("parent: pid=%ld\n", (long)getpid());
    /* 刷新用户态缓冲，避免未输出的内容被 fork 复制。 */
    if (fflush(NULL) == EOF) {
        perror("fflush");
        return EXIT_FAILURE;
    }

    pid_t pid = fork();
    if (pid == -1) {
        perror("fork");
        return EXIT_FAILURE;
    }

    if (pid == 0) {
        /* &argv[1] 的第一个元素是命令名，末尾仍有 NULL。 */
        execvp(argv[1], &argv[1]);

        /* 只有 execvp 失败，才会走到这里。 */
        int saved_errno = errno;
        perror("execvp");
        _exit(saved_errno == ENOENT ? 127 : 126);
    }

    int status;
    pid_t result;
    do {
        result = waitpid(pid, &status, 0);
    } while (result == -1 && errno == EINTR);

    if (result == -1) {
        perror("waitpid");
        return EXIT_FAILURE;
    }

    if (WIFEXITED(status)) {
        int code = WEXITSTATUS(status);
        printf("parent: child=%ld exited, code=%d\n", (long)pid, code);
        return code;
    }

    if (WIFSIGNALED(status)) {
        int sig = WTERMSIG(status);
        printf("parent: child=%ld killed by signal=%d\n", (long)pid, sig);
        return EXIT_FAILURE;
    }

    return EXIT_FAILURE;
}
