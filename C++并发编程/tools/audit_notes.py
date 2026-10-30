"""Check note structure, local links, embedded examples, and diagram artifacts."""
from pathlib import Path
import json
import re
import struct
from urllib.parse import unquote

root = Path(__file__).resolve().parent.parent
manifest = json.loads((root / 'manifest.json').read_text(encoding='utf-8'))
assert [r['n'] for r in manifest] == list(range(1, len(manifest)+1)), 'Non-contiguous article numbering'
errors, records = [], []
for item in manifest:
    path = root / item['file']
    text = path.read_text(encoding='utf-8')
    anchors = re.findall(r'<a id="([^"]+)"', text)
    if len(anchors) != len(set(anchors)):
        errors.append(f'{item["n"]}: duplicate anchors')
    prose = re.sub(r'```.*?```', '', text, flags=re.S)
    prose = re.sub(r'`[^`]+`', '', prose)
    for link in re.findall(r'\]\(([^)]+)\)', prose):
        if link.startswith(('https://', 'http://')):
            continue
        if link.startswith('#'):
            if link[1:] not in anchors:
                errors.append(f'{item["n"]}: missing anchor {link}')
        elif not (path.parent / unquote(link.split('#')[0])).exists():
            errors.append(f'{item["n"]}: missing local file {link}')
    cpp = (root / 'examples' / f'{item["n"]:02d}.cpp').read_text(encoding='utf-8').strip()
    blocks = re.findall(r'```cpp\n(.*?)\n```', text, re.S)
    if cpp not in [b.strip() for b in blocks]:
        errors.append(f'{item["n"]}: standalone cpp differs from embedded code')
    headings = re.findall(r'^## (\d+)\.', text, re.M)
    if list(map(int, headings)) != list(range(1, len(headings)+1)):
        errors.append(f'{item["n"]}: main chapter numbering is not consecutive')
    for depth in re.findall(r'^### (\d+\.\d+) (.+)$', text, re.M):
        if f'[{depth[0]} {depth[1]}]' not in text:
            errors.append(f'{item["n"]}: subsection missing from TOC {depth[0]}')
    additions = re.search(r'<!-- depth:start -->(.*?)<!-- depth:end -->', text, re.S)
    if item.get('edition')=='engineering-expansion':
        if len(text)<3500 or len(headings)<8:
            errors.append(f'{item["n"]}: incomplete engineering article')
    elif not additions or len(additions[1]) < 900:
        errors.append(f'{item["n"]}: missing substantial depth material')
    if '```text' not in text or '思维导图总结' not in text:
        errors.append(f'{item["n"]}: missing text tree')
    dot = root / 'images' / f'{item["n"]:02d}.dot'
    png = dot.with_suffix('.png')
    graph = dot.read_text(encoding='utf-8')
    if not all(token in graph for token in ('rankdir=LR', 'PingFang SC', 'dpi=200', 'shape=plaintext')):
        errors.append(f'{item["n"]}: diagram style mismatch')
    data = png.read_bytes()
    if data[:8] != b'\x89PNG\r\n\x1a\n':
        errors.append(f'{item["n"]}: invalid PNG')
    width, height = struct.unpack('>II', data[16:24])
    records.append(dict(n=item['n'], characters=len(text),
                        depth_characters=len(additions[1]) if additions else 0,
                        depth_subsections=len(re.findall(r'<a id="depth-', text)),
                        png_width=width, png_height=height))
output = root / 'build/depth-revision'
output.mkdir(parents=True, exist_ok=True)
(output / 'audit.json').write_text(json.dumps(dict(errors=errors, records=records), ensure_ascii=False, indent=2), encoding='utf-8')
print(f'Articles={len(records)}; depth sections={sum(r["depth_subsections"] for r in records)}; depth characters={sum(r["depth_characters"] for r in records)}; errors={len(errors)}')
for error in errors:
    print(error)
raise SystemExit(bool(errors))
