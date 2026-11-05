"""生成本指南新增的过程图与同目录独立思维导图（Python 3，无第三方依赖）。

python assets/build_learning_diagrams.py --dot /path/to/dot
默认声明 PingFang SC；机器缺少该字体时由 Graphviz/fontconfig 回退。
"""
from pathlib import Path
import argparse
import html
import json
import subprocess

BASE = Path(__file__).resolve().parent
COLORS = {
    'app': ('#4F46E5', '#EEF2FF'), 'ok': ('#0D9488', '#F0FDFA'),
    'error': ('#E11D48', '#FFF1F2'), 'wait': ('#D97706', '#FFFBEB'),
    'advanced': ('#7C3AED', '#F5F3FF'), 'flow': ('#0284C7', '#F0F9FF'),
    'neutral': ('#475569', '#F8FAFC'),
}

def q(s):
    return json.dumps(str(s), ensure_ascii=False)

def esc(s):
    return html.escape(str(s)).replace('\n', '<BR/>')

class Diagram:
    def __init__(self, name, title, subtitle, direction='TB'):
        self.path = BASE / (name + '.dot')
        self.lines = [
            'digraph G {',
            f'graph [rankdir={direction}, newrank=true, bgcolor="white", pad="0.3", nodesep="0.25", '
            'ranksep="0.5", ordering=out, dpi=200, fontname="PingFang SC", labelloc=t, '
            f'label=<<B><FONT POINT-SIZE="24" COLOR="#1E293B">{esc(title)}</FONT></B>'
            f'<BR/><FONT POINT-SIZE="13" COLOR="#64748B">{esc(subtitle)}</FONT>>];',
            'node [shape=plaintext, fontname="PingFang SC", fontsize=13];',
            'edge [fontname="PingFang SC", fontsize=11, color="#0284C7", '
            'fontcolor="#0284C7", arrowsize=0.7, penwidth=1.4];',
        ]

    def node(self, ident, title, body='', kind='neutral'):
        dark, light = COLORS[kind]
        rows = f'<TR><TD BGCOLOR="{dark}"><FONT COLOR="white"><B>{esc(title)}</B></FONT></TD></TR>'
        if body:
            rows += f'<TR><TD BGCOLOR="{light}"><FONT COLOR="#1E293B" POINT-SIZE="12">{esc(body)}</FONT></TD></TR>'
        self.lines.append(f'{ident} [label=<<TABLE BORDER="0" CELLBORDER="0" CELLSPACING="0" CELLPADDING="8">{rows}</TABLE>>];')

    def edge(self, a, b, label='', kind='flow', **attrs):
        attrs.update(color=COLORS[kind][0], fontcolor=COLORS[kind][0])
        if label:
            attrs['label'] = label
        self.lines.append(f'{a} -> {b} [' + ', '.join(f'{k}={q(v)}' for k, v in attrs.items()) + '];')

    def panel(self, ident, label, nodes, edges):
        self.lines.append(f'subgraph cluster_{ident} {{ label={q(label)}; fontcolor="#475569"; fontsize=15; color="#CBD5E1"; style=rounded;')
        for key, title, body, kind in nodes:
            self.node(ident + key, title, body, kind)
        for a, b, label in edges:
            self.edge(ident + a, ident + b, label)
        self.lines.append('}')

    def save(self, dot):
        self.path.write_text('\n'.join(self.lines + ['}']) + '\n', encoding='utf-8')
        subprocess.run([dot, '-Tpng', '-Gdpi=200', str(self.path), '-o', str(self.path.with_suffix('.png'))], check=True)
        return self.path


def build(dot):
    diagrams = []
    d = Diagram('learning_routes', '先分清：树是工具，还是题目的输入？', '每条箭头表示下一步为什么需要新方法', 'LR')
    d.node('root', '我要解决什么问题？', kind='app')
    routes = [
        ('order', '查某个数、按大小输出', 'BST：利用大小排除一边', 'balance', '插入后长成链怎么办？', 'AVL／红黑树／Treap／Splay'),
        ('top', '反复拿当前最小值', '堆：只维护父子优先级', 'huff', '反复合并两个最小项', '哈夫曼树复用小顶堆'),
        ('range', '反复统计数组的一段', '线段树／BIT／ST 表', 'path', '数据本来连成一棵树？', 'DFS 序／HLD 转成数组区间'),
        ('special', '访问成本或数据类型变化', '页式存储／字符串／空间点', 'choose', '按任务选择组织方式', 'B+／Trie 与 AC／KD-Tree'),
        ('input', '输入已经是一棵树', '父子关系固定，要求算答案', 'dp', '避免重复遍历同一部分', 'LCA／树形 DP／换根／点分治'),
    ]
    for a, title, body, b, title2, body2 in routes:
        d.node(a, title, body, 'flow'); d.node(b, title2, body2, 'ok')
        d.edge('root', a); d.edge(a, b)
    diagrams.append(d)

    d = Diagram('dfs_return', '递归究竟什么时候回来？', '只放大 3、1、6 这棵子树；中序在左边返回后输出当前值', 'LR')
    steps = [('a', '进入 visit(3)', '记住：左边结束后还要处理 3'), ('b', '进入 visit(1)', '左为空 → 输出 1 → 右为空'),
             ('c', '回到 visit(3)', '左边已完成 → 输出 3'), ('d', '进入 visit(6)', '左为空 → 输出 6 → 右为空'),
             ('e', 'visit(3) 结束', '把控制权交还给调用它的 8')]
    for i, title, body in steps: d.node(i, title, body, 'flow')
    for (a, *_), (b, *_) in zip(steps, steps[1:]): d.edge(a, b)
    diagrams.append(d)

    d = Diagram('bst_delete_steps', '删除有两个孩子的结点：用后继接替', '原来的 10 被移走；键和值必须作为同一条记录处理')
    for ident, label, root, ten in [('a', '① 删除 8 前', '8：待删', True), ('b', '② 用 10 替换，再删原位置的 10', '10：接替', False)]:
        ns = [('r', root, '', 'error' if ident == 'a' else 'ok'), ('l', '3', '', 'neutral'), ('rr', '12', '', 'neutral'), ('one', '1', '', 'neutral'), ('six', '6', '', 'neutral'), ('fourteen', '14', '', 'neutral')]
        es = [('r','l','左'),('r','rr','右'),('l','one','左'),('l','six','右')]
        if ten: ns.append(('ten','10：后继','右子树最小值','wait')); es.append(('rr','ten','左'))
        es.append(('rr','fourteen','右'))
        d.panel(ident,label,ns,es)
    d.lines.append('{rank=same; ar; br;}')
    diagrams.append(d)

    d = Diagram('avl_lr_steps', 'LR 失衡：先拉直，再压低', '插入顺序 30、10、20；每一步的中序仍是 10、20、30')
    d.panel('a', '① 左孩子向右拐', [('r','30','BF = 2','error'),('l','10','','wait'),('m','20','','flow')], [('r','l','左'),('l','m','右')])
    d.panel('b', '② 对 10 左旋', [('r','30','','wait'),('m','20','','flow'),('l','10','','neutral')], [('r','m','左'),('m','l','左')])
    d.panel('c', '③ 对 30 右旋', [('m','20','高度恢复为 2','ok'),('l','10','','neutral'),('r','30','','neutral')], [('m','l','左'),('m','r','右')])
    d.lines.append('{rank=same; ar; br; cm;}')
    diagrams.append(d)

    d = Diagram('llrb_insert_steps', 'LLRB 插入 10、20、30：颜色怎样变化？', '红色表示红链接的下端；省略的空孩子均为黑色 NIL')
    d.panel('a','① 已有 10，插入 20', [('x','10 黑','','neutral'),('y','20 红','','error')],[('x','y','右红')])
    d.panel('b','② 左旋，并传递原根颜色', [('y','20 黑','','neutral'),('x','10 红','','error')],[('y','x','左红')])
    d.panel('c','③ 插入 30', [('y','20 黑','','neutral'),('x','10 红','','error'),('z','30 红','','error')],[('y','x','左'),('y','z','右')])
    d.panel('d','④ fix 先处理右红：左旋', [('z','30 黑','','neutral'),('y','20 红','','error'),('x','10 红','','error')],[('z','y','左'),('y','x','左')])
    d.panel('e','⑤ 右旋、翻色、根置黑', [('y','20 黑','','ok'),('x','10 黑','','neutral'),('z','30 黑','','neutral')],[('y','x','左'),('y','z','右')])
    d.lines.append('{rank=same; ax; by; cy; dz; ey;}')
    diagrams.append(d)

    d = Diagram('splay_zigzig', 'Splay 同向双旋：先提父亲，再提目标', '访问 10；旋转只改变关系，中序仍是 10、20、30')
    d.panel('a','① 目标与父亲都在左边', [('g','30：祖父','','neutral'),('p','20：父亲','','wait'),('x','10：目标','','flow')],[('g','p','左'),('p','x','左')])
    d.panel('b','② 对 30 右旋，提升 20', [('p','20','','wait'),('x','10','','flow'),('g','30','','neutral')],[('p','x','左'),('p','g','右')])
    d.panel('c','③ 对 20 右旋，提升 10', [('x','10：到根','','ok'),('p','20','','neutral'),('g','30','','neutral')],[('x','p','右'),('p','g','右')])
    d.lines.append('{rank=same; ag; bp; cx;}')
    diagrams.append(d)

    d = Diagram('btree_split', '同样是分裂：B 树移动记录，B+ 树复制导航键', 'B 树示例 t=2；B+ 示例仅为说明分隔规则，叶容量取 3')
    d.panel('b','B 树：满根 [10,20,30] 分裂', [('r','20','记录移到父结点','ok'),('l','10','左结点','neutral'),('rr','30','右结点','neutral')],[('r','l','小于 20'),('r','rr','大于 20')])
    d.panel('p','B+：叶 [10,20,30] 插入 40 后分裂', [('r','30','复制的导航键','flow'),('l','10 | 20','叶子记录','ok'),('rr','30 | 40','30 的记录仍在这里','ok')],[('r','l','小于 30'),('r','rr','大于等于 30')])
    d.edge('pl','prr','next', constraint='false')
    d.lines.append('{rank=same; br; pr;}')
    diagrams.append(d)

    d = Diagram('ac_scan_steps', '读完 she 后，为什么还能接上 r？', '模式 he、she、hers；文本 ushers；文本指针始终向右', 'LR')
    for i,t,b,k in [('a','读 u → 根','没有匹配前缀','neutral'),('b','读 s、h、e → she','报告 she；沿 fail 还匹配 he','ok'),('c','保留后缀 he','she 无 r 边，fail 指向 he','wait'),('d','读 r → her','复用已经读过的 he','flow'),('e','读 s → hers','报告 hers；累计 3 次匹配','ok')]: d.node(i,t,b,k)
    for a,b in [('a','b'),('b','c'),('c','d'),('d','e')]: d.edge(a,b)
    diagrams.append(d)

    d = Diagram('lazy_push_steps', '懒标记：总账先更新，查明细时再下传', '数组 [2,1,3,4] 整段加 5；sum 已生效，lazy 是尚未交给孩子的加法')
    d.panel('a','① 整段更新后', [('r','[0,4) sum=30','lazy=5','wait'),('l','[0,2) sum=3','lazy=0；仍是旧值','neutral'),('rr','[2,4) sum=7','lazy=0；仍是旧值','neutral')],[('r','l','尚未下传'),('r','rr','尚未下传')])
    d.panel('b','② 查左半段前先 push', [('r','[0,4) sum=30','lazy=0','ok'),('l','[0,2) sum=13','lazy=5','ok'),('rr','[2,4) sum=17','lazy=5','ok')],[('r','l','3 + 5×2'),('r','rr','7 + 5×2')])
    d.lines.append('{rank=same; ar; br;}')
    diagrams.append(d)

    d = Diagram('persistent_path', '保留旧版本：只复制改动经过的路径', '下标 1 从 1 改为 5；青绿为新结点，灰色结点由两个版本共用')
    for i,t,b,k in [('old','旧根 sum=10','版本 0','app'),('new','新根 sum=14','版本 1','ok'),('ol','[0,2) sum=3','','app'),('nl','[0,2) sum=7','','ok'),('right','[2,4) sum=7','不变，两个版本共用','neutral'),('zero','[0,1) = 2','共用','neutral'),('one','[1,2) = 1','旧叶子','app'),('five','[1,2) = 5','新叶子','ok')]: d.node(i,t,b,k)
    for a,b in [('old','ol'),('old','right'),('new','nl'),('new','right'),('ol','zero'),('ol','one'),('nl','zero'),('nl','five')]: d.edge(a,b)
    d.lines.append('{rank=same; old; new;}')
    diagrams.append(d)

    d = Diagram('dfs_interval', 'DFS 编号：子树连续，任意路径未必连续', '按先根后左再右编号；方括号内是数组位置，不是结点值')
    for i,t,b,k in [('r','8 [0]','','neutral'),('l','3 [1]','子树区间起点','ok'),('rr','12 [4]','','neutral'),('a','1 [2]','','ok'),('b','6 [3]','子树区间终点前一项','ok'),('c','10 [5]','','neutral'),('e','14 [6]','','neutral')]: d.node(i,t,b,k)
    for a,b in [('r','l'),('r','rr'),('l','a'),('l','b'),('rr','c'),('rr','e')]: d.edge(a,b)
    d.node('arr','数组：8 | 3 | 1 | 6 | 12 | 10 | 14','3 的子树是 [1,4)；路径 1→10 跳过下标 3 的结点 6','flow')
    d.edge('b','arr','映射到数组',style='dashed')
    diagrams.append(d)

    d = Diagram('lca_lifting', '倍增 LCA：共同祖先相同，就先别跳那么远', '求 1 与 10 的 LCA；祖先跳跃用虚线，树边用实线')
    for i,t,k in [('r','8：LCA','ok'),('a','3','flow'),('b','12','flow'),('c','1：u','app'),('e','10：v','app')]: d.node(i,t,'',k)
    for a,b in [('r','a'),('r','b'),('a','c'),('b','e')]: d.edge(a,b)
    d.edge('c','r','2 步同到 8：不跳',kind='wait',style='dashed',constraint='false')
    d.edge('e','r','2 步同到 8：不跳',kind='wait',style='dashed',constraint='false')
    d.node('rule','改试 1 步：3 与 12 不同，可以同时跳','到 3、12 后，它们的父亲同为 8，所以返回 8','ok')
    d.edge('c','rule',style='invis'); d.edge('e','rule',style='invis')
    diagrams.append(d)

    d = Diagram('tree_dp_states', '子树向父亲交什么？两个有条件的答案', '相邻结点不能同时选；只返回最大值会丢掉父亲需要的信息')
    d.node('p','父亲要决定：自己选不选？','自己选 → 只能取孩子 skip\n自己不选 → 可以取 max(skip,take)','app')
    d.node('r','结点值 9','skip=8；take=9','ok')
    d.node('l','叶子值 3','skip=0；take=3','flow')
    d.node('rr','叶子值 5','skip=0；take=5','flow')
    d.edge('p','r','两种条件分开保存'); d.edge('r','l'); d.edge('r','rr')
    diagrams.append(d)

    d = Diagram('reroot_transfer', '换根：跨过一条边，距离怎样变化？', '从 u 移到相邻的 v；边不变，只改变计算距离的起点', 'LR')
    d.node('outer','v 子树外','n−size[v] 个点\n离新起点 v 都远 1 步','wait')
    d.node('u','旧起点 u','已有 answer[u]','app')
    d.node('v','新起点 v','目标 answer[v]','ok')
    d.node('inner','原先的 v 子树内','size[v] 个点\n离新起点 v 都近 1 步','flow')
    d.edge('outer','u'); d.edge('u','v','跨过这条边'); d.edge('v','inner')
    diagrams.append(d)

    d = Diagram('max_path_return', '最大路径和：完整候选和返回值分开算', '在结点 8 处，两边贡献分别为 3、6；向父亲只能延伸一边')
    d.node('p','父亲','只能接收 8+max(3,6)=14','app')
    d.node('r','8：当前结点','完整候选 3+8+6=17\n用它更新全局答案','ok')
    d.node('l','左边贡献 3','','flow'); d.node('rr','右边贡献 6','','flow')
    d.edge('r','p','返回 14',kind='ok'); d.edge('l','r','贡献 3'); d.edge('rr','r','贡献 6')
    diagrams.append(d)

    d = Diagram('mindmap_standalone', '树数据结构面试指南', '从关系与遍历出发，按实际问题选择结构，再用例子验证', 'LR')
    d.path = BASE.parent / '树数据结构面试指南_思维导图.dot'
    d.node('root','树数据结构面试指南','先问任务，再看规则\n例子 → 过程 → 复杂度 → 边界','app')
    branches = [
        ('base','1～3 基础与查找',[('关系与存储','根、子树、深度与高度\n指针、数组、邻接表'),('访问与排除','DFS／BFS 访问所有点\nBST 按键排除一边')]),
        ('heap','4 极值与优先级',[('堆','完全二叉树＋父子堆序\n上浮、下沉、线性建堆'),('应用','Top K 保留候选\n哈夫曼反复合并最小项')]),
        ('balance','5～8 控制查找成本',[('旋转与确定性平衡','保持中序顺序\nAVL 高度差／红黑树黑高'),('另外两种保证','Treap：随机化期望对数\nSplay：操作序列均摊对数')]),
        ('special','9～11 按任务组织数据',[('页与字符串','B／B+：分裂、导航、叶链\nTrie／AC：前缀与 fail'),('集合与空间','DSU：代表元与合并\nKD-Tree：距离下界剪枝')]),
        ('interval','12 数组区间',[('可修改的数据','线段树：聚合与懒标记\nBIT：前缀、lowbit、差分'),('静态与历史数据','ST 表：幂等区间合并\n持久化：复制路径保留版本')]),
        ('treeops','13～14 输入本来是树',[('关系转换成数组','LCA：倍增跳祖先\nDFS 序／HLD：子树与路径区间'),('分解与传递答案','重心／点分治：分类统计路径\n树形 DP／换根：复用子树结果'),('进阶分支','LCT：连边断边后的路径\nDSU on Tree：复用子树计数')]),
        ('practice','15～16 题目与验证',[('递归返回值','深度／重建／序列化\n最大路径和：候选与返回分开'),('复现与选型','教学源码／前提／错误边界\n朴素算法对照／不变量检查')]),
        ('review','Q&A 与复习',[('讲清为什么','搜索规则／高度保证\n标记下传／编号与路径'),('复述主线','解决什么问题 → 保存什么\n省掉什么工作 → 代价是什么')]),
    ]
    for i,title,children in branches:
        d.node(i,title,'','flow'); d.edge('root',i)
        for j,(t,b) in enumerate(children):
            ident=f'{i}{j}'; d.node(ident,t,b,'ok'); d.edge(i,ident)
    diagrams.append(d)
    for diagram in diagrams:
        print(diagram.save(dot))

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--dot', default='dot')
    build(parser.parse_args().dot)
