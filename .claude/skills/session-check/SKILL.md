---
name: session-check
description: Run before starting a lesson group, a cs-topic-batch run, or any large task in this project — tells the teacher whether to /clear first and which model and effort to use for each step.
---

# Session, model and effort check

Long sessions re-read the whole history on every turn, and stronger models use more of the Pro plan limit. Before a large task, give the teacher a short recommendation (Lithuanian, 1–3 lines) and **wait for their go-ahead** if a `/clear` or model switch is advised — you cannot run these commands yourself.

## When to run

- The teacher asks to start a new lesson group (e.g. A4.3.5–A4.3.7) or a `cs-topic-batch` run.
- The teacher asks for a content check, outline or deck build.
- The teacher asks about usage, limits, or which model to use.

Skip silently for small follow-ups inside the current task.

## 1. `/clear`

Recommend `/clear` before starting if:
- this session already worked on another lesson group that is committed;
- this session has been compacted, or covers several unrelated tasks.

Do not recommend it when the next step depends on something still open in this session (an unanswered decision, an uncommitted change being reviewed). Note that rules reload from CLAUDE.md and skills after `/clear`, so nothing is lost.

## 2. Model and effort per step

| Step | Model | Effort |
|------|-------|--------|
| Content check against `sources/` (`cs-content-check`), lesson content fixes, slide outline (`cs-slides-outline`), scope / terminology decisions | **Opus** | medium; high for lessons with many problems or Discuss [5] |
| Slides from an approved outline (`cs-slides`), style rules, spelling sweeps, build / audit / commit, syncing hint ↔ model answer | **Sonnet** | medium |
| Listing files, git status, quick lookups | Sonnet | low |

If the current model does not match the step, say so: „Šiam žingsniui rekomenduoju `/model sonnet` (mechaninis darbas).“

## 3. Batch size

- Default: 2–3 lessons per run.
- If the teacher says the limit is high (session > ~70 % or week > ~60 %): 1–2 lessons per run, Sonnet everywhere except content checks.

## Output format

```
Prieš pradedant: /clear (ankstesnė grupė jau įcommitinta) · /model opus · effort medium.
Planas: A4.3.5 → A4.3.6 → A4.3.7, po kiekvienos – trumpa ataskaita.
Tęsti?
```
