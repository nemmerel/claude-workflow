# My Claude Code Setup

> **Work in progress.** This is a guide for using Claude Code to write slides for beamer and to produce research.


**Live site:** [https://github.com/nemmerel/claude-workflow](https://github.com/nemmerel/claude-workflow)

A ready-to-fork starter kit for academics using [Claude Code](https://code.claude.com/docs/en/overview) with **LaTeX/Beamer + Stata**. You describe what you want; Claude plans the approach, runs specialized agents, fixes issues, verifies quality, and presents results — like a contractor who handles the entire job.

---

## Quick Start (5 minutes)

### 1. Fork & Clone

```bash
# Fork this repo on GitHub (click "Fork" on the repo page), then:
git clone https://github.com/YOUR_USERNAME/claude-workflow.git my-project
cd my-project
```

Replace `YOUR_USERNAME` with your GitHub username.

### 2. Start Claude Code and Paste This Prompt

```bash
claude
```

**Using VS Code? I highly recommend that you do** Open the terminal in VS Code, and type claude.

Then paste the following, filling in your project details:

> I am starting to work on **[PROJECT NAME]** in this repo. **[Describe your project in 2–3 sentences — what you're building, who it's for, what tools you use.]**
>
> I want our collaboration to be structured, precise, and rigorous. When creating visuals, everything must be polished and publication-ready.
>
> I've set up the Claude Code academic workflow (forked from `https://github.com/nemmerel/claude-workflow`). The configuration files are already in this repo. Please read them, understand the workflow, and then **update all configuration files to fit my project** — fill in placeholders in `CLAUDE.md`, adjust rules if needed, and propose any customizations specific to my use case.
>
> After that, use the plan-first workflow for all non-trivial tasks. Once I approve a plan, switch to contractor mode — coordinate everything autonomously and only come back to me when there's ambiguity or a decision to make.
>
> Enter plan mode and start by adapting the workflow configuration for this project.

**What this does:** Claude reads all the configuration files, fills in your project name, institution, and preferences, then enters contractor mode — planning, implementing, reviewing, and verifying autonomously. You approve the plan and Claude handles the rest.

---

## How It Works

### Contractor Mode

You describe a task. Claude plans the approach, implements it, runs specialized review agents, fixes issues, re-verifies, and scores against quality gates — all autonomously. You see a summary when the work meets quality standards. Say "just do it" and it auto-commits too.

### Specialized Agents

Instead of one general-purpose reviewer, focused agents each check one dimension:

- **proofreader** — grammar/typos
- **slide-auditor** — visual layout
- **pedagogy-reviewer** — teaching quality
- **stata-reviewer** — Stata code quality
- **domain-reviewer** — field-specific correctness (template — customize for your field)

Each is better at its narrow task than a generalist would be. The `/slide-excellence` skill runs them all in parallel.

### Quality Gates

Every file gets a score (0–100). Scores below threshold block the action:
- **80** — commit threshold
- **90** — PR threshold
- **95** — excellence (aspirational)

---

## What's Included

<details>
<summary><strong>7 agents, 14 skills, 14 rules, 4 hooks</strong> (click to expand)</summary>

### Agents (`.claude/agents/`)

| Agent | What It Does |
|-------|-------------|
| `proofreader` | Grammar, typos, overflow, consistency review |
| `slide-auditor` | Visual layout audit (overflow, font consistency, spacing) |
| `pedagogy-reviewer` | 13-pattern pedagogical review (narrative arc, notation density, pacing) |
| `stata-reviewer` | Stata code quality, reproducibility, and domain correctness |
| `tikz-reviewer` | Merciless TikZ diagram visual critique |
| `verifier` | End-to-end task completion verification |
| `domain-reviewer` | **Template** for your field-specific substance reviewer |

### Skills (`.claude/skills/`)

| Skill | What It Does |
|-------|-------------|
| `/compile-latex` | 3-pass pdfLaTeX compilation with bibtex |
| `/proofread` | Launch proofreader on a file |
| `/visual-audit` | Launch slide-auditor on a file |
| `/pedagogy-review` | Launch pedagogy-reviewer on a file |
| `/review-stata` | Launch Stata code reviewer |
| `/slide-excellence` | Combined multi-agent review |
| `/validate-bib` | Cross-reference citations against bibliography |
| `/devils-advocate` | Challenge design decisions before committing |
| `/create-lecture` | Full lecture creation workflow |
| `/commit` | Stage, commit, create PR, and merge to main |
| `/lit-review` | Literature search, synthesis, and gap identification |
| `/research-ideation` | Generate research questions and empirical strategies |
| `/interview-me` | Interactive interview to formalize a research idea |
| `/review-paper` | Manuscript review: structure, econometrics, referee objections |
| `/data-analysis` | End-to-end Stata analysis with publication-ready output |

### Research Workflow

| Feature | What It Does |
|---------|-------------|
| Exploration folder | Structured `explorations/` sandbox with graduate/archive lifecycle |
| Fast-track workflow | 60/100 quality threshold for rapid prototyping |
| Simplified orchestrator | implement → verify → score → done (no multi-round reviews) |
| Enhanced session logging | Structured tables for changes, decisions, verification |
| Merge-only reporting | Quality reports at merge time only |
| Math line-length exception | Long lines acceptable for documented formulas |
| Workflow quick reference | One-page cheat sheet at `.claude/WORKFLOW_QUICK_REF.md` |

### Rules (`.claude/rules/`)

Rules use path-scoped loading: **always-on** rules load every session (~100 lines total); **path-scoped** rules load only when Claude works on matching files.

**Always-on** (no `paths:` frontmatter — load every session):

| Rule | What It Enforces |
|------|-----------------|
| `plan-first-workflow` | Plan mode for non-trivial tasks + context preservation |
| `orchestrator-protocol` | Contractor mode: implement → verify → review → fix → score |
| `session-logging` | Three logging triggers: post-plan, incremental, end-of-session |

**Path-scoped** (load only when working on matching files):

| Rule | Triggers On | What It Enforces |
|------|------------|-----------------|
| `verification-protocol` | `.tex`, `.do` | Task completion checklist |
| `quality-gates` | `.tex`, `*.do` | 80/90/95 scoring + tolerance thresholds |
| `stata-code-conventions` | `*.do` | Stata coding standards |
| `tikz-visual-quality` | `.tex` | TikZ diagram visual standards |
| `pdf-processing` | `master_supporting_docs/` | Safe large PDF handling |
| `proofreading-protocol` | `.tex`, `quality_reports/` | Propose-first, then apply with approval |
| `no-pause-beamer` | `.tex` | No overlay commands in Beamer |
| `replication-protocol` | `*.do` | Replicate original results before extending |
| `knowledge-base-template` | `.tex`, `*.do` | Notation/application registry template |
| `orchestrator-research` | `*.do`, `explorations/` | Simple orchestrator for research (no multi-round reviews) |
| `exploration-folder-protocol` | `explorations/` | Structured sandbox for experimental work |
| `exploration-fast-track` | `explorations/` | Lightweight exploration workflow (60/100 threshold) |

**Templates** (`templates/`) — Beamer slides, problem sets, session logs, quality reports, and exploration READMEs. Not auto-loaded.

</details>

---

## Prerequisites

| Tool | Required For | Install |
|------|-------------|---------|
| [Claude Code](https://code.claude.com/docs/en/overview) | Everything | `npm install -g @anthropic-ai/claude-code` |
| pdfLaTeX | LaTeX compilation | [TeX Live](https://tug.org/texlive/) or [MacTeX](https://tug.org/mactex/) |
| Stata | Data analysis | [stata.com](https://www.stata.com/) |
| [gh CLI](https://cli.github.com/) | PR workflow | `brew install gh` (macOS) |

Not all tools are needed — install only what your project uses. Claude Code is the only hard requirement.

---

## Adapting for Your Field

1. **Customize the Beamer template** (`templates/beamer_template.tex`) with your colors, fonts, and institutional branding — all agents and skills inherit this style
1. **Customize the problem set template** (`templates/problemset_template.tex`) with your institution, author info, and default directions
2. **Fill in the knowledge base** (`.claude/rules/knowledge-base-template.md`) with your notation, applications, and design principles
3. **Customize the domain reviewer** (`.claude/agents/domain-reviewer.md`) with review lenses specific to your field
4. **Add field-specific Stata pitfalls** to `.claude/rules/stata-code-conventions.md`
5. **Customize the workflow quick reference** (`.claude/WORKFLOW_QUICK_REF.md`) with your non-negotiables and preferences
6. **Set up the exploration folder** (`explorations/`) for experimental work

---

## Additional Resources

- [Claude Code Documentation](https://code.claude.com/docs/en/overview)
- [Writing a Good CLAUDE.md](https://code.claude.com/docs/en/memory) — official guidance on project memory

---

## Origin

This infrastructure was extracted from **Econ 730: Causal Panel Data** at Emory University, developed by Pedro Sant'Anna using Claude Code over 6+ sessions. The course produced 6 complete PhD lecture decks with 800+ slides — all managed through this multi-agent workflow.

---

## License

MIT License. Use freely for teaching, research, or any academic purpose.
