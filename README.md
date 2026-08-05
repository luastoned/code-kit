<h1 align="center">
  <br>
  🧰 code-kit
  <br>
</h1>

<h4 align="center">Shared coding resources for agents, projects, and local tooling</h4>

<p align="center">
  <a href="./LICENSE" target="_blank">
    <img src="https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square" alt="License">
  </a>
  <a href="https://github.com/luastoned/code-kit" target="_blank">
    <img src="https://img.shields.io/badge/resources-shared-success.svg?style=flat-square" alt="Shared resources">
  </a>
  <a href="https://github.com/luastoned/code-kit" target="_blank">
    <img src="https://img.shields.io/badge/agents-ready-blueviolet.svg?style=flat-square" alt="Agent ready">
  </a>
</p>

<p align="center">
  <a href="#-features">Features</a> •
  <a href="#-contents">Contents</a> •
  <a href="#-repository-flow">Repository Flow</a> •
  <a href="#-install">Install</a> •
  <a href="#-skill-catalog">Skill Catalog</a> •
  <a href="#-agent-native-workflows">Agent-Native Workflows</a> •
  <a href="#-usage">Usage</a> •
  <a href="#-maintenance">Maintenance</a>
</p>

<br>

## ✨ Features

- 🎯 **Single source of truth** — Keep reusable guidance, formatter defaults, references, and portable agent skills in one place.
- 🔀 **Repository flow** — See how canonical resources are maintained, installed, synchronized, and adapted into downstream projects.
- 🧭 **Agent-ready guidance** — Store downstream `AGENTS.md` templates and language guides that can be adapted into project-specific instructions.
- 🔧 **Shared tooling defaults** — Version common Oxc, TypeScript, and package script defaults without burying them in individual repos.
- 🔁 **Sync workflows** — Use bundled skills to merge guidance and config into target projects while preserving local conventions.
- 🛠️ **Guided refactors** — Refactor selected files through the nearest `AGENTS.md` and mapped guidance.
- 📚 **README polish** — Refactor project READMEs into friendly, accurate, emoji-accented documentation.
- 🎨 **Design-system extraction** — Create a structured `DESIGN.md` from a webpage or a concise design brief.
- 💬 **Intent interviews** — Clarify consequential requests before committing to plans, specifications, or implementation.
- 🪶 **[ChangeShape](./docs/workflows/change-shape.md)** — Audit or adopt lightweight coordination based on ambiguity, blast radius, irreversibility, and verification.
- 🧵 **Session handoffs** — Save concise `AGENTS_STATE.md` handoffs and consume them at the start of the next session.
- 🧪 **Migration checks** — Audit TypeScript projects for one-time upgrade issues without baking cleanup checklists into downstream guidance.
- ✅ **Repeatable validation** — Check skills, metadata, configs, formatting, references, links, and cross-file consistency with one command.

## 📦 Contents

| Path          | Purpose                                                                                                  |
| ------------- | -------------------------------------------------------------------------------------------------------- |
| `configs/`    | Shared config fragments for Oxc, TypeScript path aliases, and package scripts.                           |
| `guidance/`   | Reusable downstream agent guidance, language guides, and local overlays.                                 |
| `references/` | Structured reference data reused across projects.                                                        |
| `skills/`     | Shareable agent skills for workflow adoption, syncs, refactors, design docs, interviews, and migrations. |
| `scripts/`    | Repository validation and collision-safe skill installation helpers.                                     |
| `docs/`       | Agent-native workflows, repository flow diagrams, links, and other durable reference material.           |

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

The `skills/` directory is the source of truth. Each skill is a directory with a `SKILL.md` entrypoint and YAML frontmatter, which keeps the files portable across agent runtimes that support this shape. Bundled task skills are explicit-only: invoke one by name, usually with `$skill-name`, rather than expecting installation alone to activate it.

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

The installers create the runtime skills directory when needed, refresh existing links, and refuse to overwrite real files or directories. Windows symbolic links may require Developer Mode or an elevated PowerShell session. Run `./scripts/install-skills.sh --help` or `Get-Help .\scripts\install-skills.ps1` for usage. Start a new session if the runtime does not discover newly linked skills immediately.

## 🧭 Skill Catalog

| Skill                   | Purpose                                                                                            |
| ----------------------- | -------------------------------------------------------------------------------------------------- |
| `$adopt-change-shape`   | Audit or adopt a change-shaped, low-documentation project workflow.                                |
| `$sync-agent-guidance`  | Adapt language-first `AGENTS.md` guidance while preserving project rules and ownership boundaries. |
| `$sync-project-configs` | Merge shared formatter, linter, TypeScript, and package defaults into a target project.            |
| `$migrate-typescript`   | Audit and migrate a project for TypeScript 6.0+ compatibility and TypeScript 7 preparation.        |
| `$polish-readme`        | Create or refresh a friendly, accurate, emoji-accented project README.                             |
| `$refactor-code`        | Conservatively refactor selected files using the nearest project guidance.                         |
| `$session-state`        | Save, restore, or consume a concise `AGENTS_STATE.md` session handoff.                             |
| `$create-design-md`     | Create or update a `DESIGN.md` system from a webpage, project evidence, or design brief.           |
| `$interview-me`         | Clarify consequential intent through a focused interview before planning or implementation.        |

Invoke a skill explicitly in the request, for example: `Use $refactor-code on src/example.ts.`

## 🤖 Agent-Native Workflows

Agent-native workflows preserve human product authority while accounting for the speed, parallelism, and coordination patterns of AI-assisted implementation. They are standalone methods: projects can adopt them directly or use a bundled skill to adapt them to existing conventions.

### ChangeShape

[ChangeShape](./docs/workflows/change-shape.md) is an agent-native method for classifying and coordinating software changes. It evaluates ambiguity, blast radius, irreversibility, coordination, and verification instead of estimating effort from time, story points, or file count.

Direct and Scoped work stay lightweight. Shaped work records only the boundaries and decisions that must survive. Initiatives remain strategic direction and are delivered through independently valuable Shaped slices. Use `$adopt-change-shape` to audit a repository or adapt the workflow without imposing fixed filenames or a generic documentation tree.

## 💡 Usage

### Guidance and Configs

`guidance/AGENTS.md` is the downstream entrypoint. It maps languages and runtimes to the reusable guides in `guidance/`.
Private or personal overlays can live under `guidance/private/`. Files there are ignored by git, so local mappings and non-public guidance stay local.

Invoke the sync skills to adapt these resources into a target project instead of symlinking shared guidance or configs directly:

```text
Use $sync-agent-guidance to adapt mapped language and repository guidance to this project.
Use $sync-project-configs to sync shared config files into this project.
```

Both workflows inspect the target first, preserve local conventions, and report conflicts instead of replacing project-specific choices blindly.

### Session State

Invoke `$session-state` with the intended mode. Reading keeps the handoff by default; consuming deletes it only after a successful load:

```text
Use $session-state to update AGENTS_STATE.md with the current session handoff.
Use $session-state to continue from AGENTS_STATE.md.
Use $session-state to consume AGENTS_STATE.md and delete it after loading.
```

### References

`references/gitmojis.json` follows the [Gitmoji API](https://gitmoji.dev/api/gitmojis) shape and provides a local lookup for commit tooling and agent workflows.
Copy files from `references/` intentionally when a target workflow needs them.

## 🛠️ Maintenance

Run the repository validator after changing shared resources:

```bash
python3 scripts/validate.py
```

The validator requires local `oxfmt`, `oxlint`, and the `$skill-creator` `quick_validate.py`; set `SKILL_VALIDATOR` when that script is installed in a non-standard location. It also runs ShellCheck when available.

- Keep root `AGENTS.md` focused on working in this repo.
- Keep downstream agent instructions in `guidance/`.
- Keep private overlays in `guidance/private/`; do not publish sensitive or personal project guidance.
- Keep reusable tooling defaults in `configs/`.
- Keep structured lookup data in `references/`.
- Keep skill workflows concise and procedural in `skills/*/SKILL.md`.
- Keep the validator passing after editing configs, references, guidance, skills, metadata, or installation instructions.

## 📄 License

[MIT](./LICENSE) License © 2026 [Gregor Steiner](https://github.com/luastoned)
