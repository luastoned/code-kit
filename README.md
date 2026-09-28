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
</p>

Code-kit stores reusable agent guidance, configuration fragments, explicit task skills, and workflow references. Other projects copy, merge, or link the resources they need; code-kit is not a runtime dependency.

<p align="center">
  <a href="#-contents">Contents</a> •
  <a href="#-install">Install</a> •
  <a href="#-skill-catalog">Skill Catalog</a> •
  <a href="#-agent-native-workflows">Workflows</a> •
  <a href="#-usage">Usage</a> •
  <a href="#-maintenance">Maintenance</a>
</p>

## 📦 Contents

| Path          | Purpose                                                                                       |
| ------------- | --------------------------------------------------------------------------------------------- |
| `guidance/`   | Downstream agent entrypoint, language and operational guides, and private local overlays.     |
| `configs/`    | Reusable Oxc, TypeScript, and package-script fragments.                                       |
| `skills/`     | Explicit workflows for adoption, synchronization, refactoring, writing, design, and handoffs. |
| `docs/`       | Workflow contracts, optional examples, repository flow, and reference links.                  |
| `references/` | Structured lookup data for tools and workflows.                                               |
| `scripts/`    | Validation and collision-safe skill installation.                                             |

## 📥 Install

Clone to a stable location:

```bash
git clone https://github.com/luastoned/code-kit.git
cd code-kit
```

Install the skills you intend to use:

```bash
./scripts/install-skills.sh codex session-state interview-me
./scripts/install-skills.sh all sync-agent-guidance sync-project-configs
```

Use `codex`, `claude`, or `all` to choose runtimes. Omit skill names to link every bundled skill:

```bash
./scripts/install-skills.sh codex
```

On Windows, the PowerShell installer accepts the same arguments:

```powershell
.\scripts\install-skills.ps1 codex session-state interview-me
```

The installers create runtime skill directories, refresh symlinks, and refuse to overwrite ordinary files or directories. Windows symlink creation may require Developer Mode or an elevated shell. Run either installer with `--help` for usage; PowerShell also supports `Get-Help`.

Skills are explicit-only: installation does not activate a workflow or modify a project. Invoke `$skill-name` in a request. Start a new runtime session if a linked skill is not discovered.

Keep the linked code-kit checkout available. Adoption and synchronization skills resolve shared sources relative to it. Copying a skill alone may require providing its source paths; skill-local references and assets must travel with the skill.

## 🧭 Skill Catalog

| Skill                       | Purpose                                                                                     |
| --------------------------- | ------------------------------------------------------------------------------------------- |
| `$adopt-outcome-flow`       | Audit or adopt OutcomeFlow with EvidenceProbe decisions and ChangeShape execution.          |
| `$adopt-change-shape`       | Audit or adopt a change-shaped, low-documentation project workflow.                         |
| `$run-evidence-probe`       | Resolve one consequential decision through the smallest trustworthy evidence.               |
| `$sync-agent-guidance`      | Adapt decision-relevant guidance while preserving project rules and ownership.              |
| `$sync-project-configs`     | Merge shared formatter, linter, TypeScript, and package defaults into a target project.     |
| `$migrate-typescript`       | Audit or migrate to a requested TypeScript version.                                         |
| `$polish-readme`            | Create or refresh an accurate README while preserving project voice.                        |
| `$refine-technical-writing` | Audit or rewrite technical prose without changing its meaning or established voice.         |
| `$refactor-code`            | Conservatively refactor selected files using the nearest project guidance.                  |
| `$session-state`            | Save, restore, or consume a concise handoff without duplicating workflow state.             |
| `$create-design-md`         | Create or update a `DESIGN.md` system from a webpage, project evidence, or design brief.    |
| `$interview-me`             | Clarify consequential intent through a focused interview before planning or implementation. |

Invoke a skill explicitly in the request, for example: `Use $refactor-code on src/example.ts.`

## 🤖 Agent-Native Workflows

These methods are designed for one person acting as product owner and developer. Adapt them to existing ownership and decision authority; installing the skills does not adopt the methods.

| Situation                                                               | Method                                              |
| ----------------------------------------------------------------------- | --------------------------------------------------- |
| Choose outcomes and reconsider their observed effects                   | [OutcomeFlow](./docs/workflows/outcome-flow.md)     |
| Execute an already selected change with risk-proportionate verification | [ChangeShape](./docs/workflows/change-shape.md)     |
| Resolve consequential uncertainty with bounded evidence                 | [EvidenceProbe](./docs/workflows/evidence-probe.md) |

The workflow documents contain compact operating contracts and link optional examples. OutcomeFlow uses ChangeShape or equivalent execution behavior; EvidenceProbe is optional. Routine work needs no extra artifacts or repeated acceptance of decisions already made.

```text
Use $adopt-outcome-flow to adapt this project's delivery workflow.
Use $adopt-change-shape to add execution guidance without OutcomeFlow.
Use $run-evidence-probe to determine whether the storage model supports offline synchronization.
```

Each workflow document carries its version. Adopted guidance records `Version: x.y.z`; rerun the adoption skill to apply changes listed since that version.

## 💡 Usage

### Guidance and Configs

[guidance/AGENTS.md](./guidance/AGENTS.md) routes to public guides. Synchronization adapts decision-relevant instructions and preserves local rules; it does not require copying every source section.

```text
Use $sync-agent-guidance to adapt the relevant guidance to this project.
Use $sync-project-configs to merge shared defaults into this project.
```

Config fragments apply only when their tools and runtime assumptions fit. Inspect [configs/AGENTS.md](./configs/AGENTS.md) for intended use. Private overlays under `guidance/private/` remain local and are included only when explicitly requested; publication requires explicit authorization.

### Session State

Reuse established coordination when it carries the active work. An explicit `AGENTS_STATE.md` request takes precedence:

```text
Use $session-state to update AGENTS_STATE.md with a handoff.
Use $session-state to continue the work from AGENTS_STATE.md.
Use $session-state to consume AGENTS_STATE.md and delete it after loading.
```

Reading keeps the file. Resuming continues the authorized task; consuming deletes only the designated handoff after a successful load.

### References

`references/gitmojis.json` follows the [Gitmoji API](https://gitmoji.dev/api/gitmojis) shape. Copy lookup data intentionally when a consumer needs it. See [reference links](./docs/links.md) for external documentation and editorial context.

## 🛠️ Maintenance

[Repository Flow](./docs/repository-flow.md) describes ownership, validation, installation, and downstream consumption.

Run the repository validator after shared changes:

```bash
python3 scripts/validate.py
```

It requires local `oxfmt`, `oxlint`, and skill-creator's `quick_validate.py`. Set `SKILL_VALIDATOR` for a non-standard validator location. ShellCheck and PowerShell installer checks run when those tools are available.

Keep maintenance instructions in root `AGENTS.md`, downstream rules in `guidance/`, and executable defaults in `configs/`. Skill entrypoints hold purpose, boundaries, and routing; substantial conditional detail belongs in linked references or assets. Preserve useful constraints while removing duplicated or obsolete model workarounds.

For substantial workflow changes, review representative requests for scope, reading requirements, permission boundaries, and completion behavior. Passing structural validation alone does not demonstrate that a skill makes good decisions.

## 📄 License

[MIT](./LICENSE) License © 2026 [Gregor Steiner](https://github.com/luastoned)
