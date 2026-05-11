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

- 🎯 **Single source of truth** — Keep reusable guidance, formatter defaults, references, and Codex skills in one place.
- 🧭 **Agent-ready guidance** — Store downstream `AGENTS.md` templates and language guides that can be adapted into project-specific instructions.
- 🔧 **Shared tooling defaults** — Version common Oxc, TypeScript, and package script defaults without burying them in individual repos.
- 🔁 **Sync workflows** — Use bundled skills to merge guidance and config into target projects while preserving local conventions.

## 📦 Contents

| Path          | Purpose                                                                 |
| ------------- | ----------------------------------------------------------------------- |
| `configs/`    | Shared config fragments for Oxc, TypeScript path aliases, and package scripts. |
| `guidance/`   | Reusable downstream agent guidance, language guides, and local overlays. |
| `references/` | Structured reference data reused across projects.                       |
| `skills/`     | Shareable Codex skills for syncing guidance and project configs.        |
| `docs/`       | Notes, links, and conventions that do not belong in executable configs. |

## 📥 Install

Clone this repo somewhere stable:

```bash
git clone https://github.com/luastoned/code-kit.git
cd code-kit
```

`code-kit` is not installed as a project dependency. Its files are copied, merged, or symlinked into local tooling where needed.

## 🚀 Quick Start

Link the Codex skills from the installed repo path:

```bash
test -d "$(pwd)/skills/sync-agent-guidance" && ln -sfn "$(pwd)/skills/sync-agent-guidance" ~/.codex/skills/sync-agent-guidance
test -d "$(pwd)/skills/sync-project-configs" && ln -sfn "$(pwd)/skills/sync-project-configs" ~/.codex/skills/sync-project-configs
```

Run the commands from the `code-kit` checkout. The `test -d` guard ensures the skill exists before linking it, and `$(pwd)` captures the absolute source path so Codex can resolve the skill directory later.

After linking, start a new Codex session so the skills are discovered.

```text
Use $sync-agent-guidance to sync AGENTS.md and mapped language guidance into this project.
Use $sync-project-configs to sync shared config files into this project.
```

Do not symlink shared config files directly by default. Use the skills to copy or merge `configs/`, `guidance/`, and `references/` into target projects so local project settings are preserved.

## 💡 Usage

### Agent Guidance

`guidance/AGENTS.md` is the downstream entrypoint. It maps languages and runtimes to the reusable guides in `guidance/`.
Private or personal overlays can live under `guidance/private/`. Files there are ignored by git, so local mappings and non-public guidance stay local.

Use `sync-agent-guidance` when a project needs local `AGENTS.md` instructions derived from this repo:

```text
Use $sync-agent-guidance to sync AGENTS.md and mapped language guidance into this project.
```

The skill inspects the target first, then adapts the reusable guidance instead of copying it blindly.

### Project Configs

Use `sync-project-configs` when a project should receive shared defaults from `configs/`:

```text
Use $sync-project-configs to sync shared config files into this project.
```

The skill copies missing relevant configs, merges structured configs where possible, and preserves target-specific settings.

### Gitmoji Reference

`references/gitmojis.json` is a structured lookup file for commit tooling and agent workflows that need a local gitmoji reference.

## 🛠️ Maintenance

- Keep root `AGENTS.md` focused on working in this repo.
- Keep downstream agent instructions in `guidance/`.
- Keep private overlays in `guidance/private/`; do not publish sensitive or personal project guidance.
- Keep reusable tooling defaults in `configs/`.
- Keep structured lookup data in `references/`.
- Keep skill workflows concise and procedural in `skills/*/SKILL.md`.
- Validate JSON after editing config or reference files.

## 📄 License

[MIT](./LICENSE) License © 2024-PRESENT [LuaStoned](https://github.com/luastoned)
