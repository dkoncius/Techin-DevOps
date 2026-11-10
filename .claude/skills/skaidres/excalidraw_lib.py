"""Schema (tekstinis aprašas) -> (1) redaguojamas .excalidraw JSON, (2) rankų pieštas SVG skaidrei.

Aprašas (eilutė = elementas; `|` skiria laukus; koordinatės stulpelis,eilutė gali būti trupmeninės):
  file: kelias                           (neprivaloma: .excalidraw failo vardas)
  box id | 💻 Kodas | 0,0 | blue          (spalvos: blue green pink yellow purple orange teal gray)
  box id | Du\\neilutės | 1,0 | green | 1.3,1   (neprivalomi: plotis ir aukštis langeliais)
  arrow a -> b | užrašas                  (užrašas neprivalomas)
  note 🔁 kartojasi | 1.5,2              (laisvas užrašas)
SVG yra mūsų piešinys „Excalidraw stiliumi“, o ne oficialus Excalidraw eksportas; .excalidraw atsidaro Excalidraw ir redaguojamas.
"""
import html
import json
import math
import random
import uuid

CELL_W, CELL_H, BOX_W, BOX_H = 300, 190, 240, 100
PALETTE = {  # (linija, užpildas): kaip numatytosios Excalidraw spalvos
    "blue": ("#1971c2", "#a5d8ff"), "green": ("#2f9e44", "#b2f2bb"), "pink": ("#c2255c", "#fcc2d7"),
    "yellow": ("#e67700", "#ffec99"), "purple": ("#6741d9", "#d0bfff"), "orange": ("#e8590c", "#ffd8a8"),
    "teal": ("#099268", "#96f2d7"), "gray": ("#495057", "#dee2e6"),
}
INK = "#1e1e1e"
FONT = "'Patrick Hand','Kalam','Comic Sans MS',cursive"


def parse(spec):
    boxes, arrows, notes, meta = {}, [], [], {}
    for raw in spec.strip().splitlines():
        line = raw.strip()
        if not line or line.startswith("#"):
            continue
        if line.startswith("file:"):
            meta["file"] = line.split(":", 1)[1].strip()
        elif line.startswith("box "):
            p = [x.strip() for x in line[4:].split("|")]
            col, row = [float(v) for v in p[2].split(",")]
            w, h = (1.0, 1.0)
            if len(p) > 4 and p[4]:
                w, h = [float(v) for v in p[4].split(",")]
            boxes[p[0]] = dict(id=p[0], label=clean(p[1].replace("\\n", "\n")), col=col, row=row,
                               color=p[3] if len(p) > 3 and p[3] in PALETTE else "blue", w=w, h=h)
        elif line.startswith("arrow "):
            body, _, lbl = line[6:].partition("|")
            a, _, b = body.partition("->")
            arrows.append(dict(a=a.strip(), b=b.strip(), label=lbl.strip()))
        elif line.startswith("note "):
            p = [x.strip() for x in line[5:].split("|")]
            col, row = [float(v) for v in p[1].split(",")]
            notes.append(dict(text=clean(p[0]), col=col, row=row))
        else:
            raise ValueError(f"Nežinoma schemos eilutė: {line}")
    for a in arrows:
        for k in ("a", "b"):
            if a[k] not in boxes:
                raise ValueError(f"Rodyklė mini nežinomą langelį „{a[k]}“")
    return boxes, arrows, notes, meta


def geom(b):
    bw = BOX_W + (b["w"] - 1) * CELL_W
    bh = BOX_H + (b["h"] - 1) * CELL_H
    x = b["col"] * CELL_W
    y = b["row"] * CELL_H
    return x, y, bw, bh


def edge_point(b, tx, ty):
    x, y, w, h = geom(b)
    cx, cy = x + w / 2, y + h / 2
    dx, dy = tx - cx, ty - cy
    if dx == 0 and dy == 0:
        return cx, cy
    sx = (w / 2) / abs(dx) if dx else float("inf")
    sy = (h / 2) / abs(dy) if dy else float("inf")
    s = min(sx, sy)
    return cx + dx * s, cy + dy * s


import re as _re
_EMOJI = _re.compile("[\U0001F000-\U0001FAFF\u2300-\u23FF\u2600-\u27BF\u2B00-\u2BFF\uFE0F\u200D]+")


def clean(text):
    return _EMOJI.sub("", text).replace("  ", " ").strip()


def wrap(text, limit=17):
    out = []
    for part in text.split("\n"):
        words, cur = part.split(" "), ""
        for w in words:
            if cur and len(cur) + 1 + len(w) > limit:
                out.append(cur)
                cur = w
            else:
                cur = f"{cur} {w}".strip()
        out.append(cur)
    return out


# ---------- SVG ----------
def sketch_svg(spec):
    boxes, arrows, notes, _ = parse(spec)
    rnd = random.Random(7)
    j = lambda a=2.6: rnd.uniform(-a, a)  # noqa: E731
    parts, defs = [], []
    minx = miny = 1e9
    maxx = maxy = -1e9

    def upd(x, y):
        nonlocal minx, miny, maxx, maxy
        minx, miny, maxx, maxy = min(minx, x), min(miny, y), max(maxx, x), max(maxy, y)

    for n, b in enumerate(boxes.values()):
        stroke, fill = PALETTE[b["color"]]
        x, y, w, h = geom(b)
        upd(x - 8, y - 8); upd(x + w + 8, y + h + 8)
        cid = f"c{n}"
        defs.append(f'<clipPath id="{cid}"><rect x="{x}" y="{y}" width="{w}" height="{h}" rx="16"/></clipPath>')
        hatch = "".join(f'<line x1="{x + i - h}" y1="{y + h}" x2="{x + i}" y2="{y}"/>' for i in range(0, int(w + h), 14))
        parts.append(f'<rect x="{x}" y="{y}" width="{w}" height="{h}" rx="16" fill="{fill}" fill-opacity=".55"/>')
        parts.append(f'<g clip-path="url(#{cid})" stroke="{stroke}" stroke-opacity=".28" stroke-width="2">{hatch}</g>')
        for _ in range(2):
            pts = [(x + j(), y + j()), (x + w * .5 + j(), y + j(1.6)), (x + w + j(), y + j()),
                   (x + w + j(1.6), y + h * .5 + j(1.6)), (x + w + j(), y + h + j()),
                   (x + w * .5 + j(), y + h + j(1.6)), (x + j(), y + h + j()), (x + j(1.6), y + h * .5 + j(1.6))]
            d = f"M{pts[0][0]:.1f},{pts[0][1]:.1f} " + " ".join(f"L{px:.1f},{py:.1f}" for px, py in pts[1:]) + " Z"
            parts.append(f'<path d="{d}" fill="none" stroke="{stroke}" stroke-width="3.2" stroke-linejoin="round" stroke-linecap="round"/>')
        lines = wrap(b["label"])
        fs = 30 if len(lines) <= 2 else 24
        y0 = y + h / 2 - (len(lines) - 1) * fs * .6 + fs * .33
        for k, ln in enumerate(lines):
            parts.append(f'<text x="{x + w / 2}" y="{y0 + k * fs * 1.2:.1f}" text-anchor="middle" font-size="{fs}" fill="#1e1e1e" font-family="{FONT}" font-weight="700">{html.escape(ln)}</text>')

    for a in arrows:
        A, B = boxes[a["a"]], boxes[a["b"]]
        ax, ay, aw, ah = geom(A); bx, by, bw, bh = geom(B)
        acx, acy, bcx, bcy = ax + aw / 2, ay + ah / 2, bx + bw / 2, by + bh / 2
        sx, sy = edge_point(A, bcx, bcy)
        ex, ey = edge_point(B, acx, acy)
        ang = math.atan2(ey - sy, ex - sx)
        sx, sy, ex, ey = sx + math.cos(ang) * 6, sy + math.sin(ang) * 6, ex - math.cos(ang) * 8, ey - math.sin(ang) * 8
        mx, my = (sx + ex) / 2 + j(5) - math.sin(ang) * 10, (sy + ey) / 2 + j(5) + math.cos(ang) * 10
        parts.append(f'<path d="M{sx:.1f},{sy:.1f} Q{mx:.1f},{my:.1f} {ex:.1f},{ey:.1f}" fill="none" stroke="{INK}" stroke-width="3.4" stroke-linecap="round"/>')
        for da in (0.45, -0.45):
            hx, hy = ex - 20 * math.cos(ang + da), ey - 20 * math.sin(ang + da)
            parts.append(f'<line x1="{ex:.1f}" y1="{ey:.1f}" x2="{hx:.1f}" y2="{hy:.1f}" stroke="{INK}" stroke-width="3.4" stroke-linecap="round"/>')
        upd(sx, sy); upd(ex, ey)
        if a["label"]:
            lx, ly = (sx + ex) / 2 - math.sin(ang) * 26, (sy + ey) / 2 + math.cos(ang) * 26
            upd(lx - 70, ly - 20); upd(lx + 70, ly + 10)
            parts.append(f'<text x="{lx:.1f}" y="{ly:.1f}" text-anchor="middle" font-size="22" fill="#c2410c" font-family="{FONT}">{html.escape(a["label"])}</text>')

    for t in notes:
        x, y = t["col"] * CELL_W, t["row"] * CELL_H
        upd(x - 120, y - 24); upd(x + 120, y + 14)
        parts.append(f'<text x="{x}" y="{y}" text-anchor="middle" font-size="26" fill="#c2410c" font-family="{FONT}">{html.escape(t["text"])}</text>')

    pad = 24
    vb = f"{minx - pad:.0f} {miny - pad:.0f} {maxx - minx + 2 * pad:.0f} {maxy - miny + 2 * pad:.0f}"
    return f'<svg class="sketch" viewBox="{vb}" xmlns="http://www.w3.org/2000/svg" role="img"><defs>{"".join(defs)}</defs>{"".join(parts)}</svg>'


# ---------- .excalidraw ----------
def _id():
    return uuid.uuid4().hex[:16]


def _base(t, x, y, w, h, stroke, bg, fill="solid", seed=1, rounded=None):
    return {"id": _id(), "type": t, "x": x, "y": y, "width": w, "height": h, "angle": 0, "strokeColor": stroke,
            "backgroundColor": bg, "fillStyle": fill, "strokeWidth": 2, "strokeStyle": "solid", "roughness": 1,
            "opacity": 100, "groupIds": [], "frameId": None, "roundness": rounded, "seed": seed, "version": 1,
            "versionNonce": seed + 1, "isDeleted": False, "boundElements": [], "updated": 1, "link": None, "locked": False}


def _text(txt, x, y, w, h, size, color, container=None, align="center"):
    e = _base("text", x, y, w, h, color, "transparent", "hachure", rounded=None)
    e.update({"fontSize": size, "fontFamily": 1, "text": txt, "textAlign": align,
              "verticalAlign": "middle" if container else "top", "containerId": container, "originalText": txt,
              "autoResize": True, "lineHeight": 1.25})
    return e


def excalidraw_json(spec):
    boxes, arrows, notes, _ = parse(spec)
    els, ids = [], {}
    seed = 100
    for b in boxes.values():
        stroke, fill = PALETTE[b["color"]]
        x, y, w, h = geom(b)
        seed += 2
        r = _base("rectangle", x, y, w, h, stroke, fill, "hachure", seed, {"type": 3})
        txt = "\n".join(wrap(b["label"]))
        t = _text(txt, x + 10, y + h / 2 - 20, w - 20, 40, 28, "#1e1e1e", container=r["id"])
        r["boundElements"] = [{"type": "text", "id": t["id"]}]
        ids[b["id"]] = r
        els += [r, t]
    for a in arrows:
        A, B = ids[a["a"]], ids[a["b"]]
        acx, acy = A["x"] + A["width"] / 2, A["y"] + A["height"] / 2
        bcx, bcy = B["x"] + B["width"] / 2, B["y"] + B["height"] / 2
        sx, sy = edge_point(boxes[a["a"]], bcx, bcy)
        ex, ey = edge_point(boxes[a["b"]], acx, acy)
        seed += 2
        ar = _base("arrow", sx, sy, ex - sx, ey - sy, INK, "transparent", "solid", seed, {"type": 2})
        ar.update({"points": [[0, 0], [ex - sx, ey - sy]], "lastCommittedPoint": None,
                   "startBinding": {"elementId": A["id"], "focus": 0, "gap": 4},
                   "endBinding": {"elementId": B["id"], "focus": 0, "gap": 4},
                   "startArrowhead": None, "endArrowhead": "arrow"})
        A["boundElements"].append({"type": "arrow", "id": ar["id"]})
        B["boundElements"].append({"type": "arrow", "id": ar["id"]})
        els.append(ar)
        if a["label"]:
            els.append(_text(a["label"], (sx + ex) / 2 - 70, (sy + ey) / 2 - 36, 140, 25, 20, "#c2410c"))
    for t in notes:
        els.append(_text(t["text"], t["col"] * CELL_W - 120, t["row"] * CELL_H - 14, 240, 30, 24, "#c2410c"))
    return {"type": "excalidraw", "version": 2, "source": "https://excalidraw.com", "elements": els,
            "appState": {"viewBackgroundColor": "#121212", "currentItemStrokeColor": "#d3d3d3",
                         "currentItemBackgroundColor": "transparent", "currentItemFillStyle": "hachure",
                         "currentItemRoughness": 1, "gridSize": None}, "files": {}}


def write_excalidraw(spec, path):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(excalidraw_json(spec), indent=2, ensure_ascii=False), encoding="utf-8")
