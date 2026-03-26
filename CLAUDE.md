# CLAUDE.MD -- Economic Research Project with Claude Code

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
| R | `/usr/local/bin/Rscript` | [YOUR VERSION] |

**Usage notes:**
- Stata batch mode: `/Applications/Stata/StataMP.app/Contents/MacOS/stata-mp -b do script.do`
- LaTeX compilation: use pdfLaTeX (not XeLaTeX) -- `pdflatex` or `latexmk -pdf`
- Python: Homebrew-managed, Apple Silicon native
- R: Optional, for supplementary analysis or replication

---

## Core Principles

- **Plan first** -- enter plan mode before non-trivial tasks; save plans to `quality_reports/plans/`
- **Verify after** -- compile and confirm output at the end of every task
- **Single source of truth** -- paper `.tex` in `papers/drafts/` is authoritative; new papers start from `templates/paper_template.tex`
- **Quality gates** -- nothing ships below 80/100
- **Replication first** -- replicate original results before extending
- **[LEARN] tags** -- when corrected, save `[LEARN:category] wrong -> right` to MEMORY.md

---

## Folder Structure

```
[YOUR-PROJECT]/
├── CLAUDE.md                    # This file
├── MEMORY.md                    # [LEARN] entries and corrections
├── README.md                    # Project documentation
├── bibliography_base.bib        # Centralized bibliography
├── .claude/                     # Agents, skills, rules, hooks
├── data/                        # Research data
│   ├── raw/                     # Original data (gitignored, never modify)
│   ├── processed/               # Cleaned, analysis-ready datasets
│   └── codebooks/               # Variable documentation
├── explorations/                # Research sandbox (fast-track rules)
├── master_supporting_docs/      # Papers and reference materials
│   ├── supporting_papers/       # PDFs of key papers
│   └── supporting_slides/       # Reference presentations
├── output/                      # All generated output
│   ├── tables/                  # LaTeX table fragments
│   ├── figures/                 # PDF/PNG figures
│   └── logs/                    # Stata logs
├── papers/                      # Manuscripts
│   ├── drafts/                  # Working papers
│   ├── submissions/             # Journal-ready versions
│   └── referee_responses/       # Response letters
├── preambles/                   # Shared LaTeX headers
├── quality_reports/             # Plans, session logs, reviews
├── scripts/                     # Analysis code
│   ├── stata/                   # Stata do-files
│   ├── python/                  # Python scripts
│   └── r/                       # R scripts
├── slides/                      # Presentation slides (Beamer)
└── templates/                   # Paper, do-file, response templates
```

---

## Quality Thresholds

| Score | Gate | Meaning |
|-------|------|---------|
| 80 | Commit | Good enough to save |
| 90 | Submission | Ready for journal or circulation |
| 95 | Excellence | Aspirational |

---

## Skills Quick Reference

| Command | What It Does |
|---------|-------------|
| `/compile-latex [file]` | Compile LaTeX document (paper or slides) |
| `/create-paper [name]` | Scaffold new research paper with all supporting files |
| `/create-tables [desc]` | Generate publication-ready LaTeX tables from Stata output |
| `/review-paper [file]` | Comprehensive manuscript review (referee-style) |
| `/review-stata [file]` | Stata code quality review |
| `/research-excellence [file]` | Combined multi-agent review (econometrics + paper + proofread + replication) |
| `/replication-check [file]` | Verify paper numbers match generated output |
| `/referee-response [file]` | Draft point-by-point referee response letter |
| `/lit-review [topic]` | Literature search + synthesis |
| `/research-ideation [topic]` | Research questions + empirical strategies |
| `/interview-me [topic]` | Interactive research interview |
| `/data-analysis [dataset]` | End-to-end Stata analysis |
| `/commit [msg]` | Stage, commit, PR, merge |

---

## Research Paper Template Style

All papers follow the format in `templates/paper_template.tex`:
- **12pt article** class, Times font (newtxtext + newtxmath)
- **1-inch margins**, double-spaced for submission
- **Citations:** `natbib` with `\citet`/`\citep`, `aer` bibliography style
- **Tables:** `booktabs` + `threeparttable`, `\input{}` from `output/tables/`
- **Figures:** `\includegraphics{}` from `output/figures/`, caption below
- **Cross-refs:** `tab:`, `fig:`, `eq:`, `sec:` label prefixes
- **Structure:** Introduction, Literature, Data, Empirical Strategy, Results, Robustness, Conclusion

## Data Management

- **Raw data** in `data/raw/` is gitignored and NEVER modified
- **Processed data** in `data/processed/` is produced by scripts only
- **Codebooks** in `data/codebooks/` document every variable
- **Sample construction** must be documented with observation counts at each step
- See `.claude/rules/data-management.md` for full conventions

---

## Current Project State

| Paper | File | Status | Key Results |
|-------|------|--------|-------------|
| [Paper 1] | `papers/drafts/[name].tex` | [Draft/Revision/Submitted] | [Brief description] |

| Analysis | Script | Status | Output |
|----------|--------|--------|--------|
| [Analysis 1] | `scripts/stata/[name].do` | [Draft/Verified/Replicated] | [Tables/figures produced] |
