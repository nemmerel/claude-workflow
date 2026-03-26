# Claude Code Economic Research Template

> A ready-to-fork starter kit for economists using [Claude Code](https://code.claude.com/docs/en/overview) for empirical research projects. Covers the full research lifecycle: literature review, data analysis, paper writing, submission, and referee responses.

**Live site:** [https://github.com/nemmerel/cresearch](https://github.com/nemmerel/cresearch)

You describe what you want; Claude plans the approach, runs specialized agents, fixes issues, verifies quality, and presents results -- like a contractor who handles the entire job.

---

## Quick Start (5 minutes)

### 1. Fork & Clone

```bash
git clone https://github.com/YOUR_USERNAME/cresearch.git my-research-project
cd my-research-project
```

### 2. Start Claude Code and Paste This Prompt

```bash
claude
```

**Using VS Code? Highly recommended.** Open the terminal in VS Code and type `claude`.

Then paste the following, filling in your project details:

> I am starting to work on **[PROJECT NAME]** in this repo. **[Describe your research project in 2-3 sentences -- what question you're answering, what data you're using, what methods you're applying.]**
>
> I want our collaboration to be structured, precise, and rigorous. All output must be publication-ready.
>
> I've set up the Claude Code economic research workflow (forked from `https://github.com/nemmerel/cresearch`). The configuration files are already in this repo. Please read them, understand the workflow, and then **update all configuration files to fit my project** -- fill in placeholders in `CLAUDE.md`, adjust the knowledge base for my field, and propose any customizations.
>
> After that, use the plan-first workflow for all non-trivial tasks. Once I approve a plan, switch to contractor mode -- coordinate everything autonomously and only come back to me when there's ambiguity or a decision to make.
>
> Enter plan mode and start by adapting the workflow configuration for this project.

---

## How It Works

### Contractor Mode

You describe a task. Claude plans the approach, implements it, runs specialized review agents, fixes issues, re-verifies, and scores against quality gates -- all autonomously. You see a summary when the work meets quality standards.

### Specialized Agents

Instead of one general-purpose reviewer, focused agents each check one dimension:

- **econometrics-reviewer** -- identification strategy, specification, robustness
- **paper-reviewer** -- argument structure, literature positioning, writing quality
- **paper-proofreader** -- grammar, typos, table/figure quality, journal conventions
- **stata-reviewer** -- Stata code quality, reproducibility, domain correctness
- **replication-auditor** -- verify paper numbers match generated output
- **data-documentation** -- codebooks, variable descriptions, sample construction
- **research-verifier** -- end-to-end verification (do-files run, LaTeX compiles, outputs exist)

The `/research-excellence` skill runs the key agents in parallel for a comprehensive pre-submission review.

### Quality Gates

Every file gets a score (0-100). Scores below threshold block the action:
- **80** -- commit threshold
- **90** -- submission threshold (journal-ready)
- **95** -- excellence (aspirational)

---

## What's Included

<details>
<summary><strong>7 agents, 13 skills, 15 rules, 4 hooks</strong> (click to expand)</summary>

### Agents (`.claude/agents/`)

| Agent | What It Does |
|-------|-------------|
| `econometrics-reviewer` | Identification strategy, specification, robustness, code-theory alignment |
| `paper-reviewer` | Comprehensive manuscript review (referee-style, 6 dimensions) |
| `paper-proofreader` | Grammar, typos, consistency, table/figure quality, journal conventions |
| `stata-reviewer` | Stata code quality, reproducibility, and domain correctness |
| `replication-auditor` | Verify paper numbers match Stata output with tolerance thresholds |
| `data-documentation` | Generate codebooks, trace sample construction, audit documentation |
| `research-verifier` | End-to-end verification (compilation, execution, output existence) |

### Skills (`.claude/skills/`)

| Skill | What It Does |
|-------|-------------|
| `/compile-latex` | Compile LaTeX document (paper or slides) with pdfLaTeX + bibtex |
| `/create-paper` | Scaffold new research paper with manuscript, do-file, and output dirs |
| `/create-tables` | Generate publication-ready LaTeX tables from Stata output |
| `/review-paper` | Comprehensive manuscript review with referee objections |
| `/review-stata` | Stata code quality review |
| `/research-excellence` | Combined multi-agent review (econometrics + paper + proofread + replication) |
| `/replication-check` | Verify paper numbers match generated output |
| `/referee-response` | Draft point-by-point referee response letter |
| `/lit-review` | Literature search, synthesis, and gap identification |
| `/research-ideation` | Generate research questions and empirical strategies |
| `/interview-me` | Interactive interview to formalize a research idea |
| `/data-analysis` | End-to-end Stata analysis with publication-ready output |
| `/commit` | Stage, commit, create PR, and merge to main |

### Rules (`.claude/rules/`)

**Always-on** (load every session):

| Rule | What It Enforces |
|------|-----------------|
| `plan-first-workflow` | Plan mode for non-trivial tasks + context preservation |
| `orchestrator-protocol` | Contractor mode: implement -> verify -> review -> fix -> score |
| `session-logging` | Three logging triggers: post-plan, incremental, end-of-session |

**Path-scoped** (load only when working on matching files):

| Rule | Triggers On | What It Enforces |
|------|------------|-----------------|
| `verification-protocol` | `papers/**/*.tex`, `*.do` | Task completion checklist |
| `quality-gates` | `papers/**/*.tex`, `*.do` | 80/90/95 scoring + tolerance thresholds |
| `paper-writing-conventions` | `papers/**/*.tex` | LaTeX article conventions, table/figure formatting |
| `data-management` | `data/**`, `*.do` | Raw data immutability, codebook requirements |
| `stata-code-conventions` | `*.do` | Stata coding standards |
| `replication-protocol` | `*.do`, `output/**` | Replicate original results before extending |
| `orchestrator-research` | `*.do`, `explorations/**` | Simple orchestrator for research (no multi-round reviews) |
| `proofreading-protocol` | `papers/**/*.tex` | Propose-first, then apply with approval |
| `pdf-processing` | `master_supporting_docs/` | Safe large PDF handling |
| `research-knowledge-base` | `papers/**/*.tex`, `*.do` | Estimand registry, notation, reference papers |
| `exploration-folder-protocol` | `explorations/` | Structured sandbox for experimental work |
| `exploration-fast-track` | `explorations/` | Lightweight exploration workflow (60/100 threshold) |

### Hooks (`.claude/hooks/`)

| Hook | What It Does |
|------|-------------|
| `notify.sh` | Desktop notifications on permission/auth events |
| `protect-files.sh` | Block edits to protected files (bibliography, settings) |
| `pre-compact.sh` | Save context snapshot before compression |
| `log-reminder.py` | Block stopping until session log is updated |

### Templates (`templates/`)

| Template | Purpose |
|----------|---------|
| `paper_template.tex` | LaTeX article template (12pt, Times, natbib, booktabs) |
| `do-file-template.do` | Stata do-file with proper header and section structure |
| `referee-response-template.tex` | Point-by-point referee response letter |
| `replication-plan.md` | Replication planning template with targets table |
| `session-log.md` | Session documentation template |
| `quality-report.md` | Merge quality report template |
| `exploration-readme.md` | Exploration folder initialization |
| `archive-readme.md` | Completed/abandoned exploration documentation |

</details>

---

## Research Workflow

The template supports the full research lifecycle:

```
Literature Review (/lit-review)
    |
Research Design (/research-ideation, /interview-me)
    |
Data Analysis (/data-analysis, /review-stata)
    |
Paper Writing (/create-paper, /compile-latex)
    |
Internal Review (/research-excellence)
    |
Submission (/compile-latex)
    |
Referee Response (/referee-response)
    |
Revision (repeat review cycle)
```

---

## Prerequisites

| Tool | Required For | Install |
|------|-------------|---------|
| [Claude Code](https://code.claude.com/docs/en/overview) | Everything | `npm install -g @anthropic-ai/claude-code` |
| pdfLaTeX | Paper compilation | [TeX Live](https://tug.org/texlive/) or [MacTeX](https://tug.org/mactex/) |
| Stata | Data analysis | [stata.com](https://www.stata.com/) |
| [gh CLI](https://cli.github.com/) | PR workflow | `brew install gh` (macOS) |
| R (optional) | Supplementary analysis | [r-project.org](https://www.r-project.org/) |

Not all tools are needed -- install only what your project uses. Claude Code is the only hard requirement.

---

## Adapting for Your Field

1. **Fill in the knowledge base** (`.claude/rules/knowledge-base-template.md`) with your estimands, notation, reference papers, and DGP configurations
2. **Customize the paper template** (`templates/paper_template.tex`) with your journal target formatting
3. **Add field-specific Stata pitfalls** to `.claude/rules/stata-code-conventions.md`
4. **Customize the workflow quick reference** (`.claude/WORKFLOW_QUICK_REF.md`) with your non-negotiables and preferences
5. **Set up the exploration folder** (`explorations/`) for preliminary analyses

---

## Additional Resources

- [Claude Code Documentation](https://code.claude.com/docs/en/overview)
- [Writing a Good CLAUDE.md](https://code.claude.com/docs/en/memory) -- official guidance on project memory
- [Pedro Sant'Anna's Claude Code Workflow](https://psantanna.com/claude-code-my-workflow/) -- the original teaching template this is derived from
- [Hugo Sant'Anna's Clo-Author](https://hsantanna.org/clo-author/) -- a related research publication pipeline
- [Anton Korinek: AI Agents for Economic Research](https://www.nber.org/papers/w34202) -- NBER working paper on AI-assisted research workflows

---

## Origin

This template is adapted from Pedro Sant'Anna's [Claude Code academic workflow](https://github.com/pedrohcgs/claude-code-my-workflow), originally built for Econ 730: Causal Panel Data at Emory University. It has been reoriented from lecture slide production to the full economic research lifecycle: data analysis, paper writing, submission, and revision.

---

## License

MIT License. Use freely for research, teaching, or any academic purpose.
