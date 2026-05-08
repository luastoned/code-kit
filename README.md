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
  <a href="#-quick-start">Quick Start</a> •
  <a href="#-usage">Usage</a> •
  <a href="#-maintenance">Maintenance</a>
</p>

<br>

## ✨ Features

- 🎯 **Single source of truth** — Keep reusable guidance, formatter defaults, references, and Codex skills in one place.
- 🧭 **Agent-ready guidance** — Store downstream `AGENTS.md` templates and language guides that can be adapted into project-specific instructions.
- 🔧 **Shared tooling defaults** — Version common Oxc and TypeScript config defaults without burying them in individual repos.
- 🔁 **Sync workflows** — Use bundled skills to merge guidance and config into target projects while preserving local conventions.

## 📦 Contents

| Path          | Purpose                                                                 |
| ------------- | ----------------------------------------------------------------------- |
| `configs/`    | Shared tooling defaults such as Oxc config and TypeScript path mapping. |
| `guidance/`   | Reusable downstream agent guidance and language-specific guides.        |
| `references/` | Structured reference data reused across projects.                       |
| `skills/`     | Shareable Codex skills for syncing guidance and project configs.        |
| `docs/`       | Notes, links, and conventions that do not belong in executable configs. |

## 🚀 Quick Start

Clone or keep this repo somewhere stable, then link the pieces that should be shared across projects.
Replace `<code-kit>`, `<workspace>`, and `<project>` with local paths.

```bash
ln -sf <code-kit>/configs/.oxfmtrc.json <workspace>/.oxfmtrc.json
ln -sf <code-kit>/configs/.oxlintrc.json <workspace>/.oxlintrc.json
ln -sf <code-kit>/references/gitmojis.json <workspace>/gitmojis.json

ln -sfn <code-kit>/skills/sync-agent-guidance ~/.codex/skills/sync-agent-guidance
ln -sfn <code-kit>/skills/sync-project-configs ~/.codex/skills/sync-project-configs
```

Use the shared TypeScript config only when the consuming project uses the same `~/* -> ./src/*` alias:

```bash
ln -sf <code-kit>/configs/tsconfig.json <project>/tsconfig.json
```

TypeScript `paths` entries are resolved from the `tsconfig.json` that declares them. Do not add `baseUrl` just for paths; TypeScript 6.0 deprecates it, and path mappings should include explicit project-relative prefixes.

## 💡 Usage

### Agent Guidance

`guidance/AGENTS.md` is the downstream entrypoint. It maps languages and runtimes to the reusable guides in `guidance/`.

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
- Keep reusable tooling defaults in `configs/`.
- Keep structured lookup data in `references/`.
- Keep skill workflows concise and procedural in `skills/*/SKILL.md`.
- Validate JSON after editing config or reference files.

## 📄 License

[MIT](./LICENSE) License © 2024-PRESENT [LuaStoned](https://github.com/luastoned)
