---
name: excalidraw-json
description: >-
  Generates editable Excalidraw `.excalidraw` JSON with Python (hand-sketch dark
  theme). Use when the user wants Excalidraw diagrams, mind maps, Gantt charts,
  copy-paste into Excalidraw, or output matching ib-training/build_excalidraw.py or
  examples/ia-library-exemplar/diagrams/excalidraw/. Not for lesson-page figures:
  those are SVG from lessons/diagrams/build_lesson_diagrams.py (CLAUDE.md, Diagrams).
---

# Excalidraw JSON (repo format)

## DevOps kursas (šis repo): schemos skaidrėms

IB pavyzdžių failų (`ib-training/`, `examples/`) šiame repo nėra. DevOps kurse Excalidraw naudojamas **bendroms apžvalgoms** (kurso žemėlapis, kodo kelias, tinklų vaizdas, Git šakos, CI/CD, klasterio architektūra), o ne smulkiems paveikslėliams.

1. Schemą aprašyk skaidrių šaltinyje `kursas/NN .../skaidres.md` kodo bloku ```` ```excalidraw ```` (sintaksė: viršuje `.claude/skills/skaidres/excalidraw_lib.py`):

   ```
   file: tinklu-zemelapis
   box pc | 💻 Kompiuteris | 0,1 | blue
   box srv | 🖥️ Serveris | 1,1 | green
   arrow pc -> srv | užklausa
   note 🔁 kartojasi | 0.5,2
   ```

2. `python3 -I .claude/skills/skaidres/build_deck.py "kursas/NN .../skaidres.md"` sugeneruoja du dalykus:
   - **`kursas/NN .../diagramos/<file>.excalidraw`**: redaguojamas Excalidraw failas (Menu → Open);
   - **SVG skaidrėje**: ranka pieštas vaizdas Excalidraw stiliumi (tai mūsų piešinys, **ne oficialus Excalidraw eksportas**; jei reikia tikslaus vaizdo, atidaryk `.excalidraw` Excalidraw ir eksportuok).
3. Patikrink: `python3 .claude/skills/excalidraw-json/scripts/validate.py "kursas/NN .../diagramos/<file>.excalidraw"`.
4. Kada naudoti Excalidraw, o kada kitas: **bendram vaizdui ir procesams su keliais dalyviais** (`excalidraw`), **žingsnių keliui** (`>>+` žetonai), **vienam paaiškinimui su paveikslėliu** (`@iliustracija`).
5. Maks. ~8 langelių schemai, ≥ 1 skaidrė su schema kiekvienoje pamokoje, kur yra „bendras vaizdas“ (pvz. 01, 05, 11, 22, 33).

Žemiau likusi dalis (tema, elementų laukai) galioja ir ranka kuriant `.excalidraw`; nuorodas į `ib-training/` ignoruok.


## Canonical examples (read before generating)

| Role | Path |
|------|------|
| Minimal element shapes | `examples/ia-library-exemplar/diagrams/excalidraw/AI - Decomposition (hand).excalidraw` |
| IB training diagrams (outputs in `diagrams/`) | `ib-training/build_excalidraw.py` |
| IA sketch theme notes | `examples/ia-library-exemplar/diagrams/README.md` |

**Do not** ship `excalidraw/clipboard.json` unless the user explicitly asks. Deliver full `.excalidraw` files (same shape as the decomposition example).

## Workflow

1. **Choose style**
   - **IA hand sketch**: background `#121212`, stroke/text `#d3d3d3`, boxes `#154162` — see decomposition example.
   - **Roadmap / Gantt**: dark background; labels `#c7baf0`, grid `#705a92`, header `#ad93e7`; bars `#b35500` / `#266100` / `#6b4fbb`.
   - **Linking-questions mind map**: canvas `#a5d8ff`, boxes `#b2f2bb`, ink `#1e1e1e`, `viewBackgroundColor` `#ffffff` (`MM_*` in `build_excalidraw.py`).

2. **Implement with Python** (preferred over hand-written JSON)
   - Reuse or extend helpers in `ib-training/build_excalidraw.py`: `doc()`, `_common()`, `text()`, `rect()`, `line()` / arrows.
   - Write `json.dumps(..., indent=2, ensure_ascii=False)` to a `*.excalidraw` file.
   - Run: `python ib-training/build_excalidraw.py` (or the new script path).

3. **Validate**
   - Top-level keys exactly: `type`, `version`, `source`, `elements`, `appState`, `files`.
   - `type` = `"excalidraw"`, `version` = `2`, `source` = `"https://excalidraw.com"`.
   - `appState.viewBackgroundColor` = `#121212`; `currentItemFillStyle` = `"hachure"`; `currentItemRoughness` = `1`.
   - Each element: 16-char hex `id`, `version`/`versionNonce`, `isDeleted`: false, `fontFamily`: 1 (Virgil) for text.
   - Compare new elements to the decomposition file field-for-field per `type` (`text`, `rectangle`, `ellipse`, `arrow`, `line`).

4. **User handoff**
   - Open in Excalidraw: **Menu → Open** or select all JSON in the editor and **Ctrl+V** on the canvas.
   - Export SVG/PNG for PDFs or forums; suggest **Shift+1** to zoom to fit.

## Layout rules

- Leave generous spacing; cramped diagrams are hard to edit in Excalidraw.
- **Labeled boxes**: rectangle `boundElements` → `[{"type":"text","id":...}]`; text `containerId` → rectangle id (see `_rect()` in `examples/.../build_sketch_excalidraw.py`).
- **Arrows**: `type` `"arrow"`, `points` `[[0,0],[dx,dy]]`, `endArrowhead` `"arrow"`, `roundness` `{"type":2}`.
- **Gantt**: fixed `label_w`, `col_w`, `row_h`; tasks as `(label, start_col, end_col, color)`; draw grid with `line()` then bars with `rect()`.

## Lesson-page figures

Not Excalidraw. Figures for `lessons/docs/{lesson-id}.md` are SVG written by `lessons/diagrams/build_lesson_diagrams.py`; the rules, style and workflow are in CLAUDE.md → *Diagrams (A4 lessons)*.

## When adding a new diagram to this repo

- Put generators beside outputs (e.g. `ib-training/build_excalidraw.py`) or under `examples/.../diagrams/` next to IA sketches.
- Name files `AI - … (hand).excalidraw` or `DP CS … (hand).excalidraw` to match existing convention.
- Optional site export: `public/figures/` as SVG (user may export manually from Excalidraw).

## Additional reference

Element field checklist and minimal JSON snippets: [reference.md](reference.md)

Validation script: `python .claude/skills/excalidraw-json/scripts/validate.py path/to/file.excalidraw [more files]` (checks top-level keys, theme, element fields, ids and text bindings; exit 1 on problems).
