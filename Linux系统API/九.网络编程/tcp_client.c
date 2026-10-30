#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <signal.h>
#include <arpa/inet.h>
#include <sys/socket.h>

#define PORT 8080
#define BUF_SIZE 1024

static void die(const char *msg) {
    perror(msg);
    exit(1);
}

int main(int argc, char *argv[]) {
    const char *server_ip = (argc > 1) ? argv[1] : "127.0.0.1";

    int cfd;
    struct sockaddr_in server_addr;
    char buf[BUF_SIZE];
    ssize_t n = -1;

    /* 服务端若已关闭，send 会返回 EPIPE；先屏蔽 SIGPIPE，避免进程被信号杀死 */
    signal(SIGPIPE, SIG_IGN);

    /* 1. 创建套接字（客户端通常不 bind，源端口由内核自动分配） */
    cfd = socket(AF_INET, SOCK_STREAM, 0);
    if (cfd < 0) die("socket");

    /* 2. 连接服务器，触发三次握手；返回即表示已连上 */
    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sin_family = AF_INET;
    server_addr.sin_port   = htons(PORT);
    if (inet_pton(AF_INET, server_ip, &server_addr.sin_addr) != 1)
        die("inet_pton");

    if (connect(cfd, (struct sockaddr *)&server_addr, sizeof(server_addr)) < 0)
        die("connect");

    printf("connected to %s:%d\n", server_ip, PORT);

    while (1) {
        /* 3. 从标准输入读一行，发给服务器 */
        printf("> ");
        fflush(stdout);
        if (fgets(buf, sizeof(buf), stdin) == NULL)
            break; /* Ctrl-D 退出 */

        size_t len = strlen(buf);
        if (send(cfd, buf, len, 0) < 0)
            die("send");

        /* 4. 接收服务器的回显并打印。TCP 是字节流，一次 recv 不保证把一条消息读完，
         *    这里以 '\n' 作为「一条消息」的边界，循环读到换行为止（见 8.2 粘包/拆包）。 */
        size_t got = 0;
        while (got < sizeof(buf) - 1) {
            n = recv(cfd, buf + got, sizeof(buf) - 1 - got, 0);
            if (n < 0 && errno == EINTR) continue;   /* 被信号打断，重试 */
            if (n <= 0) break;
            got += (size_t)n;
            buf[got] = '\0';
            if (memchr(buf, '\n', got) != NULL) break;
        }
        if (n <= 0) {
            if (n == 0)
                printf("server closed connection\n");
            else
                perror("recv");
            break;
        }
        printf("echo: %s", buf);
    }

    close(cfd);
    return 0;
}
