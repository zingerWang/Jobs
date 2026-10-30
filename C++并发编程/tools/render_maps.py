"""Regenerate Graphviz PNGs without requiring Python packages."""
from pathlib import Path
import argparse, concurrent.futures, subprocess
parser=argparse.ArgumentParser()
parser.add_argument('--dot',default='dot')
parser.add_argument('--jobs',type=int,default=2)
args=parser.parse_args()
root=Path(__file__).resolve().parent.parent
def render(source):
    result=subprocess.run([args.dot,'-Tpng','-Gdpi=200',str(source),'-o',str(source.with_suffix('.png'))],capture_output=True,text=True,encoding='utf-8',errors='replace',timeout=60)
    return source.name,result.returncode,result.stderr
with concurrent.futures.ThreadPoolExecutor(max_workers=args.jobs) as pool:
    results=list(pool.map(render,sorted((root/'images').glob('*.dot'))))
for name,code,error in results:
    if code or error: print(name,code,error)
print(f'{sum(code==0 for _,code,_ in results)}/{len(results)} rendered')
raise SystemExit(any(code for _,code,_ in results))
