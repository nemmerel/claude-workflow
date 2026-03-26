---
name: create-paper
description: Scaffold a new research paper with LaTeX manuscript, master do-file, replication targets, and output directories
disable-model-invocation: true
argument-hint: "[paper name, e.g., 'returns-to-education']"
allowed-tools: ["Read", "Write", "Bash", "Glob"]
---

# Create New Research Paper

Scaffold all files needed for a new research paper.

**Input:** `$ARGUMENTS` — a short kebab-case name for the paper (e.g., `returns-to-education`).

---

## Steps

1. **Read the paper template:**
   ```
   Read templates/paper_template.tex
   ```

2. **Create the manuscript** at `papers/drafts/$ARGUMENTS.tex`:
   - Copy from template
   - Fill in paper name as title placeholder
   - Update `\input{}` paths to point to `../../output/tables/`
   - Update `\includegraphics{}` paths to point to `../../output/figures/`
   - Update `\bibliography{}` to point to `../../bibliography_base`

3. **Create the master do-file** at `scripts/stata/$ARGUMENTS_master.do`:
   - Read `templates/do-file-template.do` if it exists
   - Fill in paper name, input/output paths
   - Sections: setup, data loading, sample construction, summary stats, main analysis, robustness, tables/figures, export

4. **Create output subdirectories:**
   ```bash
   mkdir -p output/tables/$ARGUMENTS output/figures/$ARGUMENTS
   ```

5. **Initialize replication targets:**
   - Create `quality_reports/$ARGUMENTS_replication_targets.md` with empty target table:
   ```markdown
   ## Replication Targets: [Paper Name]

   | Target | Table/Figure | Value | SE/CI | Notes |
   |--------|-------------|-------|-------|-------|
   | [Fill in as results are generated] | | | | |
   ```

6. **Report what was created:**
   - List all files created
   - Suggest next steps (fill in title/abstract, start data work)
