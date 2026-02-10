# CLAUDE.MD -- Academic Project Development with Claude Code

<!-- HOW TO USE: Replace [BRACKETED PLACEHOLDERS] with your project info.
     Customize Beamer environments for your theme.
     Keep this file under ~150 lines — Claude loads it every session. -->

**Project:** [YOUR PROJECT NAME]
**Institution:** [YOUR INSTITUTION]
**Branch:** main

---

## Application Paths

| Application | Path | Version |
|-------------|------|---------|
| Stata MP | `/Applications/Stata/StataMP.app/Contents/MacOS/stata-mp` | 17.0.107 |
| pdfLaTeX | `/Library/TeX/texbin/pdflatex` | TeX Live 2023 |
| latexmk | `/Library/TeX/texbin/latexmk` | 4.79 |
| Python 3 | `/opt/homebrew/bin/python3` | 3.13.2 |

**Usage notes:**
- Stata batch mode: `/Applications/Stata/StataMP.app/Contents/MacOS/stata-mp -b do script.do`
- LaTeX compilation: use pdfLaTeX (not XeLaTeX) — `pdflatex` or `latexmk -pdf`
- Python: Homebrew-managed, Apple Silicon native

---

## Core Principles

- **Plan first** -- enter plan mode before non-trivial tasks; save plans to `quality_reports/plans/`
- **Verify after** -- compile and confirm output at the end of every task
- **Single source of truth** -- Beamer `.tex` is authoritative; new lectures start from `templates/beamer_template.tex`
- **Quality gates** -- nothing ships below 80/100
- **[LEARN] tags** -- when corrected, save `[LEARN:category] wrong → right` to MEMORY.md

---

## Folder Structure

```
[YOUR-PROJECT]/
├── CLAUDE.md                    # This file
├── MEMORY.md                    # [LEARN] entries and corrections
├── README.md                    # Project documentation
├── bibliography_base.bib        # Centralized bibliography
├── .claude/                     # Rules, skills, agents, hooks
├── explorations/                # Research sandbox (see rules)
├── figures/                     # Figures and images
├── master_supporting_docs/      # Papers and existing slides
├── preambles/                   # Shared LaTeX headers
├── quality_reports/             # Plans, session logs, merge reports
├── scripts/                     # quality_score.py + Stata do-files
├── slides/                      # Beamer .tex files
└── templates/                   # Beamer, problem set, session log, quality reports
```

---

## Quality Thresholds

| Score | Gate | Meaning |
|-------|------|---------|
| 80 | Commit | Good enough to save |
| 90 | PR | Ready for deployment |
| 95 | Excellence | Aspirational |

---

## Skills Quick Reference

| Command | What It Does |
|---------|-------------|
| `/compile-latex [file]` | 3-pass pdfLaTeX + bibtex |
| `/proofread [file]` | Grammar/typo/overflow review |
| `/visual-audit [file]` | Slide layout audit |
| `/pedagogy-review [file]` | Narrative, notation, pacing review |
| `/review-stata [file]` | Stata code quality review |
| `/slide-excellence [file]` | Combined multi-agent review |
| `/validate-bib` | Cross-reference citations |
| `/devils-advocate` | Challenge slide design |
| `/create-lecture` | Full lecture creation |
| `/commit [msg]` | Stage, commit, PR, merge |
| `/lit-review [topic]` | Literature search + synthesis |
| `/research-ideation [topic]` | Research questions + strategies |
| `/interview-me [topic]` | Interactive research interview |
| `/review-paper [file]` | Manuscript review |
| `/data-analysis [dataset]` | End-to-end Stata analysis |

---

## Beamer Template Style

All slides follow the format in `templates/beamer_template.tex`:
- **16:9 aspect ratio**, default theme, dark red titles/bullets (RGB 139,0,0)
- **Font:** Times New Roman (newtxtext + newtxmath)
- **Code:** `lstlisting` with `\ttfamily\footnotesize`
- **No navigation symbols**, frame-number footer only
- **Slide patterns:** bullet points, display math, theorem, figure, code listing (`[fragile]`), equation+commentary

<!-- CUSTOMIZE: Add your own Beamer environments below. -->

## Problem Set Template Style

Problem sets use `templates/problemset_template.tex`:
- **12pt article** class, Times font, 1.6in side margins
- **Sans-serif bold** section headings (via `titlesec`)
- **Alphabetical sub-parts** via `enumitem` (`(a)`, `(b)`, `(c)`)
- **Theorem environments:** proposition, remark, corollary, theorem, definition
- **Shorthand:** `\be`/`\ee` for `\begin{equation}`/`\end{equation}`
- **Fancy headers** with frame via `fancyhdr`

---

## Current Project State

| Lecture | Beamer | Key Content |
|---------|--------|-------------|
| 1: [Topic] | `Lecture01_Topic.tex` | [Brief description] |
| 2: [Topic] | `Lecture02_Topic.tex` | [Brief description] |
