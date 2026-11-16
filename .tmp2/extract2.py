import re, os
B = r"C:\Users\孟悦\Desktop\Job\.tmp2"
doc = open(r"C:\Users\孟悦\Desktop\Job\C++新特性\content.md", encoding="utf-8").read()
# 逐个 cpp 块：按 "// 文件名：xxx.cpp" 命名
blocks = re.findall(r"```cpp\n(.*?)```", doc, re.S)
for b in blocks:
    m = re.search(r"文件名[：:]\s*([A-Za-z0-9_]+\.cpp)", b)
    name = m.group(1) if m else f"anon{len(os.listdir(B))}.cpp"
    open(os.path.join(B, name), "w", encoding="utf-8", newline="\n").write(b)
    print("cpp ->", name)
# text 块：紧跟在“实测输出”之后的第一个 ```text
for m in re.finditer(r"\*\*实测输出\*\*[^\n]*\n\n```text\n(.*?)```", doc, re.S):
    pass
outs = re.findall(r"\*\*实测输出\*\*[^\n]*\n\n```text\n(.*?)```", doc, re.S)
print("输出块数:", len(outs))
names = ["move","auto","smart","structured","variadic","constexpr","concepts","modern23","threads","probe"]
