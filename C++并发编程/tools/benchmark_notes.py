"""Collect sequential runs of example 39 without inventing aggregate metrics."""
import argparse
import json
import os
from pathlib import Path
import platform
import subprocess
from datetime import datetime, timezone

parser = argparse.ArgumentParser()
parser.add_argument('--executable', required=True)
parser.add_argument('--sizes', type=int, nargs='+', default=[1000, 1000000, 10000000])
parser.add_argument('--repeats', type=int, default=3)
parser.add_argument('--output', default='build/benchmark-notes.json')
args = parser.parse_args()
if args.repeats < 1 or any(n < 1 or n > 100000000 for n in args.sizes):
    parser.error('positive repeats and sizes in [1, 100000000] required')
exe = Path(os.path.abspath(args.executable))
records = []
for n in args.sizes:
    for repeat in range(args.repeats):
        command = [str(exe), str(n)]
        result = subprocess.run(command, capture_output=True, text=True, timeout=60)
        records.append(dict(n=n, repeat=repeat, command=command,
                            returncode=result.returncode, stdout=result.stdout, stderr=result.stderr))
output = Path(args.output)
output.parent.mkdir(parents=True, exist_ok=True)
output.write_text(json.dumps(dict(utc=datetime.now(timezone.utc).isoformat(),
    platform=platform.platform(), cpu=os.environ.get('PROCESSOR_IDENTIFIER', platform.processor()),
    logical_cpus=os.cpu_count(), records=records), ensure_ascii=False, indent=2), encoding='utf-8')
print(f'{len(records)} raw runs saved; failures={sum(r["returncode"] != 0 for r in records)}')
raise SystemExit(any(r['returncode'] != 0 for r in records))
