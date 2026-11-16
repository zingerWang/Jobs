#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""重绘思维导图：节点与文字树一一对应（11 个一级分支）。"""
import math
import os
from PIL import Image, ImageDraw, ImageFont

FONT_BOLD = r"C:\Windows\Fonts\msyhbd.ttc"
FONT_REG = r"C:\Windows\Fonts\msyh.ttc"
OUT = r"C:\Users\孟悦\Desktop\Job\C++新特性"
DPI = 200

PAL = {
    "app":     ("#4F46E5", "#EEF2FF"),
    "ok":      ("#0D9488", "#F0FDFA"),
    "bad":     ("#E11D48", "#FFF1F2"),
    "adv":     ("#7C3AED", "#F5F3FF"),
    "flow":    ("#0284C7", "#F0F9FF"),
    "neutral": ("#475569", "#F8FAFC"),
}
INK, SUB, BODY = "#1E293B", "#64748B", "#1F2937"
EDGE, EDGE_SOFT = "#94A3B8", "#CBD5E1"

S_TITLE, S_SUB, S_NODE, S_LEAF = 44, 25, 26, 22
PAD, BAR_H, BODY_LH = 18, 44, 31

_fc = {}


def font(path, size):
    k = (path, size)
    if k not in _fc:
        _fc[k] = ImageFont.truetype(path, size)
    return _fc[k]


def tw(text, f):
    b = f.getbbox(text)
    return b[2] - b[0], b[3] - b[1]


class Card:
    def __init__(self, title, body=None, palette="app", width=None, leaf=False):
        self.title, self.body, self.leaf = title, body or [], leaf
        self.bar, self.bg = PAL[palette]
        ft = font(FONT_BOLD, S_LEAF if leaf else S_NODE)
        wid = tw(title, ft)[0] + 2 * PAD + (18 if leaf else 8)
        if body:
            fb = font(FONT_REG, S_LEAF if leaf else S_LEAF)
            for line in body:
                wid = max(wid, tw(line, fb)[0] + 2 * PAD)
        if width:
            wid = max(wid, width)
        self.w = wid
        self.h = 52 if leaf else BAR_H + (len(body) * BODY_LH + PAD if body else 0)

    def draw(self, d, x, y):
        if self.leaf:
            d.rounded_rectangle([x, y, x + self.w, y + self.h], radius=9,
                                fill=self.bg, outline=self.bar, width=2)
            d.rectangle([x, y, x + 8, y + self.h], fill=self.bar)
            f = font(FONT_BOLD, S_LEAF)
            th = tw(self.title, f)[1]
            d.text((x + 20, y + (self.h - th) / 2 - 2), self.title, font=f, fill=BODY)
            return
        d.rounded_rectangle([x, y, x + self.w, y + self.h], radius=10,
                            fill=self.bg, outline=self.bar, width=2)
        d.rounded_rectangle([x, y, x + self.w, y + BAR_H], radius=10, fill=self.bar)
        d.rectangle([x, y + BAR_H - 10, x + self.w, y + BAR_H], fill=self.bar)
        ft = font(FONT_BOLD, S_NODE)
        th = tw(self.title, ft)[1]
        d.text((x + PAD, y + (BAR_H - th) / 2 - 3), self.title, font=ft, fill="white")
        fb = font(FONT_REG, S_LEAF)
        for i, line in enumerate(self.body):
            d.text((x + PAD, y + BAR_H + PAD * 0.55 + i * BODY_LH), line, font=fb, fill=BODY)


def arrow(d, p0, p1, color=EDGE, width=3):
    d.line([p0, p1], fill=color, width=width)
    ang = math.atan2(p1[1] - p0[1], p1[0] - p0[0])
    L, W = 14, 7
    d.polygon([(p1[0], p1[1]),
               (p1[0] - L * math.cos(ang) + W * math.sin(ang), p1[1] - L * math.sin(ang) - W * math.cos(ang)),
               (p1[0] - L * math.cos(ang) - W * math.sin(ang), p1[1] - L * math.sin(ang) + W * math.cos(ang))],
              fill=color)


def elbow(d, p0, p1, color=EDGE_SOFT, width=2):
    x0, y0 = p0
    x1, y1 = p1
    mid = (x0 + x1) / 2 if abs(y1 - y0) > 4 else x1
    d.line([(x0, y0), (mid, y0), (mid, y1), (x1, y1)], fill=color, width=width, joint="curve")
    arrow(d, (mid, y1), (x1, y1), color, width)


def canvas(w, h, title, subtitle):
    img = Image.new("RGB", (int(w), int(h)), "white")
    d = ImageDraw.Draw(img)
    ft, fs = font(FONT_BOLD, S_TITLE), font(FONT_REG, S_SUB)
    w1, h1 = tw(title, ft)
    d.text(((w - w1) / 2, 30), title, font=ft, fill=INK)
    w2, _ = tw(subtitle, fs)
    d.text(((w - w2) / 2, 30 + h1 + 14), subtitle, font=fs, fill=SUB)
    return img, d


def dot_nodes(node_id, title, body, palette, leaf=False):
    bar, bg = PAL[palette]
    if leaf:
        return (f'  {node_id} [label=<<TABLE BORDER="1" COLOR="{bar}" CELLBORDER="0" '
                f'CELLSPACING="0" CELLPADDING="8"><TR><TD BGCOLOR="{bg}">'
                f'<FONT COLOR="#1F2937">{title}</FONT></TD></TR></TABLE>>];')
    rows = "".join(f'<TR><TD ALIGN="LEFT"><FONT POINT-SIZE="10" COLOR="#1F2937">{b}</FONT></TD></TR>'
                   for b in body)
    return (f'  {node_id} [label=<<TABLE BORDER="0" CELLBORDER="0" CELLSPACING="0" CELLPADDING="10">'
            f'<TR><TD BGCOLOR="{bar}"><FONT COLOR="white"><B>{title}</B></FONT></TD></TR>'
            f'<TR><TD BGCOLOR="{bg}"><TABLE BORDER="0" CELLBORDER="0" CELLSPACING="0">{rows}</TABLE></TD></TR>'
            f'</TABLE>>];')


ROOT_T = "C++11～C++26 新特性：每个标准在补哪个坑"
ROOT_B = ["按「先遇到什么问题、标准才补了什么」组织"]
GROUPS = [
    ("为什么返回大对象要付两次拷贝", ["左值拷贝、右值移动，值类别决定重载", "转发引用 + 引用折叠 + std::forward",
                                     "移动构造不加 noexcept，扩容退化成拷贝"], "app"),
    ("为什么资源总要手写 delete", ["RAII：析构负责释放，异常路径也不漏", "unique_ptr / shared_ptr / weak_ptr 分工",
                                   "循环引用靠 weak_ptr；计数安全≠对象安全"], "ok"),
    ("为什么模板报错读不懂", ["static_assert → if constexpr → concepts", "concepts 参与重载决议，按约束强弱排序"], "flow"),
    ("为什么同一段逻辑要给每种类型写一遍", ["auto 掉引用与 const，decltype 保留值类别", "泛型 lambda、捕获初始化、返回类型推导",
                                            "vector<bool> 的代理类型陷阱"], "flow"),
    ("为什么多返回值总是写 out 参数", ["结构化绑定拆 pair / tuple / 聚合体", "折叠表达式与空参数包的初值",
                                      "CTAD 与 initializer_list 的歧义"], "flow"),
    ("为什么表达意图需要新语法", ["optional 可能没有、variant 多选一", "expected 值或错误，单子操作做链式",
                                 "deducing this 一份实现覆盖 const/非 const"], "adv"),
    ("为什么并发代码每版都要重写", ["jthread 自动 join，但析构会阻塞", "stop_token 是协作取消，没有安全强杀",
                                   "atomic wait/notify、latch/barrier/semaphore"], "ok"),
    ("为什么编译期能做的事越来越多", ["constexpr 是「可以」，consteval 是「必须」", "constinit 消除静态初始化顺序问题",
                                     "C++26 反射、契约、pack indexing"], "adv"),
    ("陷阱清单", ["string_view 悬垂、auto 推出代理", "jthread 阻塞、<=> 不生成 ==", "移动不 noexcept 退化为拷贝"], "bad"),
    ("版本速查", ["每个标准给了什么（语言 + 库）", "减法：auto_ptr、random_shuffle、throw() 已移除"], "neutral"),
    ("验证与表达", ["用 __cpp_* 宏探测实现", "宏有定义 ≠ 能链接、能运行", "面试稿：少拷贝、少样板、少猜意图"], "neutral"),
]


def main():
    root = Card(ROOT_T, ROOT_B, "ok", width=560)
    gcards = [Card(t, None, p, width=470) for (t, _l, p) in GROUPS]
    lcards = [[Card(l, None, p, width=520, leaf=True) for l in leaves] for (_t, leaves, p) in GROUPS]

    v_gap = 28
    heights = [sum(c.h for c in lc) + v_gap * (len(lc) - 1) for lc in lcards]
    total_h = sum(heights) + v_gap * (len(heights) - 1)
    x_root = 70
    x_group = x_root + root.w + 120
    x_leaf = x_group + max(c.w for c in gcards) + 100
    W = x_leaf + max(c.w for lc in lcards for c in lc) + 80
    head = 150
    H = head + total_h + 60
    img, d = canvas(W, H, "C++11～C++26 新特性：一张图看清主线",
                    "一级分支就是正文的章节，按「问题 → 机制 → 边界」组织")
    y = head
    for g in range(len(GROUPS)):
        gc = gcards[g]
        gy = y + (heights[g] - gc.h) / 2
        gc.draw(d, x_group, gy)
        ly = y
        for lc in lcards[g]:
            lc.draw(d, x_leaf, ly)
            elbow(d, (x_group + gc.w, gy + gc.h / 2), (x_leaf - 8, ly + lc.h / 2))
            ly += lc.h + v_gap
        y += heights[g] + v_gap
    ry = head + (total_h - root.h) / 2
    root.draw(d, x_root, ry)
    y = head
    for g in range(len(GROUPS)):
        gc = gcards[g]
        gy = y + (heights[g] - gc.h) / 2
        arrow(d, (x_root + root.w + 8, ry + root.h / 2), (x_group - 10, gy + gc.h / 2), color=EDGE)
        y += heights[g] + v_gap
    p = os.path.join(OUT, "content-mindmap.png")
    img.save(p, dpi=(DPI, DPI))
    print("PNG:", img.size, p)

    dot = ['digraph mindmap {', '  rankdir=LR;', '  dpi=200;',
           '  node [shape=plaintext, fontname="PingFang SC"];',
           '  edge [color="#94A3B8", penwidth=1.6];',
           dot_nodes("root", ROOT_T, ROOT_B, "ok")]
    for g, (t, leaves, pal) in enumerate(GROUPS):
        bar, _bg = PAL[pal]
        dot.append(f'  g{g} [label=<<TABLE BORDER="0" CELLBORDER="0" CELLSPACING="0" CELLPADDING="10">'
                   f'<TR><TD BGCOLOR="{bar}"><FONT COLOR="white"><B>{t}</B></FONT></TD></TR></TABLE>>];')
        dot.append(f"  root -> g{g};")
        for i, leaf in enumerate(leaves):
            dot.append(dot_nodes(f"g{g}l{i}", leaf, [], pal, leaf=True))
            dot.append(f"  g{g} -> g{g}l{i};")
    dot.append('  label=<<FONT POINT-SIZE="24" COLOR="#1E293B"><B>C++11～C++26 新特性：一张图看清主线</B></FONT>>;')
    dot.append("}")
    open(os.path.join(OUT, "content-mindmap.dot"), "w", encoding="utf-8").write("\n".join(dot))
    print("DOT written")


if __name__ == "__main__":
    main()
