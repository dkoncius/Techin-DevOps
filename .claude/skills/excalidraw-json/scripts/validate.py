"""Check .excalidraw files against the repo format (see ../reference.md).

Usage: python .claude/skills/excalidraw-json/scripts/validate.py FILE [FILE ...]
Exits 1 if any file has problems.
"""

import json
import re
import sys

TOP_KEYS = {"type", "version", "source", "elements", "appState", "files"}
THEMES = {"#121212", "#eaf4fd", "#ffffff"}  # IA sketch, lesson, mind map
COMMON = ["id", "type", "x", "y", "width", "height", "angle", "strokeColor", "backgroundColor",
          "fillStyle", "strokeWidth", "strokeStyle", "roughness", "opacity", "groupIds", "frameId",
          "roundness", "seed", "version", "versionNonce", "isDeleted", "boundElements", "updated",
          "link", "locked"]
TEXT = ["fontSize", "fontFamily", "text", "textAlign", "verticalAlign", "containerId",
        "originalText", "autoResize", "lineHeight"]
LINEAR = ["points", "lastCommittedPoint", "startBinding", "endBinding", "startArrowhead", "endArrowhead"]
TYPES = {"text", "rectangle", "ellipse", "arrow", "line", "diamond"}
HEX16 = re.compile(r"^[0-9a-f]{16}$")


def check(path):
    problems = []
    with open(path, encoding="utf-8") as f:
        d = json.load(f)

    if set(d) != TOP_KEYS:
        problems.append(f"top-level keys {sorted(d)} != {sorted(TOP_KEYS)}")
    if d.get("type") != "excalidraw" or d.get("version") != 2 or d.get("source") != "https://excalidraw.com":
        problems.append("type/version/source must be excalidraw / 2 / https://excalidraw.com")
    app = d.get("appState", {})
    if app.get("viewBackgroundColor") not in THEMES:
        problems.append(f"viewBackgroundColor {app.get('viewBackgroundColor')} is not a repo theme {sorted(THEMES)}")
    if app.get("currentItemFillStyle") != "hachure" or app.get("currentItemRoughness") != 1:
        problems.append("appState needs currentItemFillStyle 'hachure' and currentItemRoughness 1")

    els = d.get("elements", [])
    by_id = {}
    for i, el in enumerate(els):
        where = f"element {i} ({el.get('type')})"
        if el.get("type") not in TYPES:
            problems.append(f"{where}: unknown type")
        missing = [k for k in COMMON if k not in el]
        if el.get("type") == "text":
            missing += [k for k in TEXT if k not in el]
            if el.get("fontFamily") != 1:
                problems.append(f"{where}: fontFamily must be 1 (Virgil)")
        if el.get("type") in ("arrow", "line"):
            missing += [k for k in LINEAR if k not in el]
            if not el.get("points") or el["points"][0] != [0, 0]:
                problems.append(f"{where}: points must start at [0, 0]")
        if missing:
            problems.append(f"{where}: missing {missing}")
        if not HEX16.match(str(el.get("id", ""))):
            problems.append(f"{where}: id must be 16 hex chars")
        if el.get("id") in by_id:
            problems.append(f"{where}: duplicate id {el.get('id')}")
        by_id[el.get("id")] = el
        if el.get("isDeleted") is not False:
            problems.append(f"{where}: isDeleted must be false")

    # Labels bound both ways: container lists the text, text points at the container
    for el in els:
        for b in el.get("boundElements") or []:
            t = by_id.get(b.get("id"))
            if b.get("type") == "arrow":
                if t is None or t.get("type") != "arrow":
                    problems.append(f"{el['id']}: bound arrow {b.get('id')} missing")
                continue
            if t is None or t.get("containerId") != el["id"]:
                problems.append(f"{el['id']}: bound text {b.get('id')} missing or not pointing back")
        cid = el.get("containerId")
        if cid and not any(b.get("id") == el["id"] for b in (by_id.get(cid, {}).get("boundElements") or [])):
            problems.append(f"{el['id']}: containerId {cid} does not list this text")
    return problems


def main(paths):
    bad = 0
    for p in paths:
        problems = check(p)
        if problems:
            bad += 1
            print(f"FAIL {p}")
            for line in problems:
                print(f"  - {line}")
        else:
            print(f"OK   {p}")
    return 1 if bad else 0


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(2)
    sys.exit(main(sys.argv[1:]))
