---
paths:
  - "papers/**/*.tex"
  - "scripts/**/*.do"
---

# Task Completion Verification Protocol

**At the end of EVERY task, Claude MUST verify the output works correctly.** This is non-negotiable.

## For LaTeX Research Papers:
1. Compile with pdfLaTeX (`pdflatex` or `latexmk -pdf`) and check for errors
2. Verify all `\input{}` table files exist in `output/tables/`
3. Verify all `\includegraphics{}` figure files exist in `output/figures/`
4. Check for overfull hbox warnings and undefined citations
5. Verify PDF was generated

## For Stata Do-Files:
1. Run the do-file
2. Verify output files exist (`.dta` in `data/processed/`, tables in `output/tables/`, figures in `output/figures/`)
3. Check Stata log for errors and warnings
4. Spot-check estimates for reasonable magnitude

## Common Pitfalls:
- **Assuming success**: Always verify output files exist AND contain correct content
- **Table paths**: Ensure `\input{}` paths in paper match actual output locations

## Verification Checklist:
```
[ ] Output file created successfully
[ ] No compilation/run errors
[ ] Tables and figures generated at expected paths
[ ] Replication targets match (if applicable)
[ ] Reported results to user
```