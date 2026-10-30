在理解了 `open`、`read`、`write` 等底层系统调用后，引入 **stdio 用户空间缓冲**和**内核缓冲**这两个概念，就能厘清 Linux / Unix 文件 I/O 中数据究竟停留在哪一层。

下面以 Linux 上普通文件的缓冲 I/O 为主。常见的数据路径有两层缓冲：**C 标准库的用户态缓冲区，以及内核的 Page Cache**。`O_DIRECT` 等特殊路径会有所不同。

---

## 1. stdio 用户空间缓冲（标准 I/O 库缓冲）

这是由 C 标准库（如 glibc 的 `FILE *` 体系，包括 `fopen`、`fread`、`fwrite`、`fflush` 等）在用户空间维护的缓冲区。

**核心目的：减少系统调用次数。** 标准库先在内存中积攒数据，满足条件时再批量调用 `write()`。系统调用会进入内核并产生开销，但**用户态 / 内核态切换不等于进程或线程的调度上下文切换**；一次 `write()` 不一定导致调度器切换到其他线程。

三种缓冲模式可通过 `setvbuf()` 设置：

| 模式 | 含义 | 常见场景 |
| --- | --- | --- |
| **全缓冲 `_IOFBF`** | 数据积攒后成批提交；缓冲区满、显式刷新或正常关闭等都可能触发提交 | 普通文件、重定向到文件的 `stdout` |
| **行缓冲 `_IOLBF`** | 输出遇到 `\n`、缓冲区满或显式刷新等条件时提交 | 连接终端的 `stdout` |
| **无缓冲 `_IONBF`** | 不为凑批次而保留输出数据 | Linux/glibc 中默认的 `stderr` |

`fflush(fp)` 用于将输出流的 **stdio 用户态缓冲数据**交给底层写入函数；对通常的文件流，这会将数据提交到内核。`fflush(NULL)` 刷新所有打开的输出流。两者都不等于落盘，调用也可能失败，必须检查返回值。[参考：fflush(3)](https://man7.org/linux/man-pages/man3/fflush.3.html)

### 1.1 工程常见坑：`stdout` 重定向后，日志迟迟不出现

**现象：** 程序向终端逐行输出时能及时看到日志；改成下面这样后，文件可能很久没有新内容：

```sh
./a.out > log.txt
```

在 Linux/glibc 的默认行为下，`stdout` 连接终端时通常是**行缓冲**，连接普通文件或管道时通常是**全缓冲**。默认模式由 C 库根据输出对象选择，程序也可以显式修改。全缓冲下，单独的换行符通常不会触发刷新。[参考：setbuf(3)](https://man7.org/linux/man-pages/man3/setbuf.3.html)

例如下面的 Linux 程序：

```c
#include <stdio.h>
#include <unistd.h>

int main(void)
{
    for (int i = 0; i < 5; ++i) {
        if (printf("progress: %d\n", i) < 0) {
            return 1;
        }
        sleep(1);
    }
    return 0;
}
```

直接运行时通常每秒显示一行；重定向到文件后，这些短日志通常在程序正常退出时才一起出现。

需要纠正两个容易背错的说法：

- **不是“必须填满 4 KB 或 8 KB 才刷新”。** 实际缓冲区大小由实现和配置决定；未满时也能显式刷新，关闭流或正常退出也会刷新。
- **终端上也不是每次 `printf` 都立即可见。** 行缓冲下，没有换行的提示文字也可能滞留，需要显式调用 `fflush(stdout)`。

程序从 `main` 返回或调用 `exit()` 正常退出时会刷新 stdio 流；`_exit()`、`SIGKILL` 或默认处理下的致命信号终止不会完成同样的刷新。此时仍留在用户态缓冲区中的日志会丢失；已经提交到内核的数据，不会仅因该进程退出就随用户态缓冲一起消失。[参考：exit(3)](https://man7.org/linux/man-pages/man3/exit.3.html)、[_exit(2)](https://man7.org/linux/man-pages/man2/_exit.2.html)

需要及时输出时，可在关键日志后刷新：

```c
if (fflush(stdout) == EOF) {
    perror("fflush");
    return 1;
}
```

也可以在程序开始、对 `stdout` 进行其他 I/O 之前，选择一种模式：

```c
// 在 main 开始处设置行缓冲，适合逐行日志。
if (setvbuf(stdout, NULL, _IOLBF, 0) != 0) {
    fputs("setvbuf failed\n", stderr);
    return 1;
}

// 或者选择无缓冲；上面和下面二选一。
// setvbuf(stdout, NULL, _IONBF, 0);
```

**及时看到日志与断电后仍能保留日志，是两个不同要求。** `fflush(stdout)` 解决前一层的滞留；持久化还需要考虑内核和存储设备。

---

## 2. 内核缓冲（Kernel Buffering / Page Cache）

即使直接使用 `open` + `write`，或者 stdio 已经通过 `write()` 将数据交给内核，数据也不一定立即写入持久化存储。普通文件的缓冲 I/O 通常经过内核的 **页缓存（Page Cache）**。

这里说 `write()`“无用户态缓冲”，是指它不经过 stdio 的那一层缓冲，**不是说没有内核缓存**。现代 Linux 中，不应把文件数据的 Page Cache 和传统 Buffer Cache 想成必经的两套独立、重复缓存。

内核缓存主要用于：

- **加速读：** 缓存命中时直接从内存返回数据，减少存储设备访问。
- **合并写：** `write()` 通常将数据复制到页缓存并标记为脏页，然后返回；内核后续批量回写。但内存压力、脏页限流和同步标志等因素都可能使写入等待。

如果系统突然断电或内核崩溃，尚未持久化的脏数据可能丢失。常用控制接口如下：

| 接口 | 同步内容 | 关键区别 |
| --- | --- | --- |
| `fsync(fd)` | 文件数据及相关元数据 | 等待同步完成；需要检查返回值 |
| `fdatasync(fd)` | 文件数据，以及后续正确读取数据必需的元数据 | 可省去部分非必要元数据的同步 |

**`fdatasync()` 不是“完全不管元数据”。** 例如扩展文件后，新的文件大小是正确读取新增数据所必需的信息，必须同步；单纯修改时间等则通常不需要。因此它可能减少同步开销，但不保证总比 `fsync()` 快。[参考：fsync(2)](https://man7.org/linux/man-pages/man2/fsync.2.html)

### 2.1 `open()` 的同步写入与直接 I/O 标志

| 标志 | 含义 | 易错点 |
| --- | --- | --- |
| `O_SYNC` | 每次写操作等待本次数据及相关文件元数据同步完成 | 可按“每次写入具有类似 `fsync` 的完成要求”理解 |
| `O_DSYNC` | 每次写操作等待数据及读取所必需的元数据同步完成 | 类似 `fdatasync`，不是忽略所有元数据 |
| `O_DIRECT` | 请求直接 I/O，通常绕过文件数据的 Page Cache | 改变缓存路径，本身不提供 `O_SYNC` 的持久化保证 |

例如：

```c
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>

// 后续 write 使用同步写入语义；仍需处理错误和短写。
int fd = open("sync.log", O_WRONLY | O_CREAT | O_APPEND | O_SYNC, 0644);
if (fd == -1) {
    perror("open");
    // 调用方在此处理错误，不继续使用 fd。
}
```

`O_SYNC` 需要更频繁地等待存储，可能显著增加延迟、降低吞吐，但不能概括成“性能极差且绝对安全”。同步完成不等于多步更新具有事务原子性，也不能消除设备故障。新建或重命名文件后若要求名称关系持久化，还需考虑父目录的同步。

`O_DIRECT` 仍通过内核和文件系统处理，并非应用程序完全绕开内核操作磁盘。它通常对缓冲区地址、文件偏移和传输长度有对齐要求，具体限制取决于文件系统、设备及内核；不满足时可能失败或回退。需要同步完成保证时，还需配合同步标志或同步接口。[参考：open(2)](https://man7.org/linux/man-pages/man2/open.2.html)

数据库可用直接 I/O 减少数据库缓存池与 Page Cache 的重复缓存。例如 InnoDB 支持通过 `innodb_flush_method` 选择相关方式；收益取决于负载和配置，不能笼统认为数据库缓存一定比内核缓存更快。[参考：MySQL InnoDB 配置](https://dev.mysql.com/doc/refman/8.4/en/innodb-parameters.html#sysvar_innodb_flush_method)

### 2.2 内核的异步回写：为什么写着写着突然“卡顿”？

早期 Linux 使用 `pdflush`；现代内核由 writeback 回写机制中的 flusher / worker 执行后台工作，具体线程组织随版本演进。理解职责比记住某个线程名更重要：**把脏页写回存储，并在产生脏页过快时限制写入速度。**

`/proc/sys/vm/` 中常见参数：

| 参数 | 作用 |
| --- | --- |
| `dirty_background_ratio` | 按比例设置启动后台回写的脏页阈值 |
| `dirty_ratio` | 按比例设置写入进程受到回写压力、限流的阈值 |
| `dirty_background_bytes` / `dirty_bytes` | 对应的字节数阈值，与各自的比例参数互斥生效 |
| `dirty_expire_centisecs` | 脏数据变“老”、符合周期回写条件的时间，单位为百分之一秒 |
| `dirty_writeback_centisecs` | 周期回写的唤醒间隔，单位为百分之一秒 |

比例的基数是内核用于该计算的可用内存，并非简单的全部物理内存。实际限流还受设备回写能力等因素影响，不能理解为所有写操作在跨过某个全局比例时同时暂停。

典型过程是：**应用写得比设备快 → 脏页积累 → 后台回写赶不上 → 内核让产生脏页的写入线程等待或降速 → 某些 `write()` 延迟明显升高。** 因而异步回写不代表写入调用永远不阻塞，回写周期也不是持久化时限保证。[参考：Linux 内核 VM 参数文档](https://www.kernel.org/doc/html/latest/admin-guide/sysctl/vm.html#dirty-background-ratio)

---

## 3. 数据流转的全景图

典型的普通文件缓冲写入路径：

```text
[ 应用程序的数据 ]
          │
          ▼ fwrite() / fprintf() / fputc()
[ stdio 用户空间缓冲区：C 标准库管理 ]
          │
          ▼ 缓冲区满 / 行缓冲遇到换行 / fflush() / fclose() / 正常退出
[ write()：进入内核 ]
          │
          ▼
[ 内核 Page Cache：修改后的内容成为脏数据 ]
          │
          ▼ 后台回写 / fsync() / fdatasync() / 同步写入要求
[ 存储设备及其持久化介质 ]
```

直接调用 `write()` 跳过 stdio 缓冲；`O_DIRECT` 改变文件数据的内核缓存路径；`O_SYNC` / `O_DSYNC` 改变写操作的完成要求。这是三个不同维度。

通过 stdio 写文件且需要持久化时，顺序应为：

```c
// 前提：fp 是有效的普通文件输出流，前面的 fwrite 等调用已经检查成功。
// POSIX 接口；头文件为 <stdio.h> 和 <unistd.h>。
if (fflush(fp) == EOF) {
    perror("fflush");
    // 处理错误，不能报告保存成功。
} else {
    int fd = fileno(fp);
    if (fd == -1) {
        perror("fileno");
    } else if (fsync(fd) == -1) {
        perror("fsync");
    }
}
// 最终由调用方 fclose(fp)，并检查关闭结果。
```

如果先 `fsync()` 再 `fflush()`，第一次同步看不到仍在 stdio 缓冲区里的新数据。文件内容同步也不自动保证父目录中的新增或重命名目录项已经同步。[参考：fflush(3)](https://man7.org/linux/man-pages/man3/fflush.3.html)、[fsync(2)](https://man7.org/linux/man-pages/man2/fsync.2.html)

---

## 4. 工程常见坑：混用 `FILE *` 与 `int fd`

### 4.1 为什么可能乱序、覆盖或读错位置？

`FILE *` 维护自己的缓冲和流状态，`read/write/lseek` 只操作底层描述符。若它们关联同一个打开文件描述，却没有协调，两个层次对数据和位置的理解就可能不同。

下面是**错误用法示意，不是可依赖的输出规则**：

```c
FILE *fp = fopen("mixed.txt", "w");  // 假设成功
int fd = fileno(fp);

fwrite("A", 1, 1, fp);  // A 可能仍在 stdio 缓冲区
write(fd, "B", 1);      // B 已直接提交给内核
fclose(fp);              // 此时才提交 A
```

常见现象是文件出现 `BA`，而不是代码顺序看起来应有的 `AB`。但未按 POSIX 的句柄协调规则切换接口，结果不可依赖，不能把 `BA` 当作标准保证。

读取也有类似问题：`fread()` 可能提前读取一大块数据到用户态缓冲。应用只消费了几个字节时，底层 fd 的偏移量已经前进很多；接着调用 `read()` 可能跳过仍留在 stdio 缓冲区中的内容。

### 4.2 正确处理方式

- **优先统一使用一种接口。** 一个读写流程统一使用 stdio，或统一使用 `read/write`。
- **输出流切换到底层 fd 前，先 `fflush(fp)` 并检查成功。** 这样先前的输出才会按顺序交给内核。后续 `write()` 仍要处理错误和短写。
- **不要把“混用前刷新一次”当成万能规则。** 若继续切回 stdio，特别是涉及读取、预读缓存或 `lseek()`，还要协调缓冲状态和文件位置；可定位文件通常需要按已知的目标位置使用 `fseeko()` 等定位接口。管道和 socket 不能这样回退定位，应避免交替读取。
- **`fileno(fp)` 只返回底层 fd，不会刷新缓冲，也不会自动同步流状态。** 用它在 `fflush()` 之后调用 `fsync()` 很常见；拿到 fd 后继续交替 `fwrite/write`，问题仍然存在。
- **不要另外 `open()` 同一路径来“同步”。** 独立打开通常有独立偏移量，甚至可能发生互相覆盖。
- **明确关闭责任。** `fclose(fp)` 会关闭流所关联的描述符；不要再对同一个 fd 调用 `close()`。[参考：fileno(3)](https://man7.org/linux/man-pages/man3/fileno.3.html)、[fclose(3)](https://man7.org/linux/man-pages/man3/fclose.3.html)

Linux/POSIX 对可定位输入流的 `fflush()` 有扩展语义，但这不是可跨所有 C 平台使用的“清空输入”办法，尤其不能拿来统一处理管道或终端。[参考：fflush(3)](https://man7.org/linux/man-pages/man3/fflush.3.html)

---

## 5. 对比总结与面试常问

| 维度 | stdio 用户空间缓冲 | 内核缓冲（Page Cache） |
| --- | --- | --- |
| **管理者** | C 标准库，如 glibc | 操作系统内核 |
| **所在空间** | 用户空间 | 内核空间 |
| **主要目的** | 合并小操作，减少系统调用次数 | 缓存读取、合并写入、延迟回写 |
| **常见接口** | `fopen`、`fwrite`、`fread`、`fflush` | `open`、`write`、`read`、`fsync` |
| **数据向下一层提交的条件** | 缓冲区满、行缓冲换行、显式刷新、关闭流或正常退出等 | 后台回写、同步接口、同步写入要求等 |
| **控制接口** | `fflush()`：将待输出数据交给底层 | `fsync()` / `fdatasync()`：等待相应同步完成 |
| **主要丢失场景** | 进程异常结束时，尚未提交的用户态输出丢失 | 系统崩溃或断电时，未持久化的数据可能丢失 |

**问：为什么终端里正常的日志，重定向后长时间看不到？**

默认缓冲模式通常从行缓冲变成全缓冲。换行不再足以触发刷新，可显式 `fflush(stdout)`，或在首次 I/O 前设置行缓冲 / 无缓冲。

**问：`fwrite()`、`fflush()`、`write()` 成功，分别意味着什么？**

`fwrite()` 可能只是把数据交给 stdio；`fflush()` 将待输出的用户态缓冲提交给底层；普通缓冲 `write()` 成功，也通常不表示已经持久化。每一步都要检查实际返回结果。

**问：用了 `fwrite()`，为什么断电后数据仍可能丢？**

数据可能仍在 stdio 缓冲，也可能只进入了 Page Cache。需要持久化时，在检查写入结果后，先 `fflush()`，再 `fsync()` / `fdatasync()`，并检查错误；涉及新增目录项时还需考虑目录同步。

**问：`O_DSYNC` 是不是只写数据，完全不写元数据？**

不是。它还同步正确读取数据所必需的元数据，例如扩展文件后的文件大小。

**问：`O_DIRECT` 是否意味着数据已落盘，或者速度一定更快？**

都不是。它主要改变缓存路径；同步完成保证和性能收益是另外的问题，需结合同步机制、对齐要求与负载判断。

**问：为什么异步写入也会突然变慢？**

产生脏页的速度超过回写能力后，内核会限制写入速度，写线程可能等待回写进展。内存压力、文件系统分配等也可能带来等待。

**问：`fileno()` 能否解决 stdio 和 fd 混用的问题？**

不能。它只取得描述符，既不刷新缓冲，也不协调偏移量；应优先统一使用一套读写接口。
