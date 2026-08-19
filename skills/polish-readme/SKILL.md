---
name: polish-readme
description: Create, update, or refactor a repository README.md into a polished, friendly, emoji-accented project overview. Use only when the user explicitly invokes `$polish-readme` or names the `polish-readme` skill.
---

# Polish README

## Overview

Create or improve a README from the target repository's actual contents. The preferred style is friendly and structured: centered title or logo, short subtitle, flat-square badges when useful, emoji section headings, concise feature bullets, practical installation and quick-start examples, and repository-specific usage and documentation sections.

This is a documentation rewrite task, not a marketing exercise. Do not invent APIs, features, badges, install commands, or support promises that are not supported by the repository.

Use [awesome-readme](https://github.com/matiassingers/awesome-readme) only as an optional catalog of structure ideas when the user asks for extra inspiration. Do not bulk-copy examples or browse it by default.

## Workflow

1. Identify the target:
   - If the user provides a README path, use that file and its parent directory as the project root.
   - If the user provides a directory, use `<directory>/README.md`.
   - Otherwise use `README.md` in the current working directory.
2. Inspect before editing:
   - Existing README, if present.
   - Established branding, voice, structure, and externally sourced project facts in the existing README.
   - `package.json`, `pyproject.toml`, `Cargo.toml`, `go.mod`, `Makefile`, `Dockerfile`, compose files, lockfiles, and other manifest or build files.
   - `src/`, `docs/`, `examples/`, `test*/`, config files, and CLI entrypoints where relevant.
   - License file and repository or package name.
3. Infer the project shape:
   - Library, application, service, CLI, template or starter, documentation or resource repository, plugin, config bundle, or mixed workspace.
   - Primary language, runtime, and package manager.
   - Verified installation, quick-start, development, test, build, and usage commands.
4. Plan the README structure around what the project actually needs. Preserve deliberate branding, voice, and document structure unless the user requests a redesign or the existing structure is clearly unusable.
5. Edit the README with the runtime's patch or structured edit tool. Preserve accurate existing content and links; remove stale, duplicated, or overly verbose material.
6. Validate:
   - Check headings and local links you changed.
   - Verify that code fences have appropriate language tags.
   - Verify that commands match manifests or clearly mark them as examples.
   - If package scripts changed the README examples, verify script names exist.

## Preferred Structure

Use this shape when it fits the project:

```md
<h1 align="center">
  <br>
  🧰 project-name
  <br>
</h1>

<h4 align="center">Short factual subtitle</h4>

<p align="center">
  badges
</p>

<p align="center">
  section links
</p>

<br>

## ✨ Features

## 📦 Install

## 🚀 Quick Start

## 💡 Usage

## 📚 Documentation

## 🛠️ Development

## 📄 License
```

Adapt the sections to the repository. Small projects may only need Features, Install, Quick Start, Usage, and License. Resource or config repositories may need Contents, Usage, and Maintenance instead of API documentation. Libraries with many modules can use tables for module documentation.

For product-like tools, CLIs, apps, or public packages with strong outcomes, consider additional sections only when the repo supports them:

- `## 🧪 Proof` or `## ✅ Results` for verified screenshots, benchmarks, compatibility checks, or test matrices.
- `## 👥 Who Uses It` for notable users or adopters when the repo already documents them.
- `## ⚖️ Comparison` for factual comparisons against alternatives.
- `## 🧠 How It Works` for a short architecture or execution-flow explanation.
- `## 🆕 Release Highlights` for a compact, versioned or dated release summary when the README maintains one.
- `## ⚙️ Configuration` for environment variables, flags, config files, or runtime options.
- `## 🧩 API` for package APIs that need more than a quick-start snippet.
- `## 🤝 Contributing` and `## 🙏 Acknowledgements` when the repo has contribution docs, design credits, sponsors, or references worth preserving.

For CLIs, setup tools, security tools, and developer utilities, prefer a direct usage shape when appropriate:

````md
## 🚀 Usage

```bash
tool-name [options]
```

## 📦 Installation

## ⚙️ Configuration Options
````

For libraries or tools with multiple adoption paths, split usage by scenario instead of forcing one generic example:

- application or service usage
- library usage
- CLI usage
- Docker usage
- CI usage

## Style Rules

- Use emoji in headings and feature bullets to add color, but keep the wording professional.
- Keep the first screen clear: project name, one-line purpose, badges, and navigation.
- Use a logo or banner at the top only when the repository already has a suitable asset or the user provides one.
- Prefer flat-square Shields badges. Use only badges that are true for the project, such as package version, license, CI, docs, or project status.
- Use short, scannable feature bullets: `- 🎯 **Feature** — Practical description.`
- Keep prose concise. Prefer examples, commands, and tables over long paragraphs.
- Use clear technical English for installation, usage, configuration, and development instructions. Prefer short sentences, active voice, one instruction per sentence, consistent terms, and conditions before dependent actions.
- Use numbered steps for sequential procedures and start steps with imperative actions when practical.
- Use explicit modality: imperatives or `must` for requirements, `prefer` or `recommend` for defaults, `can` for capability, and `might` for possibility.
- Prefer a version, date, state, or event over ambiguous time-relative labels such as `new`, `latest`, or `currently`.
- Apply selected Google developer documentation language principles. Use a conversational, friendly, and respectful tone without slang or filler. Write for a global audience, and avoid unnecessary jargon, idioms, culturally specific references, and claims that a task is simple or easy.
- Follow project-specific writing conventions and preserve deliberate product, design, or community voice. Do not import Google-specific branding, US spelling, heading capitalization, emphasis, or layout conventions.
- Lead with concrete proof when the repo has it: screenshots, test output, benchmark results, live links, or published package stats.
- Distinguish observed results from expected results and state what remains unverified.
- Use animated GIFs or screenshots for CLI or application demos when suitable assets already exist.
- Use repository-specific commands from manifests instead of generic placeholders.
- Include alternate package managers in a collapsed `<details>` block when useful.
- Use Markdown tables for contents, modules, commands, or docs indexes when they improve scanability.
- Preserve useful existing examples, but refresh formatting and surrounding text.
- Preserve externally sourced project facts unless local evidence contradicts them. Treat facts that cannot be verified from the repository as unverified rather than false, and report them instead of silently deleting them when they materially affect the rewrite.
- Keep local links relative and verify referenced files exist.
- Avoid empty sections, fake roadmaps, generic badges, exaggerated claims, and unsupported “production-ready” language.

## Output Expectations

Lead with the completed README result. Briefly state what changed, any assumptions made, and any README links or commands that could not be verified. Do not repeat the workflow.
