---
name: compile-latex
description: Compile a Beamer LaTeX slide deck with pdfLaTeX (3 passes + bibtex). Use when compiling lecture slides.
disable-model-invocation: true
argument-hint: "[filename without .tex extension]"
allowed-tools: ["Read", "Bash", "Glob"]
---

# Compile Beamer LaTeX Slides

Compile a Beamer slide deck using pdfLaTeX with full citation resolution.

## Steps

1. **Navigate to slides/ directory** and compile with 3-pass sequence:

```bash
cd slides
TEXINPUTS=../preambles:$TEXINPUTS pdflatex -interaction=nonstopmode $ARGUMENTS.tex
BIBINPUTS=..:$BIBINPUTS bibtex $ARGUMENTS
TEXINPUTS=../preambles:$TEXINPUTS pdflatex -interaction=nonstopmode $ARGUMENTS.tex
TEXINPUTS=../preambles:$TEXINPUTS pdflatex -interaction=nonstopmode $ARGUMENTS.tex
```

**Alternative (latexmk):**
```bash
cd slides
TEXINPUTS=../preambles:$TEXINPUTS BIBINPUTS=..:$BIBINPUTS latexmk -pdf -interaction=nonstopmode $ARGUMENTS.tex
```

2. **Check for warnings:**
   - Grep output for `Overfull \\hbox` warnings
   - Grep for `undefined citations` or `Label(s) may have changed`
   - Report any issues found

3. **Open the PDF** for visual verification:
   ```bash
   open slides/$ARGUMENTS.pdf
   ```

4. **Report results:**
   - Compilation success/failure
   - Number of overfull hbox warnings
   - Any undefined citations
   - PDF page count

## Why 3 passes?
1. First pdflatex: Creates `.aux` file with citation keys
2. bibtex: Reads `.aux`, generates `.bbl` with formatted references
3. Second pdflatex: Incorporates bibliography
4. Third pdflatex: Resolves all cross-references with final page numbers

## Important
- **Always use pdfLaTeX** (`pdflatex` or `latexmk -pdf`), not XeLaTeX
- **Template:** New lectures must follow the style in `templates/beamer_template.tex` (16:9, dark red theme, Times New Roman via newtxtext/newtxmath, no navigation symbols, frame-number footer)
- **TEXINPUTS** is required if your Beamer preamble lives in a separate directory
- **BIBINPUTS** is required if your `.bib` file lives outside the slides directory
