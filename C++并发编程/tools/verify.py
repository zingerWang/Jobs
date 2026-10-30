"""Compile and run all examples. Run from any directory with Python 3.9+."""
from pathlib import Path
import argparse, concurrent.futures, json, os, platform, subprocess, time, sys
sys.stdout.reconfigure(encoding='utf-8',errors='replace')

parser=argparse.ArgumentParser()
parser.add_argument('--compiler',default='g++')
parser.add_argument('--build-dir',default=None)
parser.add_argument('--jobs',type=int,default=2)
parser.add_argument('--timeout',type=int,default=30)
parser.add_argument('--only',type=int,nargs='*',default=None,help='Example IDs; 0=lifecycle, 47=deep protocols, 48=Linux signal handler')
args=parser.parse_args()
root=Path(__file__).resolve().parent.parent
build=Path(args.build_dir).resolve() if args.build_dir else root/'build'
build.mkdir(parents=True,exist_ok=True)
manifest=json.loads((root/'manifest.json').read_text(encoding='utf-8'))
manifest.append(dict(n=0,std=17,source='protocol_tests.cpp'))
manifest.append(dict(n=47,std=20,source='deep_protocols.cpp'))
manifest.append(dict(n=48,std=11,source='signal_handler.cpp',platform='linux'))
if args.only is not None: manifest=[r for r in manifest if r['n'] in args.only]
env=os.environ.copy()
compiler=Path(args.compiler)
if compiler.is_absolute(): env['PATH']=str(compiler.parent)+os.pathsep+env.get('PATH','')
if os.name=='nt':
    # Keep GCC temporary paths relative: some MinGW binutils mishandle Unicode
    # absolute paths in the Windows sandbox's default temporary directory.
    env['TMPDIR']='.'
    env['TMP']='.'
    env['TEMP']='.'

def run_one(record):
    if record.get('platform')=='linux' and not sys.platform.startswith('linux'):
        return dict(n=record['n'], status='SKIP', reason='Linux/POSIX example; requires a Linux runtime')
    n=record['n']; run_dir=build/f'{n:02d}';run_dir.mkdir(exist_ok=True)
    executable=run_dir/('demo.exe' if os.name=='nt' else 'demo')
    source=os.path.relpath(root/'examples'/record.get('source',f'{n:02d}.cpp'),run_dir)
    command=[args.compiler,f'-std=c++{record["std"]}','-O2','-Wall','-Wextra','-pedantic','-pthread',source,'-o',executable.name]
    command[3:3]=record.get('compile_flags',[])
    if os.name=='nt': command.insert(1,'-save-temps=obj')
    result=dict(n=n,command=command,cwd=str(run_dir),status='FAIL')
    try:
        c=subprocess.run(command,cwd=run_dir,capture_output=True,text=True,encoding='utf-8',errors='replace',env=env,timeout=120)
        result['compile_stdout']=c.stdout;result['compile_stderr']=c.stderr;result['compile_returncode']=c.returncode
        if c.returncode==0:
            start=time.perf_counter()
            p=subprocess.run([str(executable)],cwd=run_dir,capture_output=True,text=True,encoding='utf-8',errors='replace',env=env,timeout=args.timeout)
            result.update(run_stdout=p.stdout,run_stderr=p.stderr,run_returncode=p.returncode,elapsed_seconds=time.perf_counter()-start)
            if p.returncode==0: result['status']='PASS'
    except Exception as error: result['error']=repr(error)
    return result

with concurrent.futures.ThreadPoolExecutor(max_workers=args.jobs) as pool:
    results=list(pool.map(run_one,manifest))
results.sort(key=lambda r:r['n'])
version=subprocess.run([args.compiler,'--version'],capture_output=True,text=True,env=env).stdout.splitlines()[0]
report={'platform':platform.platform(),'compiler':version,'results':results}
(build/'results.json').write_text(json.dumps(report,ensure_ascii=False,indent=2),encoding='utf-8')
for r in results:
    print(f'{r["n"]:02d}: {r["status"]}',flush=True)
    if r['status']=='FAIL': print(r.get('compile_stderr','')+r.get('run_stderr','')+r.get('error',''),flush=True)
    if r['status']=='SKIP': print(r['reason'],flush=True)
print(f'{sum(r["status"]=="PASS" for r in results)} passed; {sum(r["status"]=="SKIP" for r in results)} skipped; {sum(r["status"]=="FAIL" for r in results)} failed; {len(results)} total')
raise SystemExit(any(r['status']=='FAIL' for r in results))
