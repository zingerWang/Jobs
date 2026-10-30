#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <signal.h>
#include <arpa/inet.h>
#include <sys/socket.h>

#define PORT 8080
#define BACKLOG 128
#define BUF_SIZE 1024

static void die(const char *msg) {
    perror(msg);
    exit(1);
}

int main(void) {
    int lfd, cfd;
    struct sockaddr_in addr, client_addr;
    socklen_t client_len;
    char buf[BUF_SIZE];
    ssize_t n;

    /* 见 5.1 节：向已被对端关闭的连接写会触发 SIGPIPE，而它的默认动作是
     * 终止进程。这里直接忽略该信号，让 send 返回 -1 + errno=EPIPE 交给代码处理。 */
    signal(SIGPIPE, SIG_IGN);

    /* 1. 创建监听套接字 */
    lfd = socket(AF_INET, SOCK_STREAM, 0);
    if (lfd < 0) die("socket");

    /* 允许端口在 TIME_WAIT 状态下复用，避免重启时报 EADDRINUSE */
    int opt = 1;
    if (setsockopt(lfd, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof(opt)) < 0)
        die("setsockopt");

    /* 2. 绑定本地地址（0.0.0.0:8080） */
    memset(&addr, 0, sizeof(addr));
    addr.sin_family      = AF_INET;
    addr.sin_addr.s_addr = htonl(INADDR_ANY); /* 监听所有网卡 */
    addr.sin_port        = htons(PORT);        /* 注意字节序转换 */
    if (bind(lfd, (struct sockaddr *)&addr, sizeof(addr)) < 0)
        die("bind");

    /* 3. 进入监听：backlog 控制全连接队列长度 */
    if (listen(lfd, BACKLOG) < 0)
        die("listen");

    printf("server listening on 0.0.0.0:%d\n", PORT);

    while (1) {
        /* 4. 从全连接队列取出一个已完成握手的连接。
         *    client_len 是「传入缓冲区容量、传出实际地址长度」，每次 accept 前都要重置 */
        client_len = sizeof(client_addr);
        cfd = accept(lfd, (struct sockaddr *)&client_addr, &client_len);
        if (cfd < 0) {
            if (errno == EINTR) continue;   /* 被信号打断，重试 */
            perror("accept");
            continue;
        }

        char peer[INET_ADDRSTRLEN];
        inet_ntop(AF_INET, &client_addr.sin_addr, peer, sizeof(peer));
        printf("connection from %s:%d\n", peer, ntohs(client_addr.sin_port));

        /* 5. 收发循环：回显（echo）服务 */
        while ((n = recv(cfd, buf, sizeof(buf), 0)) > 0) {
            /* 阻塞模式下 send 一般会把 n 字节全部发完，但仍然检查返回值 */
            if (send(cfd, buf, n, 0) < 0) {
                perror("send");
                break;
            }
        }

        /* recv 返回 0 表示对端正常关闭；ECONNRESET 表示对端异常断开（RST），也不算错误 */
        if (n < 0 && errno != ECONNRESET)
            perror("recv");
        printf("connection closed\n");

        /* 6. 关闭这个连接，继续等待下一个 */
        close(cfd);
    }

    close(lfd);
    return 0;
}
