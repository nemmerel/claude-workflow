---
name: compile-latex
description: Compile a LaTeX document (research paper or slides) with pdfLaTeX (3 passes + bibtex). Auto-detects document location.
disable-model-invocation: true
argument-hint: "[filename without .tex extension, optionally with path]"
allowed-tools: ["Read", "Bash", "Glob"]
---

# Compile LaTeX Document

Compile a LaTeX document using pdfLaTeX with full citation resolution.

## Steps

1. **Locate the file.** Search in order:
   - Direct path from `$ARGUMENTS` (if includes `/`)
   - `papers/drafts/$ARGUMENTS.tex`
   - `papers/submissions/$ARGUMENTS.tex`
   - `slides/$ARGUMENTS.tex`

2. **Compile with 3-pass sequence** from the file's directory:

```bash
cd [DIRECTORY]
TEXINPUTS=../../preambles:$TEXINPUTS pdflatex -interaction=nonstopmode $ARGUMENTS.tex
BIBINPUTS=../../:$BIBINPUTS bibtex $ARGUMENTS
TEXINPUTS=../../preambles:$TEXINPUTS pdflatex -interaction=nonstopmode $ARGUMENTS.tex
TEXINPUTS=../../preambles:$TEXINPUTS pdflatex -interaction=nonstopmode $ARGUMENTS.tex
```

**Alternative (latexmk):**
```bash
cd [DIRECTORY]
TEXINPUTS=../../preambles:$TEXINPUTS BIBINPUTS=../../:$BIBINPUTS latexmk -pdf -interaction=nonstopmode $ARGUMENTS.tex
```

**Note:** Adjust `../` depth based on actual directory nesting relative to project root.

3. **Check for warnings:**
   - Grep output for `Overfull \\hbox` warnings
   - Grep for `undefined citations` or `Label(s) may have changed`
   - Report any issues found

4. **Open the PDF** for visual verification:
   ```bash
   open [DIRECTORY]/$ARGUMENTS.pdf
   ```

5. **Report results:**
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
- **Template:** New papers should follow the style in `templates/paper_template.tex`
- **TEXINPUTS** is required if shared preambles live in a separate directory
- **BIBINPUTS** is required if your `.bib` file lives outside the document directory
