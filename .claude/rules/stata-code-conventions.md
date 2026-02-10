---
paths:
  - "scripts/**/*.do"
---

# Stata Code Standards

**Standard:** Senior Principal Data Engineer + PhD researcher quality

---

## 1. Reproducibility

- `set seed` called ONCE at top (YYYYMMDD format)
- `version` set at top for cross-version reproducibility
- All paths relative to project root


## 2. Program Design

- `snake_case` naming, verb-noun pattern
- Comment header documenting purpose, inputs, outputs
- Default parameters via `syntax`, no magic numbers



## 3. Visual Identity


### Custom Scheme


### Figure Dimensions for Beamer



## 4. Code Quality Checklist

```
[ ] Set seed once at top
[ ] Version set at top
[ ] All paths relative
[ ] Programs documented
[ ] Figures: explicit dimensions
[ ] Comments explain WHY not WHAT
```
