---
paths:
  - "Slides/**/*.tex"
  - "scripts/**/*.do"
---

# Task Completion Verification Protocol

**At the end of EVERY task, Claude MUST verify the output works correctly.** This is non-negotiable.

## For LaTeX/Beamer Slides:
1. Compile with pdfLaTeX (`pdflatex` or `latexmk -pdf`) and check for errors
2. Open the PDF to verify figures render
3. Check for overfull hbox warnings
4. Verify preamble matches `templates/beamer_template.tex` (16:9, dark red, newtxtext/newtxmath)

## For Stata Do-Files:
1. Run the do-file
2. Verify output files (.dta, .png) were created
3. Spot-check estimates for reasonable magnitude

## Common Pitfalls:
- **Assuming success**: Always verify output files exist AND contain correct content

## Verification Checklist:
```
[ ] Output file created successfully
[ ] No compilation/run errors
[ ] Images/figures display correctly
[ ] Reported results to user
```