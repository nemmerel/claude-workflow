---
name: data-analysis
description: End-to-end Stata data analysis workflow from exploration through regression to publication-ready tables and figures
disable-model-invocation: true
argument-hint: "[dataset path or description of analysis goal]"
allowed-tools: ["Read", "Grep", "Glob", "Write", "Edit", "Bash", "Task"]
---

# Data Analysis Workflow

Run an end-to-end data analysis in Stata: load, explore, analyze, and produce publication-ready output.

**Input:** `$ARGUMENTS` — a dataset path (e.g., `data/county_panel.dta`) or a description of the analysis goal (e.g., "regress wages on education with state fixed effects using CPS data").

---

## Constraints

- **Follow Stata code conventions** in `.claude/rules/stata-code-conventions.md`
- **Save all do-files** to `scripts/stata/` with descriptive names
- **Save all outputs** (figures, tables, datasets) to `output/`
- **Use `save`/`export`** for every computed object
- **Use project scheme** for all figures (check for custom scheme in `.claude/rules/`)
- **Run stata-reviewer** on the generated do-file before presenting results

---

## Workflow Phases

### Phase 1: Setup and Data Loading

1. Read `.claude/rules/stata-code-conventions.md` for project standards
2. Create do-file with proper header (title, author, purpose, inputs, outputs)
3. Set version at top for reproducibility
4. Set seed once at top: `set seed 20260210`
5. Load and inspect the dataset

### Phase 2: Exploratory Data Analysis

Generate diagnostic outputs:
- **Summary statistics:** `summarize`, `tabulate`, missingness rates, variable types
- **Distributions:** Histograms for key continuous variables
- **Relationships:** Scatter plots, correlation matrices
- **Time patterns:** If panel data, plot trends over time (`xtline` or `twoway`)
- **Group comparisons:** If treatment/control, compare pre-treatment means

Save all diagnostic figures to `output/diagnostics/`.

### Phase 3: Main Analysis

Based on the research question:
- **Regression analysis:** Use `reghdfe` for panel data with high-dimensional FE, `reg`/`xtreg` for standard models
- **Standard errors:** Cluster at the appropriate level (document why)
- **Multiple specifications:** Start simple, progressively add controls
- **Effect sizes:** Report standardized effects alongside raw coefficients

### Phase 4: Publication-Ready Output

**Tables:**
- Use `esttab`/`estout` for regression tables (preferred) or `outreg2`
- Include all standard elements: coefficients, SEs, significance stars, N, R-squared
- Export as `.tex` for LaTeX inclusion and `.csv` for quick viewing

**Figures:**
- Use project graph scheme
- Include proper axis labels (sentence case, units)
- Export with explicit dimensions: `graph export, width() height()`
- Save as both `.pdf` and `.png`

### Phase 5: Save and Review

1. `save` / `export` for all key datasets and results
2. Create `output/` subdirectories as needed with `capture mkdir`
3. Run the stata-reviewer agent on the generated do-file:

```
Delegate to the stata-reviewer agent:
"Review the do-file at scripts/stata/[script_name].do"
```

4. Address any Critical or High issues from the review.

---

## Do-File Structure

Follow this template:

```stata
* ============================================================
* [Descriptive Title]
* Author: [from project context]
* Purpose: [What this do-file does]
* Inputs: [Data files]
* Outputs: [Figures, tables, datasets]
* ============================================================

* 0. Setup ----
version 17
clear all
set more off
set seed 20260210

capture mkdir "output/analysis"

* 1. Data Loading ----
* [Load and clean data]

* 2. Exploratory Analysis ----
* [Summary stats, diagnostic plots]

* 3. Main Analysis ----
* [Regressions, estimation]

* 4. Tables and Figures ----
* [Publication-ready output]

* 5. Export ----
* [save datasets, graph export for all figures]
```

---

## Important

- **Reproduce, don't guess.** If the user specifies a regression, run exactly that.
- **Show your work.** Print summary statistics before jumping to regression.
- **Check for issues.** Look for multicollinearity, outliers, perfect prediction.
- **Use relative paths.** All paths relative to project root.
- **No hardcoded values.** Use locals/globals for sample restrictions, date ranges, etc.