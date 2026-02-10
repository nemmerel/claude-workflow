---
name: create-lecture
description: Create a new Beamer lecture from papers, existing slides, Stata do-files, and other materials. Guides the content creation process with notation consistency, pedagogical patterns, and collaborative iteration.
disable-model-invocation: true
argument-hint: "[Topic name, e.g., 'Synthetic Control' or 'Regression Discontinuity']"
allowed-tools: ["Read", "Grep", "Glob", "Write", "Edit", "Bash", "Task"]
---

# Lecture Creation Workflow

Create a beautiful, pedagogically excellent Beamer lecture deck.

**This is a collaborative, iterative process. The instructor drives the vision; Claude is a thinking partner.**

---

## CONSTRAINTS (Non-Negotiable)

1. **Start from `templates/beamer_template.tex`** — copy it to `slides/` and rename. Never create a Beamer file from scratch; always inherit the template's preamble (16:9, dark red theme, Times New Roman, listings config, no navigation symbols, frame-number footer)
2. **Read the knowledge base FIRST** — notation registry, narrative arc, applications database
3. Every new symbol MUST be checked against the notation registry
4. Motivation before formalism — no exceptions
5. Worked example within 2 slides of every definition
6. Max 2 colored boxes per slide
7. No `\pause` or overlay commands (check project rules)
8. Transition slides at major conceptual pivots
9. Thread at least 1 running empirical application throughout
10. All citations verified against the bibliography
11. **Work in batches of 5-10 slides** — share for feedback, don't bulk-dump

---

## WORKFLOW

### Phase 0: Intake & Context
- Read knowledge base and creation guide
- Inventory provided materials (papers, slides, code)
- Read previous lecture's structure and ending
- State pedagogical goal, get user confirmation

### Phase 1: Paper Analysis (When Papers Provided)
- Split into chunks, extract key ideas
- Map paper notation → course notation
- Identify slide-worthy content
- Present summary for approval

### Phase 2: Structure Proposal
- Propose outline (5-Act or 3-Part template)
- List TikZ diagrams and Stata figures needed
- List new notation to introduce
- **GATE: User approves before Phase 3**

### Phase 3: Draft Slides (Iterative)
- Copy `templates/beamer_template.tex` → `slides/LectureNN_Topic.tex`
- Keep the full preamble from the template; replace only `\title`, `\author`, `\institute`, and slide content
- Work in batches of 5-10 slides using the template's slide patterns (bullet points, math, theorem, figure, code listing, equation+commentary)
- Check notation, apply creation patterns
- Quality checks during drafting

### Phase 4: Figures & Code
- Stata do-files following conventions
- TikZ diagrams in Beamer source (single source of truth)

### Phase 5: Polish & Compile
- Full 3-pass pdfLaTeX compilation (`pdflatex` or `latexmk -pdf`)
- Run Devil's Advocate
- Run Substance Review (if domain reviewer configured)
- Update knowledge base with new notation

---

## Post-Creation Checklist

```
[ ] Preamble matches templates/beamer_template.tex
[ ] Lecture compiles without errors (pdfLaTeX)
[ ] No overfull hbox > 10pt
[ ] All citations resolve
[ ] Every definition has motivation + worked example
[ ] Max 2 colored boxes per slide
[ ] 2-3 Socratic questions embedded
[ ] Transition slides between sections
[ ] At least 1 running application threaded throughout
[ ] New notation added to knowledge base
[ ] Session log updated
[ ] Devil's Advocate run
```