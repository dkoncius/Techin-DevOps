---
name: cs-slides-outline
description: Turn an IB DP Computer Science lesson page into a slide-by-slide outline (eyebrows Let's think / Demonstration / Your turn / For exam, co-fill vs practice, Learn Think first) — ready for cs-slides build.
---

# Lesson page → slide outline

Use when the teacher asks for a **slide description / outline** from a syllabus lesson (e.g. A4.2.2). Output is markdown in chat or a file — **not** HTML slides. Building decks is **`cs-slides`** (see `public/presentations/a4-2-2-deck/` for a shipped exemplar from this workflow).

## Pedagogical rhythm (default — not rigid)

Usual flow: **parodyti → paaiškinti → įtvirtinti**. **Not** “Your turn after every concept block” when the block is a **comparison table you fill in together**.

| Phase | Eyebrow on slide | On slides | In the outline |
|--------|------------------|-----------|----------------|
| **Hook** | **Let's think** | Lead + one short question (`slide--lesson-hook`) | Match **Think first** + `lesson-lead` on Learn — see **`cs-slides` §1d** |
| **Co-fill table** | **Demonstration** | Headers + row labels; **empty** `.slide-cell-empty` cells; fill together | **Never** “Your turn”; **never** pre-filled cells on outline. **Filled table** only in lesson **For teacher** |
| **Teach** | (none) | Diagram only; full static table only if too dense to co-fill | Image path; annotate live |
| **Your turn (practice)** | **Your turn** | Cards, calc, scenarios, worked example — **same slide**, reveals | List each `data-reveal-order` |
| **Exam** | **For exam** | Three-phase slide (`cs-slides` §1b) | Marks-length model answer, not teacher table verbatim |

**Co-fill uses Demonstration, not Your turn.** Do not add a separate “role of X” slide if hook + For exam already state the role (`cs-slides` §4 — A4.2.2 dropped `role` as duplicate).

**One written exam question per syllabus code.** Practise, `## From exam`, and the deck each get **one** For exam slide for the syllabus objective (`EXAM_SLIDE_BY_SYLLABUS` in `scripts/exam-slide-copy.js`). Do not outline extra `exam-practice-2` slides or second `role: "exam"` prompts on the same code (old A1.1.x consolidation questions are retired).

Do not stack many teach-only slides with no interaction at all.

## 1. Read the lesson page and extract

Before writing, pull from `lessons/docs/{lesson-id}.md` (or pasted HTML):

| What | Where it usually is | Used on |
|------|---------------------|---------|
| Syllabus code, HL/SL, statement | Title / manifest | Slide 1 eyebrow + title |
| “What to know” / key questions | Focus box at top | Three learning goals on slide 1; verify coverage at end |
| **Opening scenario** | First paragraph, “Imagine…”, everyday example | **Hook — prefer this over inventing** |
| Link to previous topic | “In A4.x.x you…” | Bridge table slide + exam trap callout |
| Core idea / role | Dedicated section | Short “explain” slide after bridge |
| Key concepts (max 2 blocks) | Main `##` sections, folds, tables | Teach + Your turn pairs |
| Diagrams (`/figures/…`, captions) | `![…](…)` | Diagram-only slide; path in outline |
| Comparison tables | “Comparing…”, “X versus Y” | **Demonstration** co-fill (empty cells on outline) + **filled copy in For teacher** — not full table on slides |
| Hook for Learn | Same scenario as slide 2 | Outline must specify **Think first** question + **lesson-lead** answer for `lessons/docs/{id}.md` if missing |
| Worked example | “Example:”, named case study | Worked example slide — **see worked-example rules below** |
| From exam + command term + marks | `## From exam` | For exam slide structure + model answer length |
| Practise hint `expectedFormat` | `scripts/seed/exercises.js` | Must align with For exam one-mark-per-point |
| Teacher model answer | `<!-- teacher-only -->` | **Do not copy verbatim** if longer than exam marks warrant |
| Exam traps | `lesson-tip`, “Exam trap”, word traps | ≥1 scenario card + For exam “Common mistakes” |

**Reference sources (private, git-ignored), if present:** `sources/ib-guide/` (authority on syllabus wording and scope), `sources/past-papers/` (how answers are marked), `sources/inthinking/{code}.md` (depth and coverage). Use them to check scope, goals, scenarios and the For exam model answer — **never copy their text** into the outline; write everything in your own words.

If the page has no scenario set, invent **6** realistic cases that test **distinctions the lesson defines**. Never invent statistics, quotes, or syllabus content not implied by the page.

## 2. Map to the fixed sequence (10–12 slides)

Default **10–11 slides** (one concept block) or **12** (two blocks). Do not exceed 12 without asking.

| # | Stage | Rule |
|---|--------|------|
| 1 | **Title** | `CODE · HL/SL · topic area`; title = syllabus statement; **3 goals** from “What to know” (reworded as student-facing outcomes). |
| 2 | **Hook** | Eyebrow **Let's think**; `slide--lesson-hook`; lead + **one short question**. Outline also: **Think first** + **lesson-lead** for Learn doc. LT note: expected answers + bridge. |
| 3 | **Bridge / contrast** | If prior topic: **Demonstration** — 2-column table (question · typical action · example), **empty cells**, ⚠ trap one line. Filled table in **For teacher**. |
| 4 | **Your turn #1** (optional) | e.g. cleaning vs selection **cards** — only if not redundant with slide 3. |
| 5 | **Diagram** | Title + image path only. |
| 6 | **Co-fill compare** | **Demonstration** — strategy rows, empty When / Cost / …; For teacher debrief. |
| 7 | **Scenarios** | **Your turn** — 6 cards, reveals on same slide. |
| 8 | **Worked example** | **Your turn** — cleaning row first if A4.2.1 chain; per-row reveals; blue answers; no syllabus refs in cells. |
| 9 | **For exam** | **For exam** — three phases; [marks]; model answer exam-length. |

Skip a dedicated **role** slide when hook + exam cover “describe the role”. Skip duplicate full tables on slides.

**Reference (9 slides):** A4.2.2 — title → **Let's think** hook → **Demonstration** cleaning vs selection → **Your turn** cards → diagram → **Demonstration** compare → **Your turn** scenarios → **Your turn** house prices → **For exam** [3].

## 3. Writing rules

- **Slide text: English.** **Teacher notes: Lithuanian** (`*Pastaba:* …`).
- On-slide copy in `>` blocks; tables as markdown; reveals *(atsiranda paspaudus)*.
- **One idea per slide.** Tables ≤ ~5 columns × 7 rows; cells ≤ ~40 characters where possible.
- In the outline, label each slide’s eyebrow explicitly: **Let's think** | **Demonstration** | **Your turn** | **For exam** (`cs-slides` §1c).
- **Co-fill tables** → **Demonstration** only. **Your turn** slides mirror what was taught (same card layout or calc structure).
- If the lesson doc lacks **Think first** for the hook scenario, add it to the outline’s “Ką pastebėjau” or handoff so build updates `lessons/docs/{id}.md`.
- Scenario reveals: short — `Filter → rank before training (fast)`.
- **Spelling:** one of -isation / -ization per outline; match the lesson page after content QA.
- **Timing in LT notes:** ~2–4 min per Your turn; ~4 min for For exam writing.

### For exam slide (align marks, hint, and model answer)

1. Read **marks** from the knowledge-check exercise (`marks` in seed, `[n]` on page).
2. **One mark per point:** write exactly `n` bullets — derived from **From exam** prompt + `expectedFormat` hint, not from the long teacher table.
3. **Common mistakes:** 2 bullets from exam traps / word traps on the page.
4. **Model answer on slides:**
   - Length ≈ **`marks` sentences** (or `marks` clear points in 3–4 sentences max).
   - Answers the **command term** (Describe = detailed account; Explain = why; Outline = brief).
   - Uses lesson terminology; writable in **~4 minutes**.
   - If the teacher-only model answer is longer, the outline model answer is still the **exam-length** version; note in “Ką pastebėjau” if the page teacher answer should be shortened.

**Typical [3] Describe “role of …”:** (1) role — informative attributes, noise/redundancy; (2) benefit — generalisation / speed / simplicity; (3) **one** method + when it runs relative to training + one strength **or** limitation (unless From exam explicitly requires more).

### Worked example slide

- Use the lesson’s named example (house prices, spam, etc.).
- Columns/features listed on-slide; **2–3 questions** max.
- If **A4.2.1-style cleaning** precedes the topic: first ask what **cleaning** removes; then what **filter / wrapper / embedded** would do.
- Reveal: one short paragraph or bullet answer — not a full model essay.

## 4. Check the lesson content (always end with this)

After the outline, run the **`cs-content-check`** checklist (including its comparison with `sources/` when present) and add its findings under **„Ką pastebėjau puslapio turinyje“** — issues or „Nieko kritinio“. At minimum cover:

- Grammar / stale copy.
- Overclaims (“only”, “always”) → hedge on slides.
- Examples that don’t support the distinction they illustrate.
- **Marks vs From exam vs hint** mismatch (scope too large for points).
- Hint key points missing what the question asks (e.g. “role” on a role question).
- **Teacher model answer vs slide model answer** length mismatch.
- Inconsistent spelling or ML correctness (training-set-only stats, dedupe before split, no target imputation).
- Diagram labels vs lesson text.

## 5. Output template

```
Pagal tą pačią struktūrą gaunasi **N skaidrių**. Skaidrių tekstas — anglų k.; pastabos mokytojui — lietuviškai.
Ritmas: hook → **Demonstration** (co-fill) → teach/diagram → **Your turn** praktika → **For exam**.
Kiekvienai skaidrei nurodyk eyebrow: Let's think | Demonstration | Your turn | For exam.

### Tema ir hook
**1 — Title**
> `CODE` · HL · <area>
> **<syllabus statement>**
> • goal 1 • goal 2 • goal 3

**2 — Hook** · eyebrow **Let's think**
> <scenario from lesson when possible>
> **<big question>**
*Pastaba:* …
*Learn:* `Think first` + `lesson-lead` (jei pamokoje dar nėra — įrašyti build metu)

### Sąvokos (blokas 1): …
**3 — …** · eyebrow **Demonstration** (bridge / contrast table)
| row labels | col A (tuščia) | col B (tuščia) |
> ⚠ …
*For teacher:* pilna lentelė debriefui

**4 — Your turn: …** (optional cards)
> card 1 … *(paspaudus → …)*

### Sąvokos (blokas 2): …
**5 — …** (diagram: `/figures/….png`)
**6 — Fill in the comparison** · eyebrow **Demonstration** (tuščios ląstelės; pilna lentelė **For teacher**)
*Pastaba:* užpildymas klasėje ant skaidrės, debrief iš pamokos

### Scenarijai ir pavyzdys
**7 — …** · eyebrow **Your turn** (scenarios — atsakymai paspaudus toje pačioje skaidrėje)
> 1. … → **…**
…

**8 — Worked example: …** · eyebrow **Your turn**
> Q: …
Atsakymai *(paspaudus)*: …

### For exam
**9 — For exam** · eyebrow **For exam**
> **<question> [marks]**
> **One mark per point:** 1. … 2. … 3. …
> **Common mistakes:** • … • …
Pavyzdinis atsakymas *(paspaudus)* — **marks-length, not teacher table:**
> …

---
**Ką pastebėjau puslapio turinyje:**
- …

Jei norite, galiu iš šio aprašymo sukurti skaidrių rinkinį (`cs-slides` → `public/presentations/{lesson-id}-deck/`).
```

## 6. Handoff to build

When the teacher approves the outline:

1. Implement fragments under `public/presentations/{lesson-id}-deck/slides/`.
2. `manifest.js` + `npm run build:{lesson-id}-deck` (add script if missing).
3. `slidesPath` in `scripts/seed/manifest.js`; `npm run build-content`; bump `SLIDES_EMBED_REV` in `public/js/app.js`.

Follow **`cs-slides`** (§1c eyebrows, §1d Learn hook, §2 patterns, A4.2.2 slide table). Copy structure from **A4.2.1** / **A4.2.2** fragment decks. After lesson doc changes for Think first / For teacher tables: `npm run build-content`.
