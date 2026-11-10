---
name: cs-lesson-figures-and-answers
description: Use when creating or changing lesson diagrams, figure captions, figure CSS, teacher model answers or marks in the IB CS lessons project.
---

# Lesson figures and model answers

These rules come from decisions made while working on A4.3.7 and A1.1.1. If CLAUDE.md already states one, do not duplicate it; if they conflict, show both and wait.

## Figures
- Diagrams only through the generator (lessons/diagrams/build_lesson_diagrams.py). Never edit an SVG by hand.
- Box texts use the wording of the lesson's tables and paragraphs. Example: Evaluation applies the fitness function; selection favours short routes, it does not always pick them; termination has two conditions, as in the lesson. Something created once (a starting population) sits outside the repeating loop.
- Every figure has a "Figure N." caption paragraph directly under it, numbered 1, 2, in order. The generator check enforces this.
- Never place a figure straight after another figure. Add a short explanatory paragraph before or after it (how to follow the arrows, why the example is valid) without repeating the caption.
- Height: a figure should fit on screen at once. Aim for a canvas of about 600 px high or less at its natural width. Report canvas size and expected on-screen size whenever a figure is built or changed.
- Keep text readable at 380 px wide. If a figure gets too small there, report it instead of shrinking further.
- Generator checks must pass with exit code 0: text fits boxes with a 14 px margin, text inside the canvas, no arrow crossing a box or label, title > box title > box line sizes. Widen boxes rather than shrinking text.
- Colour goes on a title or keyword, not a whole box. Neutral boxes use the grey fill for secondary parts. Stages of one process keep ink titles.
- CSS for captioned figures (natural width, centred, shrinks on narrow screens, panel colour #eaf4fd, class lesson-figure-caption) applies only to figures followed by a "Figure N." caption. Do not change how other lessons' figures display.
- Approved SVGs stay byte-for-byte identical unless a change is requested; verify with checksums.
- Use --preview DIR to produce full-size and 380 px PNGs and look at them.

## Teacher model answers
- Layout: the standard "Question | Model answer" table with ONE PARAGRAPH in the right cell. Never a nested table and never a separate table under the question.
- About 100 words. Bold only the key terms, in the style of the other model answers.
- Every sentence matches one of the question's marking points, and every fact matches the lesson text (for example only an instruction moves to the IR; buses are described as "both ways" in the lesson wording).
- Do not change the mark value or marking points without approval. Propose the change and wait.
- The sync script (scripts/apply-a1-1-exam-model-answers.js) must write this layout and must not duplicate the command term ("Describe Describe").
- After changing an answer, check the other places that quote it: question bank, exercises.js, hints file, grade pathways samples (2 or 3 sentences), built data.

## Process
- Rebuild with npm run build-content, run npm run audit-lessons and the generator. Do not touch the q4 audit flags about missing [marks]; they are intentional.
- Report how the shared JSON files (lessons.json, lessons.teacher.json) changed, per lesson.
- Nothing is committed without approval. At the end list uncommitted files grouped by task. When commits are approved, split shared files with git add -p, checking each hunk's lesson id before staging.
- Renderings at 380 px simulated by limiting the column are not a real phone test; say so.
