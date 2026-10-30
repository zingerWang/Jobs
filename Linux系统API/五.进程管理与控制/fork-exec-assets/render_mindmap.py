"""Generate the process-study mindmap with Graphviz; requires dot on PATH.

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
groups = [
    ('进程基础', '#4F46E5', '#EEF2FF', [
        'PID、PPID、虚拟地址空间', 'argv 与 environ：参数和环境']),
    ('创建与共享', '#0284C7', '#F0F9FF', [
        'fork：父子返回值不同，COW 推迟复制',
        '私有变量独立；共享映射仍需同步',
        'vfork：共享地址空间，暂停调用线程',
        'clone：资源选项、线程与 namespace']),
    ('执行与回收', '#0D9488', '#F0FDFA', [
        'exec：换程序，PID 保留，成功不返回',
        'l/v 参数，p 搜索，e 环境',
        'FD_CLOEXEC：成功 exec 时关闭 fd',
        'waitpid：回收僵尸，按状态宏解码']),
    ('终止与错误路径', '#E11D48', '#FFF1F2', [
        'exit / _exit / abort：清理与终止方式',
        '缓冲复制、fd 泄漏、多线程 fork 限制',
        'system：Shell 解释与命令注入',
        'longjmp：恢复位置，不回滚资源']),
    ('进程关系与终端', '#7C3AED', '#F5F3FF', [
        '进程组 PGID、会话 SID、控制终端',
        '前台组接收终端信号；fg / bg',
        'setsid：新会话，初始无控制终端']),
    ('时间与休眠', '#D97706', '#FFFBEB', [
        'time / REALTIME：现实时间',
        'MONOTONIC：经过时间；CPU 时钟：消耗',
        '纳秒表示不等于纳秒精度或准时唤醒',
        'clock_nanosleep：截止时间、EINTR、超期']),
    ('实现与复习', '#475569', '#F8FAFC', [
        '完整示例、编译命令、预期结果、排错',
        '面试表达：问题 → 机制 → 取舍',
        'Q&A：误区、边界与进一步追问']),
]

def card(title, dark, light, lines):
    detail = '<BR ALIGN="LEFT"/>'.join(html.escape(line) for line in lines)
    return ('<<TABLE BORDER="0" CELLBORDER="0" CELLSPACING="0" CELLPADDING="10">'
            f'<TR><TD BGCOLOR="{dark}"><FONT COLOR="white"><B>{html.escape(title)}</B></FONT></TD></TR>'
            f'<TR><TD BGCOLOR="{light}" ALIGN="LEFT"><FONT COLOR="#1E293B" POINT-SIZE="12">{detail}</FONT></TD></TR></TABLE>>')

parts = ['digraph process_map {',
    'graph [rankdir=LR, bgcolor="white", pad="0.35", nodesep="0.22", ranksep="0.65", dpi=200, fontname="PingFang SC", labelloc=t, label=<<B><FONT POINT-SIZE="24" COLOR="#1E293B">进程管理：从 fork、exec 到终端与时间</FONT></B><BR/><FONT POINT-SIZE="13" COLOR="#64748B">进程基础与控制 · 进程关系与终端 · 时间与休眠</FONT>>];',
    'node [shape=plaintext, fontname="PingFang SC", fontsize=14];',
    'edge [arrowhead=normal, arrowsize=0.7, penwidth=1.4, fontname="PingFang SC"];',
    'root [label=' + card('进程管理', '#475569', '#F8FAFC', ['5.1 进程基础与控制', '5.2 进程关系与终端', '5.3 时间与定时器']) + '];']
for i, (title, dark, light, lines) in enumerate(groups):
    parts.append(f'n{i} [label={card(title, dark, light, lines)}];')
    parts.append(f'root -> n{i} [color="{dark}"];')
parts.append('}')
source = directory / 'mindmap.dot'
source.write_text('\n'.join(parts) + '\n', encoding='utf-8')
for format_name in ('png', 'svg'):
    subprocess.run([args.dot, f'-T{format_name}', '-Gdpi=200', str(source),
                    '-o', str(source.with_suffix('.' + format_name))], check=True)
