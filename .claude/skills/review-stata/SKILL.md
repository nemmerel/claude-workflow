---
name: review-stata
description: Run the Stata code review protocol on do-files. Checks code quality, reproducibility, domain correctness, and professional standards. Produces a report without editing files.
disable-model-invocation: true
argument-hint: "[filename or 'all' or 'LectureN']"
allowed-tools: ["Read", "Grep", "Glob", "Write", "Task"]
---

# Review Stata Do-Files

Run the comprehensive Stata code review protocol.

## Steps

1. **Identify do-files to review:**
   - If `$ARGUMENTS` is a specific `.do` filename: review that file only
   - If `$ARGUMENTS` is `LectureN`: review all do-files matching that lecture
   - If `$ARGUMENTS` is `all`: review all do-files in `scripts/stata/` and `Figures/*/`

2. **For each do-file, launch the `stata-reviewer` agent** with instructions to:
   - Follow the full protocol in the agent instructions
   - Read `.claude/rules/stata-code-conventions.md` for current standards
   - Save report to `quality_reports/[script_name]_stata_review.md`

3. **After all reviews complete**, present a summary:
   - Total issues found per do-file
   - Breakdown by severity (Critical / High / Medium / Low)
   - Top 3 most critical issues

4. **IMPORTANT: Do NOT edit any Stata source files.**
   Only produce reports. Fixes are applied after user review.