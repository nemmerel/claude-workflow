---
name: create-tables
description: Generate publication-ready LaTeX tables from Stata output. Formats with journal-standard conventions (booktabs, significance stars, proper notes).
disable-model-invocation: true
argument-hint: "[description of table, e.g., 'main regression results from output/tables/main_results.csv']"
allowed-tools: ["Read", "Write", "Bash", "Glob", "Grep"]
---

# Create Publication-Ready Tables

Generate LaTeX tables formatted for journal submission from Stata output.

**Input:** `$ARGUMENTS` — description of the table to create, or path to raw output.

---

## Steps

1. **Locate source data.** Check:
   - Direct path from `$ARGUMENTS`
   - `output/tables/` for `.csv`, `.tex`, or `.txt` files
   - Stata log files in `output/logs/` for estimation output

2. **Read and parse the source data:**
   - For `.csv`: parse columns and rows
   - For existing `.tex`: read and reformat
   - For log files: extract estimation tables

3. **Format as publication-ready LaTeX table:**

   Required elements:
   - `\begin{table}[htbp]` with `\centering`
   - `\caption{}` with descriptive title
   - `\label{tab:descriptive_name}`
   - `booktabs` rules (`\toprule`, `\midrule`, `\bottomrule`)
   - Clear column headers with panel labels if needed
   - Coefficients with standard errors in parentheses below
   - Significance stars: `* p<0.10, ** p<0.05, *** p<0.01`
   - Observation count (N) and R-squared
   - Table notes with:
     - Standard error type (e.g., "Clustered at state level")
     - Data source and sample period
     - Any additional notes

   Style conventions:
   - 3 decimal places for coefficients (or match field convention)
   - Comma separators for N > 999
   - Consistent alignment (decimal-aligned if possible)
   - Panel A / Panel B structure for multi-panel tables

4. **Save the table:**
   - LaTeX fragment to `output/tables/[TABLE_NAME].tex`
   - This file should be `\input{}`-able from the paper

5. **Optionally compile a standalone preview:**
   ```bash
   # Create a minimal standalone .tex that inputs the table
   # Compile to PDF for quick visual check
   ```

6. **Report:**
   - Table dimensions (rows x columns)
   - File saved to
   - Any formatting decisions made

## Journal Style Reference

| Journal | Style Notes |
|---------|------------|
| AER | 3 decimal places, clustered SEs default, landscape for wide tables |
| Econometrica | Numbered tables, formal notes, smaller font ok |
| QJE | Similar to AER, compact formatting preferred |
| ReStud | 2-3 decimal places, clean formatting |
| JPE | Compact, essential info only |
