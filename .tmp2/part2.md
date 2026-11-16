<a id="section-06"></a>

## 为什么"表达意图"总需要新语法

同一个问题在不同年代有三种写法：函数可能没有返回值、可能失败、同一个实现要同时服务 `const` 与非 `const` 对象。老写法都能实现，但**读代码的人看不出意图**：返回 `-1` 还是抛异常？空指针还是空值？两份几乎一样的 `get()` 只差一个 `const`？

C++17/20/23 陆续补的就是"让意图有标准表达"：`optional` 表示"可能没有值"、`variant` 表示"多选一"、`expected` 表示"要么值要么错误"、deducing this 表示"一份实现覆盖四种对象形态"。

类比：以前用一张便签写"没有"、"坏了"、"别用"，现在抽屉里分了三个格子，贴着标签。

```cpp
{{SRC:modern23.cpp}}
```

保存为 `modern23.cpp`，编译运行：

```bash
g++ -std=c++23 modern23.cpp -o modern23
./modern23
```

实际输出：

```text
{{OUT:modern23}}
```

注意这段代码里有一处**实测失败记录**：`std::print` 在本机 `g++ 16.1.0`（MinGW）能编译，但链接时报

```text
undefined reference to `std::__open_terminal(_iobuf*)'
undefined reference to `std::__write_to_terminal(void*, std::span<char, ...>)`
```

也就是 libstdc++ 的打印后端还没实现，示例只能用 `std::format` + `std::puts` 输出。这件事的教训比语法本身更重要：**`<version>` 里 `__cpp_lib_print` 有定义，只说明头文件声明了接口，不代表能链接、能运行**。

要点：

1. `expected<T, E>` 把"值"和"错误"放进同一个返回类型，调用方必须处理（至少要看 `has_value()`），比 `bool` + 出参更难被忽略；`transform`/`and_then` 这类单子操作让链式处理不用写 `if`。
2. `variant` 的正确用法是 `std::visit`，因为编译器会强制你处理所有分支；`std::get<T>` 类型不符会抛 `bad_variant_access`。
3. **deducing this（C++23）** 用显式对象参数 `this Self&& self` 让一个模板同时覆盖 `const`/非 `const`/左值/右值，替代了 CRTP 与成对的 `const` 重载。
4. `std::to_underlying`、`string::contains`、`ranges::to` 这类"以前要写三行"的操作，现在一行且意图清楚。

边界：`expected` 不能替代异常处理不可恢复错误（越界、内存耗尽）；`variant` 的 `visit` 要求返回类型一致或显式处理；deducing this 的 `this auto self` 是按值拷贝，要引用必须写 `this auto&& self`——这两者语义不同，别混。

版本线索：`optional`/`variant`/`any`/`string_view` 是 C++17；`expected`、`mdspan`、`flat_map`、`print`、`ranges::to`、`stacktrace`、`move_only_function`、`to_underlying`、`byteswap` 是 C++23；`consteval`/`constinit`、`<=>`、指定初始化是 C++20。

<a id="section-07"></a>

## 为什么并发代码每隔几年就要重写一遍

同一段"起几个线程干活、最后收结果"的代码，C++11 要写 `join`、C++20 想用 `jthread`、要支持取消就得加 `stop_token`、要等一个标志位又得配条件变量。每次重写不是因为旧写法错了，而是因为**标准在补"必须手写且容易写错"的样板**。

类比：最早的线程像"借了车必须自己还，忘了还就出事"；`jthread` 是"带自动归还的租车"；`stop_token` 是"给司机一个'到站停车'的信号灯"，而不是把人从车上拽下来。

```cpp
{{SRC:threads.cpp}}
```

保存为 `threads.cpp`，编译运行（MSYS2 下通常不必显式加 `-pthread`，Linux 上必须加）：

```bash
g++ -std=c++20 threads.cpp -o threads -pthread
./threads
```

实际输出：

```text
{{OUT:threads}}
```

要点：

1. **`jthread` 析构时自动 `request_stop()` + `join()`**，所以不会再忘记 join 导致 `std::terminate`；代价是析构可能阻塞——线程不检查 `stop_token` 就会卡在析构里。
2. **取消是协作式的**：`request_stop()` 只设置标志并触发回调，线程必须自己检查 `st.stop_requested()`。C++ 没有安全的强制终止线程（`pthread_cancel` 会导致锁不释放、资源泄漏），所以标准只提供协作取消。
3. **`atomic::wait(0)` 的语义是"值等于 0 就睡，直到被 notify 或值改变"**，唤醒后要重新检查。它只适用于"等一个原子量变化"，替代不了"等复杂条件"的条件变量。
4. `latch` 是一次性门闩、`barrier` 可重复使用、`counting_semaphore` 是计数信号量——它们解决的都是"线程间对齐时间点"，而不是互斥。

边界：示例用 `memory_order_relaxed` 是因为只关心最终总数；如果 `total` 还要保护别的数据，就必须换更强的内存序（见并发笔记第 31～35 篇）。示例也没有处理线程内异常——`jthread` 里抛异常依然会 `std::terminate`，这是标准规定，不是实现差异。

版本线索：`thread`/`mutex`/`condition_variable`/`atomic`/`future` 是 C++11；`shared_timed_mutex` 是 C++14；`shared_mutex`、`scoped_lock`、并行算法与 `<execution>` 执行策略是 C++17；`jthread`、`stop_token`、`atomic` 的 `wait/notify`、`latch`/`barrier`/`semaphore` 是 C++20；协程是 C++20 的语言机制，而标准库给出现成生成器要到 C++23 的 `std::generator`；C++26 的 senders/receivers（`std::execution`）是另一条异步模型路线。

<a id="section-08"></a>

## 为什么编译期能做的事越来越多

有些计算天生适合在编译期完成：查表、校验格式串、生成常量数组。C++11 的 `constexpr` 让"函数可以在编译期求值"成为可能，但限制很严：函数体只能有一条 `return`，写不了循环，只能递归。C++14 放宽到循环与局部变量，C++20 再放宽到 `virtual`、动态分配、`try/catch`，并补了 `consteval`/`constinit`。

类比的边界在这里特别重要：`constexpr` 不是"编译期执行"，而是"**可以在**编译期求值"——同一个函数在运行期被调用时仍然走运行期路径，结果可能不同。`consteval` 才是"必须编译期"。

```cpp
{{SRC:constexpr.cpp}}
```

保存为 `constexpr.cpp`，编译运行：

```bash
g++ -std=c++20 constexpr.cpp -o constexpr
./constexpr
```

实际输出：

```text
{{OUT:constexpr}}
```

最值得记的一点：**`f(3)` 打印的是 4，不是 300**。因为"实参是字面量"不等于"这次调用在常量求值上下文中"，只有 `constexpr int x = f(3);` 或 `static_assert(f(3) == 300)` 这种要求常量表达式的位置，`std::is_constant_evaluated()` 才返回 `true`。这个区别是"constexpr 函数可以有两种行为"的根源，也是它最容易写出两种结果的地方。

三个关键字的分工：`constexpr` 是"可以编译期"；`consteval` 是"必须编译期"，否则编译失败；`constinit` 只约束静态初始化在编译期完成（变量本身仍可修改），用来消除"静态初始化顺序"问题。

边界：`consteval` 函数不能取运行期参数、不能调用非 constexpr 函数；C++20 的 `constexpr` 虽然允许 `new/delete`，但每次常量求值必须配平；`constexpr` 函数的编译期分支里不能用 `reinterpret_cast`、不能读 `static` 变量。

这条线还没走完：C++26 的**反射**（P2996）让你在编译期读取类型与成员信息，很多过去靠宏、模板递归、代码生成器完成的活会变成普通 `constexpr` 计算；**契约**（P2900）把前置/后置条件写进签名；**pack indexing**（P2662）让参数包能直接下标访问。这些在写进项目前都要先实测编译器支持（见[§11](#section-11)）。

<a id="section-09"></a>

## 陷阱清单：这些地方最容易写错

- **`string_view` 悬垂**：视图不拥有内存，返回指向临时 `std::string` 的 `string_view`，调用方拿到的是已销毁的缓冲区。要保存就返回 `std::string`。
- **`std::move` 不移动**：它只是类型转换。移动构造没实现、或对象是 `const`，都会静默退化成拷贝。
- **移动构造不标 `noexcept`**：`vector` 扩容为了强异常安全会退化成拷贝，性能直接掉一个量级。
- **`auto` 掉引用和 `const`**：`auto x = vec[0]` 是拷贝；要改原对象必须 `auto&`。
- **`vector<bool>` 的代理**：`auto b = bits[0]` 推成代理类型，`b = true` 会写穿容器；容器重分配后代理还悬垂。
- **结构化绑定不能在 lambda 里捕获**（C++17）：C++20 才放开，老标准要转存到普通变量。
- **`std::vector v{1, 2}` 是两个元素**：`initializer_list` 构造优先；"n 个相同值"要用 `std::vector v(n, value)`。
- **`optional::value()` 会抛**：无值时抛 `bad_optional_access`，不确定就 `value_or` 或先判断。
- **`variant` 用 `std::get<T>` 会抛**：正确姿势是 `std::visit`，让编译器强制处理所有分支。
- **ranges 视图不能比容器活得久**：视图是惰性引用，容器销毁或重分配后访问就是悬垂。
- **`shared_ptr` 只保证计数线程安全**：所指对象的读写仍要自己加锁。
- **`jthread` 析构会阻塞**：线程不检查 `stop_token`，析构就可能卡住；自动 join 不是免费的。
- **`<=>` 不生成 `==`**：需要相等比较要另写 `= default` 的 `operator==`。
- **`std::format` 的格式串要常量表达式**：运行期拼接用 `std::vformat`，但会失去编译期检查。
- **`inline` 变量与 `static` 变量在头文件里不是一回事**：`static` 每个编译单元一份副本，`inline` 全程序一份。

<a id="section-10"></a>

## 版本速查：哪个标准给了什么

![C++11 → C++26：每个标准在解决什么问题](content-evolution.png)

这张图是索引，不是讲解。真正需要理解的机制在前面的章节，这里只帮你快速定位"这个特性是哪一版"。

| 标准 | 语言特性（印象级） | 标准库（印象级） |
| --- | --- | --- |
| C++11 | 右值引用与移动语义、`constexpr`、可变参数模板、`static_assert`、`auto`/`decltype`、`nullptr`、`enum class`、`using` 别名、lambda、范围 `for`、`initializer_list`、`override`/`final`、`=default`/`=delete`、`noexcept`、`alignas`/`alignof`、UDL、原始字符串、委托构造、类内初始化、`thread_local` | 智能指针、`thread`/`mutex`/`atomic`/`condition_variable`、`future`/`promise`/`async`、`call_once`、`chrono`、`unordered_*`、`tuple`/`array`/`forward_list`、`function`/`bind`、`regex`、`random`、`to_string` |
| C++14 | 泛型 lambda、捕获初始化、返回类型推导与 `decltype(auto)`、变量模板、放宽 `constexpr`、二进制字面量、数位分隔符、`[[deprecated]]` | `make_unique`、`exchange`、`get<T>`、`shared_timed_mutex`、`integer_sequence` |
| C++17 | 结构化绑定、if/switch 初始化、`if constexpr`、折叠表达式、CTAD、`inline` 变量、保证拷贝消除、`[[nodiscard]]`/`[[fallthrough]]`/`[[maybe_unused]]`、嵌套命名空间、`template<auto>`、constexpr lambda | `optional`/`variant`/`any`/`string_view`、`filesystem`、`apply`/`invoke`、`byte`、`clamp`/`gcd`/`lcm`、`pmr`、`shared_mutex`/`scoped_lock`、并行算法与 `<execution>`、`reduce`、`to_chars` |
| C++20 | concepts、协程、modules、`consteval`/`constinit`、`<=>`、指定初始化、`char8_t`、模板 lambda、`using enum`、`[[no_unique_address]]`、`[[likely]]` | `format`、`span`、`source_location`、`bit_cast`、`numbers`、`erase_if`、`ssize`、`starts_with`/`ends_with`、`atomic` 的 `wait/notify`、`atomic_ref`、`jthread`/`stop_token`、`latch`/`barrier`/`semaphore`、`osyncstream`、`bind_front`、`to_array` |
| C++23 | deducing this、`static operator()`/`[]`、多维下标、`if consteval`、`size_t` 字面量、`[[assume]]`、`#elifdef`、`auto(x)` | `expected`、`mdspan`、`flat_map`/`flat_set`、`stacktrace`、`generator`、`print`、`to_underlying`、`byteswap`、`move_only_function`、optional 单子操作、`string::contains`、`ranges::to` |
| C++26 | 反射、契约、pack indexing、`#embed` | senders/receivers（`std::execution`）、`std::hive` |

**减法**同样要记：`std::auto_ptr`（拷贝即转移所有权，放进容器会静默变空）与 `std::random_shuffle`（依赖 `rand()`、不可复现）在 C++17 被移除；动态异常规格 `throw(int)`、`register` 关键字、`std::bind1st`/`bind2nd` 也在 C++17 移除；`std::iterator` 基类、`std::codecvt`、`std::uncaught_exception` 被弃用。这些不是"不建议用"，是新标准下直接编译不过或明确不推荐。

<a id="section-11"></a>

## 怎么确认你的编译器真的有这些特性

查表会过时，"我印象里 GCC 8 支持 C++17"也可能记错。最可靠的办法是**让编译器自己回答**：标准给每个特性定义了 feature-test macro（`__cpp_xxx`），库特性是 `__cpp_lib_xxx`，`<version>` 头文件会把它们暴露出来。

```cpp
{{SRC:probe.cpp}}
```

编译运行（换 `-std=` 就能看出每个标准下的差异）：

```bash
g++ -std=c++23 probe.cpp -o probe
./probe
```

本机 `g++ 16.1.0` 的实测值（节选）：

| 宏 | `-std=c++11` | `-std=c++17` | `-std=c++20` | `-std=c++23` |
| --- | --- | --- | --- | --- |
| `__cplusplus` | 201103 | 201703 | 202002 | 202302 |
| `__cpp_constexpr` | 200704 | 201603 | 202002 | 202211 |
| `__cpp_if_constexpr` | — | 201606 | 201606 | 201606 |
| `__cpp_structured_bindings` | — | 201606 | 201606 | 201606 |
| `__cpp_concepts` | — | — | 202002 | 202002 |
| `__cpp_consteval` | — | — | 202211 | 202211 |
| `__cpp_lib_format` | — | — | 202304 | 202304 |
| `__cpp_lib_jthread` | — | — | 201911 | 201911 |
| `__cpp_lib_expected` | — | — | — | 202211 |
| `__cpp_lib_print` | — | — | — | 202406 |

三条经验：

1. **宏有定义 ≠ 能用**。上面 `__cpp_lib_print` 有值，但链接失败（见[§6](#section-06)）。宏只说明"头文件声明了接口"。要验证真正可用，必须**编译并运行**。
2. **`__cplusplus` 在 MSVC 上默认是 199711**，要加 `/Zc:__cplusplus` 才是真实值，所以很多库改用 `_MSVC_LANG` 判断。
3. **交叉验证**：[cppreference 编译器支持](https://en.cppreference.com/w/cpp/compiler_support)、[GCC 状态页](https://gcc.gnu.org/projects/cxx-status.html)、[Clang 状态页](https://clang.llvm.org/cxx_status.html)、[MSVC 符合性](https://learn.microsoft.com/en-us/cpp/overview/visual-cpp-language-conformance) 三处对照，最后以本机实测为准。

<a id="section-12"></a>

## 面试表达

> 我用三个词概括 C++11 之后的演进：少拷贝、少样板、少猜意图。C++11 解决"深拷贝浪费"和"没有标准并发"，给了移动语义、`constexpr`、可变参数模板和整套并发库；C++14、17 补语法糖，结构化绑定、`if constexpr`、`string_view` 让代码短一截；C++20 是第二个分水岭，concepts 让模板要求变成可检查的约束，ranges 把算法变成管道，`consteval`、`format`、`jthread` 改写了日常写法。代价是新特性都有边界：`string_view` 不拥有内存、`jthread` 析构会阻塞、`std::move` 只是转换、移动构造不标 `noexcept` 会让 `vector` 退化成拷贝。所以我判断一个特性能不能用时，先问三件事：编译器和标准是否支持、失败路径是否清楚、它会不会把生命周期问题藏起来。

<a id="section-13"></a>

## 深入追问

**为什么移动构造要 `noexcept`？**
因为 `vector` 扩容要保证强异常安全：移动若抛异常，已搬走的元素无法回滚，容器状态就不一致。`std::move_if_noexcept` 因此只在移动构造 `noexcept`（或类型不可拷贝）时才移动，否则退化为拷贝。这是标准库的异常安全契约逼出来的，不是编码风格。

**`std::move` 到底做了什么？**
一个 `static_cast<T&&>`，把表达式变成右值，让重载决议选中移动构造。它不修改对象、不释放资源。移动之后的对象仍可析构、可赋值，但值未指定。

**concepts 与 SFINAE 的区别？**
SFINAE 靠"替换失败不是错误"排除重载，错误在实例化深处、约束无法命名；concept 是可命名的布尔约束，能参与重载决议并按约束强弱排序（约束包含），不满足时在调用点报错。它更早失败、更好读，但管不到模板实现内部的错误。

**为什么 ranges 视图是惰性的，代价是什么？**
不产生中间容器，只遍历一次、只算需要的元素，省掉多次分配与拷贝。代价是生命周期依赖（视图只引用不拥有，容器销毁后悬垂）与调试不直观（每次迭代才计算）。

**`expected` 和异常怎么选？**
异常适合"不该发生、发生就中断流程"的错误；`expected` 适合"常见、需要就地处理"的失败。`expected` 不打断控制流、没有栈展开成本，但错误处理写在调用点；异常相反。不可恢复错误仍应抛异常。

**C++20 协程为什么"只有机制没有运行时"？**
标准只规定编译器如何把含 `co_await` 的函数改写成状态机、以及 `promise_type` 的接口；调度、内存分配、唤醒策略都由库决定。所以同一套机制既能做生成器也能做异步任务，但"帧在哪分配、何时销毁"必须由库回答，这也是协程代码容易出生命周期问题的原因。

<a id="section-14"></a>

## Q&A（常见问题与解答）

**C++11 的 `constexpr` 和 C++20 的有什么区别？**
C++11 只允许函数体有一条 `return`（可递归）；C++14 放宽到循环、局部变量、多语句；C++20 进一步允许 `virtual`、动态分配、`try/catch`、部分 `std::string`/`std::vector` 操作。

**`nullptr` 比 `NULL` 好在哪？**
`NULL` 通常是 `0` 或 `0L`，重载决议会选中整数版本，模板推导会推成整数；`nullptr` 是 `std::nullptr_t`，能隐式转任意指针、不能转整数。

**结构化绑定能让 `map` 的 key 可写吗？**
不能。`map` 的键是 `const`，`auto& [k, v]` 里的 `k` 是 `const` 引用，`v` 可写；`auto [k, v] = *it` 拿到的是拷贝，改它不影响容器。

**`std::function` 为什么有性能问题？**
它做类型擦除：可能堆分配（捕获较大的 lambda），每次调用是一次间接跳转、无法内联。热路径用模板参数接收可调用对象，需要存储或跨接口时才用 `std::function`，只能移动的场景用 C++23 的 `move_only_function`。

**`vector<bool>` 为什么被称为失败的实验？**
它是唯一被特化的标准容器：按位存储，`operator[]` 返回代理而非 `bool&`，因此不能取地址、不能与 C 接口互通、`auto` 会推出代理类型。省了内存，破坏了容器语义。

**`inline` 变量与头文件里的 `static` 变量有什么区别？**
`static` 每个编译单元一份副本（地址不同、修改互不影响），`inline` 全程序一份且允许定义在头文件里；想表达"全局唯一"用 `inline`。

**`std::span` 和 `std::string_view` 的区别？**
都是"指针 + 长度"的视图、都不拥有内存。`span` 面向任意连续内存（可写、可多维 `mdspan`），`string_view` 面向字符并提供字符串接口（`substr`、`starts_with`）。传参用它们替代 `(T*, size)` 与 `const std::string&` 能减少拷贝。

**C++26 的功能现在能用在项目里吗？**
要看三件事：标准是否定稿、你的工具链是否实现（用 `__cpp_*` 宏 + 编译运行实测）、以及团队是否接受依赖草案特性。C++26 的反射、契约、senders 都还在实现补齐阶段，生产项目应先在旁路验证。

<a id="section-15"></a>

## 进一步阅读

- **参考手册**：[cppreference 各版本页](https://en.cppreference.com/w/cpp/11)（11/14/17/20/23/26 分别在 `/cpp/14`、`/cpp/17` 等路径）、[特性测试宏总表](https://en.cppreference.com/w/cpp/feature_test)。
- **提案原文**：`<=>`（P0515）、concepts（P0898）、ranges（P0896）、`consteval`（P1073）、`constinit`（P1143）、`format`（P0645）、`jthread`（P0660）、`expected`（P0323）、`print`（P2093）、deducing this（P0847）、多维下标（P2128）、反射（P2996）、契约（P2900）、senders（P2300）。在 [wg21.link](https://wg21.link) 后加编号即可打开。
- **编译器状态**：[GCC](https://gcc.gnu.org/projects/cxx-status.html)、[Clang](https://clang.llvm.org/cxx_status.html)、[MSVC](https://learn.microsoft.com/en-us/cpp/overview/visual-cpp-language-conformance)。
- **书籍**：Stroustrup《C++ 程序设计语言（第 4 版）》覆盖 C++11；《Effective Modern C++》讲 C++11/14 的实践陷阱；Josuttis 的《C++17 - The Complete Guide》《C++20 - The Complete Guide》按特性逐条讲。
- **配套笔记**：并发与内存序见 [C++ 并发编程](../C%2B%2B%E5%B9%B6%E5%8F%91%E7%BC%96%E7%A8%8B/README.md)；容器与算法见 [C++ 数据结构与算法](../C%2B%2B%E6%95%B0%E6%8D%AE%E7%BB%93%E6%9E%84%E4%B8%8E%E7%AE%97%E6%B3%95/%E6%A0%91/README.md)。

<a id="section-16"></a>

## 思维导图总结

```text
C++11～C++26 新特性：每个标准在补哪个坑
├── 为什么返回大对象要付两次拷贝
│   ├── 值类别决定重载：左值拷贝、右值移动
│   ├── 转发引用 + 引用折叠 + std::forward
│   └── 移动构造不加 noexcept，vector 扩容退化成拷贝
├── 为什么资源总要手写 delete
│   ├── RAII：析构负责释放，异常路径也不漏
│   ├── unique_ptr 独占、shared_ptr 共享、weak_ptr 观察
│   └── 循环引用靠 weak_ptr 打破；计数安全但对象不安全
├── 为什么模板报错读不懂
│   ├── 约束从注释、static_assert、if constexpr 演进到 concepts
│   └── concepts 参与重载决议，按约束强弱排序
├── 为什么同一段逻辑要给每种类型写一遍
│   ├── auto 掉引用/const，decltype 保留值类别
│   ├── 泛型 lambda、捕获初始化、返回类型推导
│   └── vector<bool> 的代理类型陷阱
├── 为什么多返回值总是 out 参数
│   ├── 结构化绑定拆 pair/tuple/聚合体
│   └── CTAD 与 initializer_list 的歧义、空参数包的折叠初值
├── 为什么表达意图需要新语法
│   ├── optional 表示可能没有、variant 表示多选一
│   ├── expected 表示值或错误，单子操作做链式处理
│   └── deducing this 让一份实现覆盖 const/非 const
├── 为什么并发代码每版重写
│   ├── thread 要手写 join → jthread 自动 join（析构会阻塞）
│   ├── stop_token 是协作取消，没有安全的强杀
│   └── atomic wait/notify、latch/barrier/semaphore 补齐对齐原语
├── 为什么编译期能做越来越多
│   ├── constexpr 是"可以编译期"，consteval 是"必须编译期"
│   ├── constinit 消除静态初始化顺序问题
│   └── C++26 反射、契约、pack indexing 继续扩展
├── 陷阱清单
│   └── string_view 悬垂、auto 代理、jthread 阻塞、<=> 不生成 ==
├── 版本速查
│   ├── 语言特性按版本定位
│   ├── 标准库按版本定位
│   └── 减法：auto_ptr、random_shuffle、throw()、register 已移除
└── 验证与表达
    ├── 用 __cpp_* 宏探测实现，宏有定义 ≠ 能链接
    └── 面试稿：少拷贝、少样板、少猜意图 + 三个判断标准
```

![C++11～C++26 新特性：一张图看清主线](content-mindmap.png)

**配图维护**：三张图的 DOT 源文件是 `content-evolution.dot`、`content-move.dot`、`content-mindmap.dot`，按仓库规范写（`rankdir=LR`、`PingFang SC`、200 DPI、卡片式节点、语义配色）。本次生成时本机没有 Graphviz，PNG 是用 Pillow 按与 DOT 相同的节点/连线数据画的；装上 Graphviz 后执行下面命令可渲染成标准样式：

```bash
for source in content-evolution.dot content-move.dot content-mindmap.dot; do
    dot -Tpng -Gdpi=200 "$source" -o "${source%.dot}.png"
done
```
