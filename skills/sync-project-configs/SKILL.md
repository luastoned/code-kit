---
name: sync-project-configs
description: Apply or merge shared project configuration files from code-kit into another repository, folder, or project. Use when Codex needs to sync formatter, linter, TypeScript, or other files from a source configs directory while preserving target-specific settings and documenting conflicts.
---

# Sync Project Configs

## Overview

Apply shared config fragments and defaults from a source `configs/` directory into a target project. This is a merge task: inspect the target first, preserve project-specific settings, and make the resulting files valid for the target.

## Workflow

1. Identify the source configs directory. Default to the `configs/` directory in this code-kit repo when the user does not provide another source.
2. Identify the target project directory from the user request or current working directory.
3. List source config files, including dotfiles, and matching target files before editing. Use `find`, `rg --files`, or `ls -A`; do not rely on plain `ls`, because it hides files such as `.oxfmtrc.json` and `.oxlintrc.json`.
   - Read `configs/AGENTS.md` when present; it describes how to apply the config files.
   - Do not sync `configs/AGENTS.md` itself into the target project.
4. Inspect the target project:
   - Existing matching config files.
   - Hidden config files and dotfiles in the target root.
   - Project manifests, lockfiles, workspace files, and README/developer docs when relevant.
   - Tooling actually used by the project, so unrelated configs are not added blindly.
5. Decide the action for each source file:
   - Copy when the target file is missing and the tool is relevant to the target.
   - Merge when the target file exists and both files use a structured format.
   - Skip when the config is clearly irrelevant to the target.
   - Ask only when applying the config could break an established target convention.
6. Edit manually with `apply_patch`. Do not overwrite target files wholesale unless they are absent or the user explicitly requested replacement.
7. Validate changed files with the relevant parser or tool when available.

## Merge Rules

- Preserve target-specific settings for project paths, generated directories, runtime assumptions, and framework/tool integrations.
- Apply shared defaults for formatting, linting, and common compiler/tool behavior when they do not conflict with local requirements.
- Prefer the target's existing schema path or schema URL when it is more specific or already valid. Add the source schema only when the target has none.
- For ignore lists and similar arrays, keep the union unless order has semantic meaning.
- For scalar values with different meanings, prefer the target value and mention the conflict in the final response.
- For nested objects, merge recursively using the same rules.
- Keep key ordering readable and consistent with the source config's logical grouping when possible.
- Never invent target-specific commands or package dependencies just because a shared config exists.
- Treat partial files as fragments. For example, merge `package.json` scripts into the target manifest instead of replacing the manifest.

## File Guidance

- `.oxfmtrc.json`: merge formatter defaults. Preserve target-specific ignores and overrides. Let the shared config provide common print, quote, import-sorting, JSDoc, newline, and package sorting defaults unless the target already has a deliberate value.
- `.oxlintrc.json`: merge linter plugins, categories, rules, environment, and ignore patterns. Preserve target rule overrides. Union plugin and ignore arrays.
- `package.json`: merge relevant shared scripts into the target `package.json` only when the corresponding tools are installed or intentionally being adopted. Preserve existing scripts unless the user explicitly asks to replace them.
- `tsconfig.json`: merge only when the target is a JavaScript, TypeScript, Node.js, or related web project. Preserve existing compiler options, includes, excludes, references, framework plugins, and module settings. Do not add deprecated `baseUrl`; use explicit prefixes in `paths`.

## Validation

- Before editing, confirm the discovered source file list includes dotfiles from the source configs directory.
- Parse every changed JSON file.
- If local tooling exists and the change affects it, run the relevant validation command when practical.
- If validation cannot run because dependencies are missing or the tool is unavailable, state that in the final response.

## Output Expectations

Summarize which configs were copied, merged, or skipped. Call out preserved target choices, conflicts, and validation results.
