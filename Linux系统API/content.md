	一、基础概念
		UNIX/Linux历史与标准
			POSIX、SUS、LSB规范
			内核、系统调用、glibc库函数
			系统调用 vs C库函数：性能差异、缓冲机制
		编程基础要素
			errno错误处理
			✅ strerror() / perror() 错误打印
			系统数据类型typedef
			/proc伪文件系统
			✅ man手册：man2系统调用，man3库函数
	二、文件I/O
		基础文件调用
			open / read / write / close / lseek
			文件描述符、打开文件表、inode
			fcntl：文件控制
				✅ F_GETFL / F_SETFL：动态设置O_NONBLOCK，epoll配套核心
			✅ dup / dup2：fd复制，IO重定向
		分散聚集IO
			✅ readv / writev：多缓冲区一次性读写，网络库常用
		原子读写
			✅ pread / pwrite：带偏移原子读写，多线程文件场景
		数据落盘持久化
			✅ fsync / fdatasync / sync：内核缓存刷盘区别
			✅ O_DIRECT：直接IO，绕过页缓存，高性能存储
		缓冲机制
			内核缓冲
			stdio用户空间缓冲
		文件元信息
			stat / fstat 获取文件属性
			文件权限、umask掩码
		高级IO
			mmap / munmap：内存映射
				私有映射、共享映射
				brk / sbrk 与malloc底层分配机制（ptmalloc）
			零拷贝：sendfile、splice、tee
			IO模型分类：阻塞IO、非阻塞IO、IO多路复用、信号驱动IO、AIO、io_uring
	三、文件、目录与链接
		硬链接 link / unlink
		符号链接 symlink
		目录操作
			mkdir、rmdir、readdir
			✅ readdir 非线程安全；readdir_r 多线程注意事项
			✅ chdir() / getcwd()：进程工作目录
		ACL访问控制列表（了解项，可折叠）
	四、用户与进程凭证
		用户/组数据库：/etc/passwd、/etc/shadow、/etc/group
		✅ real uid / effective uid / saved uid 区别
			setuid程序原理：passwd修改shadow底层机制
		UID、GID，进程凭证
		set-user-ID / set-group-ID 特殊权限程序
	五、进程管理
		5.1 进程基础与控制
			进程基础
				PID、进程虚拟内存布局
				命令行参数、环境变量environ
			进程创建与程序执行
				✅ fork：写时复制COW
				✅ vfork：共享父进程地址空间，子进程优先执行
				clone：底层系统调用，线程/容器namespace基础
				exec系列函数加载新程序
				✅ FD_CLOEXEC：exec时自动关闭fd，安全编程考点
				wait / waitpid 回收子进程、僵尸进程
					✅ WIFEXITED / WEXITSTATUS / WIFSIGNALED：获取子进程退出状态宏
			✅ 进程终止
				exit() / _exit() / abort() 三者区别
				exit刷新stdio缓冲，_exit直接进入内核
			✅ system()：fork+exec+wait封装，安全问题，命令注入风险
			✅ setjmp / longjmp：C非局部跳转，底层错误恢复
		5.2 进程关系与终端
			进程组、会话、控制终端
				进程组ID、会话session
				作业控制
		5.3 时间与定时器
			时间相关API
				✅ clock_gettime() 高精度时间（替代gettimeofday）
				系统时间、进程CPU时间
				time、clock_nanosleep
	六、信号
		信号基础
			信号来源、默认处理动作
			不可靠信号、实时可靠信号
		信号API
			signal()、sigaction()（推荐）
			✅ kill()、raise()：发送信号
			信号集：sigemptyset、sigaddset
			sigprocmask 信号屏蔽
			sigpending 查询待处理信号
			✅ sigsuspend：原子解除屏蔽+挂起进程，解决竞态
			✅ sigaltstack：替代信号栈，栈溢出场景
		信号进阶
			信号中断系统调用
			✅ 异步信号安全函数：信号处理函数只能调用AS-Safe函数
			✅ SIGCHLD：信号处理函数循环waitpid(-1, &status, WNOHANG)回收，防止僵尸
			✅ SIGPIPE：向已关闭socket/管道写，默认终止进程
			多线程环境下的信号行为：pthread_sigmask、pthread_kill
	七、进程间通信 IPC
		管道与FIFO
			pipe匿名管道（亲缘进程）
			FIFO有名管道（无亲缘进程）
			✅ popen / pclose：管道调用外部命令封装
			✅ socketpair：全双工管道，Nginx/Redis广泛使用
			管道读写阻塞规则
		XSI IPC（俗称System V IPC，APUE标准叫法）
			✅ ftok()：生成XSI IPC key_t
			消息队列 msgget/msgsnd/msgrcv
			信号量 semget/semop：同步互斥
			共享内存 shmget/shmat
		POSIX IPC
			POSIX消息队列 mq_*
			POSIX有名/无名信号量
			✅ shm_open + mmap：POSIX共享内存标准用法
	八、POSIX线程（pthread）
		线程基础
			pthread库，线程ID
			pthread_create / pthread_exit
			pthread_join、pthread_detach
		线程同步原语
			mutex互斥锁
			cond条件变量（等待通知）
				✅ 虚假唤醒：pthread_cond_wait必须放在while循环，不能if
			自旋锁、读写锁
				✅ pthread_rwlock：写饥饿问题
			屏障barrier
		线程高级特性
			线程属性配置
			TSD线程私有数据：pthread_key_create / __thread
			✅ pthread_once：多线程单例初始化
			✅ pthread_cancel、pthread_cleanup_push/pop：线程取消与资源清理
			✅ fork+多线程陷阱：子进程仅保留调用线程，持有锁会造成死锁
			✅ 内存屏障与原子操作：volatile≠同步，std::atomic与内存序
			✅ 单一线程段错误，整个进程崩溃（信号面向进程）
	九、网络编程基础（Socket，UNP核心）
		Socket基础
			域：UNIX域套接字、IPv4/IPv6
			SOCK_STREAM(TCP)、SOCK_DGRAM(UDP)
			socket / bind / listen / accept / connect
		地址与字节序
			getaddrinfo地址解析
			htons/ntohl 大小端转换
			✅ inet_pton / inet_ntop：二进制与字符串IP互转
		Socket读写与关闭
			✅ send / recv 带flag的socket读写，对比read/write
			✅ sendmsg / recvmsg：高级读写，支持传递fd、控制信息
			✅ shutdown vs close：半关闭、引用计数差异
		Socket选项
			✅ SO_REUSEADDR / SO_REUSEPORT：解决TIME_WAIT bind失败，多进程负载均衡
			✅ TCP_NODELAY：关闭Nagle算法，降低延迟
			✅ TCP_CORK：合并小包，大文件传输优化
			✅ MSG_NOSIGNAL：send时抑制SIGPIPE信号
		网络TCP细节
			TCP粘包拆包
			TIME_WAIT状态产生、作用与调优
		IO多路复用
			✅ select / poll / epoll底层对比
				select：数组，O(N)，fd上限1024
				poll：链表，O(N)，无硬上限
				epoll：红黑树+就绪链表，事件就绪O(1)，无硬上限
			epoll
				LT水平触发 / ET边缘触发
				✅ ET模式强制要求：非阻塞fd + 循环读到EAGAIN
				✅ EPOLLIN / EPOLLOUT：读写事件区分
				✅ EPOLLRDHUP / EPOLLHUP / EPOLLERR：事件含义；EPOLLRDHUP优雅检测对端关闭
				EPOLLONESHOT：防止惊群
		非阻塞connect：返回EINPROGRESS的处理流程
	十、守护进程、伪终端
		守护进程daemon
			标准创建流程：fork → setsid → fork → chdir("/")
				✅ 重定向stdin/stdout/stderr至/dev/null或日志，避免占用终端
			✅ 单实例守护进程：文件锁防止重复启动
			✅ nohup 原理：忽略SIGHUP，配套输出重定向
			syslog系统日志
				✅ openlog / closelog / setlogmask：syslog高级配置
			✅ prctl / prlimit：动态修改进程资源限制
		伪终端pty
			master/slave两端
			应用场景：ssh、终端模拟器
	十一、库、调度与资源限制
		静态库、共享库
			dlopen / dlsym 动态加载
			✅ dlerror() 获取动态链接错误；编译需 -ldl
		进程调度
			nice值、调度策略
		资源与系统限制
			✅ sysconf() / pathconf()：运行时系统配置
				✅ sysconf(_SC_OPEN_MAX)：最大文件描述符
				✅ sysconf(_SC_NPROCESSORS_ONLN)：在线CPU核心数，线程池调参
				✅ sysconf(_SC_PAGESIZE)：获取内存页大小，mmap内存对齐必备
			getrlimit / setrlimit：进程资源限制