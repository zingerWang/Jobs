# 树数据结构面试指南

打开 [完整技术文档](树数据结构面试指南.md)。正文按学习路线串联问题、手算过程、原理与实现，共引用 29 张不同的配图，保留复杂度与选型表，以及完整 C++17 源码附录。

单独复习可打开同目录的 [思维导图 PNG](树数据结构面试指南_思维导图.png)，对应 [Graphviz 源文件](树数据结构面试指南_思维导图.dot) 也在同一目录。

- `assets/`：原理图 PNG、Graphviz DOT 源文件，以及部分旧图的 SVG 版本。
- `src/`：六个头文件、示例入口 demo.cpp、对照测试入口 test.cpp。
- `测试结果.txt`：本次实际测试输出。
- `示例输出.txt`：简短调用示例的实际输出。

图片使用相对路径引用，移动文档时请一并保留 assets 目录。

新增的 15 张路线与过程图，以及同目录独立思维导图，使用下面的命令重新生成。需要 Python 3 和 Graphviz；`--dot` 可以传入本机 `dot` 可执行文件的完整路径。

```bash
python assets/build_learning_diagrams.py --dot dot
```

生成参数为 200 DPI，DOT 声明字体为 PingFang SC。本次 Windows 环境未安装该字体，Graphviz 使用系统回退字体；图片已检查中文显示。安装 PingFang SC 后可用同一命令重新渲染。单张图也可用 `dot -Tpng -Gdpi=200 源.dot -o 目标.png` 生成。

```bash
g++ -std=c++17 -O2 -Wall -Wextra -Wpedantic src/demo.cpp -o tree_demo
./tree_demo
g++ -std=c++17 -O2 -Wall -Wextra -Wpedantic src/test.cpp -o tree_tests
./tree_tests
```

B/B+ 树示例不提供删除；KD-Tree 为静态二维最近邻；线段树为区间加与区间和。具体接口前提、内存管理和递归深度限制见正文第 16 节。
