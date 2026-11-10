#!/usr/bin/env python3
"""skaidres.md -> savarankiškas skaidres.html (be diegimo, atidaroma naršyklėje).

Naudojimas: python3 -I build_deck.py "kursas/05 Tinklų pagrindai/skaidres.md"
Rezultatas: tas pats aplankas, failas skaidres.html. Sintaksė: žr. SKILL.md.
"""
import base64
import html
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from illustrations import ILLUSTRATIONS  # noqa: E402
import excalidraw_lib  # noqa: E402

OUT_DIR = Path(".")

HERE = Path(__file__).resolve().parent
EYEBROWS = {
    "titulinė": "", "pagalvokime": "Pagalvokime", "demonstracija": "Demonstracija",
    "jusu-eile": "Jūsų eilė", "schema": "Schema", "komanda": "Komandos",
    "uzduotys": "Užduotys", "uzduotis": "Užduotis",
    "klaida": "Dažna klaida", "santrauka": "Santrauka", "kita": "Kita pamoka", "tekstas": "Svarbu",
}
CENTER = {"titulinė", "pagalvokime", "kita"}
MAX_SLIDES = 14
MERMAID = "https://cdn.jsdelivr.net/npm/mermaid@11.4.1/dist/mermaid.min.js"
FONTS = ("https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;700&"
         "family=JetBrains+Mono:wght@400;700&family=Patrick+Hand&family=Fraunces:wght@600;700&display=swap")


def inline(text):
    t = html.escape(text, quote=False)
    t = re.sub(r"`([^`]+)`", r"<code>\1</code>", t)
    t = re.sub(r"\*\*([^*]+)\*\*", r"<strong>\1</strong>", t)
    t = re.sub(r"\[([^\]]+)\]\((https?://[^)\s]+)\)", r'<a href="\2" target="_blank" rel="noopener">\1</a>', t)
    return t


def split_emoji(text):
    t = text.strip()
    if t and not t[0].isalnum() and ord(t[0]) > 0x2000:
        head, _, rest = t.partition(" ")
        return head, rest.strip()
    return "", t


def parse_table(rows, step):
    cells = [[c.strip() for c in r.strip().strip("|").split("|")] for r in rows]
    head, body = cells[0], [r for r in cells[2:]] if len(cells) > 1 else []
    out = ["<table><thead><tr>" + "".join(f"<th>{inline(c)}</th>" for c in head) + "</tr></thead><tbody>"]
    for row in body:
        if any(c.startswith("?") for c in row):
            has_answer = any(c.startswith("?") and c[1:].strip() for c in row)
            if has_answer:
                step += 1
            tds = []
            for c in row:
                if c.startswith("?"):
                    txt = c[1:].strip()
                    inner = '<span class="ph">?</span>'
                    if txt:
                        inner += f'<span class="reveal ans" data-step="{step}">{inline(txt)}</span>'
                    tds.append(f'<td class="ans-cell"><span class="cell">{inner}</span></td>')
                else:
                    tds.append(f"<td>{inline(c)}</td>")
            out.append("<tr>" + "".join(tds) + "</tr>")
        else:
            out.append("<tr>" + "".join(f"<td>{inline(c)}</td>" for c in row) + "</tr>")
    out.append("</tbody></table>")
    return "".join(out), step


def parse_slide(kind, title, lines, warnings, idx, deco=""):
    body, notes, step, uses_mermaid = [], [], 0, False
    art_svg = ""
    lead_cls = ' class="lead"' if kind in CENTER or kind == "pagalvokime" else ""
    eyebrow_txt = EYEBROWS[kind]
    i, n = 0, len(lines)
    para = []

    def flush():
        nonlocal para
        if para:
            text = " ".join(para)
            if kind == "titulinė" and not eyebrow_txt_holder:
                eyebrow_txt_holder.append(text)
            else:
                body.append(f"<p{lead_cls}>{inline(text)}</p>")
            para = []

    eyebrow_txt_holder = []
    while i < n:
        line = lines[i]
        s = line.strip()
        if not s:
            flush(); i += 1
        elif s.startswith("```"):
            flush()
            info = s[3:].strip()
            reveal = info.endswith("+")
            lang = info.rstrip("+")
            i += 1
            code = []
            while i < n and not lines[i].strip().startswith("```"):
                code.append(lines[i]); i += 1
            i += 1
            src = html.escape("\n".join(code), quote=False)
            if lang == "excalidraw":
                spec = "\n".join(code)
                meta = excalidraw_lib.parse(spec)[3]
                slug = meta.get("file") or f"skaidre-{idx}"
                excalidraw_lib.write_excalidraw(spec, OUT_DIR / "diagramos" / f"{slug}.excalidraw")
                body.append(f'<div class="sketch-wrap">{excalidraw_lib.sketch_svg(spec)}</div>')
            elif lang == "mermaid":
                uses_mermaid = True
                body.append(f'<pre class="mermaid">{src}</pre>')
            else:
                if reveal:
                    step += 1
                is_out = lang == "output"
                label = "pavyzdinė išvestis" if is_out else (lang or "terminalas")
                tcls = "term" + (" term--out" if is_out else "") + (" reveal" if reveal else "")
                tattr = f' data-step="{step}"' if reveal else ""
                body.append(f'<div class="{tcls}"{tattr}><div class="term__bar"><i></i><i></i><i></i>'
                            f'<span>{html.escape(label)}</span></div><pre><code>{src}</code></pre></div>')
        elif s.startswith("|"):
            flush()
            rows = []
            while i < n and lines[i].strip().startswith("|"):
                rows.append(lines[i]); i += 1
            t, step = parse_table(rows, step)
            body.append(t)
        elif s.startswith("Pastaba:"):
            flush(); notes.append(s[len("Pastaba:"):].strip()); i += 1
        elif s.startswith("# "):
            flush(); body.append(f'<p class="big">{inline(s[2:])}</p>'); i += 1
        elif s.startswith((":: ", "+:: ")):
            flush()
            cards = []
            while i < n and lines[i].strip().startswith((":: ", "+:: ")):
                ln = lines[i].strip()
                reveal = ln.startswith("+")
                parts = [x.strip() for x in ln.lstrip("+").lstrip(":").strip().split("|")]
                icon = parts[0] if len(parts) > 1 else ""
                title_c = parts[1] if len(parts) > 1 else parts[0]
                text_c = parts[2] if len(parts) > 2 else ""
                cls, attr = "card", ""
                if reveal:
                    step += 1
                    cls, attr = "card reveal", f' data-step="{step}"'
                cards.append(f'<div class="{cls}"{attr}><div class="card__icon">{html.escape(icon)}</div>'
                             f'<p class="card__title">{inline(title_c)}</p><p class="card__text">{inline(text_c)}</p></div>')
                i += 1
            body.append('<div class="cards">' + "".join(cards) + "</div>")
        elif s.startswith(">>"):
            flush()
            reveal = s.startswith(">>+")
            chips = []
            for it in [x.strip() for x in s.lstrip(">+").split("|")]:
                icon, label = split_emoji(it)
                cls, attr = "chip", ""
                if reveal:
                    step += 1
                    cls, attr = "chip reveal", f' data-step="{step}"'
                chips.append(f'<div class="{cls}"{attr}><span class="chip__icon">{html.escape(icon)}</span>'
                             f'<span class="chip__label">{inline(label)}</span></div>')
            body.append('<div class="flow">' + "".join(chips) + "</div>")
            i += 1
        elif s.startswith(("> ", "+> ")):
            flush()
            reveal = s.startswith("+")
            icon, txt = split_emoji(s.lstrip("+").lstrip(">").strip())
            cls, attr = "bubble", ""
            if reveal:
                step += 1
                cls, attr = "bubble reveal", f' data-step="{step}"'
            body.append(f'<div class="{cls}"{attr}><span class="bubble__icon">{html.escape(icon or "💬")}</span>'
                        f'<div class="bubble__body"><span class="bubble__label">Analogija</span><p>{inline(txt)}</p></div></div>')
            i += 1
        elif s.startswith("@nuotrauka:"):
            flush()
            img = OUT_DIR / s.split(":", 1)[1].strip()
            if img.exists():
                b64 = base64.b64encode(img.read_bytes()).decode()
                art_svg = f'<img class="photo" alt="" src="data:image/jpeg;base64,{b64}">'
            else:
                warnings.append(f"skaidrė {idx}: nerastas paveikslėlis {img.name}")
            i += 1
        elif s.startswith("@iliustracija:"):
            flush()
            art = s.split(":", 1)[1].strip().lower()
            if art in ILLUSTRATIONS:
                art_svg = ILLUSTRATIONS[art]
            else:
                warnings.append(f"skaidrė {idx}: nėra iliustracijos „{art}“ (yra: {', '.join(sorted(set(ILLUSTRATIONS)))})")
            i += 1
        elif s.startswith("+ "):
            flush(); step += 1
            body.append(f'<p class="reveal" data-step="{step}">{inline(s[2:])}</p>'); i += 1
        elif re.match(r"\d+\. ", s):
            flush()
            items = []
            while i < n and re.match(r"\d+\. ", lines[i].strip()):
                li_text = re.sub(r"^\d+\. ", "", lines[i].strip())
                items.append(f"<li>{inline(li_text)}</li>"); i += 1
            body.append('<ol class="steps">' + "".join(items) + "</ol>")
        elif s.startswith("- "):
            flush()
            items = []
            while i < n and lines[i].strip().startswith("- "):
                items.append(f"<li>{inline(lines[i].strip()[2:])}</li>"); i += 1
            body.append("<ul>" + "".join(items) + "</ul>")
        else:
            para.append(s); i += 1
    flush()
    if eyebrow_txt_holder:
        eyebrow_txt = eyebrow_txt_holder[0]
    if kind not in ("titulinė", "pagalvokime", "kita", "tekstas", "santrauka") and not title:
        warnings.append(f"skaidrė {idx}: nėra antraštės")
    head = ""
    m_num = re.match(r"(\d+)", eyebrow_txt) if kind == "titulinė" else None
    if m_num:
        head += f'<div class="deco">{m_num.group(1)}</div>'
    if eyebrow_txt:
        head += f'<p class="eyebrow">{inline(eyebrow_txt)}</p>'
    if title:
        head += (f'<h1 class="title-main">{inline(title)}</h1>' if kind == "titulinė"
                 else f'<h2 class="title">{inline(title)}</h2>')
    cls = f"slide slide--{kind}" + (" slide--center" if kind in CENTER else "")
    note_attr = html.escape(" ".join(notes), quote=True)
    content = "".join(body)
    if art_svg:
        content = f'<div class="split"><div class="split__text">{content}</div><div class="split__art">{art_svg}</div></div>'
    sect = f'<section class="{cls}" data-i="{idx}" data-notes="{note_attr}">{head}{content}</section>'
    return sect, step, uses_mermaid


def read_tasks(pamoka: Path):
    """Užduotys iš pamoka.md skyriaus „Užduotys“: [(numeris, pavadinimas, tikslas, [žingsniai])]."""
    if not pamoka.exists():
        raise SystemExit(f"Nerastas {pamoka}: reikalingas @uzduotys")
    text = pamoka.read_text(encoding="utf-8")
    m = re.search(r"(?ms)^## Užduotys\s*\n(.*?)(?=^## )", text)
    if not m:
        raise SystemExit("pamoka.md neturi skyriaus „## Užduotys“")
    tasks = []
    for blk in re.split(r"(?m)^### ", m.group(1))[1:]:
        head, _, rest = blk.partition("\n")
        num = re.match(r"(\d)", head)
        title = head.split(" ", 1)[1].strip() if " " in head else head.strip()
        goal, steps = "", []
        for ln in rest.split("\n"):
            mm = re.match(r"\d+\. (.*)", ln)
            if not mm:
                continue
            t = mm.group(1).strip()
            g = re.match(r"\*\*Tikslas:\*\*\s*(.*)", t)
            if g:
                goal = g.group(1)
            elif t.startswith("**Papildomai:**"):
                steps.append("⭐ " + t.replace("**Papildomai:**", "**Papildomai:**", 1))
            else:
                steps.append(t)
        tasks.append((num.group(1) if num else str(len(tasks) + 1), title, goal, steps))
    return tasks


def expand_tasks(pamoka: Path, notes_line: str):
    tasks = read_tasks(pamoka)
    nums = ["1️⃣", "2️⃣", "3️⃣", "4️⃣", "5️⃣", "6️⃣", "7️⃣", "8️⃣", "9️⃣"]
    over = ["Užduotis skelbiu po vieną Teams'e: pirma parodau gyvai, tada darote jūs.", ""]
    for n_, title, goal, steps in tasks:
        over.append(f":: | {n_} užduotis: {title} | {goal}")
    over += ["", "Žingsniai ir komandos (įstrigus) yra Teams žinutėje prie užduoties. Jei kas neveikia: perskaitykite klaidą, ieškokite dokumentacijoje arba klauskite LLM.",
             notes_line]
    out = [("uzduotys", "Užduotys", "\n".join(over))]
    for n_, title, goal, steps in tasks:
        body = [goal, ""] + [f"{k}. {st}" for k, st in enumerate(steps, 1)]
        body.append(f"Pastaba: Komandos šiai užduočiai: pamoka.md → „Komandos“, skyrius {n_}.")
        out.append(("uzduotis", f"{n_} užduotis: {title}", "\n".join(body)))
    return out


def split_sections(text):
    """Skaido pagal `=== tipas | ...` eilutes, ignoruodamas kodo blokų vidų."""
    parts, cur, infence = [], [], False
    for line in text.split("\n"):
        if line.lstrip().startswith("```"):
            infence = not infence
        m = re.match(r"^=== +(\S.*)$", line)
        if m and not infence:
            parts.append("\n".join(cur)); parts.append(m.group(1)); cur = []
        else:
            cur.append(line)
    parts.append("\n".join(cur))
    return parts


def build(src: Path):
    global OUT_DIR
    OUT_DIR = src.parent
    text = src.read_text(encoding="utf-8")
    parts = split_sections(text)
    sections, warnings, steps_total, mermaid, title = [], [], 0, False, src.parent.name
    task_slides = 0
    for k in range(1, len(parts), 2):
        header = parts[k].strip()
        hp = [x.strip() for x in header.split("|")]
        kind = hp[0].lower()
        ttl = hp[1] if len(hp) > 1 else ""
        deco = hp[2] if len(hp) > 2 else ""
        if kind not in EYEBROWS:
            raise SystemExit(f"Nežinomas skaidrės tipas „{kind}“. Galimi: {', '.join(EYEBROWS)}")
        body_text = parts[k + 1]
        if "@uzduotys:" in body_text:
            extra = [l for l in body_text.split("\n") if l.strip().startswith("Pastaba:")]
            for kd, tt, bd in expand_tasks(src.parent / "pamoka.md", extra[0] if extra else "Pastaba: Skelbkite užduotis po vieną."):
                idx = len(sections) + 1
                s, st, m = parse_slide(kd, tt, bd.split("\n"), warnings, idx, "")
                sections.append(s); steps_total += st; task_slides += 1
            continue
        idx = len(sections) + 1
        if kind == "titulinė" and idx == 1 and ttl:
            title = ttl
        s, st, m = parse_slide(kind, ttl, body_text.split("\n"), warnings, idx, deco)
        sections.append(s); steps_total += st; mermaid = mermaid or m
    if not sections:
        raise SystemExit("Nėra nė vienos skaidrės (eilutė „=== tipas | antraštė“).")
    if len(sections) - task_slides > MAX_SLIDES:
        warnings.append(f"{len(sections) - task_slides} skaidrių (be užduočių) (rekomenduojama iki {MAX_SLIDES})")
    css = (HERE / "deck.css").read_text(encoding="utf-8")
    js = (HERE / "deck.js").read_text(encoding="utf-8")
    doc = f"""<!doctype html>
<html lang="lt"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>{html.escape(title)}</title>
<link rel="stylesheet" href="{FONTS}">
<style>{css}</style></head><body>
{chr(10).join(sections)}
<div class="bar"></div><div class="counter"></div>
<div class="hint">← → arba tarpas · N pastabos · F visas ekranas</div><div class="notes"></div>
{f'<script src="{MERMAID}"></script>' if mermaid else ''}
<script>{js}</script></body></html>
"""
    out = src.with_name("skaidres.html" if src.stem == "skaidres" else src.stem + ".html")
    out.write_text(doc, encoding="utf-8")
    print(f"{out}: {len(sections)} skaidrių (iš jų užduočių {task_slides}), {steps_total} atskleidimo žingsnių, mermaid: {'taip' if mermaid else 'ne'}")
    for w in warnings:
        print("ĮSPĖJIMAS:", w)


if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit(__doc__)
    build(Path(sys.argv[1]))
