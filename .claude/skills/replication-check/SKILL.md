---
name: replication-check
description: Run the replication auditor to verify that numbers in a manuscript match generated output from analysis scripts
disable-model-invocation: true
argument-hint: "[paper name or path to .tex file]"
allowed-tools: ["Read", "Grep", "Glob", "Write", "Bash", "Task"]
---

# Replication Check

Verify that all numerical claims in a manuscript match the actual output from analysis code.

**Input:** `$ARGUMENTS` — paper name or path to `.tex` file.

---

## Steps

1. **Locate the manuscript.** Search in order:
   - Direct path from `$ARGUMENTS`
   - `papers/drafts/$ARGUMENTS.tex`
   - `papers/submissions/$ARGUMENTS.tex`

2. **Delegate to the replication-auditor agent:**

   ```
   Delegate to the replication-auditor agent:
   "Audit the manuscript at [PATH]. Compare all numerical claims against
   output in output/tables/, output/logs/, and any replication targets
   in quality_reports/. Use tolerance thresholds from
   .claude/rules/quality-gates.md."
   ```

3. **Present summary of results:**
   - Total numbers checked
   - PASS / FAIL counts
   - Any numbers that could not be verified
   - Location of the full audit report

4. **If failures found:**
   - List each failed target with paper value vs generated value
   - Suggest which script to investigate
   - Flag whether this is likely a rounding issue or a real discrepancy
