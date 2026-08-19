<h1 align="center">
  <br>
  🧰 code-kit
  <br>
</h1>

<h4 align="center">Shared coding resources for agents, projects, and local tooling</h4>

<p align="center">
  <a href="./LICENSE">
    <img src="https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square" alt="License">
  </a>
  <a href="https://github.com/luastoned/code-kit">
    <img src="https://img.shields.io/badge/resources-shared-success.svg?style=flat-square" alt="Shared resources">
  </a>
</p>

<p align="center">
  <a href="#-features">Features</a> •
  <a href="#-agent-native-workflows">Agent-Native Workflows</a> •
  <a href="#-contents">Contents</a> •
  <a href="#-repository-flow">Repository Flow</a> •
  <a href="#-install">Install</a> •
  <a href="#-skill-catalog">Skill Catalog</a> •
  <a href="#-usage">Usage</a> •
  <a href="#-maintenance">Maintenance</a>
</p>

<br>

## ✨ Features

- 🎯 **Canonical home** — Keep reusable guidance, formatter defaults, references, and portable agent skills in one place.
- 🧭 **Agent-ready guidance** — Store downstream `AGENTS.md` templates and language guides that can be adapted into project-specific instructions.
- 🔧 **Shared tooling defaults** — Version common Oxc, TypeScript, and package script defaults without duplicating them across individual repositories.
- 🤖 **Agent-native workflows** — Use OutcomeFlow, ChangeShape, and EvidenceProbe together or as independent methods.
- 🧩 **Portable skills** — Reuse explicit workflows for synchronization, refactoring, documentation, design systems, interviews, session handoffs, and migrations.
- 🔁 **Safe synchronization** — Merge guidance and configuration into target projects while preserving local conventions.
- 🔀 **Repository flow** — See how canonical resources are maintained, validated, installed, synchronized, and adapted into downstream projects.
- ✅ **Repeatable validation** — Check skills, metadata, configs, formatting, references, links, and cross-file consistency with one command.

## 🤖 Agent-Native Workflows

Agent-native delivery preserves human product authority while accounting for the speed, parallelism, and coordination patterns of AI-assisted implementation.

OutcomeFlow guides the choice of what to deliver next. EvidenceProbe resolves consequential uncertainty. ChangeShape governs production-change execution. EvidenceProbe and ChangeShape can each be used independently.

Projects can adopt these methods directly or use the bundled skills. Adoption skills adapt durable workflow behavior to an existing project; run skills apply a method to the current decision or task.

### When to Use Each Workflow

| Situation                                          | Use                                                             |
| -------------------------------------------------- | --------------------------------------------------------------- |
| Choose and sequence product outcomes               | OutcomeFlow                                                     |
| Implement an already selected software change      | ChangeShape                                                     |
| Resolve one consequential uncertainty              | EvidenceProbe                                                   |
| Uncertainty blocks OutcomeFlow or ChangeShape      | EvidenceProbe, then return to the originating workflow          |
| Make a trivial change with no meaningful ambiguity | No extra ceremony; ChangeShape treats it as Direct when adopted |

OutcomeFlow and ChangeShape are normally adopted once and then followed through ordinary project requests. EvidenceProbe is invoked when a specific consequential decision needs bounded evidence.

### Example Usage

Adopt OutcomeFlow for ongoing product delivery and its supporting methods:

```text
Use $adopt-outcome-flow to adapt this project to OutcomeFlow.
```

Adopt ChangeShape without the broader product-delivery framework:

```text
Use $adopt-change-shape to add ChangeShape to this repository.
```

Run EvidenceProbe for one blocked decision:

```text
Use $run-evidence-probe to determine whether the current storage model can safely support offline synchronization.
```

### OutcomeFlow

[OutcomeFlow](./docs/workflows/outcome-flow.md) is a draft agent-native product delivery framework for one person acting as product owner and developer. It guides outcome selection, routes blocked decisions through EvidenceProbe, delegates production execution to ChangeShape, and uses observed effects to reconsider direction.

OutcomeFlow limits execution concurrency by human attention and integration capacity rather than agent availability. Delivered outcomes can await delayed evidence through explicit decision triggers without blocking independent delivery. Initiatives remain optional. The framework avoids comprehensive backlogs and task trees and separates canonical, coordination, and operational state.

OutcomeFlow remains in code-kit during its `0.x` incubation. Use `$adopt-outcome-flow` to audit or adapt the framework without imposing a generic roadmap or document tree.

### ChangeShape

[ChangeShape](./docs/workflows/change-shape.md) is the execution method used by OutcomeFlow and can also be adopted independently. It evaluates ambiguity, blast radius, recovery risk, coordination, and verification instead of estimating effort from time, story points, or file count.

Direct and Scoped work stay lightweight. Shaped work records only the boundaries and decisions that must survive. Initiatives remain strategic direction and are delivered through independently valuable Shaped slices. Use `$adopt-change-shape` to audit a repository or adapt the workflow without imposing fixed filenames or a generic documentation tree.

### EvidenceProbe

[EvidenceProbe](./docs/workflows/evidence-probe.md) is a draft agent-native method for resolving consequential uncertainty with bounded evidence. It frames one decision, selects the smallest discriminating probe, reports observed evidence and residual uncertainty, and leaves the consequential choice with the human owner.

EvidenceProbe ends with decision-ready evidence or an explicit inconclusive result, not production integration. It can operate independently, resolve a decision that blocks OutcomeFlow selection or reconsideration, or investigate ambiguity before ChangeShape. The method remains in code-kit during its `0.x` incubation. Use `$run-evidence-probe` to apply it to one consequential uncertainty.

## 📦 Contents

| Path          | Purpose                                                                                                                     |
| ------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `configs/`    | Shared config fragments for Oxc, TypeScript path aliases, and package scripts.                                              |
| `guidance/`   | Reusable downstream agent guidance, language guides, and local overlays.                                                    |
| `references/` | Structured reference data reused across projects.                                                                           |
| `skills/`     | Shareable agent skills for workflow adoption, syncs, refactors, technical writing, design docs, interviews, and migrations. |
| `scripts/`    | Repository validation and collision-safe skill installation helpers.                                                        |
| `docs/`       | Agent-native workflows, repository flow diagrams, links, and other durable reference material.                              |

## 🔀 Repository Flow

[Repository Flow](./docs/repository-flow.md) shows how shared changes move through formatting, validation, and review. It also shows how guidance, configs, skills, workflows, and references connect to agent runtimes and downstream repositories.

## 📥 Install

Clone this repo somewhere stable:

```bash
git clone https://github.com/luastoned/code-kit.git
cd code-kit
```

`code-kit` is not installed as a project dependency. Its files are copied, merged, or symlinked into local tooling where needed.

### Install Skills

The `skills/` directory is the canonical home for bundled skills. Each skill is a directory with a `SKILL.md` entrypoint and YAML frontmatter. This structure is portable across agent runtimes that support it.

Bundled task skills are explicit-only. Invoke one by name, usually with `$skill-name`; installation alone does not activate it.

Run the installer from the `code-kit` checkout to link every skill into one or both supported runtimes:

```bash
./scripts/install-skills.sh codex
./scripts/install-skills.sh claude
./scripts/install-skills.sh all
```

On Windows, run the equivalent PowerShell installer:

```powershell
.\scripts\install-skills.ps1 codex
.\scripts\install-skills.ps1 claude
.\scripts\install-skills.ps1 all
```

Pass skill names after the runtime to install only a selected set:

```bash
./scripts/install-skills.sh codex session-state interview-me create-design-md
./scripts/install-skills.sh all sync-agent-guidance sync-project-configs
```

The PowerShell installer accepts the same runtime and optional skill arguments.

The installers:

- create the runtime skills directory when needed
- refresh existing links
- refuse to overwrite non-symlink files or directories

On Windows, enable Developer Mode or use an elevated PowerShell session if symbolic-link creation requires permission.

For usage, run `./scripts/install-skills.sh --help`, `.\scripts\install-skills.ps1 --help`, or `Get-Help .\scripts\install-skills.ps1`. If the runtime does not discover a linked skill, start a new session.

## 🧭 Skill Catalog

| Skill                       | Purpose                                                                                            |
| --------------------------- | -------------------------------------------------------------------------------------------------- |
| `$adopt-outcome-flow`       | Audit or adopt OutcomeFlow with EvidenceProbe decisions and ChangeShape execution.                 |
| `$adopt-change-shape`       | Audit or adopt a change-shaped, low-documentation project workflow.                                |
| `$run-evidence-probe`       | Resolve one consequential decision through the smallest trustworthy evidence.                      |
| `$sync-agent-guidance`      | Adapt language-first `AGENTS.md` guidance while preserving project rules and ownership boundaries. |
| `$sync-project-configs`     | Merge shared formatter, linter, TypeScript, and package defaults into a target project.            |
| `$migrate-typescript`       | Audit and migrate a project for TypeScript 6.0+ compatibility and TypeScript 7 preparation.        |
| `$polish-readme`            | Create or refresh a friendly, accurate, emoji-accented project README.                             |
| `$refine-technical-writing` | Audit or rewrite technical prose without changing its meaning or established voice.                |
| `$refactor-code`            | Conservatively refactor selected files using the nearest project guidance.                         |
| `$session-state`            | Save, restore, or consume a concise handoff without duplicating workflow state.                    |
| `$create-design-md`         | Create or update a `DESIGN.md` system from a webpage, project evidence, or design brief.           |
| `$interview-me`             | Clarify consequential intent through a focused interview before planning or implementation.        |

Invoke a skill explicitly in the request, for example: `Use $refactor-code on src/example.ts.`

## 💡 Usage

### Guidance and Configs

`guidance/AGENTS.md` is the downstream entrypoint. It maps languages and runtimes to the reusable guides in `guidance/`.
Private or personal overlays can live under `guidance/private/`. Files there are ignored by git, so local mappings and non-public guidance stay local.

Invoke the sync skills to adapt these resources into a target project instead of symlinking shared guidance or configs directly:

```text
Use $sync-agent-guidance to adapt mapped language and repository guidance to this project.
Use $sync-project-configs to sync shared config files into this project.
```

Both workflows inspect the target first, preserve local conventions, and report conflicts. They keep project-specific choices until those choices have been evaluated.

### Session State

Invoke `$session-state` with the intended mode. It reuses established workflow coordination when applicable. For `AGENTS_STATE.md`, reading keeps the handoff by default, while consuming deletes it only after a successful load:

```text
Use $session-state to update AGENTS_STATE.md with the current session handoff.
Use $session-state to continue from AGENTS_STATE.md.
Use $session-state to consume AGENTS_STATE.md and delete it after loading.
```

When OutcomeFlow or ChangeShape already provides persistent coordination for active work, reuse that coordination state instead of creating a parallel `AGENTS_STATE.md` file.

### References

`references/gitmojis.json` follows the [Gitmoji API](https://gitmoji.dev/api/gitmojis) shape and provides a local lookup for commit tooling and agent workflows.
Copy files from `references/` intentionally when a target workflow needs them.

## 🛠️ Maintenance

Run the repository validator after changing shared resources:

```bash
python3 scripts/validate.py
```

The validator requires local `oxfmt`, `oxlint`, and the `$skill-creator` `quick_validate.py`; set `SKILL_VALIDATOR` when that script is installed in a non-standard location. It also runs ShellCheck and checks the PowerShell installer help path when those tools are available.

- Keep root `AGENTS.md` focused on working in this repo.
- Keep downstream agent instructions in `guidance/`.
- Keep private overlays in `guidance/private/`; do not publish sensitive or personal project guidance.
- Keep reusable tooling defaults in `configs/`.
- Keep structured lookup data in `references/`.
- Keep skill workflows concise and procedural in `skills/*/SKILL.md`.
- Keep the validator passing after editing configs, references, guidance, skills, metadata, or installation instructions.

## 📄 License

[MIT](./LICENSE) License © 2026 [Gregor Steiner](https://github.com/luastoned)
