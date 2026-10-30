# bRPC 源码精读 · 50 篇

> 面向「读源码」的学习路线。每篇给出 **目标 / 源码位置 / 阅读要点**，按「先跑通 → 再顺着调用栈读 → 画图」的方式推进。
> bRPC = Apache bRPC（原百度 RPC），C++ 工业级 RPC 框架。它最值钱的部分是自研的 **bthread**（M:N 线程模型）和 **butil**（基础库），也是读懂其余一切的钥匙。

> **进度**：已写正文 11 篇（`01`–`11`）。正文按章节放在子目录里，如 `01-地图与准备/01-….md`。
> **源码位置核对**：各篇的「源码位置」已按 Apache bRPC **主干**校对；版本演进会增删文件，以你 clone 到的版本为准。

---

## 怎么用这份清单

**三条原则**

1. **先跑通，再读码**：每读一块，先在 `example/` 里找个能跑的例子，用 gdb 打上断点，看它真实走一遍，再回头看实现。
2. **带着调用栈读**：不要从头顺读文件。从「用户 API」出发，一层层跟进去——`AddService` → ? → `CallMethod` → ?，把栈打出来再读。
3. **读完就画图**：对象关系图（谁持有谁）、时序图（谁先调谁）、状态机图。bRPC 的对象模型很绕，不画图必忘。

**阅读顺序建议**

```
01–06  地图与准备      ← 必读，先建立全局观
07–13  butil 基础库    ← 地基，IOBuf/Arena 后面到处用
14–24  bthread 引擎    ← 核心中的核心，建议慢读
25–28  bvar 监控       ← 相对独立，可穿插
29–35  IO 与连接层     ← 承上启下
36–41  协议层          ← 插拔机制，理解扩展性的关键
42–45  客户端路径      ← 串起前面所有零件
46–50  服务端与进阶    ← 收尾 + 扩展点
```

**依赖关系**：`butil` → `bthread` → `brpc`（上层依赖下层）；`bvar` 基本独立但被 `brpc` 大量使用。第 14–24 篇（bthread）不读透，后面很多设计会看不懂。

**环境准备（第 02 篇会展开）**

```bash
git clone https://github.com/apache/brpc.git
cd brpc
# 编译 example，尽量带 -g 方便 gdb
```

---

## 第 1 部分 · 地图与准备（01–06）

> 先知道「东西在哪」，再动手。这一部分不追细节，目标是建立一张能挂东西的骨架图。

| # | 标题 | 源码位置 | 阅读要点 |
|---|------|---------|---------|
| 01 | bRPC 源码全景：src/ 下的四座「大厦」 | `src/` 目录树、`docs/` | 认清 `brpc / bthread / butil / bvar` 四大目录各自管什么；画出分层依赖图（butil 在最底） |
| 02 | 搭建「可调试」的源码环境 | `CMakeLists.txt`、`config.mk` | 编译出静态库 + 开 `-g`；能单步进 `Channel::CallMethod`；记录一份你自己的编译命令 |
| 03 | 从 example 反推：第一个 RPC 走了哪些函数 | `example/echo_c++/` | 在 `Server::AddService`、`Channel::Init`、`CallMethod` 下断点，打印调用栈 |
| 04 | 读源码的方法论：怎么跟调用栈不迷路 | `brpc/rpcz`（打印链路） | 自顶向下（从 API 进）vs 自底向上（从 epoll 出）；用 rpcz 看真实调用链 |
| 05 | bRPC 的编码风格与惯用法速查 | `butil/macros.h`、`butil/logging.h` | 常见宏、`CHECK/DCHECK`、`butil::Status` 的用法；看懂这些才不会被源码「劝退」 |
| 06 | protobuf 是 bRPC 的「骨架」 | `brpc/controller.h`、protobuf 的 `Service` | 为什么接口长得像 protobuf stub；`Controller` 继承 `RpcController`、`done` 就是 `Closure` |

---

## 第 2 部分 · 基础设施 butil（07–13）

> `butil` 是 bRPC 自带的「标准库」。很多你以为是 STL 的东西，其实是 butil 重新实现的——因为要服务于性能。

| # | 标题 | 源码位置 | 阅读要点 |
|---|------|---------|---------|
| 07 | butil 总览：bRPC 为什么要重造轮子 | `src/butil/` | 逐个目录扫一遍，标记出「和 STL 重名」的组件（FlatMap、ObjectPool…），想清楚为什么不用 STL |
| 08 | IOBuf 源码剖析（一）：块结构与零拷贝 | `butil/iobuf.h`、`iobuf.cpp` | `Block` 的结构、引用计数、`IOBuf` 如何串起多个块；理解「零拷贝」到底省在哪 |
| 09 | IOBuf 源码剖析（二）：append / cut / 解析 | `butil/iobuf.cpp` | `append`、`cutn`、`pop_front` 的指针运算；协议解析为什么靠它避免内存拷贝 |
| 10 | Arena 内存管理源码 | `butil/arena.h`、`butil/arena.cpp` | 一次性分配、统一释放；protobuf 为什么自带 Arena，brpc 如何配合（注：无 `arena_inl.h`；接口是 `clear()`/`swap()`，`allocate_aligned` 未实现） |
| 11 | FlatMap / FlatSet 源码剖析 | `butil/containers/flat_map.h`（FlatSet 也在其中） | 相比 `std::unordered_map` 省了什么（首节点内联、不额外分配节点）；散列与扩容策略（**注意：是链地址法，不是开放寻址**） |
| 12 | 原子操作与 ObjectPool | `butil/atomicops.h`、`object_pool.h` | brpc 如何封装原子操作；对象池如何减少 malloc 次数与锁竞争 |
| 13 | 线程局部存储与定时工具 | `butil/thread_local.h`、`butil/time.h` | thread_local 的加速实现；`butil::Timer`/时间缓存的用途 |

---

## 第 3 部分 · bthread 并发引擎（14–24）

> **全篇最重要的一部分。** bRPC 高并发的根源就在这里。建议反复读、动手改、跑实验。

| # | 标题 | 源码位置 | 阅读要点 |
|---|------|---------|---------|
| 14 | 为什么 bRPC 要自研 bthread：M:N 模型原理 | `src/bthread/` 概览 | 对比 pthread（1:1）：M 个 bthread 映射到 N 个 worker 线程，解决「同步代码写异步性能」的矛盾 |
| 15 | bthread 源码地图：三大核心对象 | `bthread/task_control.*`、`task_group.*`、`task_meta` | `TaskControl`（全局）、`TaskGroup`（每 worker 一个）、`TaskMeta`（每个协程）各自管什么 |
| 16 | 协程创建与调度：从 `bthread_start_background` 开始 | `bthread/bthread.cpp` | 跟着 API 走一遍：分配栈 → 建 TaskMeta → 入队 → 被 worker 取走 |
| 17 | work stealing 算法源码剖析 | `bthread/task_group.cpp` | `steal_task` 如何从别的 group 队列偷任务；为什么能减少线程空转 |
| 18 | TaskGroup 与 Worker 线程的关系 | `bthread/task_group.cpp`、`task_control.cpp` | worker 如何绑定 TaskGroup；`_remote_rq` / `_rq` 两级队列的作用 |
| 19 | 上下文切换：栈与 `swapcontext` | `bthread/stack.*`、`context.h` | 协程栈怎么分配、怎么切换；理解「切换成本远低于线程」的来源 |
| 20 | butex：bthread 里的「futex」 | `bthread/butex.*` | butex 是什么、为什么要自己实现；它是所有同步原语的地基 |
| 21 | 同步原语源码：mutex / cond / spinlock | `bthread/bthread_mutex.cpp`、`bthread_cond.cpp` | bthread 版锁如何挂起/唤醒协程（而非阻塞线程） |
| 22 | TimerThread：定时器源码 | `bthread/timer_thread.*` | 定时任务的数据结构、如何高效找出「最早到期」的任务 |
| 23 | bthread 与 pthread 互操作（重点避坑） | `bthread/bthread.cpp`、butex | 在 bthread 里调 `usleep`/阻塞 pthread 锁会发生什么；为什么必须用 bthread 版工具 |
| 24 | 从源码看：bthread 为何能扛高并发 | 综合 `task_group` + `socket` | 把「协程调度 + IO 就绪唤醒」连起来，解释「同步写法、异步性能」 |

---

## 第 4 部分 · bvar 监控（25–28）

> 相对独立的一部分，可以在读 bthread 读累时穿插。bvar 是 bRPC「自带监控」的实现。

| # | 标题 | 源码位置 | 阅读要点 |
|---|------|---------|---------|
| 25 | bvar 架构：Variable / Agent / AgentGroup | `bvar/variable.*`、`detail/agent_group*` | 一个指标从「定义」到「被读到」经过哪些对象 |
| 26 | bvar 的无锁统计与时间窗口 | `bvar/window.h`、`detail/` | `Window`/`PerSecond` 如何做到高频写入不锁；窗口如何滑动 |
| 27 | LatencyRecorder 源码 | `bvar/latency_recorder.*` | 延迟统计（avg/p99/qps）怎么算出来的；为什么它对 RPC 场景特化 |
| 28 | bvar 如何对接内置服务 | `bvar/`、`brpc/builtin/` | 指标怎么暴露成 `/vars` 的页面；`dump` 流程 |

---

## 第 5 部分 · IO 与连接层（29–35）

> 从「事件循环」到「一条连接」的完整实现。这是把 bthread 和网络打通的桥梁。

| # | 标题 | 源码位置 | 阅读要点 |
|---|------|---------|---------|
| 29 | EventDispatcher：epoll 事件循环源码 | `brpc/event_dispatcher.*` | epoll 如何注册/等待；事件如何分发给对应 Socket |
| 30 | Socket 对象模型与生命周期 | `brpc/socket.*` | 一个 Socket 从 `Create` 到 `SetFailed` 的状态流转；它为什么是引用计数的 |
| 31 | SocketMap：fd → Socket 的映射 | `brpc/socket_map.*` | 为什么需要全局表；epoll 事件来了怎么「反查」到 Socket |
| 32 | InputMessenger：读数据与切包 | `brpc/input_messenger.*` | 数据到达后如何读取、如何按协议「切」出完整请求 |
| 33 | 写数据与拥塞控制（在 Socket 里，无独立 Messenger） | `brpc/socket.cpp`、`socket_inl.h` | 发送缓冲、`writev` 批量写、写不进去时怎么处理；注意写路径**没有**独立的 output_messenger 文件 |
| 34 | 连接建立与断开的源码路径 | `brpc/socket.*`、`brpc/policy/` | connect 流程；断开时如何清理、如何触发重连 |
| 35 | 引用计数与资源回收 | `brpc/socket.*`、`butil/` | `SocketUniquePtr` 的存在意义；如何避免「连接刚断就被别人用」 |

---

## 第 6 部分 · 协议层（36–41）

> 理解 bRPC「为什么能同时讲这么多协议」，以及扩展性的来源。

| # | 标题 | 源码位置 | 阅读要点 |
|---|------|---------|---------|
| 36 | Protocol 接口：协议如何插拔 | `brpc/protocol.h`、`protocol.cpp` | `Protocol` 抽象了哪几件事（切包、解析、序列化）；注册与查找机制 |
| 37 | baidu_std 协议源码剖析 | `brpc/policy/baidu_rpc_protocol.cpp` | 私有协议的报文格式、字段含义；作为「自己写协议」的范本 |
| 38 | HTTP 协议实现源码 | `brpc/policy/http_rpc_protocol.cpp` | 如何兼容 HTTP/1.x；请求解析与响应构造 |
| 39 | h2 / gRPC 兼容层源码 | `brpc/policy/http2_rpc_protocol.cpp` | bRPC 如何「说 gRPC 的话」；HTTP/2 多路复用的落点 |
| 40 | 协议自动检测源码 | `brpc/protocol.cpp`、`policy/adaptive_protocol_type.h` | 服务端如何在不知道协议的情况下「猜」出对方在说什么 |
| 41 | 序列化与压缩源码 | `brpc/compress.cpp`、`brpc/policy/gzip_compress.cpp` | snappy/zlib/lz4 如何接入；压缩在哪一步发生 |

---

## 第 7 部分 · 客户端路径（42–45）

> 把前面所有零件串成「一次客户端调用」。

| # | 标题 | 源码位置 | 阅读要点 |
|---|------|---------|---------|
| 42 | Channel 源码：Init 与命名服务解析 | `brpc/channel.*`、`brpc/naming_service.h`、`brpc/policy/*_naming_service.cpp` | 名字（`list://`/`file://`…）如何变成一组地址；改变地址如何生效 |
| 43 | LoadBalancer 源码与一致性哈希 | `brpc/load_balancer.h`、`brpc/policy/consistent_hashing_load_balancer.cpp` | 轮询/随机/一致性哈希的实现；`SelectServer` 被谁调用 |
| 44 | Controller 源码：一次调用的状态机 | `brpc/controller.*` | 一次 RPC 的状态变迁；`failed()`、`ErrorText()` 从哪来 |
| 45 | 重试、超时与 backup request 源码 | `brpc/channel.cpp`、`controller.*` | 重试在源码里挂在哪；backup request（对冲请求）如何降低长尾 |

---

## 第 8 部分 · 服务端与进阶（46–50）

> 收尾：走通服务端全链路，并看清 bRPC 的三个扩展点。

| # | 标题 | 源码位置 | 阅读要点 |
|---|------|---------|---------|
| 46 | Server 源码：启动、AddService、监听 | `brpc/server.*` | 从 `Start` 到真正 accept；service 表怎么存、怎么查 |
| 47 | 一次 RPC 服务端的完整源码路径 | 串起 `input_messenger` → `server` → `method` | 收包 → 解析 → 查 service/method → 调用 → 组装响应 → 回包，全链路跟一遍 |
| 48 | 并发限制与自适应限流源码 | `brpc/concurrency_limiter.h`、`brpc/policy/auto_concurrency_limiter.cpp` | 限流器如何根据延迟自动调节并发度 |
| 49 | Streaming / 服务端推送源码 | `brpc/stream.*` | 一个 stream 的生命周期；与普通 RPC 的差异 |
| 50 | 扩展点源码：自定义 Protocol / LB / NamingService | `brpc/extension.h`、`extension_inl.h` | 三者如何通过「名字 + 工厂」被动态加载；自己写一个插件的完整步骤 |

---

## 学习节奏建议

| 阶段 | 篇目 | 建议投入 | 里程碑 |
|------|------|---------|--------|
| 建立地图 | 01–06 | 1 周 | 能在 gdb 里打出一次完整 RPC 调用栈 |
| 打地基 | 07–13 | 1–2 周 | 理解 IOBuf 与 Arena，能说清「零拷贝省在哪」 |
| 啃核心 | 14–24 | **3–4 周** | 能画出 bthread 调度图，讲清 work stealing |
| 上下游 | 25–41 | 3 周 | 能画出「事件 → Socket → 切包 → 分发」的链路图 |
| 串起来 | 42–50 | 2–3 周 | 能独立跟完客户端 + 服务端两条完整调用栈 |

> 每篇读完，产出一张图 + 一段「我理解的设计权衡」——这比抄一遍源码有用得多。

---

## 已写 / 待补

**已写**：`01`–`11`

- `01-地图与准备/`：`01`–`06`
- `02-基础库butil/`：`07`–`11`

**待补**：

- [ ] 第 12–50 篇正文（逐篇写，沿用仓库规范：类比先行 + 底层原理 + 示例 + Graphviz 配图 + 思维导图）
- [ ] 把 `brpc/` 纳入仓库总规范（`CLAUDE.md`）
