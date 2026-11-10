---
name: cs-slides
description: Build classroom slide decks from an outline — A4.2.1 / A4.2.2 fragment-deck typography, left-aligned, same-slide step reveals, co-fill tables. Step 2 after cs-slides-outline.
---

# IB DP CS lesson slides (design + build)

**Pipeline:** (1) `cs-slides-outline` — lesson page → slide outline. (2) **This skill** — outline → deck HTML.

**Gold reference:** the fragment decks `public/presentations/a4-2-1-deck/`, `a4-2-2-deck/` and `a4-2-3-deck/` (`slides/*.html`). Their styles are shared: `public/presentations/shared/deck.css` (A4.2.x template) and `shared/deck-common.css` (reveals, For exam, layout — also linked by `a1-2-deck`). A new deck's `shell.html` links both files and has no `<style>` of its own. New A4 decks should look and behave like this, not like a light export default.

Use when the teacher approves an outline. Read `lessons/docs/{lesson-id}.md`, `public/figures/`, and the outline’s on-slide copy.

**Use the approved outline’s slide text exactly** — do not rewrite, shorten, “improve” or add on-slide copy. If something in the outline looks wrong, stop and ask instead of changing it.

## 1. Typography and sizes (apply first)

**Fragment deck** (`clamp()` in shell) is the standard format. **All text is left-aligned** (titles, hook, questions, bullets, tables) — never centre text. Font: **DM Sans**; **JetBrains Mono** for given data / messy records.

| Element | Class / pattern | Size (fragment `clamp`) | Colour |
|--------|------------------|-------------------------|--------|
| Title slide eyebrow | `.slide-eyebrow` | ~0.72–0.88rem, uppercase, letter-spacing 0.12em | `--accent` `#60a5fa` |
| Title slide H1 | `.slide-intro-title` | ~1.65–2.5rem | `--text` |
| Learning goals | `.slide-intro-outline` / `.bullets` | ~1.1–1.5rem, generous line-height | `--text` / muted secondary |
| Section H2 | `h2.slide-title` | ~1.35–1.85rem | `--text` |
| Hook slide | **Required classes:** `slide--gpu-question slide--question-large slide--lesson-hook` | **Left-aligned**; `<p class="slide-eyebrow">Let's think</p>` then gray lead + large question (`a1-2-1-hook.html`) | |
| Hook lead | `p.lead.slide-hook-lead` inside hook | ~1.15–1.65rem | `#cbd5e1` |
| Hook question | `p.gpu-question-text` in `.gpu-question-wrap` | ~1.75–3.45rem, bold, **left-aligned** | `--text` — **one short line** (not a long exam stem) |
| Phase eyebrows | `.slide-eyebrow` | same as title eyebrow | `--accent` — see **§1c** |
| Table body | `.slide-deck-table` | ~1.05–1.28rem (six-row summary) | `--text` on `--card` |
| **For exam slide** | `.slide--exam-full` — copy **`a1-2-1-exam-practice.html`** (canonical) | Three-phase classroom flow — see §1b | |
| Exam eyebrow | `.slide-eyebrow` on exam slide | **same as** other slides (`~0.72–0.88rem`) | `--accent` |
| Exam question H2 | `.slide-title--exam` | slightly above `h2.slide-title` (`~1.45–2.05rem`) | `--text` |
| Lesson-flow chips | `.slide-exam-flow` | step **3** (blue pen) → step **5** (Practise) | ties to `/figures/lesson-flow.svg` |
| Exam timing + timer | `.slide-exam-meta` · `.slide-exam-timing` · `.slide-exam-timer` | instruction `~1.1–1.55rem`; timer mono `~1.35–1.95rem` | `#cbd5e1` / `--text` |
| Exam panel titles / body | `.slide-exam-panel__*` | match table/body scale (`~0.95–1.2rem`) | `--card` panels |
| Exam model answer | `.slide-exam-model` | **full width**, `~1.05–1.28rem` body; **focus** state when revealed | |
| Scenario card prompt | `.slide-classify-card__value` | bold, card title size | `--text` |
| Scenario card answer | `.slide-classify-card__label` on `slide--scenario-cards` | ~1.2–1.65rem, bold | `--accent`, no background; under prompt |
| Calc given line | mono box | ~1–1.2rem in `--card` panel | `--text` |

**Layout by slide density:** dense slides (tables, cards, worked examples, **For exam**) use the **fixed top anchor** (`--slide-pad-top`, `.slide { justify-content: flex-start }`). Sparse slides — **Title** (`slide--intro`) and **Let's think** (`slide--lesson-hook`) — are centred **vertically only**; text stays left-aligned, and the hook question is the largest element. Diagram slides (`slide--diagram-full`) carry an eyebrow (e.g. **Demonstration**) and the image fills the free height under the title, keeping its proportions. These rules live in `shared/deck-common.css`. Template fixes go into `shared/deck.css` or `shared/deck-common.css` only — never into a single shell; then rebuild all fragment decks and bump the `?v=` on the two `<link>` tags in every fragment shell. **Reveals keep their place:** a hidden `.slide-reveal` uses `visibility: hidden` + `opacity: 0` (never `display: none` or `max-height: 0`), styles that change size (font size, weight, margin) apply in both states, and worked-example tables and card grids do not stretch over the free height — so a click only shows the answer and nothing else moves. Co-fill tables **full width** (`slide--co-fill-table`).

### 1b. For exam — three phases (fragment decks)

**HTML template:** `public/presentations/a1-2-deck/slides/a1-2-1-exam-practice.html` (copy per lesson; swap question, panels, model text).

**Behaviour:** `public/presentations/slide-deck.js` — `syncExamSlidePhase()` on slide change and after each **Space / →** reveal.

| Step | Teacher (Space) | On screen | Timer |
|------|-----------------|-----------|--------|
| 1 Recall | — | Question + lesson-flow chip **3** only; **no** rubric/mistakes | 5:00 · on paper |
| 2 Refine | Reveal `.slide-exam-panels` (`data-reveal-order="1"`) | + One mark per point + Common mistakes; chip **3 → 5** | Reset 5:00 · laptops · Practise → From exam |
| 3 Model | Reveal `.slide-exam-model` (`data-reveal-order="2"`) | Only the eyebrow, the question and the model answer (directly below the question, highlighted); lesson-flow chips, timer and panels are **hidden** (`display: none`, in `shared/deck-common.css`, all decks) | Hidden |

**Lesson flow:** Step 4 (red pen / article) is **not** a separate slide moment — rubric + mistakes replace it in the exam block. Step 5 = full answer in **Practise → From exam** on the site.

**Required markup:** `.slide-exam-flow`, `.slide-exam-meta` (timing `data-exam-phase-*` + `.slide-exam-timer` `data-exam-minutes` / `data-exam-minutes-refine`), panels wrapped in `.slide-reveal`, model `data-reveal-order="2"`.

Re-run `npm run build:a1-2-deck` / `build:a4-2-1-deck` / `build:a4-2-2-deck` / `build:a4-2-3-deck` after shared CSS, shell or `*-exam-practice.html` edits; bump `slide-deck.js?v=` in shells when JS changes.

**Exam model answer text (single source):** Copy in `slides/*-exam-practice.html` (`.slide-exam-model__text`) is the **only** exemplar for that question — sync to `scripts/data/model-answers-by-id.js` (`{lesson}-q4` or matching exam id), lesson **For teacher** table, then `npm run build-content`. Submissions and teacher UI read the built model answer; do not keep a longer “teacher-only” version.

**One For exam slide per lesson:** `buildExamPracticeSlides()` in `scripts/exam-slide-copy.js` lists one exercise id per syllabus code. Do not add `exam-practice-2.html` for extra consolidation questions on the same code. A1.1 topic decks (`build-a1-topic-decks.js`) and standalone `a1-1-*-deck.html` follow the same rule.

**Short screens (e.g. 1280×720):** when the revealed model answer would run past the bottom margin, `fitExamModel()` in `slide-deck.js` lifts it (`.slide-exam-model--lifted`, and `--compact` smaller text if it still does not fit); since the panels are hidden in the model phase, this should rarely be needed. Check every deck at 1280×720 and 1920×1080 in real fullscreen.

**Exam timer layout:** `.slide--exam-full .slide-exam-meta` uses `align-items: flex-start` so the timer does not jump down when the Practise-phase timing line wraps to two lines (do not use `align-items: center` on that row).

### 1c. Eyebrow labels (when to use which)

All use the same `.slide-eyebrow` style (uppercase blue). **Do not** put syllabus codes on hook eyebrows.

| Eyebrow | Meaning | Slide pattern |
|---------|---------|----------------|
| **Let's think** | Open question before you teach | Hook only (`slide--lesson-hook`) — required on every hook, including A4 (`a4-2-1-hook.html`, `a4-2-2-hook.html`) |
| **Demonstration** | You and class **co-fill** a reference table live | Pattern A — empty `.slide-cell-empty` cells; answers only in lesson **For teacher** |
| **Your turn** | Students **apply** after teaching | Pattern B — scenarios, calc, classify cards, worked example with reveals |
| **For exam** | Three-phase exam slide | §1b |

**Common mistake:** putting **Your turn** on a co-fill table. If the slide is empty cells and you debrief from For teacher, it is **Demonstration**.

**A4.2.2 examples:** slide 3 cleaning vs selection + slide 6 compare strategies = **Demonstration**; cleaning-or-selection cards, which method?, house prices = **Your turn**.

### 1d. Slides vs Learn page (hook)

| Surface | Hook pattern |
|---------|----------------|
| **Slides** | `Let's think` eyebrow + `slide-hook-lead` + `gpu-question-text` |
| **Learn** (`lessons/docs/{id}.md`) | Yellow callout: `<p class="lesson-tip"><strong>Think first.</strong> …question…</p>` then `<p class="lesson-lead">…short answer…</p>` (see `a1-2-1.md`, `a4-2-2.md`) |

The hook question on slides and **Think first** on Learn should match. Run `npm run build-content` after lesson doc edits.

Do **not** paste full co-fill table answers on Learn student view if slides use Pattern A — keep filled tables under `<!-- teacher-only: For teacher -->` in the lesson doc (one block per co-fill slide you debrief).

## 2. Classroom interaction — three patterns

### A. Reference tables → fill **together** on the **same** slide

Use for “six problems”, “cleaning vs selection”, “compare three strategies”, etc.

- **One slide only** — do **not** add a second slide that repeats the same table empty then full.
- On load: show **row labels** (and column headers); consequence / technique / limitation cells **empty** (`.slide-cell-empty` or blank cells).
- Eyebrow **`Demonstration`** (see §1c).
- **Never** ship pre-filled answer cells on the slide — that duplicates the lesson page and removes the live fill. Copy belongs in **For teacher** only.
- Speaker notes: point to **For teacher** for the filled table (`Poromis užpildykite… Pilna lentelė — pamokos skiltyje **For teacher**.`).
- Optional: reveal **one row at a time** on the **same** slide via `#deck-motion` steps or `.slide-reveal` — still not a new slide.

**References:** A4.2.1 `a4-2-1-problems-table.html`; A4.2.2 `a4-2-2-cleaning-vs-selection.html`, `a4-2-2-compare-table.html`.

### B. **Your turn** = practice after you already taught it — **one slide, stepped reveals**

Use when students **apply** something already shown (calculate, pick method, scenarios, exam write).

- **Everything on one slide:** prompt + hidden answers on the **same** `deck-slide` / `<section>`.
- **Do not** navigate to a new slide for answers.
- Advance **within** the slide: `.slide-reveal` + `data-reveal-order` (fragment deck).
- Reveal order: one answer at a time (calc pills right, scenario cards, exam model answer last).

Examples from A4.2.1:

| Slide | Pattern |
|-------|---------|
| 6 Different scales | Teach visual + question; **answer box** fades in on same slide |
| 8 Calculate | YOUR TURN eyebrow; 3 questions left; **three answer pills** reveal sequentially |
| 9 What would you do? | 6 cards; **labels reveal** per card |
| 10 Clean this record | messy row + **answer table** one reveal |
| 11 For exam | **Recall** (paper) → reveal rubric → **Practise** → reveal **model answer** (see §1b) |

### C. Diagram + teach slides

- Diagram: **eyebrow + title + image only** (annotate live); the image fills the free height.
- Full comparison table (with limitation column): **teach slide** — may use pattern A (co-fill) or show full table if too dense to fill live.

## 3. Teaching principles (summary)

- **Demonstrate → explain → practise** — but **practise on the same slide** with steps, except reference tables which are **co-filled** on the teach slide.
- **Slides ≠ lesson page** — minimal on-screen text; depth in speaker notes (LT).
- **10–12 slides** per lesson; do not add slides without asking.
- Slide copy **English**; `data-speaker-notes` / `<template class="slide-speaker-notes">` **Lithuanian**.

## 4. Fixed sequence (content)

| Stage | Slides | Build notes |
|-------|--------|-------------|
| Title | 1 | Eyebrow `CODE · HL · area`; syllabus title; 3 goals |
| Hook | 2 | `slide--lesson-hook`: 1–2 sentence lead + **short** `gpu-question-text`; copy `a4-2-1-hook.html` / `a4-2-2-hook.html` structure |
| Diagram / concept | 3–4 | GIGO, six problems, etc. |
| Summary / compare table | 5–6 | **Demonstration** — empty cells, one slide, no duplicate; filled copy in For teacher |
| Second concept | 6–7 | Diagram partial reveal; full table (norm vs std) |
| Your turn (practice) | 8 | Calc / sort / scenarios — **same-slide reveals** |
| Worked example | 9–10 | **Your turn** eyebrow; copy `a4-2-2-house-prices.html` / `a4-2-1-clean-record.html`: record row + optional `slide-worked-prompt` + answer cells as `.slide-reveal` per row; revealed text **blue** (`.slide--worked-example … .slide-reveal.is-revealed { color: var(--accent) }`). No syllabus cross-refs in student-facing cells (e.g. drop “after A4.2.1 checks”). |
| For exam | 11 | Three-phase exam slide (§1b); copy `a1-2-1-exam-practice.html` |

Drop second concept block (6–8) if the topic only has one idea.

**Do not add a separate “role of X” slide** if the hook + For exam model answer already state the role (A4.2.2 removed `a4-2-2-role` as duplicate of hook + exam).

### A4.2.2 fragment deck (9 slides)

| # | Fragment id | Eyebrow |
|---|-------------|---------|
| 1 | title | syllabus |
| 2 | hook | Let's think |
| 3 | cleaning-vs-selection | Demonstration |
| 4 | your-turn-cleaning-selection | Your turn |
| 5 | strategies-diagram | (teach) |
| 6 | compare-table | Demonstration |
| 7 | scenarios | Your turn |
| 8 | house-prices | Your turn |
| 9 | exam-practice | For exam |

### A4.2.1 fragment-deck mapping (11 slides)

| # | Label | Interaction |
|---|--------|-------------|
| 1 | Title | |
| 2 | Hook (spam) | |
| 3 | GIGO diagram | |
| 4 | Six problems diagram | |
| 5 | Fill in the table | **Demonstration** — co-fill empty cells; debrief For teacher |
| 6 | Different scales | Same-slide answer reveal |
| 7 | Normalization vs standardization | Full teach table |
| 8 | Calculate | **YOUR TURN** — 3 step reveals |
| 9 | What would you do? | 6 card reveals |
| 10 | Clean this record | Table reveal |
| 11 | For exam | Recall → rubric reveal → model reveal (§1b) |


## 5. Before building: check the content

If the outline did not already include a content check, run **`cs-content-check`** on `lessons/docs/{lesson-id}.md` (overclaims, example fit, exam alignment, spelling, ML correctness, diagram vs lesson text, comparison with `sources/`). List issues for the teacher; do not silently rewrite the lesson page.

## 6. Building

### Standard: data deck (`presentations/decks/{lesson-id}.js`)

1. Write the deck as a data file like `presentations/decks/a4-3-2.js`: slide types `title`, `hook`, `cards`, `cofill`, `diagram`, `worked`, `exam`, `html` (documented at the top of `scripts/build-deck.js`; `?` at the start of a table cell = revealed answer). The exam question, marks and model answer are read from `scripts/seed/exercises.js` and `scripts/data/model-answers-by-id.js`, the statement from `scripts/seed/manifest.js` — never retype them. All decks share `public/presentations/shared/shell.html`.
2. `npm run build:deck -- {lesson-id}` → `public/presentations/{lesson-id}-deck.html` (`npm run build:decks` rebuilds all). Never edit the generated HTML.
3. Older decks (A4.1, A4.2, B1) are still fragment decks (`public/presentations/{lesson-id}-deck/` with `shell.html`, `slides/*.html`, `manifest.js`) built by their own scripts; move them to data files when they are next changed.
4. `slidesPath` in `scripts/seed/manifest.js`; `npm run build-content`; bump `SLIDES_EMBED_REV` in `public/js/app.js`.

Step reveals: elements with `data-reveal-order` inside `.slide-reveal`; Your-turn answers start hidden and appear per click, within the slide before advancing.

After shell, data-file or slide fragment edits: rebuild deck + bump `SLIDES_EMBED_REV` in `public/js/app.js` so lesson embed cache refreshes.

When fragment deck still has a separate empty-table slide from an old outline, **merge into one co-fill slide** on the next pass. When a table was wrongly exported **full** on slides, empty the cells and move the filled version to lesson **For teacher**.

## 7. Visual tokens

| Token | Hex | Use |
|--------|-----|-----|
| `--bg` | `#0f172a` | Canvas |
| `--card` | `#1e293b` | Tables, cards, exam panels |
| `--text` | `#f8fafc` | Body |
| `--muted` | `#94a3b8` | Secondary |
| `--accent` | `#60a5fa` | Eyebrows, reveals, table header text |
| Border | `#475569` | Cards, tables |

Scenario grid: `slide--scenario-cards` + `slide-scenario-grid-lead`; 3×2 grid; revealed `.slide-classify-card__label` = **large blue text, no pill** — directly under the prompt (see `a4-2-2-your-turn-cleaning-selection.html`).

## 8. When done

Reply briefly in **Lithuanian**: slide count; which slides use **co-fill tables** vs **same-slide YOUR TURN reveals**; files changed; `SLIDES_EMBED_REV` if bumped. Note any lesson content still to fix.
