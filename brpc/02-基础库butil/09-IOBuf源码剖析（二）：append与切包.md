# IOBuf 源码剖析（二）：append 与切包

> **一句话总结**：TCP 交给你的是一串**没有边界的字节流**，而 RPC 框架需要的是**一个个完整的请求**——`IOBuf` 用 `append` 家族负责"攒"（其中 `append(const IOBuf&)` / `append(const Movable&)` **完全不拷贝**），用 `cutn` / `pop_front` / `cut_until` 家族负责"切"（**只改 BlockRef 的 offset/length，payload 一个字节都不动**），再用 `WriteV` 把切好的数据**一次性 `writev` 发出去**；一个协议解析器只要照着"先 `copy_to` 头部 → 判长度 → `pop_front` + `cutn`"这个形状写，就能同时拿到正确性和零拷贝。

---

## 阅读路径

- **快速版（约 6 分钟）**：读「一句话总结」+ 第 1 节（为什么字节流没有边界）+ 第 2 节（append 三档）+ 第 3 节（cut 四件套）+ 第 8 节（坑）。
- **深入版（约 35 分钟）**：全文通读。重点吃透第 4 节（`cutn` 的指针运算，配图）+ 第 5 节（源码逐行）+ 第 6 节（把粘包切开的完整可运行示例）+ 第 7 节（`cut_until` 的复杂度陷阱）。

> 本篇承接 [08 IOBuf 源码剖析（一）：块结构与零拷贝](./08-IOBuf源码剖析（一）：块结构与零拷贝.md)。如果你还没读 08，建议先看它的第 2、3 节——本篇所有的"零拷贝"，指的都是那篇讲的 **Block / BlockRef** 结构。

---

## 目录

1. [问题：TCP 给的是字节流，不是消息](#1-问题tcp-给的是字节流不是消息)
2. [写侧：append 家族的三档语义](#2-写侧append-家族的三档语义)
3. [读侧：cut 家族的四件套](#3-读侧cut-家族的四件套)
4. [原理到实现：cutn 到底动了什么](#4-原理到实现cutn-到底动了什么)
5. [源码剖析](#5-源码剖析)
6. [完整可复现的示例：把粘包切成一个个完整包](#6-完整可复现的示例把粘包切成一个个完整包)
7. [数据验证与复杂度分析](#7-数据验证与复杂度分析)
8. [边界、反例与失败路径](#8-边界反例与失败路径)
9. [对比与选型](#9-对比与选型)
10. [常见问题 FAQ](#10-常见问题-faq)
11. [延伸阅读](#11-延伸阅读)
12. [思维导图总结](#12-思维导图总结)

---

## 1. 问题：TCP 给的是字节流，不是消息

### 1.1 两个必须同时处理的现实

写 RPC 服务端时，你从 `readv` 拿到的字节流和"一个请求"之间没有任何对应关系：

| 现象 | 说明 |
|------|------|
| **粘包** | 客户端连发 3 个请求，服务端一次 `readv` 全读进来。你要把这 100 字节切成 3 个包 |
| **半包** | 一个 2MB 的请求，服务端每次只读到 8KB。你要攒够 2MB 才能解析 |
| **半包 + 粘包** | 第一次读到 1.5 个包，第二次读到 1 个包 + 半个包……**这才是常态** |

所以"切包"这件事必须满足两个条件：

1. **幂等**：解析函数可以被反复调用，每次"不够"就原样返回，**绝不能改动缓冲区**；
2. **零拷贝**：切出来的包不能靠 `memcpy` 得到。

bRPC 的 `InputMessageHandler` 把第 1 条写进了接口约定（`brpc/input_messenger.h:44-61`）：

```cpp
struct InputMessageHandler {
    // The callback to cut a message from `source'.
    // Returned message will be passed to process_request or process_response
    // later and Destroy()-ed by them.
    // Returns:
    //   MakeParseError(PARSE_ERROR_NOT_ENOUGH_DATA):
    //     `source' does not form a complete message yet.
    //   MakeParseError(PARSE_ERROR_TRY_OTHERS).
    //     `source' does not fit the protocol, the data should be tried by
    //     other protocols. If the data is definitely corrupted (e.g. magic 
    //     header matches but other fields are wrong), pop corrupted part
    //     from `source' before returning.
    //  MakeMessage(InputMessageBase*):
    //     The message is parsed successfully and cut from `source'.
    typedef ParseResult (*Parse)(butil::IOBuf* source, Socket *socket,
                                 bool read_eof, const void *arg);
    Parse parse;
```

注意这个签名：**`butil::IOBuf* source` 是输入兼输出**——解析器"看懂"多少就从 `source` 里 `cut` 走多少。

`input_messenger.cpp:104-110` 的注释把整个流程说得非常直白：

```cpp
    // Notes:
    // - If the socket has only one message, the message will be parsed and
    //   processed in this bthread. nova-pbrpc and http works in this way.
    // - If the socket has several messages, all messages will be parsed (
    //   meaning cutting from butil::IOBuf. serializing from protobuf is part of
    //   "process") in this bthread. All messages except the last one will be
    //   processed in separate bthreads. To minimize the overhead, scheduling
    //   is batched(notice the BTHREAD_NOSIGNAL and bthread_flush).
```

**"parsed = cutting from butil::IOBuf"**——一句话点破了 IOBuf 在这套体系里的位置。

![用 IOBuf 把「粘包 + 半包」切成一个个完整包](../images/09_framing.png)

### 1.2 于是 IOBuf 需要两组操作

| 方向 | 需要的能力 | 对应 API |
|------|-----------|---------|
| **写（攒）** | 往后追加数据；把另一个 IOBuf 接上来 | `append` 家族 |
| **读（切）** | 从前面拿走 n 字节；丢掉前 n 字节；按分隔符切；只看不动 | `cutn` / `pop_front` / `cut_until` / `fetch` |
| **发** | 把多个不连续的块一次发出去 | `cut_into_file_descriptor`（内部 `writev`） |

---

## 2. 写侧：append 家族的三档语义

`IOBuf` 里叫 `append` 的函数有一大堆（`butil/iobuf.h:210-262`），它们**语义完全不同**。按"代价"分三档：

### 第一档：拷贝写（数据会被 memcpy 进 Block）

```cpp
// butil/iobuf.h:230   拷贝 count 字节
int append(void const* data, size_t count);
// butil/iobuf.h:226   拷贝 1 个字节
int push_back(char c);
// butil/iobuf.h:240   一次拷贝多段（比逐个 append 快）
int appendv(const const_iovec vec[], size_t n);
// butil/iobuf.h:247   等价于 append(s, strlen(s))
int append(char const* s);
// butil/iobuf.h:252   等价于 append(s.data(), s.size())
int append(const std::string& s);
// butil/iobuf.h:276   扩容（可能发生拷贝 + memset）
int resize(size_t n, char c);
```

实现上就是"从 TLS 池拿块 → `memcpy` → 压一条 BlockRef"（`butil/iobuf.cpp:1117-1139`）：

```cpp
int IOBuf::append(void const* data, size_t count) {
    if (BAIDU_UNLIKELY(!data)) {
        return -1;
    }
    if (count == 1) {
        return push_back(*((char const*)data));
    }
    size_t total_nc = 0;
    while (total_nc < count) {  // excluded count == 0
        IOBuf::Block* b = iobuf::share_tls_block();
        if (BAIDU_UNLIKELY(!b)) {
            return -1;
        }
        const size_t nc = std::min(count - total_nc, b->left_space());
        iobuf::cp(b->data + b->size, (char*)data + total_nc, nc);
        
        const IOBuf::BlockRef r = { (uint32_t)b->size, (uint32_t)nc, b };
        _push_back_ref(r);
        b->size += nc;
        total_nc += nc;
    }
    return 0;
}
```

**两个细节**：

- `count == 1` 走 `push_back` 的快捷路径——因为单字符 `append` 在格式化输出里极常见；
- 循环里的 `share_tls_block()`（`butil/iobuf.cpp:341`）意味着**数据超过一个块时会自动续到下一个块**，而不是去 realloc 前面那个块——**这就是"永不 realloc"的来源**。

### 第二档：共享写（零拷贝，只加引用计数）

```cpp
// butil/iobuf.h:212   payload 共享，不拷贝
void append(const IOBuf& other);
// butil/iobuf.h:214   内容搬到 self，清空 other
void append(const Movable& other);
```

`append(const IOBuf&)` 的全部实现（`butil/iobuf.cpp:1075-1080`）：

```cpp
void IOBuf::append(const IOBuf& other) {
    const size_t nref = other._ref_num();
    for (size_t i = 0; i < nref; ++i) {
        _push_back_ref(other._ref_at(i));      // 每条 ref 只做一次 inc_ref
    }
}
```

`append(const Movable&)` 更激进（`butil/iobuf.cpp:1082-1096`）：

```cpp
void IOBuf::append(const Movable& movable_other) {
    if (empty()) {
        swap(movable_other.value());           // 我是空的 → 直接换内脏，O(1)
    } else {
        butil::IOBuf& other = movable_other.value();
        const size_t nref = other._ref_num();
        for (size_t i = 0; i < nref; ++i) {
            _move_back_ref(other._ref_at(i));  // 搬走 ref，不做 inc_ref/dec_ref
        }
        if (!other._small()) {
            iobuf::release_blockref_array(other._bv.refs, other._bv.capacity());
        }
        new (&other) IOBuf;                    // other 被清空
    }
}
```

`Movable` 是一个**语义标记**（`butil/iobuf.h:111-116`），用 `buf.movable()`（`iobuf.h:374`）或 `IOBuf::Movable(buf)` 构造。看到它，你就知道**传进去的那个 IOBuf 会被清空**——这是它和 `append(const IOBuf&)` 最大的区别，也是最爱出 bug 的地方。

> **该用哪个？**
> - 目标 IOBuf 是新建的（常见于"把结果搬出去"）：用 `append(b.movable())`，最省；
> - 源 IOBuf 后面还要用：必须用 `append(const IOBuf&)`，代价是每次多一对 `inc_ref`/`dec_ref`。

`IOBufBuilder::move_to`（`butil/iobuf.h:842-844`）和 `IOBufAppender::move_to`（`iobuf.h:874-876`）内部都是 `target = Movable(buf())`，所以"**用 builder 拼完就把它掏空搬到目标**"这个惯用法是完全零拷贝的。

### 第三档：接管写（连 Block 都不建，直接包住别人的内存）

```cpp
// butil/iobuf.h:257
int append_user_data(void* data, size_t size, std::function<void(void*)> deleter);
// butil/iobuf.h:261  多带一个 64 位 meta
int append_user_data_with_meta(void* data, size_t size,
                               std::function<void(void*)> deleter, uint64_t meta);
```

实现（`butil/iobuf.cpp:1167-1191`）值得逐行看：

```cpp
int IOBuf::append_user_data_with_meta(void* data,
                                      size_t size,
                                      std::function<void(void*)> deleter,
                                      uint64_t meta) {
    if (size > 0xFFFFFFFFULL - 100) {
        LOG(FATAL) << "data_size=" << size << " is too large";
        return -1;
    }
    if (!deleter) {
        deleter = ::free;
    }
    if (!size) {
        deleter(data);                       // size==0：直接调用析构回调
        return 0;
    }
    char* mem = (char*)malloc(sizeof(IOBuf::Block) + sizeof(UserDataExtension));
    if (mem == nullptr) {
        return -1;
    }
    IOBuf::Block* b = new (mem) IOBuf::Block((char*)data, size, std::move(deleter));
    b->u.data_meta = meta;
    const IOBuf::BlockRef r = { 0, b->cap, b };
    _move_back_ref(r);
    return 0;
}
```

**它连 payload 都不复制**：只 malloc 了一个 `Block` 头（`sizeof(Block) + sizeof(UserDataExtension)` 字节），让 `Block::data` 指向**用户自己的内存**，并把用户的 `deleter` 存进紧跟头部的 `UserDataExtension`（`butil/iobuf_inl.h:503-508`、`511-514`）。

这是 IOBuf 里最"零拷贝"的一档——**适合零拷贝地接管 `mmap` 出来的文件、RDMA 注册内存、或者第三方库已经分配好的 buffer。**

配套的 `get_first_data_meta()`（`iobuf.cpp:1193-1202`）可以在后续任何地方取回那个 meta：

```cpp
uint64_t IOBuf::get_first_data_meta() {
    if (_ref_num() == 0) {
        return 0;
    }
    IOBuf::BlockRef const& r = _ref_at(0);
    if (!(r.block->flags & IOBUF_BLOCK_FLAGS_USER_DATA)) {
        return 0;
    }
    return r.block->u.data_meta;
}
```

注意它只看**第一条 ref 所在的那个块**，且块必须是 user-data 块，否则返回 0。

### 追加一族的高性能替代品

源码在 `butil/iobuf.h:216-222` 主动给了提示：

```cpp
    // ===================================================================
    // Following push_back()/append() are just implemented for convenience
    // and occasional usages, they're relatively slow because of the overhead
    // of frequent BlockRef-management and reference-countings. If you get
    // a lot of push_back/append to do, you should use IOBufAppender or
    // IOBufBuilder instead, which reduce overhead by owning IOBuf::Block.
    // ===================================================================
```

| 工具 | 定位 | 关键点 |
|------|------|-------|
| `IOBufAppender`（`iobuf.h:848-888`） | 高频小数据追加 | 直接**持有当前 Block 的写指针** `_data/_data_end`，避免每次 `append` 都走一遍 BlockRef 管理。注释里的实测：`push_back` 约 **3ns**，而 `IOBuf::push_back` 约 **13ns**（Intel Xeon E5-2620 @2.00GHz） |
| `IOBufBuilder`（`iobuf.h:822-845`） | 用 `std::ostream` 语法拼 IOBuf | 继承自 `IOBuf` + `IOBufAsZeroCopyOutputStream` + `ZeroCopyStreamAsStreamBuf` + `std::ostream`，`builder << x << y` 后 `move_to(target)` |
| `IOBufAsZeroCopyOutputStream`（`iobuf.h:594-612`） | protobuf 序列化直写 IOBuf | 在 `baidu_rpc_protocol.cpp:98` 被用来把 `RpcMeta` 直接序列化进包头 |

实际用法参考：`redis_cluster.cpp:125` 用 `IOBufAppender` 拼 Redis 命令；`details/http_message.cpp:652, 751` 用 `IOBufBuilder` 拼 HTTP 响应；`redis_reply.cpp:47` 的 `RedisReply::SerializeTo(butil::IOBufAppender*)` 也是。

---

## 3. 读侧：cut 家族的四件套

### 3.1 `cutn`：切出去（零拷贝）

```cpp
// butil/iobuf.h:143-148
    // Cut off n bytes from front side and APPEND to `out'
    // If n == 0, nothing cut; if n >= length(), all bytes are cut
    // Returns bytes cut.
    size_t cutn(IOBuf* out, size_t n);
    size_t cutn(void* out, size_t n);
    size_t cutn(std::string* out, size_t n);
```

三个重载的**代价完全不同**：

| 重载 | 代价 | 位置 |
|------|------|------|
| `cutn(IOBuf* out, n)` | **零拷贝**：只搬 BlockRef + `inc_ref` | `iobuf.cpp:744-769` |
| `cutn(void* out, n)` | **拷贝**：`iobuf::cp()` 逐段 memcpy | `iobuf.cpp:771-796` |
| `cutn(std::string* out, n)` | **拷贝**：先 `resize` 再 memcpy | `iobuf.cpp:798-809` |

`cutn(IOBuf*)` 的实现（`iobuf.cpp:744-769`）：

```cpp
size_t IOBuf::cutn(IOBuf* out, size_t n) {
    const size_t len = length();
    if (n > len) {
        n = len;                                // 夹到 length()，不会越界
    }
    const size_t saved_n = n;
    while (n) {   // length() == 0 does not enter
        IOBuf::BlockRef &r = _front_ref();
        if (r.length <= n) {
            n -= r.length;
            out->_move_back_ref(r);             // 整条搬走，不做 inc_ref/dec_ref
            _moveout_front_ref();
        } else {
            const IOBuf::BlockRef cr = { r.offset, (uint32_t)n, r.block };
            out->_push_back_ref(cr);            // 切一小条出去（+1 引用）
            
            r.offset += n;
            r.length -= n;
            if (!_small()) {
                _bv.nbytes -= n;
            }
            return saved_n;
        }
    }
    return saved_n;
}
```

**三种情况，都只看最后一段的 else 分支**：

1. `n >= length()`：**夹到 `length()`**（`n = len`），然后把所有 ref 搬走，源变空；
2. 整条 ref 都能给出去（`r.length <= n`）：`_move_back_ref` 直接把这条 ref 的所有权转给 `out`——**连引用计数都不用动**（`iobuf.cpp:560-563` 的 `MOVE=true` 分支里只在 merge 时才 `dec_ref`）；
3. 一条 ref 只切一部分：造一条新 ref `{offset, n, block}` 给 `out`，然后**把源的 ref 往后挪** `offset += n; length -= n`。

第 3 种情况就是上一篇里那句"`src.offset` 从 0 变成 4"。

### 3.2 `pop_front` / `pop_back`：丢掉

```cpp
// butil/iobuf.h:136-141
    // Pop n bytes from front side
    // If n == 0, nothing popped; if n >= length(), all bytes are popped
    // Returns bytes popped.
    size_t pop_front(size_t n);
    size_t pop_back(size_t n);
```

实现（`iobuf.cpp:681-702`）：

```cpp
size_t IOBuf::pop_front(size_t n) {
    const size_t len = length();
    if (n >= len) {
        clear();                    // ！！超界直接全清
        return len;
    }
    const size_t saved_n = n;
    while (n) {  // length() == 0 does not enter
        IOBuf::BlockRef &r = _front_ref();
        if (r.length > n) {
            r.offset += n;
            r.length -= n;
            if (!_small()) {
                _bv.nbytes -= n;
            }
            return saved_n;
        }
        n -= r.length;
        _pop_front_ref();
    }
    return saved_n;
}
```

`pop_back`（`iobuf.cpp:722-742`）是对称的，从尾部改 `r.length -= n`。

### 3.3 `cut_until`：按分隔符切

```cpp
// butil/iobuf.h:153-160
    // Cut from front side until the characters matches `delim', append
    // data before the matched characters to `out'.
    // Returns 0 on success, -1 when there's no match (including empty `delim')
    // or other errors.
    int cut_until(IOBuf* out, char const* delim);

    // std::string version, `delim' could be binary
    int cut_until(IOBuf* out, const std::string& delim);
```

**注意返回值的约定和 `cutn` 截然不同**：`cutn` 返回"切了多少字节"，`cut_until` 返回"**0 成功 / −1 失败**"，切出来的数据通过 `out` 返回。这里特别容易写错：

```cpp
// ❌ 错：把 cut_until 的返回值当长度
size_t n = buf.cut_until(&line, "\r\n");
// ✅ 对
if (buf.cut_until(&line, "\r\n") == 0) { /* line 里是一整行 */ }
```

分派逻辑在 `butil/iobuf_inl.h:109-128`：

```cpp
inline int IOBuf::cut_until(IOBuf* out, char const* delim) {
    if (*delim) {
        if (!*(delim+1)) {
            return _cut_by_char(out, *delim);      // 单字符：逐字节找
        } else {
            return _cut_by_delim(out, delim, strlen(delim));
        }
    }
    return -1;                                     // 空 delim：直接失败
}
```

`_cut_by_char`（`iobuf.cpp:811-829`）逐块扫描：

```cpp
int IOBuf::_cut_by_char(IOBuf* out, char d) {
    const size_t nref = _ref_num();
    size_t n = 0;
    
    for (size_t i = 0; i < nref; ++i) {
        IOBuf::BlockRef const& r = _ref_at(i);
        char const* const s = r.block->data + r.offset;
        for (uint32_t j = 0; j < r.length; ++j, ++n) {
            if (s[j] == d) {
                // There's no way cutn/pop_front fails
                cutn(out, n);        // 分隔符之前的内容给 out
                pop_front(1);        // 分隔符本身也消费掉
                return 0;
            }
        }
    }

    return -1;                       // 没找到：source 完全没动
}
```

**关键语义：分隔符本身会被消费掉，不会出现在 `out` 里。**

`_cut_by_delim`（`iobuf.cpp:831-867`）用"滚动哈希"式的位运算做多字符匹配——把最近 `ndelim` 个字节拼进一个 `unsigned long` 再和目标的签名比较：

```cpp
int IOBuf::_cut_by_delim(IOBuf* out, char const* dbegin, size_t ndelim) {
    typedef unsigned long SigType;
    const size_t NMAX = sizeof(SigType);
    
    if (ndelim > NMAX || ndelim > length()) {
        return -1;
    }
    ...
        for (uint32_t j = 0; j < r.length; ++j, ++n) {
            sig = ((sig << CHAR_BIT) | static_cast<SigType>(s[j])) & SIGMASK;
            if (sig == dsig) {
                // There's no way cutn/pop_front fails
                cutn(out, n + 1 - ndelim);
                pop_front(ndelim);
                return 0;
            }
        }
```

两个硬限制：**`ndelim` 不能超过 `sizeof(unsigned long)`**（64 位上是 8 字节）；`ndelim` 也不能超过当前长度。签名 `sig` 声明在 refs 循环**外面**，所以分隔符**跨块边界也能匹配**。

### 3.4 `fetch` / `fetch1` / `copy_to` / `append_to`：只看、不改

```cpp
// butil/iobuf.h:342-345
    const void* fetch(void* aux_buffer, size_t n) const;
    const void* fetch1() const;
```

`fetch(aux, n)` 的语义（`butil/iobuf.h:331-341`）：如果这 `n` 个字节**恰好全在第一条 ref 里**，直接返回内部指针（零拷贝）；否则拷进你给的 `aux_buffer` 并返回它；`n > length()` 返回 `nullptr`。实现见 `iobuf.cpp:1398-1420`：

```cpp
void const* IOBuf::fetch(void* d, size_t n) const {
    if (n <= length()) {
        IOBuf::BlockRef const& r0 = _ref_at(0);
        if (n <= r0.length) {
            return r0.block->data + r0.offset;     // 单块内：零拷贝
        }
        ...
```

正是靠 `fetch` 的"单块内零拷贝"特性，`memcache.cpp:79` 能这样解析：

```cpp
        const policy::MemcacheRequestHeader* header =
            (const policy::MemcacheRequestHeader*)tmp.fetch(aux_buf, sizeof(aux_buf));
        if (header == nullptr) {
            return false;
        }
        ...
        tmp.pop_front(sizeof(*header) + total_body_length);
    }
```

`fetch1()`（`iobuf.cpp:1422-1428`）只取第一个字节的指针，是"按分隔符扫描"的起手式。`redis_reply.cpp:145` 就是它：

```cpp
    const char* pfc = (const char*)buf.fetch1();
    if (pfc == nullptr) {
        return PARSE_ERROR_NOT_ENOUGH_DATA;
    }
    const char fc = *pfc;  // first character
    switch (fc) {
    case '-':   // Error          "-<message>\r\n"
    case '+': { // Simple String  "+<string>\r\n"
        butil::IOBuf str;
        if (buf.cut_until(&str, "\r\n") != 0) {
```

### 3.5 两个"只读"工具

| 工具 | 作用 | 使用者 |
|------|------|-------|
| `IOBufCutter`（`butil/iobuf.h:514-553`） | **可写**的高效切包器：内部缓存 `_data/_data_end/_block` 指针，避免每次都从 `_ref_num()`/`_front_ref()` 绕一圈 | `butil/recordio.h:116`（RecordIO 的 `RecordReader`） |
| `IOBufBytesIterator`（`butil/iobuf.h:892-923`） | **只读**遍历，不改变源 IOBuf | `redis_command.cpp:32`（找 CRLF）、`rtmp.cpp:831`、`details/hpack.cpp`（HTTP/2 的 HPACK 解析） |

`IOBufCutter` 的析构函数很有意思（`iobuf.cpp:1745-1756`）——它会把"读到一半"的进度**写回源 IOBuf 的第一条 ref**：

```cpp
IOBufCutter::~IOBufCutter() {
    if (_block) {
        if (_data != _data_end) {
            IOBuf::BlockRef& fr = _buf->_front_ref();
            CHECK_EQ(fr.block, _block);
            fr.offset = (uint32_t)((char*)_data - _block->data);
            fr.length = (uint32_t)((char*)_data_end - (char*)_data);
        } else {
            _buf->_pop_front_ref();
        }
    }
}
```

所以 `IOBufCutter` 是"**RAII 的切包事务**"：中途 return/抛异常，进度也不会丢。

`IOBufBytesIterator` 则相反，它的注释明确写着 `// During iteration, the iobuf should NOT be changed.`（`iobuf.h:890-891`），只读不写。

---

## 4. 原理到实现：cutn 到底动了什么

![一次 cutn + append 的前后指针变化](../images/09_cut_pointer.png)

上面这张图是**本篇的核心**，把"切包"的代价完整摊开了：

| 阶段 | 发生了什么 | 代价 |
|------|-----------|------|
| ① 起点 | 一次 `readv` 读进来 100 字节，`src` 有一条 ref `{offset=0, length=100}` | — |
| ② `cutn(&pkt, 40)` | `pkt` 拿到 `{offset=0, length=40}`（+1 引用），`src` 的 ref 变成 `{offset=40, length=60}` | 一次 `fetch_add` + 8 字节的整数改写 |
| ③ `append("XYZ", 3)` | 同一块里接着写，新 ref `{100,3}` 与 `src` 的最后一条 ref 首尾相接 ⇒ **Merge ref**，`src` 仍然只有 1 条 ref `{40,63}` | 一次 `memcpy(3)` + merge |
| ④ 第 3 条 ref | `SmallView` 装不下 ⇒ 转 `BigView`，refs 搬到堆上 32 槽数组 | 分配 + 搬 48 字节的 ref 数组 |

**整条链路上 payload 一次都没搬过。**这就是"切包零拷贝"的全部含义。

### 4.1 复杂度

设当前 IOBuf 有 `k` 条 ref：

| 操作 | 复杂度 | 说明 |
|------|-------|------|
| `append(const IOBuf&)` | O(k_other) | k_other = 对方 ref 数，通常是 1~3 |
| `cutn(out, n)` | O(切过的 ref 数) | 通常 O(1)（`n` 落在第一条 ref 内） |
| `pop_front(n)` | O(切过的 ref 数) | 同上 |
| `cut_until` **成功** | O(从头部到分隔符的字节数) | 扫过就消费，**摊还下来是 O(1)/字节** |
| `cut_until` **失败** | O(当前总长度) | ❗每次都从头扫，见 7.2 |
| `copy_to(buf, n)` | O(n) | 必然拷贝 |
| `IOBufCutter::cutn` | O(1) 摊还 | 内部缓存了当前块指针 |

---

## 5. 源码剖析

### 5.1 `append_to(IOBuf*)`：`copy_to(IOBuf*)` 的零拷贝版本

```cpp
// butil/iobuf.h:297-320
    // Append min(n, length()) bytes starting from `pos' at front side to `buf'.
    // The real payload is shared rather than copied.
    // Returns bytes copied.
    size_t append_to(IOBuf* buf, size_t n = (size_t)-1L, size_t pos = 0) const;

    // Explicitly declare this overload as error to avoid copy_to(butil::IOBuf*)
    // from being interpreted as copy_to(void*) by the compiler (which causes
    // undefined behavior).
    size_t copy_to(IOBuf* buf, size_t n = (size_t)-1L, size_t pos = 0) const
#if defined(__GNUC__) && (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 8))
        __attribute__ (( error("Call append_to(IOBuf*) instead") ))
#endif
        ;

    size_t copy_to(void* buf, size_t n = (size_t)-1L, size_t pos = 0) const;
```

**这段有一处非常精妙的设计**：`copy_to(IOBuf*)` 被声明了但**故意标成编译期错误**（`__attribute__((error(...)))`）。为什么？因为 `IOBuf*` 能隐式转成 `void*`，如果不拦，`buf.copy_to(&other_iobuf)` 会**匹配到 `copy_to(void*)`**，然后 `memcpy` 把 `IOBuf` 对象自己的内存覆写掉——程序立刻崩。

`append_to` 的实现（`iobuf.cpp:1315-1339`）和 `cutn` 一样是搬 ref：

```cpp
size_t IOBuf::append_to(IOBuf* buf, size_t n, size_t pos) const {
    const size_t nref = _ref_num();
    // Skip `pos' bytes. `offset' is the starting position in starting BlockRef.
    size_t offset = pos;
    size_t i = 0;
    for (; offset != 0 && i < nref; ++i) {
        IOBuf::BlockRef const& r = _ref_at(i);
        if (offset < (size_t)r.length) {
            break;
        }
        offset -= r.length;
    }
    size_t m = n;
    for (; m != 0 && i < nref; ++i) {
        IOBuf::BlockRef const& r = _ref_at(i);
        const size_t nc = std::min(m, (size_t)r.length - offset);
        const IOBuf::BlockRef r2 = { (uint32_t)(r.offset + offset),
                                     (uint32_t)nc, r.block };
        buf->_push_back_ref(r2);
        offset = 0;
        m -= nc;
    }
    // If nref == 0, here returns 0 correctly
    return n - m;
}
```

注意它**支持 `pos` 偏移**——这是 `cutn` 没有的能力：可以"从第 40 字节开始，取 100 字节，追加到别人后面"，全程零拷贝。

### 5.2 一个容易忽略的判空：`operator=`

```cpp
// butil/iobuf_inl.h:93-101
inline void IOBuf::operator=(const char* s) {
    clear();
    append(s);          // s 为 nullptr 时 append 返回 -1，但 clear() 已经执行了
}

inline void IOBuf::operator=(const std::string& s) {
    clear();
    append(s);
}
```

和 `append(char const*)`（`iobuf.cpp:1110-1115`）配合：

```cpp
int IOBuf::append(char const* s) {
    if (BAIDU_LIKELY(s != nullptr)) {
        return append(s, strlen(s));
    }
    return -1;
}
```

**注意注释里的这条**（`iobuf.h:246`）：`// NOTE: Returns 0 when 's' is empty.`——空字符串是**成功**（返回 0），`nullptr` 才是失败（返回 −1）。别把返回值当成"写了多少字节"。

### 5.3 发送：`writev` 是分段数据的最佳出口

到这里，IOBuf 的前半生（攒 + 切）讲完了。最后一环是**发**：一堆分散在多个 Block 里的数据，怎么一次系统调用发出去？

答案是 `writev`——内核接受 `iovec[]` 数组，你不需要先把数据拼成连续内存。`IOBuf` 里做这件事的是（`butil/iobuf.cpp:873-903`）：

```cpp
// Since cut_into_file_descriptor() allocates iovec on stack, IOV_MAX=1024
// is too large(in the worst case) for bthreads with small stacks.
static const size_t IOBUF_IOV_MAX = 256;

ssize_t IOBuf::pcut_into_file_descriptor(int fd, off_t offset, size_t size_hint) {
    if (empty()) {
        return 0;
    }
    
    const size_t nref = std::min(_ref_num(), IOBUF_IOV_MAX);
    struct iovec vec[nref];
    size_t nvec = 0;
    size_t cur_len = 0;

    do {
        IOBuf::BlockRef const& r = _ref_at(nvec);
        vec[nvec].iov_base = r.block->data + r.offset;
        vec[nvec].iov_len = r.length;
        ++nvec;
        cur_len += r.length;
    } while (nvec < nref && cur_len < size_hint);

    ssize_t nw = 0;

    if (offset >= 0) {
        static iobuf::iov_function pwritev_func = iobuf::get_pwritev_func();
        nw = pwritev_func(fd, vec, nvec, offset);
    } else {
        nw = ::writev(fd, vec, nvec);
    }
    if (nw > 0) {
        pop_front(nw);
    }
    return nw;
}
```

**四个设计要点**：

1. **BlockRef 到 iovec 是天然映射**——`iov_base = r.block->data + r.offset`、`iov_len = r.length`。这也是为什么 `BlockRef` 的字段顺序和 `iovec` 的语义完全一致；
2. **`IOBUF_IOV_MAX = 256`，不是系统的 `IOV_MAX`（1024）**——注释说得很清楚：`iovec vec[nref]` 是**栈上变长数组**，256 × 16 = 4KB，对 bthread 的小栈才安全；
3. **`size_hint` 只影响"凑多少 iovec"**，不影响正确性。默认 `1024*1024`（`iobuf.h:168`）——先凑够 1MB 再发，避免小包频繁进内核；
4. **只有 `writev` 真的写成功才 `pop_front(nw)`**——部分写（`nw < 总长`）也被正确处理，剩下的下次继续。

同类接口：

| 接口 | 位置 | 用途 |
|------|------|------|
| `pcut_into_file_descriptor(fd, offset, size_hint)` | `iobuf.h:179`，`iobuf.cpp:873` | 发到 fd（`offset >= 0` 用 `pwritev`，`-1` 用 `writev`） |
| `cut_into_writer(IWriter*, size_hint)` | `iobuf.h:164`，`iobuf.cpp:905` | 发到抽象 writer（`IWriter` 的 4 个实现者见 `butil/reader_writer.h`），同样走 `WriteV` |
| `cut_multiple_into_file_descriptor(fd, pieces, count)` | `iobuf.h:193`，`iobuf.cpp:1000` | **一次发多个 IOBuf**（如 RPC 的 `response` + `attachment`） |
| `cut_into_SSL_channel(ssl, ssl_error)` | `iobuf.h:184`，`iobuf.cpp:929` | SSL 通道，**退化成一次 `SSL_write` 一条 ref**（SSL 不支持 scatter-gather） |

读取方向是镜像的：`IOPortal::pappend_from_file_descriptor`（`iobuf.cpp:1527-1587`）准备最多 `MAX_APPEND_IOVEC = 64` 个 buffer，一次 `readv` 读进多个块：

```cpp
    ssize_t nr = 0;
    if (offset < 0) {
        nr = readv(fd, vec, nvec);
    } else {
        static iobuf::iov_function preadv_func = iobuf::get_preadv_func();
        nr = preadv_func(fd, vec, nvec, offset);
    }
```

它从 `Butil::iobuf::acquire_tls_block()` 拿块，用 `Block::u.portal_next` 串成一条链（`_block`），读完再把数据按块切成 BlockRef 压进去（`iobuf.cpp:1573-1585`）。

> `socket.cpp:2109` 的 `Socket::DoRead` 最终就是调 `read_buf->append_from_file_descriptor(fd(), size_hint)`（`socket.cpp:2143`），其中 `read_buf` 是一个 `butil::IOPortal`。这条链路会在第 32、33 篇展开。

---

## 6. 完整可复现的示例：把粘包切成一个个完整包

### 6.1 协议定义

我们复刻 bRPC 的 `baidu_std` 包格式的**骨架**（`brpc/policy/baidu_rpc_protocol.cpp`）：

```text
+--------+------------+-----------+---------------+
| "PRPC" | body_size  | meta_size |  meta    body |
| 4 字节 | 4 字节大端 | 4 字节大端 | meta_size |   |
+--------+------------+-----------+---------------+
                                       ← body_size →
```

真实实现里的头是 12 字节：4 字节 magic + 4 字节 `body_size` + 4 字节 `meta_size`（`baidu_rpc_protocol.cpp:78-81` 的 `PackRpcHeader`）。

### 6.2 真实 bRPC 的切包函数（照抄 `baidu_rpc_protocol.cpp:105-146`）

```cpp
ParseResult ParseRpcMessage(butil::IOBuf* source, Socket* socket,
                            bool /*read_eof*/, const void*) {
    char header_buf[12];
    const size_t n = source->copy_to(header_buf, sizeof(header_buf));
    if (n >= 4) {
        void* dummy = header_buf;
        if (*(const uint32_t*)dummy != *(const uint32_t*)"PRPC") {
            return MakeParseError(PARSE_ERROR_TRY_OTHERS);
        }
    } else {
        if (memcmp(header_buf, "PRPC", n) != 0) {
            return MakeParseError(PARSE_ERROR_TRY_OTHERS);
        }
    }
    if (n < sizeof(header_buf)) {
        return MakeParseError(PARSE_ERROR_NOT_ENOUGH_DATA);
    }
    uint32_t body_size;
    uint32_t meta_size;
    butil::RawUnpacker(header_buf + 4).unpack32(body_size).unpack32(meta_size);
    if (body_size > FLAGS_max_body_size) {
        // We need this log to report the body_size to give users some clues
        // which is not printed in InputMessenger.
        LOG(ERROR) << "body_size=" << body_size << " from "
                   << socket->remote_side() << " is too large";
        return MakeParseError(PARSE_ERROR_TOO_BIG_DATA);
    } else if (source->length() < sizeof(header_buf) + body_size) {
        return MakeParseError(PARSE_ERROR_NOT_ENOUGH_DATA);
    }
    if (meta_size > body_size) {
        LOG(ERROR) << "meta_size=" << meta_size << " is bigger than body_size="
                   << body_size;
        // Pop the message
        source->pop_front(sizeof(header_buf) + body_size);
        return MakeParseError(PARSE_ERROR_TRY_OTHERS);
    }
    source->pop_front(sizeof(header_buf));
    MostCommonMessage* msg = MostCommonMessage::Get();
    source->cutn(&msg->meta, meta_size);
    source->cutn(&msg->payload, body_size - meta_size);
    return MakeMessage(msg);
}
```

**这 40 行是整个 bRPC 协议层最值得背下来的模板**，逐条拆解：

| 行 | 动作 | 为什么 |
|----|------|-------|
| `copy_to(header_buf, 12)` | 只拷 12 字节的头 | 用最小的代价做"先看头"的判断。返回的是**实际拷到的字节数**，可能 < 12 |
| `n >= 4 && magic != "PRPC"` | 头够长且 magic 不对 | `TRY_OTHERS`：**这时 `source` 一个字节都没动**，交给别的协议去试 |
| `n < 4 && memcmp(..., n)` | 头还不够 4 字节 | 也要比一遍前缀，**避免"看起来像别的协议"而被抢走** |
| `n < 12` | 头没收全 | `NOT_ENOUGH_DATA`，`source` 未动 |
| `body_size > FLAGS_max_body_size` | 防"恶意大包把内存撑爆" | 注意这是**唯一会丢弃数据**的分支之一 |
| `length() < 12 + body_size` | **半包** | 直接返回，`source` 未动，等下一批数据 |
| `meta_size > body_size` | 元数据不合理 | **已确认是本协议的坏包**，`pop_front` 整包丢掉（否则会卡死） |
| `pop_front(12)` | 头不要了 | 丢弃用 `pop_front`，因为头我们已经 `copy_to` 读过了 |
| `cutn(&msg->meta, meta_size)` | 切出 meta | **零拷贝** |
| `cutn(&msg->payload, ...)` | 切出 payload | **零拷贝** |

**"判长度用 `copy_to`、丢数据用 `pop_front`、留数据用 `cutn`"** —— 记住这三句话就够了。

### 6.3 可运行版本

因为编译真实 bRPC 需要 gflags / protobuf / snappy 等依赖，这里给出**可直接编译运行的最小复现**：把 [08 篇的 `iobuf_demo.cpp`](./08-IOBuf源码剖析（一）：块结构与零拷贝.md) 里的 `IOBuf` 结构，**再加上下面三个方法**（照抄 `iobuf.cpp:1341`、`811`、`831`、`1422`）：

```cpp
    // ==== iobuf.cpp:1341  copy_to(void* d, size_t n, size_t pos) ====
    size_t copy_to(void* d, size_t n, size_t pos = 0) const {
        const size_t nref = _ref_num();
        size_t offset = pos, i = 0;
        for (; offset != 0 && i < nref; ++i) {
            const BlockRef& r = _ref_at(i);
            if (offset < (size_t)r.length) break;
            offset -= r.length;
        }
        size_t m = n;
        for (; m != 0 && i < nref; ++i) {
            const BlockRef& r = _ref_at(i);
            const size_t nc = std::min(m, (size_t)r.length - offset);
            memcpy(d, r.block->data + r.offset + offset, nc);
            offset = 0;
            d = (char*)d + nc;
            m -= nc;
        }
        return n - m;
    }

    // ==== iobuf.cpp:811 _cut_by_char ／ 831 _cut_by_delim ====
    int cut_until(IOBuf* out, const char* delim) {
        const size_t ndelim = strlen(delim);
        if (ndelim == 0) return -1;
        if (ndelim == 1) {
            const size_t nref = _ref_num();
            size_t n = 0;
            for (size_t i = 0; i < nref; ++i) {
                const BlockRef& r = _ref_at(i);
                const char* const s = r.block->data + r.offset;
                for (uint32_t j = 0; j < r.length; ++j, ++n) {
                    if (s[j] == delim[0]) { cutn(out, n); pop_front(1); return 0; }
                }
            }
            return -1;
        }
        typedef unsigned long SigType;
        const size_t NMAX = sizeof(SigType);
        if (ndelim > NMAX || ndelim > length()) return -1;
        SigType dsig = 0;
        for (size_t i = 0; i < ndelim; ++i)
            dsig = (dsig << CHAR_BIT) | (SigType)(unsigned char)delim[i];
        const SigType SIGMASK = (ndelim == NMAX ? (SigType)-1
                    : (((SigType)1 << (ndelim * CHAR_BIT)) - 1));
        const size_t nref = _ref_num();
        SigType sig = 0; size_t n = 0;
        for (size_t i = 0; i < nref; ++i) {
            const BlockRef& r = _ref_at(i);
            const char* const s = r.block->data + r.offset;
            for (uint32_t j = 0; j < r.length; ++j, ++n) {
                sig = ((sig << CHAR_BIT) | (SigType)(unsigned char)s[j]) & SIGMASK;
                if (sig == dsig) { cutn(out, n + 1 - ndelim); pop_front(ndelim); return 0; }
            }
        }
        return -1;
    }

    // ==== iobuf.cpp:1422  fetch1 ====
    const void* fetch1() const {
        if (length() == 0) return nullptr;
        const BlockRef& r0 = _ref_at(0);
        return r0.block->data + r0.offset;
    }
```

然后写解析器和 `main`：

```cpp
// 报文：12 字节头 = "PRPC"(4) + body_size(4, 大端) + meta_size(4, 大端)，其后是 body
struct RpcMessage { IOBuf meta; IOBuf payload; };
enum ParseResult { PARSE_OK, PARSE_NOT_ENOUGH, PARSE_TRY_OTHERS };

static uint32_t get_u32be(const char* p) {
    return ((uint32_t)(uint8_t)p[0] << 24) | ((uint32_t)(uint8_t)p[1] << 16)
         | ((uint32_t)(uint8_t)p[2] << 8)  | (uint32_t)(uint8_t)p[3];
}
static void put_u32be(char* p, uint32_t v) {
    p[0] = (char)(v >> 24); p[1] = (char)(v >> 16);
    p[2] = (char)(v >> 8);  p[3] = (char)v;
}

ParseResult ParseRpcMessage(IOBuf* source, RpcMessage* msg) {
    char header_buf[12];
    const size_t n = source->copy_to(header_buf, sizeof(header_buf));
    if (n >= 4) {
        if (memcmp(header_buf, "PRPC", 4) != 0) {
            return PARSE_TRY_OTHERS;                      // 不是本协议，别动 source
        }
    } else {
        if (memcmp(header_buf, "PRPC", n) != 0) {
            return PARSE_TRY_OTHERS;
        }
    }
    if (n < sizeof(header_buf)) {
        return PARSE_NOT_ENOUGH;                          // 头都没收全
    }
    const uint32_t body_size = get_u32be(header_buf + 4);
    const uint32_t meta_size = get_u32be(header_buf + 8);
    if (source->length() < sizeof(header_buf) + body_size) {
        return PARSE_NOT_ENOUGH;                          // 半包：原样留着，下次再来
    }
    if (meta_size > body_size) {
        source->pop_front(sizeof(header_buf) + body_size); // 明显坏了：整包丢掉
        return PARSE_TRY_OTHERS;
    }
    source->pop_front(sizeof(header_buf));                // 头没了
    source->cutn(&msg->meta, meta_size);                  // meta 零拷贝切出
    source->cutn(&msg->payload, body_size - meta_size);   // payload 零拷贝切出
    return PARSE_OK;
}

// 造一个包（12 字节头 + meta + payload）
static std::string MakePacket(const std::string& meta, const std::string& payload) {
    std::string pkt(12, '\0');
    memcpy(&pkt[0], "PRPC", 4);
    put_u32be(&pkt[4], (uint32_t)(meta.size() + payload.size()));
    put_u32be(&pkt[8], (uint32_t)meta.size());
    pkt += meta; pkt += payload;
    return pkt;
}

int main() {
    IOBuf read_buf;
    int total = 0;

    // ---- 第一波数据：2 个完整包 + 第 3 个包的前 20 字节 ----
    const std::string p1 = MakePacket("m1", "hello");
    const std::string p2 = MakePacket("m2", "world!!");
    const std::string p3 = MakePacket("m3", "half-packet-payload");
    const std::string wave1 = p1 + p2 + p3.substr(0, 20);
    read_buf.append(wave1.data(), wave1.size());
    printf("第 1 波读到 %zu 字节（其中 20 字节属于第 3 个包）\n", wave1.size());

    for (;;) {
        RpcMessage msg;
        const ParseResult r = ParseRpcMessage(&read_buf, &msg);
        if (r != PARSE_OK) {
            printf("  切不动了：%s\n", r == PARSE_NOT_ENOUGH
                   ? "NOT_ENOUGH_DATA（半包原样留在 read_buf）" : "TRY_OTHERS");
            break;
        }
        printf("  切出第 %d 个包：meta=\"%s\" payload=\"%s\"  剩余 %zu 字节\n",
               ++total, msg.meta.to_string().c_str(),
               msg.payload.to_string().c_str(), read_buf.length());
    }
    printf("read_buf 里还剩 %zu 字节 —— 就是第 3 个包的前 20 字节，一个都没动\n\n",
           read_buf.length());

    // ---- 第二波数据：把第 3 个包补齐 ----
    const std::string wave2 = p3.substr(20);
    read_buf.append(wave2.data(), wave2.size());
    printf("第 2 波读到 %zu 字节，read_buf 现在 %zu 字节\n", wave2.size(), read_buf.length());
    for (;;) {
        RpcMessage msg;
        if (ParseRpcMessage(&read_buf, &msg) != PARSE_OK) {
            printf("  切不动了：NOT_ENOUGH_DATA\n"); break;
        }
        printf("  切出第 %d 个包：meta=\"%s\" payload=\"%s\"  剩余 %zu 字节\n",
               ++total, msg.meta.to_string().c_str(),
               msg.payload.to_string().c_str(), read_buf.length());
    }
    printf("全部切完，read_buf 已空 = %s\n\n", read_buf.length() == 0 ? "是" : "否");

    // ---- 分隔符切包：cut_until ----
    printf("--- cut_until 按 \"\\r\\n\" 切 ---\n");
    IOBuf line_stream;
    line_stream.append("PING\r\nPONG\r\nPART", 17);
    for (;;) {
        IOBuf seg;
        if (line_stream.cut_until(&seg, "\r\n") != 0) break;
        printf("  切到一行：\"%s\"（分隔符被一起吃掉）\n", seg.to_string().c_str());
    }
    printf("  剩余 \"%s\" —— 还没等到 \\r\\n，等下一批数据\n",
           line_stream.to_string().c_str());
    return 0;
}
```

### 6.4 预期输出（实测）

```text
第 1 波读到 60 字节（其中 20 字节属于第 3 个包）
  切出第 1 个包：meta="m1" payload="hello"  剩余 41 字节
  切出第 2 个包：meta="m2" payload="world!!"  剩余 20 字节
  切不动了：NOT_ENOUGH_DATA（半包原样留在 read_buf）
read_buf 里还剩 20 字节 —— 就是第 3 个包的前 20 字节，一个都没动

第 2 波读到 13 字节，read_buf 现在 33 字节
  切出第 3 个包：meta="m3" payload="half-packet-payload"  剩余 0 字节
  切不动了：NOT_ENOUGH_DATA
全部切完，read_buf 已空 = 是

--- cut_until 按 "\r\n" 切 ---
  切到一行："PING"（分隔符被一起吃掉）
  切到一行："PONG"（分隔符被一起吃掉）
  剩余 "PART" —— 还没等到 \r\n，等下一批数据
```

**三个可验证的结论**：

1. **粘包被正确切开**：第一波里的 60 字节 = 包1(24) + 包2(26) + 包3前 20 字节。循环连续切出 2 个完整包；
2. **半包原封不动**：切不动时 `read_buf` 里**仍然是那 20 字节**，一个 bit 都没变。第二波补齐 13 字节后立刻切出第 3 个包。这正是"解析器必须幂等"的含义；
3. **`cut_until` 会把分隔符吃掉**：`"PING\r\n"` 切出来是 `"PING"`（4 字节），`\r\n` 被 `pop_front(2)` 消费。所以解析时要记得**分隔符不属于数据**。

> **注意切包用的循环写法**：`for (;;) { ... if (r != PARSE_OK) break; }`——**一次数据到达要尽可能多切几个包**，直到切不动为止。这是 `input_messenger` 里 batched scheduling 的前提（见 `input_messenger.cpp:104-110` 的注释）。

---

## 7. 数据验证与复杂度分析

### 7.1 操作代价对照（基于源码推算）

| 操作 | 100 字节单块 IOBuf | 备注 |
|------|------------------|------|
| `append(const IOBuf&)` | 1 次 `fetch_add` | 实测见 08 篇第 7 节：nshared 2 → 3 |
| `cutn(&out, 40)` | 1 次 `fetch_add` + 8 字节整数改写 | offset 0 → 40 |
| `pop_front(40)` | 8 字节整数改写 | offset 0 → 40，无引用计数变化 |
| `append(data, 100)` | 1 次 `memcpy(100)` | 不可避免 |
| `copy_to(buf, 100)` | 1 次 `memcpy(100)` | 不可避免 |
| `cut_until` 命中 | memcmp 级扫描 + 一次 `cutn` | 摊还 O(1)/字节 |
| `WriteV` | 1 次 `writev` 系统调用 | iovec 直接来自 BlockRef |

**一句话**："切"是免费的，"拷"是要付钱的，而"发"不用先把数据拼起来。

### 7.2 陷阱：`cut_until` 反复失败会退化成 O(n²)

`_cut_by_char`（`iobuf.cpp:811-829`）和 `_cut_by_delim`（`iobuf.cpp:831-867`）**每次调用都从第一条 ref 的第一个字节开始扫**，失败时**不记录任何进度**。

于是这个看起来无害的循环：

```cpp
while (cp.cut_until(&seg, "\r\n") == 0) { ... }   // redis.cpp:175 的写法
```

在**数据一段一段到**的场景下会变成灾难：每来一小段就调一次 `cut_until`，每次都把整个已缓冲的数据重扫一遍。

**估算**：一条 1MB 的行，按每次到达 1 字节计算：
- 调用次数 ≈ 10⁶
- 第 k 次调用扫描 ≈ k 字节 ⇒ 总扫描量 ≈ 10⁶ × 10⁶ / 2 = **5 × 10¹¹ 次字节比较**

即使每次比较只要 1ns，也要 **500 秒**。这就是为什么 `redis_reply.cpp:161-172` 专门给行长度加了上限：

```cpp
            // Enforce the cap while still waiting for CRLF, otherwise a peer
            // that never sends the terminator can grow buf without bound (like
            // RedisCommandParser does for inline commands). buf holds the first
            // char plus the payload so far; allow one extra byte for a boundary
            // '\r' whose matching '\n' hasn't arrived yet.
            if (FLAGS_redis_max_allocation_size < 0 ||
                len > (size_t)FLAGS_redis_max_allocation_size + 2) {
```

`redis_command.cpp:31-48` 的 `FindCRLF` 也是同样的道理——它带一个 `max_scan_size` 参数。

**正确做法**：如果一定要用分隔符协议，要么
1. 给单行长度设上限（像 Redis 那样），要么
2. 自己记录"上次扫到哪了"（`IOBufCutter` 就是为此设计的，见 3.5）、要么
3. 让协议用**长度前缀**而不是分隔符——这正是 `baidu_std`、gRPC、HTTP/2 都选长度前缀的原因。

---

## 8. 边界、反例与失败路径

### 8.1 `cutn` 越界 vs `pop_front` 越界：语义完全不同

这是最容易踩的坑，实测对比（来自 08 篇那个最小复现）：

```text
cutn(&o,100)  => 返回 6，o.length=6，p 剩 0（被夹到 length）
pop_front(100) => 返回 6，q 剩 0（静默清空）
```

| 调用 | `n > length()` 时 | 危险程度 |
|------|------------------|---------|
| `cutn(out, n)` | **夹到 `length()`**，返回实际切出的字节数 | 安全，但可能得到比预期少的数据 |
| `pop_front(n)` / `pop_back(n)` | **直接 `clear()`**，返回 `length()` | ⚠️ **静默丢光所有数据** |

所以：

```cpp
// ❌ 危险：如果 size 算错了，整个缓冲区被清空，且返回值看起来"成功了"
read_buf.pop_front(packet_size);

// ✅ 稳：先确保长度够
if (read_buf.length() < packet_size) return NOT_ENOUGH;
read_buf.pop_front(packet_size);
```

`baidu_rpc_protocol.cpp:131-141` 正是这个顺序：**先 `length()` 检查，再 `pop_front`**。

### 8.2 为什么这些接口都返回 `size_t`

`cutn` / `pop_front` / `pop_back` / `copy_to` / `append_to` 全都返回"**实际处理的字节数**"，且这个数**可能小于你请求的**。源码里的注释反复强调这一点（`iobuf.h:134-148`）。

因此**必须比对返回值**：

```cpp
// ❌ 静默的错误：如果包不完整，content 会是残缺的
buf.cutn(&content, len);

// ✅ bRPC 源码里的标准写法（memcache.cpp:808 等）
if (buf.cutn(&content, len) != len) {
    return PARSE_ERROR_NOT_ENOUGH_DATA;
}
```

`_cut_by_char` 里有句注释 `// There's no way cutn/pop_front fails`（`iobuf.cpp:820`）——那是因为它先扫描到了位置才切，**你的代码没有这个前提，就必须查返回值。**

### 8.3 千万不要 `buf.append(buf)`

`append(const IOBuf& other)`（`iobuf.cpp:1075-1080`）**没有自引用检查**：

```cpp
void IOBuf::append(const IOBuf& other) {
    const size_t nref = other._ref_num();        // 先记下条数
    for (size_t i = 0; i < nref; ++i) {
        _push_back_ref(other._ref_at(i));        // 但 other 可能就是 this！
    }
}
```

虽然 `nref` 在循环前被固定住了，但 `_push_back_ref` 会修改 `this` 的 ref 队列（可能触发 merge、转 BigView、`inc_ref`）；当 `&other == this` 时，你在**一边读自己的 ref 数组一边往里写**——行为不受定义，多数情况下会破坏内部结构。

**结论：自 append 是禁止的。**要"复制自己一份接在后面"，请显式做临时对象：

```cpp
butil::IOBuf tmp = buf;      // 浅拷贝，零拷贝
buf.append(tmp);             // 现在 other 是独立对象了
```

### 8.4 `cut_until` 的 `-1` 有两种含义，别混

```cpp
// butil/iobuf.h:155-156
    // Returns 0 on success, -1 when there's no match (including empty `delim')
    // or other errors.
```

`-1` 既表示"还没找到"（正常的半包情况，应该等更多数据），也表示"参数不合法"（delim 是空串，或者 `ndelim > sizeof(unsigned long)`）。后者是**永久的错误**，重试一万次也是 −1，会活活卡死。

```cpp
// ❌ delim 太长（> 8 字节）会永远返回 -1，循环里就是死循环
if (buf.cut_until(&out, "MULTI-PART-DELIMITER") == 0) { ... }

// ✅ 先校验分隔符合法性（一次性，启动时做）
CHECK_LE(strlen(delim), sizeof(unsigned long));
```

顺带：`ndelim > length()` 也直接返回 −1（`iobuf.cpp:835`），所以**极短的数据上也会失败**——这同样属于"还没找到"。

### 8.5 `cutn` 是「分裂」，不是「移动」

`cutn` 把数据**共享**给了 `out`（`inc_ref`），所以：

```cpp
butil::IOBuf a;  a.append("hello", 5);
butil::IOBuf b;  a.cutn(&b, 3);        // b = "hel"，a = "lo"
// a 和 b 的 payload 在同一个 Block 里，只是 offset/length 不同
```

**这不是"移动"，是"分裂"。**两条 IOBuf 从此各自独立，谁都不会看到对方的修改（因为谁都不许改共享的 Block）。真正理解这一点，才不会在"我 cut 走了，源还能看到吗"这种问题上纠结。

### 8.6 `cut_into_SSL_channel` 会退化

`iobuf.cpp:929-943` 的实现里**只用第一条 ref**：

```cpp
ssize_t IOBuf::cut_into_SSL_channel(SSL* ssl, int* ssl_error) {
    *ssl_error = SSL_ERROR_NONE;
    if (empty()) {
        return 0;
    }
    
    IOBuf::BlockRef const& r = _ref_at(0);
    ERR_clear_error();
    const int nw = SSL_write(ssl, r.block->data + r.offset, r.length);
    if (nw > 0) {
        pop_front(nw);
    }
```

**SSL 不支持 scatter-gather**，所以每次只能发一条 ref。这意味着一个跨 10 个块的 IOBuf 在 SSL 上要 10 次 `SSL_write`——HTTPS 场景下切包粒度会直接影响发送效率。相比之下明文路径的 `writev` 一次能带 256 条 ref（`IOBUF_IOV_MAX`）。

### 8.7 `IOBufCutter` 期间不要动 `_buf`

`IOBufCutter` 缓存了 `_data/_data_end/_block`（`iobuf.h:549-552`），它在构造时就把"当前进度"锚定住了。源码注释说得很清楚（`iobuf.h:510-513`）：

```cpp
// Specialized utility to cut from IOBuf faster than using corresponding
// methods in IOBuf.
// Designed for efficiently parsing data from IOBuf.
// The cut IOBuf can be appended during cutting.
```

注意最后半句：**"可以往被切的 IOBuf 追加"**——但**不能在 `_cutter` 已经缓存了指针之后，从 `_buf` 的头部 `pop` 掉数据**，否则析构时 `CHECK_EQ(fr.block, _block)`（`iobuf.cpp:1749`）会直接 crash。

---

## 9. 对比与选型

### 9.1 切包 API 的选型

| 需求 | 该用 | 不该用 | 理由 |
|------|------|-------|------|
| 定长切（长度前缀协议） | `cutn(&out, n)` | `copy_to` + `pop_front` | `cutn` 零拷贝 |
| 按分隔符切（文本协议） | `cut_until(&out, delim)` | 手写 `fetch1` + 逐字节 `cutn` | `cut_until` 一次扫描，跨块也能匹配 |
| 只看头部做判断 | `copy_to(small_buf, n)` 或 `fetch` | 直接把整个包切出来 | 少切一次就少一次 ref 操作 |
| 丢弃已处理的数据 | `pop_front(n)` | `cutn` 到临时对象再析构 | `pop_front` 只改 offset |
| 连续大量切包 | `IOBufCutter` | 反复 `IOBuf::cutn` | 省掉每次的 `_front_ref()` / `_ref_num()` 往返 |
| 只读遍历（不改变源） | `IOBufBytesIterator` | `IOBufCutter` | 迭代器语义更清晰，且不写回 |
| 高频小段追加 | `IOBufAppender` | `IOBuf::append` | 持有写指针，省 BlockRef 管理（3ns vs 13ns） |

### 9.2 粘包处理方案的横向对比

| 方案 | 零拷贝切包 | 半包重扫 | 跨块支持 | 实现复杂度 |
|------|:---:|:---:|:---:|---|
| `std::string` + `substr`/`erase` | ❌ | 不适用 | 不适用 | 最低 |
| 手写环形缓冲（ring buffer） | ❌（要处理回绕） | 要自己记进度 | ✅ 但很绕 | 高 |
| 长度前缀 + `IOBuf::cutn` | ✅ | 不重扫（只看头 12 字节） | ✅ | 低（**推荐**） |
| 分隔符 + `IOBuf::cut_until` | ✅ | ⚠️ 每次重扫全缓冲 | ✅ | 低（但要注意 7.2 的复杂度陷阱） |
| 分隔符 + `IOBufCutter` + 自记进度 | ✅ | 不重扫 | ✅ | 中 |
| 分隔符 + `IOBufBytesIterator` 找位置 | ✅（找到后 `cutn`） | ⚠️ 重扫 | ✅ | 中 |

**选型建议：**

- **能选长度前缀就选长度前缀**。它在协议设计上就把"半包判断"的成本降到了"只看固定长度的头"，彻底消灭重扫问题。
- **文本协议（Redis/HTTP/1.x）必须用分隔符**时，**务必给单行/单头长度设上限**，否则一个不发 `\r\n` 的恶意客户端就能把你的 CPU 打满（这正是 `redis_reply.cpp:161-172` 那段注释说的攻击面）。
- **一次到达的数据里通常有多个包**：循环切到切不动为止，别切一个就 return。

---

## 10. 常见问题 FAQ

**Q1：`cutn(&out, n)` 和 `copy_to(buf, n)` + `pop_front(n)` 有什么区别？**
结果类似，代价差很多。`cutn` 搬的是 BlockRef（零拷贝），后者会把 `n` 字节真的 `memcpy` 一遍。**能用 `cutn` 就别用"拷 + 丢"。**只有在接收方是裸 `void*`（比如老的 C API）时才不得不 `copy_to`。

**Q2：`append(const IOBuf&)` 之后，源 IOBuf 清空了吗？**
没有。`append(const IOBuf&)` 是**共享**（两边都能看到同一份数据）；`append(const Movable&)` 才是**转移**（源被清空）。区别在 `iobuf.cpp:1075-1096`。用错会导致"我以为源没了，结果它还在（或者反过来）"这类难查的 bug。

**Q3：为什么 `copy_to(IOBuf*)` 会被编译报错？**
因为 `IOBuf*` 会隐式转成 `void*`，于是 `copy_to(IOBuf*)` 会被编译器解析成 `copy_to(void*)`，然后在你的 `IOBuf` 对象本身上做 `memcpy`——立刻崩。bRPC 用 GCC 的 `__attribute__((error(...)))` 把它变成一个**明确的编译错误**（`iobuf.h:302-310`），提示你改用 `append_to(IOBuf*)`。

**Q4：`cut1(&c)` 和 `fetch1()` 该用哪个？**
`cut1` **消费**掉一个字节（`iobuf.cpp:704-720`），`fetch1` **只看不消费**（`iobuf.cpp:1422-1428`）。解析器里"嗅探第一个字节决定走哪个分支"用 `fetch1`（`redis_reply.cpp:145` 就是这么干的），"确定要吃掉它"才用 `cut1`。

**Q5：`IOBuf::length()` 返回 `size_t`，那我能塞超过 4GB 的数据吗？**
总长度可以超过 4GB（BigView 的 `nbytes` 是 `size_t`），但**单个 Block 不可以**——`BlockRef::offset/length` 是 `uint32_t`，`create_block` 也会在 `block_size > 0xFFFFFFFF` 时 `LOG(FATAL)`（`iobuf_inl.h:630-633`）。所以超大数据的正确姿势是"多块"，而不是"大块"。

**Q6：`append_to(IOBuf*)` 的 `pos` 参数有什么用？**
可以从源的第 `pos` 字节开始追加，且**全程零拷贝**（`iobuf.cpp:1315-1339`）。典型用途：跳过包头后把 body 直接拼到响应里，不用先 `cutn` 出来再 `append`。这是 `cutn` 没有的能力（`cutn` 只能从头切）。

**Q7：`input_messenger` 是怎么知道一个包有没有切完的？**
靠解析函数的返回值。它循环调用 `handler->parse(source, ...)`（`input_messenger.h:57-59`），拿到 `PARSE_ERROR_NOT_ENOUGH_DATA` 就停，等下一次 socket 可读；拿到消息就交给 `_process`。切包的全部工作都发生在解析函数里，`input_messenger` 本身只负责调度——这正是第 32 篇要展开的内容。

---

## 11. 延伸阅读

- **源码（本篇涉及的主要函数）**：
  - `src/butil/iobuf.cpp`：`cutn` 三个重载 744 / 771 / 798；`_cut_by_char` 811；`_cut_by_delim` 831；`pcut_into_file_descriptor` 873；`append(const IOBuf&)` 1075；`append(const Movable&)` 1082；`append(void const*, size_t)` 1117；`appendv` 1141；`append_user_data_with_meta` 1167；`append_to(IOBuf*)` 1315；`copy_to` 1341 / 1366；`fetch` 1398；`IOPortal::pappend_from_file_descriptor` 1527；`IOBufCutter` 1738-1863。
  - `src/butil/iobuf_inl.h`：`cut_until` 分派 109-128；`IOBufCutter` 内联实现 216-279；`IOBufAppender` 282-354；`IOBufBytesIterator` 356-442。
  - `src/butil/iobuf.h`：接口与注释是**最好的文档**，尤其是 `fetch`（331-341）、`append_user_data`（254-261）、`IOBufCutter`（510-553）三处的注释。
- **真实用例**：
  - `src/brpc/policy/baidu_rpc_protocol.cpp:105-146` —— 长度前缀切包的标准模板；
  - `src/brpc/redis_reply.cpp:140-215` —— 分隔符（`\r\n`）+ 长度前缀混合的解析；
  - `src/brpc/memcache.cpp:76-93` —— `fetch` + `pop_front` 的循环；
  - `src/butil/recordio.h:116` + `src/butil/recordio.cc:155-291` —— `IOBufCutter` 的完整用法；
  - `src/brpc/details/hpack.cpp:541-800` —— `IOBufBytesIterator` 解析 HTTP/2 HPACK。
- **相关篇目**：IOBuf 的结构与零拷贝见 [08 块结构与零拷贝](./08-IOBuf源码剖析（一）：块结构与零拷贝.md)；`input_messenger` 怎么调用这些解析函数见第 32 篇；`socket` 怎么写数据见第 33 篇；协议接口 `Protocol::parse` 的设计见第 36 篇。
- **外部参考**：`man 2 writev` / `man 2 readv`（scatter-gather I/O 的内核语义）、`man 2 sendmsg`（`iovec` 的进阶形态）；Netty `ByteBuf` 的 `readerIndex/writerIndex` 是"单个 offset"思路的另一种实现，正好可以和 IOBuf 的"ref 队列"思路对照。
- **源码地址**：[github.com/apache/brpc](https://github.com/apache/brpc)

---

## 12. 思维导图总结

```text
IOBuf 的 append 与切包
├── 问题：TCP 给的是字节流，不是消息
│   ├── 粘包 / 半包 / 两者混合，都是常态
│   ├── 解析器必须幂等：不够时绝不能改动缓冲区
│   └── input_messenger：「parsed = cutting from butil::IOBuf」
├── 写：append 家族三档
│   ├── 拷贝写：append(数据) / push_back / appendv / resize
│   │   └── 超出一个块就续到下一块 —— 永不 realloc
│   ├── 共享写：append(const IOBuf&) 只 inc_ref
│   │   └── append(const Movable&)：空的直接 swap，否则搬 ref 并清空源
│   └── 接管写：append_user_data —— 只 malloc 块头，payload 是用户内存
│       └── get_first_data_meta() 取回 64 位 meta
├── 读：cut 家族四件套
│   ├── cutn(&out,n)：整条 ref 走 _move_back_ref；部分切只改 offset/length
│   ├── pop_front / pop_back：只改 offset/length，n ≥ len 时直接清空
│   ├── cut_until(&out, delim)：返回 0 / -1，分隔符会被消费掉
│   │   └── ndelim ≤ sizeof(unsigned long)，且跨块也能匹配
│   └── fetch / fetch1 / copy_to / append_to：只看不改（append_to 才零拷贝）
│       └── copy_to(IOBuf*) 被 __attribute__((error)) 拦成编译错误
├── 发送：BlockRef → iovec → writev
│   ├── pcut_into_file_descriptor：栈上 iovec[IOBUF_IOV_MAX=256]
│   ├── cut_multiple_into_*：一次发多个 IOBuf
│   └── SSL 路径退化成每次只发一条 ref（SSL 不支持 scatter-gather）
├── 切包的标准形状（baidu_rpc_protocol.cpp:105）
│   ├── 判长度：copy_to(header, 12)
│   ├── 丢数据：pop_front
│   ├── 留数据：cutn(&meta/&payload) 零拷贝
│   └── 坏包必须 pop 掉，否则协议卡死
├── 更快 / 更省的替代品
│   ├── IOBufCutter：缓存块指针，RAII 写回进度（recordio 在用）
│   ├── IOBufBytesIterator：只读遍历不改变源（HPACK / Redis 在用）
│   ├── IOBufAppender：持有写指针，3ns vs 13ns
│   └── IOBufBuilder：ostream 语法拼 IOBuf
└── 边界与坑
    ├── cutn 越界会夹到 length；pop_front 越界会静默清空
    ├── 返回值都是 size_t，必须与期望值比对
    ├── cut_until 反复失败 → O(n²) 重扫（必须设长度上限）
    ├── 千万不要 buf.append(buf)（源码没有自引用检查）
    ├── delim 空串或超过 8 字节 → 永远 -1，循环里会死循环
    └── IOBufCutter 存活期间不能从 _buf 头部 pop
```

![思维导图：IOBuf 的 append 与切包](../images/09_mindmap.png)

> **回看**：[08 IOBuf 源码剖析（一）：块结构与零拷贝](./08-IOBuf源码剖析（一）：块结构与零拷贝.md) 讲清了 Block / BlockRef / SmallView / BigView 这套**内存结构**；本篇讲的是在这套结构上跑起来的**操作与协议切包**。下一篇进入 `butil` 的另一块地基：Arena 内存管理。
