"""Compile each independent example and compare its expected output (Python 3.8+)."""
from pathlib import Path
import argparse
import json
import os
import shutil
import subprocess
import sys

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--compiler", default=shutil.which("g++"))
    args = parser.parse_args()
    if not args.compiler:
        parser.error("g++ not found; install/configure it or pass --compiler PATH")
    root = Path(__file__).resolve().parent
    build = root / ".build"
    build.mkdir(exist_ok=True)
    expected = json.loads((root / "expected_outputs.json").read_text(encoding="utf-8"))
    env = os.environ.copy()
    if os.name == "nt":
        env.update({"TMP": ".", "TEMP": ".", "TMPDIR": "."})
    for filename, output in expected.items():
        shutil.copyfile(root / "examples" / filename, build / filename)
        name = Path(filename).stem + (".exe" if os.name == "nt" else "")
        command = [args.compiler, "-std=c++17", "-Wall", "-Wextra", "-Wpedantic",
                   "-Werror", "-O2", "-g", "-pthread", "-save-temps=obj", filename, "-o", name]
        result = subprocess.run(command, cwd=build, env=env, capture_output=True,
                                text=True, encoding="utf-8", errors="replace", timeout=90)
        if result.returncode:
            print("COMPILE FAILED:", filename, "\n", result.stderr)
            return 1
        result = subprocess.run([str(build / name)], cwd=build, capture_output=True,
                                text=True, encoding="utf-8", errors="replace", timeout=10)
        if result.returncode != 0 or result.stdout != output:
            print("RUN FAILED:", filename, "\nactual:", repr(result.stdout),
                  "\nexpected:", repr(output), "\nstderr:", result.stderr)
            return 1
        print("PASS", filename, flush=True)
    print("All 23 examples passed.")
    return 0

if __name__ == "__main__":
    sys.exit(main())
