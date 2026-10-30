# Linux 排障速查小抄

适用范围：Linux Bash，配套《Linux调试实战_通俗图解版》。先记录时间、请求标识、输入、影响范围，再决定采集哪一层。下面的 12345、eth0、192.0.2.10 和 ./app 都是示例，必须换成真实值。看到 sudo 不代表应在生产中直接执行。

> 记录现象 → 定位慢阶段 → 选择工具 → 修改验证。
>
> 我看到的是事实还是猜想？工具观测哪一层？什么证据可以推翻我的假设？

## 1. 先读状态：系统、进程、线程

以下命令主要读取信息；在目标权限和命名空间内执行。采集间隔结果要对应同一个问题时间窗口。

```bash
cat /etc/os-release
uname -r
uptime
free -h
vmstat 1 6
mpstat -P ALL 1 5
pidstat -t -u -w -p 12345 1 5
ps -L -p 12345 -o pid,tid,pcpu,stat,wchan:24,comm
iostat -xz -y 1 5
```

- vmstat 第一行通常是启动以来汇总，后续才是间隔值。
- CPU 百分比先核对是单核还是整机口径；负载不等于 CPU 利用率。
- 内存先看 available 与交换活动，RSS 增长也不等于已经证明泄漏。
- iostat 的 await 包含排队；现代并行设备的 %util 不能独自证明带宽耗尽。
- 线程仍能推进但等待较长，可能是锁竞争；证明死锁需要相关路径之间无法自行解除的等待。

## 2. 连接与路径：先确认监听、队列和接口

```bash
ss -lnt
ss -s
sudo ss -tinp
ip -br addr
ip route get 192.0.2.10
ip -s link show dev eth0
```

查看进程信息可能需要权限。已建立连接与监听 socket 的队列含义不同；TIME_WAIT 多不自动等于异常。ping、iperf3 会产生测试流量，不能用它们的结果替代业务请求证据。

## 3. 静态分析已保存的 core

将 app、core 替换成现场文件，使用故障原始二进制、共享库与匹配调试符号。

```bash
gdb ./app ./core
```

进入 GDB 后：

```text
set pagination off
set print pretty on
info threads
thread apply all bt
bt full
info args
info locals
```

info args 与 info locals 针对当前所选栈帧；frame N 可切换，N 按 bt 结果填写。普通 core 没有后续执行，不能 continue，也不能靠 watch 回看写入历史。在这种会话里 run 启动的是新进程。

## 4. core 去哪了：先查，不先改全局设置

```bash
ulimit -c
cat /proc/sys/kernel/core_pattern
grep 'Max core file size' /proc/12345/limits
```

systemd 服务另外核对：

```bash
systemctl show 服务名 -p LimitCORE -p LimitCORESoft
coredumpctl list
```

服务名需替换；部分系统没有 coredumpctl 或没有启用相应收集器。终端里的 ulimit 不会追溯改变既有服务。容器还要检查运行时资源限制、宿主机内核和收集路径；管道形式的 core_pattern 有特殊限制语义，详见正文第 06 节。core 可能包含业务数据，采集和导出都应控制权限与空间。

## 5. 会暂停或干扰业务的采集：先在测试环境练习

### GDB 附加

⚠️ 默认 all-stop 附加会暂停被调试线程，可能导致业务超时。经评估后才对正确 PID 使用：

```bash
sudo gdb -p 12345
```

```text
set pagination off
info threads
thread apply all bt
detach
quit
```

detach 用于解除附加并恢复正常运行。不要把 kill 当作退出线上调试的普通步骤。独立 gcore 工具不靠让目标崩溃来取转储，成功完成并解除附加后，目标继续运行；转储期间的暂停与 I/O 成本仍可能很大。交互式 GDB 中生成 core 不等于自动恢复执行，不应主动让线上服务崩溃来取证。

### strace：缩小范围，短时采集

⚠️ 高频系统调用服务可能明显变慢。以下为教学语法，先在测试副本验证，结束时在采集终端按 Ctrl+C：

```bash
sudo strace -ff -tt -T -p 12345 \
  -e trace=network,futex,read,write,epoll_wait -o trace
```

trace 过滤中 network 是类别，其余项是额外列举的系统调用名，futex 不属于 network，也不只服务于互斥锁。-T 是系统调用经过的时间，不等于 CPU 计算时间；大量 epoll_wait 或 futex 并不能单独证明故障。输出可能含数据，保存范围和保留时间也要控制。

## 6. 抓包：限定目标、接口与磁盘占用

⚠️ 抓包需要权限，会消耗 CPU、磁盘，也可能保存明文敏感信息。以下为限定端口的轮转示例，实际接口和端口按问题选取：

```bash
sudo tcpdump -i eth0 -nn -s 0 -B 4096 \
  -C 20 -W 3 -w incident.pcap 'tcp port 8080'
```

完成后 Ctrl+C 正常结束。按约 20 MB 阈值轮转（1 MB = 1,000,000 字节，非 MiB），最多三个文件；文件可略超阈值，旧证据会被覆盖；目录还须允许 tcpdump 降权后的账户写入。不要等很久后才去取偶发故障文件。

- 本文 HTTP 实验访问 127.0.0.1，抓 lo 与 tcp port 18080。
- any 仅覆盖当前网络命名空间；同一逻辑包经过多接口可重复出现。
- packets dropped by kernel 是捕获机制丢包指标，不等于业务链路丢包数。
- 不为抓包方便随意关闭线上 tx-checksum、TSO/GSO/GRO。
- Wireshark 的 retransmission 是分析推断，需结合两端字节区间和 ACK 核对。

读取已保存的实验文件：

```bash
tcpdump -nn -tttt -r http-lab.pcap
tshark -r http-lab.pcap -d tcp.port==18080,http -Y http
```

| 想查什么 | 捕获过滤器 | Wireshark 显示过滤器 |
|---|---|---|
| 指定 TCP 端口 | tcp port 18080 | tcp.port == 18080 |
| 指定主机 | host 192.0.2.10 | ip.addr == 192.0.2.10 |
| HTTP 请求 | 不直接等价 | http.request |
| 怀疑重传 | 不直接等价 | tcp.analysis.retransmission |

## 7. perf：命令存在、可以启动、可以采样是三件事

```bash
command -v perf
```

只有已经安装并找到命令时再检查：

```bash
perf --version
```

包名按发行版、当前内核和仓库核对，见正文第 02 节。权限或 PMU 问题不通过盲目降低整机安全设置来解决。

**配套 CPU 实验环境中**，先尝试软件事件：

```bash
perf stat -e task-clock,context-switches,page-faults \
  -- ./cpu_hotspot baseline
perf record -e cpu-clock -F 99 -g -o baseline.data \
  -- ./cpu_hotspot baseline
perf report -i baseline.data
```

-F 99 请求约每秒 99 次采样，实际频率可能调整；不要盲目提高频率，栈采集也会增加开销。软件事件也可能被权限策略禁止。无法采样时，可先运行 time ./cpu_hotspot baseline 并使用程序自身计时完成对照；real 与 user/sys 的统计口径不同。不要把默认事件在虚拟机不可用，误认为 CPU 实验错误。

现有服务的采样另须评估开销、限定 PID 和持续时间，参见正文；这里不把实验命令当作生产通用模板。

## 8. 修复后的核对清单

| 要核对什么 | 本文实验的判断依据 |
|---|---|
| 崩溃是否正确处理 | 用户 1 正常，用户 404 返回错误且退出状态为 2 |
| 死锁是否消除 | 固定锁序后 completed=40000，并正常退出 |
| 慢请求在哪一段 | fast/slow 对照、请求日志与抓包时序相互支持 |
| CPU 优化是否有效 | baseline/cached 输出一致，再多次比较同口径耗时 |

生产复测保持输入、并发、资源限制、优化选项与持续时间一致，同时看正确性、吞吐、错误率与 P95/P99。Little 定律使用平均值，不能用 P99 替代平均耗时推算平均在途数。先写下可能推翻结论的证据，再宣布问题解决。
