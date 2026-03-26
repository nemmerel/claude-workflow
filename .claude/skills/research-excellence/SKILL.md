---
name: research-excellence
description: Combined multi-agent review for research papers. Runs econometrics reviewer, paper reviewer, proofreader, and replication auditor in parallel, then synthesizes a combined quality score.
disable-model-invocation: true
argument-hint: "[paper name or path to .tex file]"
allowed-tools: ["Read", "Grep", "Glob", "Write", "Task"]
---

# Research Excellence Review

Run a comprehensive multi-agent review of a research paper. This is the research equivalent of a pre-submission internal review.

**Input:** `$ARGUMENTS` — paper name or path to `.tex` file.

---

## Steps

1. **Locate the manuscript.** Search in order:
   - Direct path from `$ARGUMENTS`
   - `papers/drafts/$ARGUMENTS.tex`
   - `papers/submissions/$ARGUMENTS.tex`

2. **Launch review agents in parallel:**

   **Agent 1: Econometrics Review**
   ```
   Delegate to the econometrics-reviewer agent:
   "Review [PATH] for econometric correctness, identification validity,
   and code-theory alignment."
   ```

   **Agent 2: Paper Review**
   ```
   Delegate to the paper-reviewer agent:
   "Provide a comprehensive manuscript review of [PATH] covering argument
   structure, literature positioning, and writing quality."
   ```

   **Agent 3: Proofreading**
   ```
   Delegate to the paper-proofreader agent:
   "Proofread [PATH] for grammar, typos, consistency, table/figure quality,
   and journal conventions."
   ```

   **Agent 4: Replication Audit** (only if scripts exist)
   ```
   Delegate to the replication-auditor agent:
   "Audit [PATH] against output in output/tables/ and output/logs/."
   ```

3. **Synthesize results.** After all agents complete:
   - Collect all CRITICAL and MAJOR issues
   - Identify overlapping concerns (same issue flagged by multiple agents)
   - Deduplicate findings
   - Assign combined quality score

4. **Compute quality score:**

   Start at 100, deduct:
   | Issue Type | Deduction |
   |-----------|-----------|
   | CRITICAL econometrics issue | -30 |
   | CRITICAL replication failure | -25 |
   | MAJOR identification concern | -15 |
   | MAJOR writing/structure issue | -10 |
   | MINOR issue (any category) | -2 |
   | Replication: unverifiable number | -5 |

5. **Produce combined report** at `quality_reports/[PAPER]_excellence_review.md`:

   ```markdown
   # Research Excellence Review: [Paper]

   **Date:** [YYYY-MM-DD]
   **Quality Score:** [N]/100
   **Gate:** [PASS >= 80 for commit / PASS >= 90 for submission]

   ## Agent Results Summary

   | Agent | Issues | Critical | Major | Minor |
   |-------|--------|----------|-------|-------|
   | Econometrics | N | X | Y | Z |
   | Paper Review | N | X | Y | Z |
   | Proofreading | N | X | Y | Z |
   | Replication | N | X | Y | Z |

   ## Critical Issues (Must Fix)
   [Combined list from all agents]

   ## Major Issues (Should Fix)
   [Combined list]

   ## Minor Issues
   [Combined list]

   ## Positive Findings
   [What the paper does well]

   ## Recommendation
   [Overall assessment and priority actions]
   ```

6. **Report to user:**
   - Quality score and gate status
   - Number of critical/major/minor issues
   - Top 3 priority actions
   - Links to individual agent reports
