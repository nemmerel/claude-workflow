---
paths:
  - "papers/**/*.tex"
  - "output/tables/**/*.tex"
---

# Paper Writing Conventions

## Document Structure

Standard economics paper structure:
1. **Introduction** — question, contribution, preview of results, roadmap
2. **Literature Review** (or embedded in intro) — positioning, contribution differentiation
3. **Institutional Background / Data** — data sources, sample construction, summary statistics
4. **Empirical Strategy** — identification, estimand, estimation, threats
5. **Results** — main findings, interpretation, magnitudes
6. **Robustness** — alternative specifications, placebo tests, bounds
7. **Conclusion** — summary, limitations, policy implications

## LaTeX Conventions

- **Document class:** `\documentclass[12pt]{article}`
- **Font:** Times New Roman via `newtxtext` + `newtxmath`
- **Margins:** 1 inch (`geometry` package)
- **Spacing:** Double-spaced for submission (`setspace` package), single for working paper
- **Citations:** `natbib` with `\citet{}` (author as subject) and `\citep{}` (parenthetical)
- **Bibliography style:** `aer` (or journal-specific)

## Cross-Reference Naming

| Type | Prefix | Example |
|------|--------|---------|
| Table | `tab:` | `\label{tab:main_results}` |
| Figure | `fig:` | `\label{fig:event_study}` |
| Equation | `eq:` | `\label{eq:did_specification}` |
| Section | `sec:` | `\label{sec:identification}` |
| Appendix Table | `tab:a_` | `\label{tab:a_robustness}` |
| Appendix Figure | `fig:a_` | `\label{fig:a_placebo}` |

## Table Conventions

- Use `booktabs` (`\toprule`, `\midrule`, `\bottomrule`) — no vertical lines
- `\input{}` tables from `output/tables/` — never hardcode table content in the paper
- Standard notes format below each table:
  ```latex
  \begin{tablenotes}[flushleft]\footnotesize
  \item \textit{Notes:} [Description]. Standard errors clustered at [level]
  in parentheses. * p<0.10, ** p<0.05, *** p<0.01.
  \end{tablenotes}
  ```
- Consistent decimal places within columns (typically 3 for coefficients)
- Comma separators for N > 999

## Figure Conventions

- `\includegraphics{}` from `output/figures/`
- Caption below figure
- Source notes below caption when applicable
- Width: `\textwidth` for single-column, `0.48\textwidth` side-by-side
- Format: PDF preferred (vector), PNG for raster images (300+ DPI)

## Abstract

- Target: 100-150 words (AER/QJE), up to 200 (Econometrica)
- Must contain: question, method, main finding, contribution
- No citations, no equations, no acronyms without definition
- JEL codes and keywords below abstract

## Style Guide

- Avoid contractions (don't → do not)
- Define acronyms on first use: "difference-in-differences (DID)"
- Numbers: spell out one through nine, use numerals for 10+
- Percent vs percentage point: be precise
- "significant" always means statistically significant — use "substantial" or "large" for magnitude
