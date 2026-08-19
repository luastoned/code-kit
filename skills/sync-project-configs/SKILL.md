---
name: sync-project-configs
description: Apply or merge shared project configuration files from code-kit into another repository, folder, or project. Use only when the user explicitly invokes `$sync-project-configs` or names the `sync-project-configs` skill.
---

# Sync Project Configs

## Overview

Apply shared config fragments and defaults from a source `configs/` directory into a target project. This is a merge task: inspect the target first, preserve project-specific settings, and make the resulting files valid for the target.

## Workflow

1. Identify the source configs directory:
   - Use the source path provided by the user when present.
   - Otherwise resolve symlinks to find this skill's directory, then use `configs/` from the code-kit root two directories above it.
   - Confirm the directory contains `AGENTS.md`. Ask for the source path if it does not.
2. Identify the target project directory from the user request or current working directory.
3. Read source `AGENTS.md` as the authoritative inventory and file-specific application guidance.
4. List source config files, including dotfiles, and matching target files before editing. Use `find`, `rg --files --hidden`, or `ls -A`; do not use plain `rg --files` or `ls`, because both can hide dotfiles.
   - Do not sync `configs/AGENTS.md` itself into the target project.
5. Inspect the target project:
   - Existing matching config files.
   - Hidden config files and dotfiles in the target root.
   - Project manifests, lockfiles, workspace files, and README or developer documentation when relevant.
   - Tooling actually used by the project, so unrelated configs are not added without evidence that they apply.
6. Decide the action for each documented source file:
   - Copy when the target file is missing and the tool is relevant to the target.
   - Merge when the target file exists and both files use a structured format.
   - Skip when the config is clearly irrelevant to the target.
   - Ask only when applying the config could break an established target convention.
7. Edit with the runtime's patch or structured edit tool. Do not replace an entire target file unless it is absent or the user explicitly requested replacement.
8. Validate changed files with the relevant parser or tool when available.

## Merge Rules

- Preserve target-specific settings for project paths, generated directories, runtime assumptions, and framework or tool integrations.
- Apply shared defaults for formatting, linting, and common compiler or tool behavior when they do not conflict with local requirements.
- Prefer the target's existing schema path or schema URL when it is more specific or already valid. Add the source schema only when the target has none.
- For ignore lists and similar arrays, keep the union unless order has semantic meaning.
- For scalar values with different meanings, prefer the target value and mention the conflict in the final response.
- For nested objects, merge recursively using the same rules.
- Keep key ordering readable and consistent with the source config's logical grouping when possible.
- Never invent target-specific commands or package dependencies just because a shared config exists.
- Treat partial files as fragments. For example, merge `package.json` scripts into the target manifest instead of replacing the manifest.

## Source File Guidance

- Treat source `AGENTS.md` as the authoritative inventory of available configs and their intended use. Do not duplicate its file mapping in this skill.
- Apply each file only under the conditions documented there. Inspect undocumented source files, but do not sync them until their intended use is clear.
- When source guidance delegates broader migration or cleanup to another skill, keep the config sync scoped and use that skill only when the user request includes the additional work.

## Validation

- Before editing, confirm the discovered source file list includes dotfiles from the source configs directory.
- Parse every changed JSON file.
- If local tooling exists and the change affects it, run the relevant validation command when practical.
- If validation cannot run because dependencies are missing or the tool is unavailable, state that in the final response.

## Output Expectations

Summarize which configs were copied, merged, or skipped. Report preserved target choices, conflicts, and validation results.
