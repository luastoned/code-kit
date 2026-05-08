---
name: sync-agent-guidance
description: Adapt and merge reusable repository agent guidance into another project. Use when Codex needs to inspect a target project, create a project-specific AGENTS.md, merge mapped language guidance into existing agent instructions, or update guidance while preserving local rules and project conventions.
---

# Sync Agent Guidance

## Overview

Adapt reusable agent guidance from a source directory containing `AGENTS.md` and any mapped language guides into a target project. This is a synthesis task: read the target project first, then write guidance that fits what is actually there.

## Workflow

1. Identify the source directory. Default to the `guidance/` directory in this code-kit repo when the user does not provide another source.
2. Identify the target project directory from the user request or current working directory.
3. Read source guidance:
   - `AGENTS.md`
   - Any language guides mapped or referenced by `AGENTS.md` that are relevant to the target project
4. Inspect the target project before editing:
   - Existing `AGENTS.md` and any language-specific guides it references
   - Package manifests, lockfiles, workspace files, language/toolchain configs, formatter/linter configs, test configs, build configs, and README/developer docs when present
   - Source layout and dominant languages using `rg --files`, excluding generated/vendor directories
5. Decide the target shape:
   - If there is no `AGENTS.md`, create a concise project-specific `AGENTS.md` from the reusable entrypoint rules plus target-specific commands and conventions discovered locally.
   - Include or reference mapped language guidance only when it fits the target project's actual languages and tooling.
   - If `AGENTS.md` already exists, merge into that file or its referenced language guide. Preserve target-specific rules and add only useful missing guidance.
6. Edit manually with `apply_patch`. Review the final diff for duplicated or contradictory rules.

## Merge Rules

- Preserve local rules that mention project architecture, commands, deployment, testing, security, data handling, or ownership.
- Prefer the target project's nearest formatter/linter configs over copied style rules.
- Do not duplicate sections with the same purpose. Combine them under the target's existing heading when possible.
- Keep language-specific guidance concise. Inline only the parts of mapped language guides that are relevant to the target when a separate language guide is not appropriate.
- If the target already references separate language guides, update the relevant guide instead of inlining a second copy.
- Prefer project-specific commands discovered from manifests, task files, or docs over generic commands.
- Remove source rules that clearly do not fit the target runtime, framework, package manager, or language mix.
- Surface conflicts explicitly in the final response, especially commit format, tooling source of truth, test commands, module system, or stricter typing rules.

## Language Guide Detection

Use the source `AGENTS.md` language mapping as the source of truth for available language guides. Detect the target's relevant guides from files and configuration in the project.

Common signals include:

- File extensions in source files.
- Language-specific config files, compiler configs, build files, and project manifests.
- Package manifests and dependencies that identify the runtime, framework, or test tooling.
- Existing `AGENTS.md` lookup rules or language-specific guides already present in the target.

Do not scan `node_modules`, `dist`, `build`, `.git`, or coverage directories for detection.

## Target Inspection Checklist

Use `rg --files` first. Read only the files needed to understand local conventions.

- Package manager: infer from lockfiles, manifests, and project docs.
- Commands: prefer existing scripts for format, lint, typecheck, test, build, and dev.
- Tooling: check nearest formatter, linter, test, build, and compiler configs.
- Language configs: read relevant language-specific config files before adding strictness, module, runtime, or compiler guidance.
- Framework/runtime: identify runtimes, frameworks, CLIs, libraries, services, apps, or monorepos.
- Existing docs: keep project-specific workflows from README or developer docs when they affect agent behavior.

## Output Expectations

The final `AGENTS.md` should read as if it was written for the target project, not copied from the source. It should be short enough to follow, specific enough to be useful, and explicit where the target has real commands or constraints.
