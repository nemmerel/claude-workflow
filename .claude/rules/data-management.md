---
paths:
  - "data/**"
  - "scripts/**/*.do"
---

# Data Management Conventions

## Directory Structure

```
data/
├── raw/          # Original, untouched data files (NEVER modify)
├── processed/    # Cleaned, merged, analysis-ready datasets
└── codebooks/    # Variable documentation and sample construction narratives
```

## Raw Data Immutability

- **NEVER modify files in `data/raw/`.** This is the single source of truth.
- All cleaning, recoding, and merging happens in scripts that read from `raw/` and write to `processed/`.
- Document the exact source, download date, and version of each raw dataset.
- Raw data should NOT be committed to git (it's in `.gitignore`). Document how to obtain it.

## Codebook Requirements

Every analysis dataset in `data/processed/` must have a corresponding codebook in `data/codebooks/`:

- Variable name, type, label, and description
- Value ranges or categories
- Missing value coding and rates
- Units (dollars, thousands, log points, etc.)
- Source variable from raw data
- Any transformations applied

## Sample Construction

Document every sample restriction with observation counts:

```
Raw data:              N = 100,000
  Drop missing income:  N = 95,000  (-5,000)
  Restrict to age 25-64: N = 72,000 (-23,000)
  Drop outliers (>99th): N = 71,280  (-720)
Final analysis sample:  N = 71,280
```

## Variable Naming

- `snake_case` for all variables
- Prefix conventions:
  - `d_` for dummies/indicators
  - `ln_` for log-transformed
  - `l_` for lagged
  - `f_` for forward/lead
  - `z_` for standardized
  - `w_` for weights
- Suffixes: `_orig` for original, `_clean` for cleaned

## Sensitive Data

- Never commit PII (names, SSN, addresses) to git
- Use encrypted storage for restricted-use data
- Document IRB approval and data use agreements in `data/README.md`
- Flag any variables that could be re-identifying

## Reproducibility

- All data transformations must be scripted (no manual Excel edits)
- Scripts must be runnable from raw data to final analysis dataset
- Record Stata/R/Python versions and package versions used
- Set seed for any stochastic operations (imputation, bootstrap, simulation)
