---
name: create-pset
description: Create a graduate-level problem set from scratch. Guides the process from structure proposal through drafting, compilation, and review — ensuring progressive difficulty, scaffolded sub-parts, notation consistency, and solvability.
disable-model-invocation: true
argument-hint: "[Topic or pset number, e.g., 'Pset 3: Synthetic Control' or 'Difference-in-Differences']"
allowed-tools: ["Read", "Grep", "Glob", "Write", "Edit", "Bash", "Task"]
---

# Problem Set Creation Workflow

Create a rigorous, well-scaffolded graduate-level problem set.

**This is a collaborative, iterative process. The instructor drives the vision; Claude is a thinking partner.**

---

## CONSTRAINTS (Non-Negotiable)

1. **Start from `templates/problemset_template.tex`** — copy it to the target path and rename. Never create a problem set from scratch; always inherit the template's preamble (12pt article, Times font, fancyhdr, enumitem, theorem environments)
2. **Read the knowledge base FIRST** — notation registry, narrative arc, applications database
3. Every symbol MUST be checked against the notation registry; no symbol collisions across problems
4. **Progressive difficulty** — problems ordered easier to harder (or grouped by topic with internal escalation)
5. **Scaffolded sub-parts** — hard problems break into guided (a), (b), (c) parts that build toward the final result
6. **All problems self-contained** — each problem provides all information needed to solve it; no "use the result from class" without specifying which result
7. **Clear instructions** — every part states exactly what to do: prove, derive, compute, interpret, explain, or show
8. **Verify solvability** — each problem must be solvable with tools/techniques covered so far
9. **Skill mix** — include derivation, proof, computation, and interpretation; not all problems should be pure algebra
10. **Appropriate length** — target 3-5 problems, 8-15 hours total effort for a PhD student

---

## WORKFLOW

### Phase 0: Intake & Context
- Read knowledge base (`.claude/rules/`) — notation registry, applications, design principles
- Identify which lectures this problem set covers
- Read those lecture `.tex` files to extract notation, key results, and topics
- Inventory any materials the instructor has provided (papers, notes, specific problems to include)

### Phase 1: Structure Proposal
- Propose number of problems (typically 3-5)
- For each problem: topic, type (derivation/proof/computation/interpretation/application), estimated difficulty (Routine/Moderate/Challenging), estimated hours
- Present a difficulty map and skill coverage summary
- Verify the mix: ~30% Routine, ~50% Moderate, ~20% Challenging
- **GATE: User approves structure before drafting**

### Phase 2: Draft Problems (Iterative)
- Copy `templates/problemset_template.tex` → target path (e.g., `slides/PSet03_Topic.tex`)
- Keep the full preamble from the template; replace only `\title`, `\author`, `\date`, and problem content
- Work **problem by problem** — draft one problem, present it for feedback, then move to the next
- For each problem:
  - Write a clear problem stem with all necessary setup (DGP, assumptions, notation)
  - Break into scaffolded sub-parts using `\begin{enumerate}[label=(\alph*)]`
  - Ensure earlier parts produce intermediate results used in later parts
  - Include hints for non-obvious steps
  - Check notation against the knowledge base and previous problems in this pset

### Phase 3: Polish & Compile
- Full pdfLaTeX compilation (`pdflatex` or `latexmk -pdf`)
- Run `graduate-pset-reviewer` agent for holistic review
- Address critical and major issues from the review
- Re-compile and verify clean output

---

## Post-Creation Checklist

```
[ ] Preamble matches templates/problemset_template.tex
[ ] Problem set compiles without errors (pdfLaTeX)
[ ] Notation consistent with lectures and knowledge base
[ ] No symbol collisions across problems
[ ] Progressive difficulty (easier → harder)
[ ] All hard problems have scaffolded sub-parts
[ ] Every problem is self-contained
[ ] Clear instructions on every part (prove/derive/compute/interpret/show)
[ ] Solvability verified — each problem uses only covered techniques
[ ] Skill mix includes derivation, proof, computation, and interpretation
[ ] Appropriate length (3-5 problems, ~8-15 hours total)
[ ] At least one problem connects theory to empirical context
[ ] graduate-pset-reviewer agent run
```
