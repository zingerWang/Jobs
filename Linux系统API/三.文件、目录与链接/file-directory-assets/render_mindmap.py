"""Generate the file, directory and ACL mindmap with Graphviz; requires dot on PATH.

Usage: python render_mindmap.py --dot /path/to/dot
Install PingFang SC before rendering to reproduce the repository font.
"""
import argparse
import html
from pathlib import Path
import subprocess

parser = argparse.ArgumentParser()
parser.add_argument('--dot', default='dot')
args = parser.parse_args()
directory = Path(__file__).resolve().parent
groups = [('对象与链接（1～3）', '#0284C7', '#F0F9FF', ['名字、inode、fd 分属不同层次', '硬链接共享对象；软链接保存目标路径', 'unlink 删除名字，不立即撤销打开引用']), ('目录与遍历（4～6）', '#4F46E5', '#EEF2FF', ['目录 r 列名，x 搜索，w 修改目录项', '创建：mode、umask、默认 ACL', 'readdir：结束与错误、生命周期、并发']), ('工作目录与路径（7～8）', '#D97706', '#FFFBEB', ['cwd 可能在线程之间共享', '目录 fd 固定起点，不消除所有路径风险', 'symlinkat 不改写目标字符串']), ('UGO 与 ACL：访问时（9）', '#0D9488', '#F0FDFA', ['owner → 指定用户 → 匹配组 → other', 'UGO 与 ACL 不是先后两道关卡', '指定用户和组类条目受 mask 限制', '组模式位有 mask 时表示 mask']), ('创建与删除：分开看（9）', '#7C3AED', '#F5F3FF', ['无默认 ACL：mode 与 umask 决定初始权限', '有默认 ACL：继承模板，再受 mode 限制', '删除：父目录 w+x', '内容可写不等于文件名可删除']), ('实验与复习（10～12）', '#475569', '#F8FAFC', ['完整代码、命令、预期结果与失败路径', '接口返回值与易错点速查', 'Q&A：两种 mask 与目录权限'])]

def card(title, dark, light, lines):
    detail = '<BR ALIGN="LEFT"/>'.join(html.escape(line) for line in lines)
    return ('<<TABLE BORDER="0" CELLBORDER="0" CELLSPACING="0" CELLPADDING="10">'
            f'<TR><TD BGCOLOR="{dark}"><FONT COLOR="white"><B>{html.escape(title)}</B></FONT></TD></TR>'
            f'<TR><TD BGCOLOR="{light}" ALIGN="LEFT"><FONT COLOR="#1E293B" POINT-SIZE="12">{detail}</FONT></TD></TR></TABLE>>')

parts = ['digraph process_map {',
    'graph [rankdir=LR, bgcolor="white", pad="0.35", nodesep="0.22", ranksep="0.65", dpi=200, fontname="PingFang SC", labelloc=t, label=<<B><FONT POINT-SIZE="24" COLOR="#1E293B">文件、目录与链接</FONT></B><BR/><FONT POINT-SIZE="13" COLOR="#64748B">对象与名字 · 路径与目录 · ACL 权限与继承</FONT>>];',
    'node [shape=plaintext, fontname="PingFang SC", fontsize=14];',
    'edge [arrowhead=normal, arrowsize=0.7, penwidth=1.4, fontname="PingFang SC"];',
    'root [label=' + card('文件、目录与链接', '#475569', '#F8FAFC', ['先分清操作对象', '再判断权限与生命周期']) + '];']
for i, (title, dark, light, lines) in enumerate(groups):
    parts.append(f'n{i} [label={card(title, dark, light, lines)}];')
    parts.append(f'root -> n{i} [color="{dark}"];')
parts.append('}')
source = directory / 'mindmap.dot'
source.write_text('\n'.join(parts) + '\n', encoding='utf-8')
for format_name in ('png', 'svg'):
    subprocess.run([args.dot, f'-T{format_name}', '-Gdpi=200', str(source),
                    '-o', str(source.with_suffix('.' + format_name))], check=True)
