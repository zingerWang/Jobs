#include <cstdio>
#include <cstdlib>
#include <sys/wait.h>

int main() {
    // 固定且可信的命令；不拼接用户输入。
    int status = std::system("printf 'system demo\\n'; exit 7");
    if (status == -1) { std::perror("system"); return 1; }
    if (WIFEXITED(status)) {
        int code = WEXITSTATUS(status);
        std::printf("shell exit=%d\n", code);
        return code == 7 ? 0 : 1;
    }
    if (WIFSIGNALED(status))
        std::printf("shell signal=%d\n", WTERMSIG(status));
    return 1;
}
