---
name: referee-response
description: Draft a point-by-point referee response letter from a referee report. Parses comments, drafts responses, and generates a formatted LaTeX response letter.
disable-model-invocation: true
argument-hint: "[path to referee report, e.g., 'papers/referee_responses/R1_report.pdf']"
allowed-tools: ["Read", "Write", "Grep", "Glob"]
---

# Referee Response Drafting

Parse a referee report and draft a structured, point-by-point response letter.

**Input:** `$ARGUMENTS` — path to the referee report (PDF, text, or markdown).

---

## Steps

1. **Read the referee report:**
   - If PDF: Read using the Read tool
   - If text/markdown: Read directly
   - Also read the current manuscript to understand what's in the paper

2. **Parse referee comments into categories:**
   - **Major concerns** — substantive issues (identification, data, methods)
   - **Minor concerns** — presentation, clarity, missing references
   - **Specific comments** — line-by-line or section-specific suggestions
   - **Positive remarks** — note what the referee liked

3. **For each comment, draft a response:**

   Structure each response as:
   - **Acknowledge** the concern (never dismiss)
   - **Explain** what was done to address it
   - **Reference** specific changes in the revised manuscript (section, page, table)
   - **If not addressed:** explain why, with reasoning

   Tone guidelines:
   - Professional and grateful, never defensive
   - Specific and concrete (page numbers, table numbers)
   - Show you took the comment seriously even if you disagree

4. **Read the response template:**
   ```
   Read templates/referee-response-template.tex
   ```

5. **Generate the response letter** at `papers/referee_responses/$PAPER_response_R[N].tex`:
   - Use the template format
   - Editor summary letter at top
   - Per-referee sections with quote-then-respond format
   - Color-code references to new manuscript text (blue for additions)

6. **Generate a changes summary** listing all manuscript modifications:
   ```markdown
   ## Summary of Changes
   | # | Change | Location | Referee |
   |---|--------|----------|---------|
   | 1 | Added robustness check for... | Section 5.2, Table A3 | R1, MC2 |
   ```

7. **Report:**
   - Number of comments addressed
   - Any comments that need the author's input (flagged with TODO)
   - Files created
