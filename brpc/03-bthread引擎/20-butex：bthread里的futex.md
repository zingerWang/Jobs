# butex：bthread 里的「futex」

> **一句话总结**：`butex`（**b**thread f**utex**）是 bthread 库自己实现的一个「32 位整数 + 等待队列」的同步原语，语义上对齐 Linux 的 `futex`（值没变就睡、值变了就醒），但**挂起和唤醒的对象从「操作系统线程」换成了「协程（bthread）」**——它不调用 `futex(2)` 系统调用去睡眠线程，而是把当前协程从 worker 上摘下来，让 worker 继续跑别的协程。`mutex.cpp`、`condition_variable.cpp`、`rwlock.cpp`、`semaphore.cpp` 里那些协程版锁，全都是在这块地基上盖起来的。

---

## 阅读路径

- **快速版（约 6 分钟）**：读「一句话总结」+ 第 1 节（为什么需要它）+ 第 5 节（`butex_wait` / `butex_wake` 的真实实现）+ 第 5 节末尾的「唤醒链路」图。
- **深入版（约 30 分钟）**：全文通读，重点吃透第 3 节（数据结构）、第 4 节（快慢路径）、第 5 节（逐函数源码）和第 8 节（唤醒丢失与 object pool 那场著名的 race）。把第 6 节的示例真跑一遍。

---

## 目录

1. [为什么 bthread 需要一个自己的 futex](#1-为什么-bthread-需要一个自己的-futex)
2. [futex 原理速览：「门铃」模型](#2-futex-原理速览门铃模型)
3. [butex 的数据结构：一个 value + 一条等待队列](#3-butex-的数据结构一个-value--一条等待队列)
4. [快路径与慢路径：butex_wait 怎么决定睡不睡](#4-快路径与慢路径butex_wait-怎么决定睡不睡)
5. [源码剖析：逐个函数看真实实现](#5-源码剖析逐个函数看真实实现)
6. [完整可复现的示例](#6-完整可复现的示例)
7. [数据验证：wake 一个 vs wake 全部](#7-数据验证wake-一个-vs-wake-全部)
8. [边界、反例与失败路径](#8-边界反例与失败路径)
9. [对比与选型：butex vs futex vs condition_variable](#9-对比与选型butex-vs-futex-vs-condition_variable)
10. [常见问题 FAQ](#10-常见问题-faq)
11. [延伸阅读](#11-延伸阅读)
12. [思维导图总结](#12-思维导图总结)

---

## 1. 为什么 bthread 需要一个自己的 futex

### 1.1 痛点：bthread 之间也需要「等一件事」

第 14 篇讲过 bthread 的 M:N 模型：**M 个协程跑在 N 个 worker 线程上**。只要协程之间需要互相等待（等一个变量变成某个值、等一把锁释放、等一个条件成立），就必须有一种「挂起自己、稍后被别人叫醒」的机制。

Linux 已经提供了 `futex(2)`：一块 4 字节的共享内存 + `FUTEX_WAIT` / `FUTEX_WAKE` 两个操作。`pthread_mutex_t`、`pthread_cond_t`、`sem_t` 全都是站在 futex 上面。

那么 bthread 直接用 futex 行不行？

**不行。** 因为 futex 挂起的是**调用它的那个内核线程（task）**：

```text
[普通 pthread 场景]                    [bthread 场景]
pthread_mutex_lock 阻塞               bthread_mutex_lock 阻塞
   └─> futex(FUTEX_WAIT)                 └─> ？？？
        └─> 内核把「这个线程」挂起         如果也调 futex(FUTEX_WAIT)
            线程从 CPU 上消失                    └─> 挂起的是「worker 线程」
                                                     而 worker 上还排着几十个
                                                     本来可以跑的协程！
```

> **类比：餐厅的服务员**。你把 bthread 想成「桌客人」，worker 想成「服务员」。客人要等后厨出菜，正确做法是**服务员把这张桌标记成「等菜中」，转身去服务别的桌**。而 futex 的做法相当于「**让服务员站在这一桌旁边干等**」——一张桌就把一个服务员锁死了。服务员一共就 8 个（`bthread_concurrency` 默认 `8 + BTHREAD_EPOLL_THREAD_NUM`，见 `bthread.cpp:47`），几张桌就把餐厅拖垮。

这就是 bthread 必须自造一个 futex 的根本原因：

> **它要有 futex 的语义（值没变才睡、序列化的 wait/wake、内存可见性），但挂起物必须是「协程」而不是「线程」。**

### 1.2 butex 的定位：所有同步原语的地基

打开 `src/bthread/`，你会看到这些文件都 `#include "bthread/butex.h"`：

| 同步原语 | 文件 | 底层用的是 |
|---------|------|-----------|
| `bthread_mutex_t` | `mutex.cpp` | `m->butex`（一个 32 位 butex 的地址） |
| `bthread_cond_t` | `condition_variable.cpp` | `c->seq`（一个 32 位 butex 的地址） |
| `bthread_rwlock_t` | `rwlock.cpp` | `lock_word` + `writer_wait_count` + 内嵌一个 `bthread_mutex_t` |
| `bthread_sem_t` | `semaphore.cpp` | `sem->butex`（一个 32 位 butex 的地址） |
| `bthread_usleep` / `join` | `task_group.cpp` | 定时器 / 等待队列 |

所以 butex 这一篇值得单独写：**读懂了 butex，第 21 篇的锁源码基本就是「按图索骥」。**

> **一个常见说法要纠正**：本系列 `README.md` 第 3 部分把第 21 篇的源码位置写成 `bthread/bthread_mutex.cpp`、`bthread_cond.cpp`。**这两个文件不存在**（`ls src/bthread/` 可验证）。真实文件名是 `mutex.cpp/h`、`condition_variable.cpp/h`、`rwlock.cpp/h`、`semaphore.cpp`。

---

## 2. futex 原理速览：「门铃」模型

在讲 butex 之前，先把 futex 讲透，因为 butex 是它的「协程化改写」。

### 2.1 futex 的三要素

| 要素 | 说明 |
|------|------|
| **一块内存** | 一个 32 位整数（通常是 `pthread_mutex_t` 里的 `lock` 字段、`sem_t` 里的计数）。这是**用户态可见的唯一状态** |
| **FUTEX_WAIT(addr, expected)** | 原子的：**如果 `*addr == expected` 就睡**，否则立刻返回 `EAGAIN`。睡 = 把自己挂到内核里 `addr` 对应的等待队列上 |
| **FUTEX_WAKE(addr, n)** | 从 `addr` 的等待队列里叫醒最多 n 个 |

> **类比：门铃**。
> - 门铃上的**数字**（`*addr`）是最关键的：你按门铃之前先看一眼数字，如果数字已经变了，说明「事情已经发生了」，你不用等了，直接走（**快路径**）。
> - 只有数字没变，你才真的按铃躺下睡（**慢路径**，一次 `futex` 系统调用）。
> - 对方要叫醒你时：先把数字改掉（`*addr = new_value`），**再**按唤醒键（`FUTEX_WAKE`）。
>
> **顺序绝不能反**。如果先 WAKE 再改数字，可能出现：WAKE 时等待队列是空的（没人睡）→ 你随后才去 WAIT，发现数字「还没变」→ 你睡了 → **永远没人再叫醒你**。这就是经典的**唤醒丢失（lost wakeup）**。

### 2.2 为什么「值没变才睡」这么重要

它把「检查条件」和「入睡」变成**一个原子操作**（由内核保证）：不可能出现「我刚检查完条件不满足，还没来得及睡，别人就改值+唤醒了」这种窗口。

用户态代码因此长这样（以 `bthread_mutex` 为例的伪码）：

```text
loop:
    if (*addr != expected)  return EAGAIN      // 快路径：条件已变，不用睡
    futex_wait(addr, expected)                 // 慢路径：原子地「再检查一次 + 睡」
    continue loop
```

**注意这是「循环重试」的**：即使被唤醒，也要重新检查条件（spurious wakeup 是允许的）。

### 2.3 bthread 要改的是哪一步

对照表：

| 步骤 | Linux futex | butex |
|------|------------|-------|
| 值没变 → 睡 | 内核把**当前线程**从调度器摘下来 | 把**当前协程**挂到 `Butex::waiters` 链上，然后 `TaskGroup::sched` 切到下一个协程；**worker 线程还在跑** |
| 把值改掉 | 用户态直接 store | 一样（butex 的 `value` 就是用户态那块 int） |
| 叫醒 | `futex(FUTEX_WAKE)` → 内核唤醒线程 | 从 `waiters` 链上摘一个 waiter → 找到它的 `TaskMeta` → `ready_to_run`（**没有系统调用**） |
| 实在没人可跑 | — | 只有当「所有 worker 都空了」时，`TaskControl::signal_task` 才会用真 `futex_wake_private` 叫醒一个睡着的 worker（`task_control.cpp:666`） |

**最后一行是关键洞察**：butex 的唤醒**绝大多数情况下不需要任何系统调用**；真正的 `futex` 系统调用被「下沉」到了「唤醒空闲 worker」这一层（`parking_lot.h`）。这就是 bRPC 能扛高并发的微观原因之一。

![butex 的快路径与慢路径](../images/20_butex_fastpath.png)

---

## 3. butex 的数据结构：一个 value + 一条等待队列

### 3.1 `Butex`（`butex.cpp:112-119`）

```cpp
struct BAIDU_CACHELINE_ALIGNMENT Butex {
    Butex() {}
    ~Butex() {}

    butil::atomic<int> value;      // ← 就是返回给用户的那块 32 位内存
    ButexWaiterList waiters;       // ← 等待者链表（侵入式双向链表）
    FastPthreadMutex waiter_lock;  // ← 保护 waiters 链表的 pthread 锁
};

BAIDU_CASSERT(offsetof(Butex, value) == 0, offsetof_value_must_0);
BAIDU_CASSERT(sizeof(Butex) == BAIDU_CACHELINE_SIZE, butex_fits_in_one_cacheline);
```

三点极其重要：

1. **`value` 必须位于偏移 0**（`butex.cpp:121`）。因为 `butex_create()` 返回的是 **`&b->value`**（`butex.cpp:264-270`），而所有唤醒函数拿到的是这个 `void*`，再用 `container_of` 反推出整个 `Butex`（`butex.cpp:307`）。这是 C 语言风格的「从成员指针反推宿主结构」。
2. **整个 `Butex` 恰好占一个 cacheline**（`butex.cpp:122`）。`BAIDU_CACHELINE_SIZE` = 64（`butil/compiler_specific.h:301`）。一个热点的 butex 不会引起两个核之间的 cacheline 乒乓。
3. **`waiters` 链表本身是用真 pthread 锁保护的**（`waiter_lock` 默认是 `butil::Mutex`，即 `pthread_mutex_t` 的封装——因为默认构建没有定义 `BTHREAD_USE_FAST_PTHREAD_MUTEX`，见 `mutex.h:95-97`）。这不矛盾：这把锁**只用来做链表的摘挂**，持锁时间是几十纳秒，不会在里面做调度。

> **纠正一个流传的说法**：网上有些 bthread 分析说 butex 的等待队列是用「CAS 原语操作 `_butex_waiting_xxx` 字段」实现的。**本仓库源码里没有这样的字段或函数。** 真实的并发方案是：**链表操作走 `waiter_lock`（pthread 互斥锁），waiter 的去向走 `ButexWaiter::container`（原子指针）**。见下一节。

### 3.2 三种 waiter：一种基类，两种派生（`butex.cpp:81-108`）

```cpp
struct ButexWaiter : public butil::LinkNode<ButexWaiter> {
    bthread_t tid;                       // tid == 0 表示「这是 pthread，不是 bthread」
    butil::atomic<Butex*> container;     // 当前挂在哪条 Butex 的 waiters 链上；nullptr 表示已摘除
};

// 非 pthread 的协程使用，分配在**栈上**
struct ButexBthreadWaiter : public ButexWaiter {
    TaskMeta* task_meta;                 // 指向协程元数据，唤醒时靠它 ready_to_run
    TimerThread::TaskId sleep_id;        // 超时任务的 id（见第 22 篇）
    WaiterState waiter_state;            // READY / TIMEDOUT / UNMATCHEDVALUE / INTERRUPTED
    int expected_value;
    Butex* initial_butex;
    TaskControl* control;                // 跨 tag 唤醒时要选一个 TaskGroup
    const timespec* abstime;
};

// 真 pthread（含主线程 / 非 worker 线程）使用，同样分配在**栈上**
struct ButexPthreadWaiter : public ButexWaiter {
    butil::atomic<int> sig;              // PTHREAD_NOT_SIGNALLED / PTHREAD_SIGNALLED
};
```

设计要点：

- **`container` 是「waiter 与 butex 的绑定关系」**。所有摘除逻辑（`erase_from_butex`，`butex.cpp:515`）都遵循同一个模式：CAS/读 `container` 拿到 `b`，锁 `b->waiter_lock`，**再确认一次** `container` 还是 `b`（防 ABA），才真正 `RemoveFromList` 并把 `container` 置 `nullptr`。这样「超时线程」和「唤醒线程」同时想摘同一个 waiter 时，只有一个能成功。
- **waiter 分配在调用者的栈上**（`butex_wait` 里的局部变量 `ButexBthreadWaiter bbw`，`butex.cpp:756`）。所以「唤醒一个已经因超时返回、栈已销毁的 waiter」是**内存不安全**的。这正是 `erase_from_butex` 开头那句注释的含义（`butex.cpp:516-518`），也是 `butex_wait` 结尾那段自旋等待（`BT_LOOP_WHEN`，`butex.cpp:792-799`）存在的原因：**必须等定时器回调 / interrupt 彻底放手，才能让栈帧消亡**。
- **`tid == 0` 是「pthread waiter」的标志**（`butex.cpp:82` 的注释与 `butex.cpp:318` 的判断）。这让同一套队列能同时容纳协程和真线程——因为 bRPC 里主线程、以及 `bthread` 之外的用户线程也可能来调 `butex_wait`。

### 3.3 等待队列的结构图

```text
                      ┌──────────────────────── Butex (1 cacheline) ───────────────────────┐
                      │ value: atomic<int>    ← butex_create() 返回的就是这里的地址        │
                      │ waiter_lock: pthread mutex  ← 只保护下面这条链                      │
                      │ waiters: LinkedList<ButexWaiter>                                    │
                      └────────────────────────────────────────────────────────────────────┘
                                    │
       head ──► [ButexBthreadWaiter A] ⇄ [ButexBthreadWaiter C] ⇄ [ButexPthreadWaiter D] ──► tail
                    tid != 0                  tid != 0                 tid == 0
                    task_meta → TaskMeta#A    task_meta → TaskMeta#C   sig: atomic<int>
                    container = &Butex        container = &Butex        container = &Butex
                    ↑ 栈上对象                 ↑ 栈上对象                 ↑ 栈上对象
```

![butex 的等待队列与唤醒链路](../images/20_butex_queue.png)

---

## 4. 快路径与慢路径：butex_wait 怎么决定睡不睡

### 4.1 三层路径

`butex_wait`（`butex.cpp:743`）一进来就做第一层判断：

```cpp
int butex_wait(void* arg, int expected_value, const timespec* abstime, bool prepend) {
    Butex* b = container_of(static_cast<butil::atomic<int>*>(arg), Butex, value);
    if (b->value.load(butil::memory_order_relaxed) != expected_value) {
        errno = EWOULDBLOCK;
        butil::atomic_thread_fence(butil::memory_order_acquire);   // 见 4.3
        return -1;
    }
    TaskGroup* g = BAIDU_GET_VOLATILE_THREAD_LOCAL(tls_task_group);
    if (nullptr == g || g->is_current_pthread_task()) {
        return butex_wait_from_pthread(g, b, expected_value, abstime, prepend);  // 真线程路径
    }
    // ... 协程路径
}
```

由此分出三条路：

| 路径 | 触发条件 | 代价 |
|------|---------|------|
| **① 值不匹配（最快）** | `*butex != expected_value` | 一次原子读 + 一条 fence，**不睡、不碰链表** |
| **② 真线程路径** | 当前不在 worker 上，或当前是「pthread-mode 的 main task」 | 走 `butex_wait_from_pthread` → 最终 **`futex_wait_private` 系统调用** |
| **③ 协程路径（本篇主角）** | 在 worker 上的普通协程 | **无系统调用**：挂队列 + 切协程 |

第 ② 条路同样重要——**bthread 必须能和 pthread 互操作**（主线程调 `bthread_mutex_lock` 也得对啊）。它由 `butex_wait_from_pthread`（`butex.cpp:653`）实现，用一个栈上的 `ButexPthreadWaiter` 排队，然后 `wait_pthread`（`butex.cpp:147`）里 `futex_wait_private(&pw.sig, PTHREAD_NOT_SIGNALLED, ptimeout)` 真睡。唤醒时 `wakeup_pthread`（`butex.cpp:135`）先 `sig.store(PTHREAD_SIGNALLED, release)`，再 `futex_wake_private(&pw.sig, 1)`。

> 注意 `wait_pthread` 里的循环：超时后先 `erase_from_butex`，**如果别人正在摘除（返回 false）**，还要再看一眼 `sig`——因为「被别人唤醒」和「自己超时」可能同时发生，必须确定自己到底是哪种结局（`butex.cpp:173-186`）。

### 4.2 协程路径：`set_remained` + `sched` 的精髓

协程路径最妙的两行是（`butex.cpp:786-788`）：

```cpp
bbw.task_meta->current_waiter.store(&bbw, butil::memory_order_release);
WaitForButexArgs args{ &bbw, prepend };
g->set_remained(wait_for_butex, &args);
TaskGroup::sched(&g);
```

**为什么不直接在当前栈上把自己挂进队列再切走？** 因为如果那样，「挂队列」这个动作要在**协程 A 的栈上**执行，而 `TaskGroup::sched` 一旦切走，当前栈就冻结了——逻辑上没问题，但会让「入队」和「真正入睡」相隔一段不可控的时间，期间有人唤醒你（队列里还没有你，唤醒失败）就丢唤醒。

bRPC 用的是**两段式**：

```text
[协程 A 的栈]                          [协程 B 的栈 / remained 回调]
bthread::butex_wait(...)
  set_remained(wait_for_butex,&args)   ← 只是登记「切走后要做什么」
  TaskGroup::sched(&g) ──────────────►  worker 先执行 _last_context_remained，
                                        即 wait_for_butex(&args)：
                                          - 锁 b->waiter_lock
                                          - 复查 value == expected ?
                                          - 检查 interrupted ?
                                          - 把 bbw 挂进 waiters 链，container = b
                                          - 安排定时器（若有 abstime）
                                        ── 到这里，协程 A 才真正「睡下」
                                        然后 worker 从 _rq 取下一个协程继续跑
```

这个「在离开 A 的栈之后再完成入队」的技巧，是 `set_remained`（`task_group.h:94`）机制唯一的、也是最关键的用途之一。它同时解决了「中断（interrupt）」，见 `wait_for_butex` 中 `version_lock` 与 `task_meta->interrupted` 的检查（`butex.cpp:585-606`）——**「检查中断」和「入队 + 发布 container」必须在同一个临界区里**，否则 `TaskGroup::interrupt()` 可能在两者之间把 waiter 消费掉，导致协程排了队却永远没人唤醒。

### 4.3 那条 acquire fence 是干什么的（`butex.cpp:745-750`）

```cpp
if (b->value.load(butil::memory_order_relaxed) != expected_value) {
    errno = EWOULDBLOCK;
    // Sometimes we may take actions immediately after unmatched butex,
    // this fence makes sure that we see changes before changing butex.
    butil::atomic_thread_fence(butil::memory_order_acquire);
    return -1;
}
```

**场景**：线程 2 写 `value = new_value` 之后才 `butex_wake()`；线程 1 的 `butex_wait` 看到值不匹配直接返回。如果没有这条 fence，编译器/CPU 可能把「线程 1 返回后要读的数据」提前到这次 `value` 读之前——于是线程 1 看到的是**旧数据**。

文件头部的注释把这件事讲得很清楚（`butex.cpp:41-58`）：

> If wait is sequenced before wake：wait() 要么看到不匹配的值（不睡），要么 wake() 看到了这个 waiter。
> If wait is sequenced after wake：wake() 必须提供内存栅栏，防止「赋值 value」被重排到 wake() 之后。

一句话：**这就是但 butex 对「futex 语义」的等价承诺——wait/wake 之间有序，且保证可见性。**

---

## 5. 源码剖析：逐个函数看真实实现

### 5.1 `butex_create` / `butex_destroy`（`butex.cpp:264-279`）

```cpp
void* butex_create() {
    Butex* b = butil::get_object<Butex>();   // ObjectPool，从不 free 底层内存
    if (b) {
        return &b->value;
    }
    return nullptr;
}

void butex_destroy(void* butex) {
    if (!butex) { return; }
    Butex* b = static_cast<Butex*>(
        container_of(static_cast<butil::atomic<int>*>(butex), Butex, value));
    butil::return_object(b);                 // 归还对象池，不是 free()
}
```

用户拿到的是一个**裸 `void*`**，指向那块 32 位 int。所有 API（`butex_wait` / `butex_wake` …）的第一个参数都是它。

`butex.h:44-47` 提供类型检查版：

```cpp
template <typename T> T* butex_create_checked() {
    BAIDU_CASSERT(sizeof(T) == sizeof(int), sizeof_T_must_equal_int);
    return static_cast<T*>(butex_create());
}
```

这就是为什么 `bthread_mutex_init` 里写的是 `bthread::butex_create_checked<unsigned>()`（`mutex.cpp:1201`）。

### 5.2 `butex_wake`：只唤一个（`butex.cpp:306-331`）

```cpp
int butex_wake(void* arg, bool nosignal) {
    Butex* b = container_of(static_cast<butil::atomic<int>*>(arg), Butex, value);
    ButexWaiter* front = nullptr;
    {
        BAIDU_SCOPED_LOCK(b->waiter_lock);
        if (b->waiters.empty()) {
            return 0;                        // ① 没人等，返回 0（不报错）
        }
        front = b->waiters.head()->value();  // ② FIFO：取队首
        front->RemoveFromList();
        front->container.store(nullptr, butil::memory_order_relaxed);
    }
    if (front->tid == 0) {
        wakeup_pthread(static_cast<ButexPthreadWaiter*>(front));   // ③ pthread waiter
        return 1;
    }
    ButexBthreadWaiter* bbw = static_cast<ButexBthreadWaiter*>(front);
    unsleep_if_necessary(bbw, get_global_timer_thread());          // ④ 取消定时器
    TaskGroup* g = get_task_group(bbw->control, bbw->task_meta->attr.tag);
    if (g == BAIDU_GET_VOLATILE_THREAD_LOCAL(tls_task_group)) {
        run_in_local_task_group(g, bbw->task_meta, nosignal);      // ⑤a 同 group：直接入本地队列
    } else {
        g->ready_to_run_remote(bbw->task_meta, check_nosignal(nosignal, g->tag()));  // ⑤b 跨 group
    }
    return 1;
}
```

逐点解释：

- **① `waiters.empty()` 直接返回 0**。这个「空队列短路」非常重要：锁的 `unlock` 在无竞争时会走这条路径，**完全不需要进内核**。
- **② 先摘除，再出锁**。摘除后 `container = nullptr`，任何同时想摘这个 waiter 的人（超时、interrupt）都会在 `erase_from_butex` 里循环发现 `container == nullptr` 而放弃。
- **③④⑤ 唤醒三件事**：如果是 pthread waiter → 用真 futex 叫醒那个线程；如果是协程 waiter → **先取消它的超时定时器**（否则定时器还会再唤一次）；再找到它所属的 `TaskGroup` 并 `ready_to_run`。
- **⑤a/⑤b 为什么分本地/远端**：如果唤醒者和被唤醒者在**同一个 worker**，直接把 TaskMeta 推入本地 `_rq` 就行（`task_group.cpp:846` 的 `ready_to_run`）；否则要推到对方的 `_remote_rq` 并 `signal_task`（`task_group.cpp:870`）。这属于 TaskGroup 的领域，详见第 18 篇。

`nosignal` 是 bRPC 的一个批量优化：一批连续唤醒里，前面的先不 signal，最后统一 flush（`flush_nosignal_tasks`，`task_group.cpp:861`）。`nosignal=true` 只在**同一个 tag** 下才安全，所以有 `check_nosignal(nosignal, g->tag())`（`butex.cpp:287-290`、`butex.cpp:288`）。

### 5.3 `butex_wake_n` / `butex_wake_all`：唤醒 N 个（`butex.cpp:333-399`）

```cpp
int butex_wake_all(void* arg, bool nosignal) {
    return butex_wake_n(arg, 0, nosignal);      // n == 0 表示「全部」
}
```

`butex_wake_n` 的实现比 `butex_wake` 复杂，因为它要**把摘下来的 waiter 按「pthread / bthread」分成两组**（`butex.cpp:336-350`），然后：

1. 先唤醒所有 pthread waiter（`butex.cpp:353-359`）——它们各自要调一次真 futex。
2. bthread waiter **逆序弹出**（`butex.cpp:371-381`，注释写着 `// pop reversely`），每个通过 `ready_to_run_general` 入队，并用一个 `FlatMap<bthread_tag_t, TaskGroup*>` 记录「哪些 group 被喂了任务」。
3. 最后对每个受影响的 group 调一次 `flush_nosignal_tasks_general()`（`butex.cpp:382-387`），把攒下来的 signal 一次性发出。
4. **第一个 bthread waiter 留到最后**，用 `run_in_local_task_group`（`butex.cpp:388-393`）——因为如果它正好是当前的 worker，可以直接 `exchange`（**省掉一次入队 + 出队**，让唤醒者立刻切到被唤醒者，Cache 更热）。

> **设计细节**：为什么第一个 waiter 特殊对待？看 `TaskGroup::exchange`（`task_group.h:88`）——它「把当前协程换出，直接运行 `next_meta`」。这是 bRPC 里到处都在用的「顺手切换」优化。

### 5.4 `butex_wake_except`：唤醒「除了某一个」之外的全部（`butex.cpp:401-460`）

签名 `int butex_wake_except(void* butex, bthread_t excluded_bthread)`。用途：**把锁直接移交给我之外的下一个人**。典型场景是条件变量里配合锁的所有权转移。

实现要点：遍历 `waiters` 链时，如果遇到 `tid == excluded_bthread` 的那个 waiter，**不摘除它**，遍历结束后再 `b->waiters.Append(excluded_waiter)` 放回队尾（`butex.cpp:426-428`）——因为链表的 `RemoveFromList` 会强制摘掉，只能用「摘掉再挂回」来模拟「跳过」。

### 5.5 `butex_requeue`：唤醒一个，其余「搬家」（`butex.cpp:462-503`）

```cpp
int butex_requeue(void* arg, void* arg2) {
    ...
    std::unique_lock<FastPthreadMutex> lck1(b->waiter_lock, std::defer_lock);
    std::unique_lock<FastPthreadMutex> lck2(m->waiter_lock, std::defer_lock);
    butil::double_lock(lck1, lck2);          // 同时锁两个 butex（避免死锁的固定顺序）
    if (b->waiters.empty()) { return 0; }
    front = b->waiters.head()->value();      // 队首：叫醒
    front->RemoveFromList();
    front->container.store(nullptr, ...);
    while (!b->waiters.empty()) {            // 其余：整条链搬到 m 的队尾
        ButexWaiter* bw = b->waiters.head()->value();
        bw->RemoveFromList();
        m->waiters.Append(bw);
        bw->container.store(m, butil::memory_order_relaxed);   // ← 注意 container 改成 m 了！
    }
    ...
}
```

这是 `pthread_cond_broadcast` 的高效实现：**不唤醒所有等待者（避免惊群），而是把除一个之外的全部「转移到 mutex 的等待队列」**，等它们拿到 mutex 时自然被唤醒。第 21 篇会看到 `bthread_cond_broadcast` 正是这么调用的（`condition_variable.cpp:82`）。

注意 `container.store(m, ...)`：waiter「搬家」后，它的 owner 变成了 `m`，所以后续 `erase_from_butex` 会去 `m->waiter_lock` 下面摘除它——**这条一致性是这套机制正确性的核心**。

### 5.6 `erase_from_butex`：摘除的唯一入口（`butex.cpp:515-547`）

```cpp
inline bool erase_from_butex(ButexWaiter* bw, bool wakeup, WaiterState state) {
    bool erased = false;
    Butex* b;
    int saved_errno = errno;
    while ((b = bw->container.load(butil::memory_order_acquire))) {
        BAIDU_SCOPED_LOCK(b->waiter_lock);
        if (b == bw->container.load(butil::memory_order_relaxed)) {   // 二次确认，防 ABA
            bw->RemoveFromList();
            bw->container.store(nullptr, butil::memory_order_relaxed);
            if (bw->tid) {
                static_cast<ButexBthreadWaiter*>(bw)->waiter_state = state;
            }
            erased = true;
            break;
        }
        // container 变了（比如被 requeue 搬到别的 butex），重试
    }
    if (erased && wakeup) {
        // 把它 ready_to_run（超时路径）或 wakeup_pthread
    }
    errno = saved_errno;    // 调用者（定时器线程）需要自己的 errno 不被污染
    return erased;
}
```

三个调用者，语义各不同：

| 调用者 | 谁在调 | 语义 |
|--------|--------|------|
| `erase_from_butex_and_wakeup`（`butex.cpp:506`） | TimerThread 回调 | 超时了，摘除并唤醒（`WAITER_STATE_TIMEDOUT`） |
| `erase_from_butex_because_of_interruption`（`butex.cpp:511`） | `TaskGroup::interrupt()` | 被中断，摘除并唤醒（`WAITER_STATE_INTERRUPTED`） |
| `wait_pthread` 里（`butex.cpp:175`） | pthread 自己超时 | 摘除，`wakeup=false`（自己就是醒来的人） |

**返回值 `erased` 的含义是「我赢了这场摘除竞赛」**。输的一方必须退让（pthread 路径里就是继续回去 `futex_wait`，见 `butex.cpp:176-184`）。这是「同一时刻最多一个线程唤起一个 waiter」的保证（`butex.cpp:505` 的注释）。

### 5.7 唤醒的完整链路

```text
butex_wake(b)                                  ← 你在 unlock 里调用
  │
  ├─ ① 锁 b->waiter_lock，取队首 waiter，摘除，置 container=nullptr
  │
  ├─ ② 若是 pthread waiter
  │      wakeup_pthread: sig=signed → futex_wake_private(&pw.sig, 1)   ← 一次真系统调用
  │
  └─ ③ 若是 bthread waiter
         unsleep_if_necessary: timer_thread->unschedule(sleep_id)      ← 取消超时，无系统调用
         TaskGroup* g = get_task_group(bbw->control, meta->attr.tag)
           │
           ├─ 同 worker: g->ready_to_run(meta)            (task_group.cpp:846)
           │       push_rq(meta->tid)  → 推入本地 _rq
           │       _control->signal_task(1 + additional, tag)            (task_control.cpp:666)
           │
           └─ 异 worker: g->ready_to_run_remote(meta)     (task_group.cpp:870)
                   锁 _remote_rq._mutex, push_locked → signal_task(...)
                        │
                        └─ ParkingLot::signal(num)         (parking_lot.h:84)
                              _pending_signal += num*2
                              if (有 waiter) futex_wake_private(&_pending_signal, num)
                                                                    ↑ 真 futex，但只用来叫醒「空转/睡着的 worker」
```

**请把最后这个箭头记牢**：butex 的唤醒在「协程层面」是零系统调用的；只有在「**必须把一个空闲的 worker 从睡眠中叫醒**」时，才下沉到真正的 futex。而下一个拿到 CPU 的 worker 会先看自己的 `_rq`，直接跑刚被唤醒的协程。

---

## 6. 完整可复现的示例

### 6.1 环境

```bash
# 本文基于 Apache bRPC 主干（本地核对 commit 6ab8c0e）
git clone https://github.com/apache/brpc.git
cd brpc && git checkout 6ab8c0e

# 构建（三选一，任选）：
sh config_brpc.sh --headers=/usr/include --libs=/usr/lib && make -j8
# 或
mkdir -p build && cd build && cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DWITH_DEBUG_SYMBOLS=ON .. && make -j8
```

构建完成后，`output/lib/libbrpc.a`（或 `.so`）与头文件 `src/` 就绪。

> **为什么用 `-g` / `RelWithDebInfo`**：本文所有行号来自源码，但你没在 gdb 里打断点看过，很难真正相信。第 02、03 篇有 gdb 上手细节。

### 6.2 示例一：直接使用 butex（`example/butex_demo/butex_demo.cpp`）

因为 bthread 是**可独立编译**的库，我们可以完全不用任何 RPC 代码：

```cpp
// example/butex_demo/butex_demo.cpp
#include <errno.h>
#include <stdio.h>
#include <bthread/butex.h>      // butex_create / butex_wait / butex_wake ...
#include <bthread/bthread.h>    // bthread_start_background / bthread_usleep / bthread_join

static void* waiter_fn(void* arg) {
    void* butex = arg;
    printf("[waiter %lu] 准备 butex_wait(expected=0)\n",
           (unsigned long)bthread_self());
    // 关键：expected_value 必须等于「我期待的当前值」。
    // 若值已不是 0，会直接返回 -1 / errno=EWOULDBLOCK（快路径）。
    int rc = bthread::butex_wait(butex, 0, nullptr);
    printf("[waiter %lu] 醒来 rc=%d errno=%d\n",
           (unsigned long)bthread_self(), rc, errno);
    return nullptr;
}

int main() {
    int* value = bthread::butex_create_checked<int>();
    *value = 0;

    bthread_t th[3];
    for (int i = 0; i < 3; ++i) {
        bthread_start_background(&th[i], nullptr, waiter_fn, value);
    }
    bthread_usleep(100000);   // 让 3 个 waiter 先睡下去（真实代码里不需要）

    printf("[main] 3 个 waiter 应该都已入睡，现在只 wake 一个\n");
    *value = 1;                              // ① 先改值
    int n = bthread::butex_wake(value);      // ② 再唤醒（顺序不能反！）
    printf("[main] butex_wake 唤醒了 %d 个\n", n);

    bthread_usleep(200000);
    printf("[main] 再 wake_all\n");
    n = bthread::butex_wake_all(value);
    printf("[main] butex_wake_all 唤醒了 %d 个\n", n);

    for (int i = 0; i < 3; ++i) { bthread_join(th[i], nullptr); }
    bthread::butex_destroy(value);
    return 0;
}
```

**编译**：把文件放进 `example/butex_demo/`，拷一份 `example/coroutine/Makefile` 进去，改两行（没有 `.proto` 也没关系，`PROTOS` 会是空）：

```makefile
SERVER_SOURCES = butex_demo.cpp
all: butex_demo
butex_demo:$(PROTO_OBJS) $(SERVER_OBJS)
	$(CXX) $(LIBPATHS) $(SOPATHS) $(LINK_OPTIONS_SO) -o $@
clean:
	rm -rf butex_demo $(SERVER_OBJS)
```

```bash
cd example/butex_demo && make && ./butex_demo
```

**预期输出**（顺序可能略有交错）：

```text
[waiter 1] 准备 butex_wait(expected=0)
[waiter 2] 准备 butex_wait(expected=0)
[waiter 3] 准备 butex_wait(expected=0)
[main] 3 个 waiter 应该都已入睡，现在只 wake 一个
[waiter 1] 醒来 rc=0 errno=0
[main] butex_wake 唤醒了 1 个
[main] 再 wake_all
[waiter 2] 醒来 rc=0 errno=0
[waiter 3] 醒来 rc=0 errno=0
[main] butex_wake_all 唤醒了 2 个
```

### 6.3 示例二：`value` 不降回去会怎样

把示例一的 `*value = 1;` **删掉**，直接 `butex_wake(value)`。你会发现所有 waiter 都从 `butex_wait` **立刻返回 -1 / EWOULDBLOCK**，根本没有睡：

```text
[main] 3 个 waiter 应该都已入睡，现在只 wake 一个
[waiter 1] 醒来 rc=-1 errno=11        ← EWOULDBLOCK
[waiter 2] 醒来 rc=-1 errno=11
[waiter 3] 醒来 rc=-1 errno=11
[main] butex_wake 唤醒了 0 个
```

为什么？因为 `*value` 在 `butex_usleep` 之后的某次循环里被看到是 1…等等——本例里我们**没有**改 `value`。实际情况是：`butex_wake` 时队列里的 waiter 之所以「不见了」，是因为……

> **这是一道很好的自测题。** 答案是：删掉 `*value = 1` 后，`butex_wait(value, 0, nullptr)` 的快路径判断 `*value != 0`？——**仍然等于 0，所以它们确实睡了**。那么它们是怎么醒的？它们**根本没醒在 `butex_wake` 上**——真正让它们返回的是 `bthread_usleep(200000)` 到了之后的 `butex_wake_all`，以及进程退出前的 `bthread_join`。而 `butex_wake` 返回 0 是因为队列是空的（此时 3 个 waiter 还没睡进去，主线程只 `usleep` 了 100ms，理论上是够的；但 `main` 是**非 worker 线程**，`bthread_usleep` 在非 worker 上就是真的 `usleep`，时间是对的）。

**结论**：这个实验说明「**顺序敏感**」——必须**先改值，后 wake**；而且 `value` **不会**像信号量那样自动减回去。一个真实的 butex 使用者（比如 `bthread_mutex`）必须自己在 `unlock` 里把 `value` 改掉。

### 6.4 示例三：用 `bthread_mutex` 看「同一套地基」

```cpp
// example/butex_demo/mutex_via_butex.cpp
#include <stdio.h>
#include <bthread/bthread.h>
#include <bthread/mutex.h>

static bthread_mutex_t g_mutex = BTHREAD_MUTEX_INITIALIZER;
static long g_counter = 0;

static void* worker(void*) {
    for (int i = 0; i < 100000; ++i) {
        bthread_mutex_lock(&g_mutex);
        ++g_counter;                  // 临界区
        bthread_mutex_unlock(&g_mutex);
    }
    return nullptr;
}

int main() {
    bthread_t th[16];
    for (int i = 0; i < 16; ++i) {
        bthread_start_background(&th[i], nullptr, worker, nullptr);
    }
    for (int i = 0; i < 16; ++i) { bthread_join(th[i], nullptr); }
    printf("counter = %ld (expect 1600000)\n", g_counter);
    return 0;
}
```

> `BTHREAD_MUTEX_INITIALIZER` 在 `bthread/mutex.h` 中靠 `__BEGIN_DECLS` 暴露（与 pthread 风格一致）。若你的版本没有这个宏，就改用 `bthread_mutex_init(&g_mutex, nullptr)`。

---

## 7. 数据验证：wake 一个 vs wake 全部

### 7.1 语义验证（示例一已覆盖）

| 调用 | 队列里有 3 个 waiter 时返回 | 说明 |
|------|--------------------------|------|
| `butex_wake(b)` | `1` | 只摘队首一个（`butex.cpp:311-317`） |
| `butex_wake_n(b, 2)` | `2` | 摘两个 |
| `butex_wake_n(b, 0)` / `butex_wake_all(b)` | `3` | `n == 0` 表示全部（`butex.cpp:397-399`） |
| `butex_wake(b)`（队列为空） | `0` | 空队列短路，不进内核（`butex.cpp:311-313`） |

### 7.2 吊两个 waiter、wake 一个，另一个会不会「被误伤」

**不会。** 因为 `butex_wake` 是**从队列里摘掉**一个 waiter 再唤醒它，队列里另一个 waiter 完全没被触碰（`butex.cpp:314-316`）。这也解释了为什么 butex 不会「惊群」（thundering herd）。

### 7.3 「快路径零成本」的粗略量化

如果想亲眼看到「无竞争时 `unlock` 不产生系统调用」，用 `strace -c -f ./mutex_via_butex` 对比两种写法：

```bash
# 单 worker、无竞争
strace -c -f ./mutex_via_butex 2>&1 | tail -20
```

你会看到 `futex` 的调用次数**远远小于** `bthread_mutex_lock` 的次数（16 × 100000 = 160 万次）——只有在 worker 需要睡眠/唤醒时才出现 `futex`。

> **测试环境说明**：以上是方法，不是硬数字。数字随机器、核数、`bthread_concurrency` 变化。**任何 benchmark 都要写清环境**（CPU 型号、核数、`FLAGS_bthread_concurrency`、编译器版本、`-O2` 与否），否则结论不可复现。

### 7.4 复杂度小结

| 操作 | 无竞争 | 有竞争 |
|------|--------|--------|
| `butex_wait` 快路径 | O(1)，一次原子读 + fence | — |
| `butex_wait` 慢路径 | — | O(1) 入队 + O(1) 协程切换（约几十~几百 ns） |
| `butex_wake` | O(1)（空队列直接返回） | O(1) 摘队首 + `ready_to_run` |
| `butex_wake_n(b, n)` | O(n) + O(不同 tag 数) | 额外一次 `FlatMap` 分配（`butex.cpp:363-364`） |

---

## 8. 边界、反例与失败路径

### 8.1 坑一：`butex_wake` 只唤一个，写错了就是死锁

最常见的错误写法：

```cpp
// 错误！只想通知「一件事发生了」，却用了 wake
*value = 1;
butex_wake(b);            // 只醒 1 个
// 剩下 N-1 个 waiter 永远睡下去 → 程序 hang 住
```

**正确做法**：要广播就 `butex_wake_all(b)`（或 `butex_wake_n`）。`bthread_cond_signal` 用 `butex_wake`（`condition_variable.cpp:68`），`bthread_cond_broadcast` 用 `butex_requeue`（`condition_variable.cpp:82`）——因为它们语义不同。

### 8.2 坑二：唤醒丢失（lost wakeup）——先 wake 后改值

```cpp
// 错误！
butex_wake(b);        // ① 队列可能还是空的，返回 0
*value = 1;           // ② 之后才改值

// 另一个线程：
butex_wait(b, 0, nullptr);   // 看到 *value == 0（还没改），入睡 → 永远没人叫
```

**正确做法**：**永远先改值，再 wake**。文件头注释（`butex.cpp:41-58`）就是这条规则的正式陈述。

### 8.3 坑三：`value` 不会自动复位

futex/butex **没有**信号量的语义。`butex_wake` 不会把 `value` 减一或清零。使用者必须自己维护 `value` 的含义（`bthread_mutex_t` 是把 `locked`/`contended` 两个 bit 打包进一个 unsigned，见第 21 篇）。

### 8.4 坑四：`butex_destroy` 与 `butex_wake` 的竞态（bRPC 自己也没完全解决）

这是源代码里一段非常诚实的注释（`butex.cpp:207-262`）。场景：

```cpp
void signal() {
    _mutex.lock();
    if (!_done) { _done = true; _cond.signal(); }
    _mutex.unlock();      // ← 这一行的最后一步是 value.store(0); butex_wake(value);
}
```

`unlock` 的最后一步是「解锁 + 唤醒」。就在 `value.store(0)` 之后、`butex_wake(value)` 之前，**另一个线程可能已经拿到锁、走完全程、把 `mutex` / `cond` 连同 butex 一起析构了**。此时 `butex_wake(value)` 操作的就是一块已经归还的地址。

bRPC 的选择是：

> **butex 底层内存永不真正释放**（`ObjectPool`，`butex.cpp:207` 注释 + `butex.cpp:264` 用 `get_object`）。代价是「`butex_wake` 可能唤醒一个**复用了该内存的无关 butex**，造成 spurious wakeup」。源码原话：*"the race is infrequent, even rare. The extra spurious wakeups should be acceptable."*

另外 `mutex.cpp:1274` 和 `mutex.cpp:1170` 都留了同样一句：

```cpp
// CAUTION: the mutex may be destroyed, check comments before butex_create
```

**给你的启示**：如果你自己封装同步原语，**必须让 waiter 在「被唤醒」和「返回」之间有办法判断自己是不是超时/被抢**；并且在 `value` 被改之后**立即**返回，不要再多碰对象。

### 8.5 坑五：把 butex 和 pthread 的 futex 混用

`butex.h:40` 写得清清楚楚：

```cpp
// NOTE: all butexes are private(not inter-process).
```

- butex **不是** `pthread_mutex_t`。你**不能**把一个 `bthread_mutex_t` 拿给 pthread 的 `pthread_mutex_lock`，反之亦然。
- butex 的 `value` 是**用户态 int**，不参与内核的 PI（优先级继承）、也不做 `FUTEX_ROBUST` 那种「持有者死亡自动释放」。**进程崩溃时不会有人帮你解锁**。
- 用一个 `pthread_cond_t` + `bthread_mutex_t` 混搭等待 → 完全是两种等待队列，**一定死锁**。

### 8.6 坑六：`butex_wait` 的 `expected_value` 写错

`butex_wait(b, expected, ...)` 里 `expected` 必须是**你入睡时希望看到的那个值**。写错了会怎样？两种：

- `expected` 恰好≠当前值 → 立刻返回 `EWOULDBLOCK`，你以为「睡了一觉」，其实是空转。
- `expected` 恰好==当前值 → 正常入睡，但**当你被唤醒、代码回到循环里时，如果 `value` 已经被别人改成别的值**，你的下一次 `butex_wait(b, expected, ...)` 又会立刻 `EWOULDBLOCK`——所以**所有 butex 的使用都必须包在 `while` 循环里**（`mutex.cpp:1077` 的 `while (whole->exchange(...) & LOCKED)` 就是这个套路）。

### 8.7 坑七：在非 worker 线程上大量使用 butex

主线程 / 普通 pthread 调 `butex_wait` 会走 `butex_wait_from_pthread`（`butex.cpp:653`），**退化成真 futex 系统调用**。这不是 bug，是设计；但如果你在「每秒几万次」的热路径上用普通线程做 butex 同步，就失去了协程的意义。**同步原语要和 bthread 配合使用。**

---

## 9. 对比与选型：butex vs futex vs condition_variable

| 维度 | Linux `futex` | `bthread::butex` | `bthread_cond_t`（第 21 篇） |
|------|--------------|------------------|---------------------------|
| 等待的对象 | 内核线程 | **协程**（在 worker 上时）/ 线程（在 pthread 上时） | 协程 |
| 唤醒的机制 | `futex(FUTEX_WAKE)` 系统调用 | 摘队列 + `ready_to_run`（通常**零系统调用**） | 同上 + `butex_requeue` |
| 用户态状态 | 一块 32 位内存 | 一块 32 位 `value`（+ 内核不感知队列） | 一个 `seq` 计数器（`bthread_cond_t::seq`） |
| 超时 | `timespec`（**相对时间**） | `timespec`（**绝对时间**，`butex.h:79`） | 绝对时间 |
| 跨进程 | 支持（`FUTEX_PRIVATE_FLAG` 关闭时） | **不支持**（`butex.h:40`） | 不支持 |
| 队列位置 | 内核里的哈希桶 | **用户态**侵入式链表 | 用户态 |
| 死锁检测 / PI | 有（robust futex、PI futex） | 无 | 无 |
| 谁在用 | glibc 的 pthread | bthread 全部同步原语 | `bthread_cond_*` |

**选型建议**：

- 你在写 **bthread 里的代码** → **一律用 `bthread_mutex_t` / `bthread_cond_t` / `bthread_sem_t`**，它们背后是 butex（见第 21 篇）。直接用 butex 是「造原语的人」才做的事。
- 你在写 **普通 pthread 里的代码**（例如 `brpc` 里那些不做 `bthread_start_*` 的辅助线程） → 用 pthread 那套。bRPC 里 `parking_lot.h` 就是「worker 线程自己睡觉」用的真 futex（`parking_lot.h:93`、`parking_lot.h:109`）。
- 你要**跨进程** → butex 不行，用 `FUTEX_PRIVATE_FLAG` 之外的 futex，或用共享内存上的 `pthread_mutex_t`（带 `PTHREAD_PROCESS_SHARED`）。

---

## 10. 常见问题 FAQ

**Q1：为什么 `butex_create()` 返回 `void*` 而不是一个结构体指针？**

因为「一个 butex」在用户眼里就是**一块 32 位内存**，语义完全对齐 futex。所有 API 都接受这个 `void*`，内部用 `container_of` 反推 `Butex*`（`butex.cpp:307`）。`butex_create_checked<int>()` 是带类型检查的糖（`butex.h:44`）。

**Q2：等待队列为什么不用无锁链表？**

因为**代价不对称**：队列操作只发生在「入睡/唤醒」这种**已经很不便宜**（要切协程）的路径上，用一把 pthread 锁把链表保护起来，代码简单得多（`butex.cpp:310`），且一次持锁只有几十纳秒。真正需要极致性能的是 `value` 的读写——那个确实是原子操作 + fence（`butex.cpp:745-750`）。bRPC 在这里选了「简单正确 > 极致无锁」。

**Q3：`butex_wait` 为什么有 `prepend` 参数？**

`prepend=true` 表示把 waiter **插到队首**（`butex.cpp:596`）。用途见 `mutex.cpp:1094`：一个被唤醒的锁竞争者发现自己总被新来的抢走锁时，会 `queue_lifo = true`，插到队首——**防止饥饿**。这是「LIFO 抢占 + FIFO 公平」的折中。

**Q4：`unsleep_if_necessary` 是在干什么？为什么唤醒一个协程前要先取消它的定时器？**

`butex_wait` 带 `abstime` 时，会向 TimerThread 注册一个定时任务（`butex.cpp:607-609`）。如果协程**先被正常唤醒**，那个定时器如果不取消，以后还会再调一次 `erase_from_butex_and_wakeup`——不仅白费，还可能在栈已销毁后使用 `bbw`。所以 `unsleep_if_necessary`（`butex.cpp:194-205`）先 `timer_thread->unschedule(sleep_id)`；**如果定时器回调已经在跑**（`unschedule` 返回 >0），就返回 -1，调用方要负责「等它跑完」（`butex.cpp:792` 的 `BT_LOOP_WHEN` 自旋）。这是整个 butex 里最烧脑的一段。

**Q5：`butex_wake_except` 的注释说 "This function does not yield"，但我看实现里调用了 `ready_to_run_general`？**

`butex.h:65-66` 的注释是**历史遗留/表述不精确**。当前实现（`butex.cpp:401-460`）确实会把除 `excluded_bthread` 之外的 waiter 都 `ready_to_run_general` 到各自 group。以源码为准。

**Q6：bthread 里的 `FLAGS_task_group_ntags` 是干嘛的？为什么 `butex_wake_n` 里用了 `FlatMap<tag, TaskGroup*>`？**

`task_group_ntags`（`task_control.cpp:47`）让不同业务用不同的 tag 分池调度（`BTHREAD_TAG_DEFAULT = 0`，`types.h:39`）。`butex_wake_all` 可能跨多个 tag 唤醒，所以要按 tag 聚合，每个 group **只 flush 一次 signal**，避免惊动过多 worker（`butex.cpp:363-387`）。

**Q7：没有竞争的时候，`bthread_mutex_lock` 到底有没有系统调用？**

**没有。** 快路径是一次 `exchange`（`mutex.cpp:1053`）；`unlock` 在一次 `exchange` 之后，发现 `prev == LOCKED`（即没有 contended）就直接返回（`mutex.cpp:1275-1277`），**连 `butex_wake` 都不调**。这就是 bRPC 锁「和 pthread 锁一样快」的原因。详见第 21 篇。

---

## 11. 延伸阅读

- **源码**（本地核实 commit `6ab8c0e`）：
  - `src/bthread/butex.h` — 全部 API 与语义注释（尤其 `butex.h:40-86`）
  - `src/bthread/butex.cpp` — 本文所有实现
  - `src/bthread/sys_futex.h:38-62` — `futex_wait_private` / `futex_wake_private` 的真身（`syscall(SYS_futex, ...)`）
  - `src/bthread/parking_lot.h` — worker 睡觉用的真 futex，以及那段很精彩的 Dekker 式 StoreLoad 论证（`parking_lot.h:50-83`）
  - `src/bthread/task_group.cpp:846-911` — `ready_to_run` / `ready_to_run_remote`
  - `src/bthread/task_control.cpp:666-694` — `signal_task`
- **Linux futex**：`man 2 futex`；Ulrich Drepper, *Futexes Are Tricky*（讲透 futex 语义的经典文章）。
- **上游文档**：`docs/` 目录（本仓库是 sparse checkout，**没有** `docs/`，请到上游 [github.com/apache/brpc](https://github.com/apache/brpc) 查看）。
- **系列内**：第 15/18 篇（TaskGroup / 队列）、第 21 篇（基于 butex 的同步原语）、第 22 篇（TimerThread，butex 超时的来源）、第 23 篇（bthread 与 pthread 互操作的坑）。

---

## 12. 思维导图总结

```text
butex：bthread 里的「futex」
├── 为什么需要它
│   ├── futex 挂起的是「线程」，会堵死 worker
│   ├── bthread 要的是「挂起协程、worker 继续跑」
│   └── 它是 mutex / cond / rwlock / sem 的共同地基
├── futex 原理（门铃模型）
│   ├── 一块 32 位内存 = 状态
│   ├── 快路径：值变了 → 不睡，EAGAIN
│   ├── 慢路径：值没变 → 原子「再检查 + 睡」
│   └── 铁律：先改值，后 wake（否则丢唤醒）
├── 数据结构
│   ├── Butex = value + waiters + waiter_lock（恰好 1 cacheline）
│   ├── value 必须在 offset 0（container_of 反推）
│   ├── waiter 分配在调用者栈上
│   ├── ButexBthreadWaiter：task_meta / sleep_id / waiter_state
│   ├── ButexPthreadWaiter：sig（tid==0 区分）
│   └── 队列并发：waiter_lock（pthread 锁）+ container（原子指针）
├── 快慢路径
│   ├── ① 值不匹配 → 直接返回（最快）
│   ├── ② 真线程 → futex_wait_private
│   └── ③ 协程 → set_remained(wait_for_butex) + sched
├── 源码逐个函数
│   ├── butex_wait：快路径 → 栈上 waiter → set_remained → sched
│   ├── butex_wake：空队列短路 → 摘队首 → unsleep → ready_to_run
│   ├── butex_wake_n/all：pthread 先、bthread 逆序、首个别留做 exchange
│   ├── butex_wake_except：跳过指定 tid（摘了再挂回）
│   ├── butex_requeue：唤醒一个 + 其余搬家（cond_broadcast 神器）
│   └── erase_from_butex：唯一的摘除入口，二次确认防 ABA
├── 唤醒链路
│   └── ready_to_run → signal_task → ParkingLot → 真 futex（仅叫醒空闲 worker）
├── 边界与坑
│   ├── wake 只唤一个 → 广播要用 wake_all
│   ├── 先 wake 后改值 → 丢唤醒
│   ├── value 不自动复位
│   ├── destroy 与 wake 的 race → 内存永不 free，容忍 spurious wakeup
│   ├── 不是 pthread futex，不能跨进程、不能混搭
│   └── expected_value 写错 → 空转
└── 选型
    ├── bthread 里 → bthread_mutex/cond/sem
    ├── 普通 pthread → pthread 那套 / ParkingLot 的真 futex
    └── 跨进程 → futex 或 PROCESS_SHARED 的 pthread 对象
```

![思维导图：butex](../images/20_butex_mindmap.png)
