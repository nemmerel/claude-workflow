* ============================================================
* [Descriptive Title]
* ============================================================
* Author:   [Name]
* Date:     [YYYY-MM-DD]
* Purpose:  [What this do-file does]
* Inputs:   [Data files read]
* Outputs:  [Tables, figures, datasets produced]
* ============================================================

* ----------------------------------------
* 0. Setup
* ----------------------------------------
version 17
clear all
set more off
set seed 20260326

* Project paths (relative to project root)
global root     "."
global data_raw "$root/data/raw"
global data_out "$root/data/processed"
global output   "$root/output"
global tables   "$output/tables"
global figures  "$output/figures"
global logs     "$output/logs"

* Create output directories if needed
capture mkdir "$output"
capture mkdir "$tables"
capture mkdir "$figures"
capture mkdir "$logs"

* Start log
log using "$logs/[script_name]_`c(current_date)'.log", replace

* ----------------------------------------
* 1. Data Loading
* ----------------------------------------

* use "$data_raw/[dataset].dta", clear

* ----------------------------------------
* 2. Sample Construction
* ----------------------------------------

* Document every restriction:
* Raw: N = [count]
* [Restriction 1]: N = [count] (dropped [n])
* [Restriction 2]: N = [count] (dropped [n])
* Final sample: N = [count]

* ----------------------------------------
* 3. Summary Statistics
* ----------------------------------------

* Summary statistics table
* estpost summarize [varlist]
* esttab using "$tables/summary_stats.tex", ///
*     cells("mean(fmt(3)) sd(fmt(3)) min(fmt(1)) max(fmt(1)) count(fmt(0))") ///
*     label replace booktabs

* ----------------------------------------
* 4. Main Analysis
* ----------------------------------------

* Estimation
* reghdfe y treatment [controls], absorb([FE]) cluster([cluster_var])
* estimates store main

* ----------------------------------------
* 5. Robustness Checks
* ----------------------------------------

* Alternative specifications
* Alternative samples
* Placebo tests

* ----------------------------------------
* 6. Tables and Figures
* ----------------------------------------

* Export regression table
* esttab main using "$tables/main_results.tex", ///
*     label replace booktabs ///
*     star(* 0.10 ** 0.05 *** 0.01) ///
*     se(3) b(3) ///
*     stats(N r2, fmt(0 3) labels("Observations" "R-squared")) ///
*     title("Main Results") ///
*     note("Standard errors clustered at [level] in parentheses.")

* Export figures
* twoway (scatter y x), ///
*     title("") ///
*     xtitle("[X Label]") ytitle("[Y Label]")
* graph export "$figures/[figure_name].pdf", replace

* ----------------------------------------
* 7. Export
* ----------------------------------------

* Save analysis dataset
* save "$data_out/[dataset]_analysis.dta", replace

* Close log
log close
