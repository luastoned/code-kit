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
  <a href="#-install">Install</a> •
  <a href="#-quick-start">Quick Start</a> •
  <a href="#-usage">Usage</a> •
  <a href="#-maintenance">Maintenance</a>
</p>

<br>

## ✨ Features

- 🎯 **Single source of truth** — Keep reusable guidance, formatter defaults, references, and portable agent skills in one place.
- 🧭 **Agent-ready guidance** — Store downstream `AGENTS.md` templates and language guides that can be adapted into project-specific instructions.
- 🔧 **Shared tooling defaults** — Version common Oxc, TypeScript, and package script defaults without burying them in individual repos.
- 🔁 **Sync workflows** — Use bundled skills to merge guidance and config into target projects while preserving local conventions.
- 🛠️ **Guided refactors** — Refactor selected files through the nearest `AGENTS.md` and mapped guidance.
- 📚 **README polish** — Refactor project READMEs into friendly, accurate, emoji-accented documentation.
- 🧵 **Session handoffs** — Save concise `AGENTS_STATE.md` handoffs and consume them at the start of the next session.
- 🧪 **Migration checks** — Audit TypeScript projects for one-time upgrade issues without baking cleanup checklists into downstream guidance.
- ✅ **Repeatable validation** — Check skills, metadata, configs, formatting, references, links, and cross-file consistency with one command.

## 📦 Contents

| Path          | Purpose                                                                                              |
| ------------- | ---------------------------------------------------------------------------------------------------- |
| `configs/`    | Shared config fragments for Oxc, TypeScript path aliases, and package scripts.                       |
| `guidance/`   | Reusable downstream agent guidance, language guides, and local overlays.                             |
| `references/` | Structured reference data reused across projects.                                                    |
| `skills/`     | Shareable agent skills for syncs, refactors, README updates, session handoffs, and migration checks. |
| `scripts/`    | Repository validation and collision-safe skill installation helpers.                                 |
| `docs/`       | Notes, links, and conventions that do not belong in executable configs.                              |

## 📥 Install

Clone this repo somewhere stable:

```bash
git clone https://github.com/luastoned/code-kit.git
cd code-kit
```

`code-kit` is not installed as a project dependency. Its files are copied, merged, or symlinked into local tooling where needed.

## 🚀 Quick Start

The `skills/` directory is the source of truth. Each skill is a directory with a `SKILL.md` entrypoint and YAML frontmatter, which keeps the files portable across agent runtimes that support this shape.

Link the skills from the installed repo path into the runtime you want to use.

### Codex

```bash
mkdir -p ~/.codex/skills
test -d "$(pwd)/skills/sync-agent-guidance" && ln -sfn "$(pwd)/skills/sync-agent-guidance" ~/.codex/skills/sync-agent-guidance
test -d "$(pwd)/skills/sync-project-configs" && ln -sfn "$(pwd)/skills/sync-project-configs" ~/.codex/skills/sync-project-configs
test -d "$(pwd)/skills/migrate-typescript" && ln -sfn "$(pwd)/skills/migrate-typescript" ~/.codex/skills/migrate-typescript
test -d "$(pwd)/skills/polish-readme" && ln -sfn "$(pwd)/skills/polish-readme" ~/.codex/skills/polish-readme
test -d "$(pwd)/skills/refactor-code" && ln -sfn "$(pwd)/skills/refactor-code" ~/.codex/skills/refactor-code
test -d "$(pwd)/skills/session-state" && ln -sfn "$(pwd)/skills/session-state" ~/.codex/skills/session-state
```

### Claude Code

```bash
mkdir -p ~/.claude/skills
test -d "$(pwd)/skills/sync-agent-guidance" && ln -sfn "$(pwd)/skills/sync-agent-guidance" ~/.claude/skills/sync-agent-guidance
test -d "$(pwd)/skills/sync-project-configs" && ln -sfn "$(pwd)/skills/sync-project-configs" ~/.claude/skills/sync-project-configs
test -d "$(pwd)/skills/migrate-typescript" && ln -sfn "$(pwd)/skills/migrate-typescript" ~/.claude/skills/migrate-typescript
test -d "$(pwd)/skills/polish-readme" && ln -sfn "$(pwd)/skills/polish-readme" ~/.claude/skills/polish-readme
test -d "$(pwd)/skills/refactor-code" && ln -sfn "$(pwd)/skills/refactor-code" ~/.claude/skills/refactor-code
test -d "$(pwd)/skills/session-state" && ln -sfn "$(pwd)/skills/session-state" ~/.claude/skills/session-state
```

### Optional Installer

Keep using the manual commands above when you want direct control, or use the installer to link every skill or a selected subset:

```bash
./scripts/install-skills.sh codex
./scripts/install-skills.sh claude session-state polish-readme
./scripts/install-skills.sh all sync-agent-guidance sync-project-configs
```

The installer refreshes existing symlinks but refuses to overwrite real files or directories. Run `./scripts/install-skills.sh --help` for usage.

Run the commands from the `code-kit` checkout. The `test -d` guard ensures the skill exists before linking it, and `$(pwd)` captures the absolute source path so the agent runtime can resolve the skill directory later.

Claude Code also supports project-local skills under `.claude/skills/`. For `code-kit`, the recommended model is to keep this repo as the source of truth and symlink selected skills into the runtime that should consume them.

After linking, start a new Codex session so the skills are discovered. Claude Code detects changes in an existing skills directory during the current session; restart it only when the top-level skills directory was created after the session began.

```text
Use $sync-agent-guidance to adapt mapped language and repository guidance to this project.
Use $sync-project-configs to sync shared config files into this project.
Use $migrate-typescript to audit and migrate this project for TypeScript 6.0+ compatibility.
Use $polish-readme to refresh this project's README.md.
Use $refactor-code on src/example.ts.
Use $session-state to update AGENTS_STATE.md with the current session handoff.
```

Do not symlink shared config files directly by default. Use the sync skills to copy or merge `configs/` and `guidance/` into target projects so local project settings are preserved. Copy files from `references/` intentionally when a target workflow needs them.

## 💡 Usage

### Agent Guidance

`guidance/AGENTS.md` is the downstream entrypoint. It maps languages and runtimes to the reusable guides in `guidance/`.
Private or personal overlays can live under `guidance/private/`. Files there are ignored by git, so local mappings and non-public guidance stay local.

Use `sync-agent-guidance` when a project needs local `AGENTS.md` instructions derived from this repo:

```text
Use $sync-agent-guidance to adapt mapped language and repository guidance to this project.
```

The skill inspects the target first, then adapts the reusable guidance instead of copying it blindly.

### Project Configs

Use `sync-project-configs` when a project should receive shared defaults from `configs/`:

```text
Use $sync-project-configs to sync shared config files into this project.
```

The skill copies missing relevant configs, merges structured configs where possible, and preserves target-specific settings.

### TypeScript Migration

Use `migrate-typescript` for one-time TypeScript 6.0+ upgrade audits and migration fixes:

```text
Use $migrate-typescript to audit and migrate this project for TypeScript 6.0+ compatibility.
```

The skill checks deprecated compiler options, deprecated syntax, changed defaults, and project-local typecheck behavior without adding those cleanup steps to downstream `AGENTS.md` files.

### README Polish

Use `polish-readme` when a project README should be created, refreshed, or refactored:

```text
Use $polish-readme to refresh this project's README.md.
```

The skill inspects the target repo first, then rewrites the README around real project contents, commands, links, and examples.

### Code Refactors

Use `refactor-code` when selected files should be cleaned up according to the nearest `AGENTS.md` and mapped guidance:

```text
Use $refactor-code on src/example.ts.
```

The skill keeps behavior unchanged by default, follows local project rules, avoids broad rewrites, and runs the smallest relevant validation when practical.

### Session State

Use `session-state` when a session should leave or consume a short handoff:

```text
Use $session-state to update AGENTS_STATE.md with the current session handoff.
Use $session-state to continue from AGENTS_STATE.md.
Use $session-state to consume AGENTS_STATE.md and delete it after loading.
```

The skill writes dynamic state from the current conversation and repository context only. Reading or continuing from a handoff keeps the file by default; consuming it deletes the file after a successful load.

### Gitmoji Reference

`references/gitmojis.json` follows the [Gitmoji API](https://gitmoji.dev/api/gitmojis) shape and provides a local lookup for commit tooling and agent workflows.

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
