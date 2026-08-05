---
name: sync-agent-guidance
description: Audit or adapt reusable AGENTS.md and mapped language, repository, and workflow guidance for a target project. Use only when the user explicitly invokes `$sync-agent-guidance` or names the `sync-agent-guidance` skill.
---

# Sync Agent Guidance

## Overview

Audit a target project's instructions against the current public guidance from code-kit, or adapt that guidance into instructions that fit the project. Audit without writing when the user wants to know whether resynchronization is needed. When synchronizing, inspect established projects before writing and weight the result in this order: primary language guidance, applicable tooling or workflow guidance, then a compact repository baseline.

## Mode Selection

- Use audit mode when the user asks whether guidance is current, needs resynchronization, or has drifted. Audit mode is read-only.
- Use sync mode when the user asks to create, update, adapt, or resynchronize guidance.
- Do not add version stamps, provenance comments, lock files, or other tracking metadata to the target project.

## Workflow

1. Resolve the source guidance directory:
   - Use a source path supplied by the user.
   - Otherwise resolve this skill's physical directory with symlinks followed and use `guidance/` from the code-kit root two directories above it.
   - Confirm the directory contains `AGENTS.md` and `Repositories.md`. Ask for the source path if it does not.
2. Resolve the target project from the request or current working directory.
3. Read source `AGENTS.md`, `Repositories.md`, and the guides selected under [Guide Selection](#guide-selection). Read private guidance only when explicitly requested.
4. Inspect the target using [Target Inspection](#target-inspection).
5. In audit mode, follow [Audit Mode](#audit-mode), report the result, and stop without editing.
6. In sync mode, decide the guidance shape:
   - Use root guidance for repository-wide rules and nested guidance for project-specific implementation rules.
   - For a single-project repository, organize `AGENTS.md` around the primary language guide. Follow it with applicable tooling guidance, then concise repository rules.
   - For a new or sparse repository, include the broadly applicable sections from the known primary language guide even when framework, runtime, package-manager, and tooling details are not established.
   - Carry forward the general technical-writing, response, and code-comment rules as compact supporting guidance when the target does not provide a stronger local convention.
   - Include the source commit policy and other durable repository defaults even when `.git`, hooks, CI, or repository tooling have not been initialized. Treat missing setup as unknown or planned, not evidence that the guidance is irrelevant.
   - Merge with existing instructions and referenced language guides instead of creating duplicate guidance.
7. Before editing, inventory the `##` sections in each selected guide and map applicable sections to cohesive target sections. Record only non-obvious omissions, moves, or combinations that will need explanation.
8. Edit with the runtime's patch or structured-edit tool, then review the diff for missing, duplicated, or contradictory rules.

## Guide Selection

Use source `AGENTS.md` as the authoritative guide mapping; do not maintain a second hardcoded mapping in this skill.

- Always read `Repositories.md` to determine guidance shape, ownership, commit boundaries, and validation scope. Carry forward its durable defaults, including commit guidance, while keeping them secondary to language and tooling content.
- Use the primary language guide when the language is known from the user request, target source, or project metadata. This is sufficient evidence for a new or sparse project: a new TypeScript repository should receive a TypeScript-driven baseline even before its framework, runtime, package manager, or tooling is known.
- Give the primary language guide content priority. In a single-language project, its applicable sections should dominate the resulting guidance rather than being condensed beneath broad repository or working-style sections.
- Use additional language guides when those languages are maintained parts of normal development, not merely incidental files.
- Use workflow or specialty guides for maintained operational surfaces such as containers, shell orchestration, security work, or reverse-engineering artifacts, or when the user explicitly targets that work.
- Treat framework, dependency, manifest, and tooling signals as refinements to language guidance rather than prerequisites for it.
- Treat the absence of `.git`, commit hooks, CI, or tool configuration as a lack of local overrides. Use the source default where one exists, but do not invent commands or name unselected tools.
- Ignore one-off helpers, examples, generated artifacts, vendored code, copied snippets, CI fragments, and tool output unless agents are expected to maintain them.
- Exclude `node_modules`, `dist`, `build`, `.git`, and coverage directories from detection.

## Target Inspection

Use `rg --files` first and read only what is needed to establish local conventions:

- Root and nested `AGENTS.md` files and any guides they reference.
- Repository shape, ownership boundaries, and source layout.
- Manifests, lockfiles, workspace files, and language or toolchain configs.
- Existing commands for formatting, linting, typechecking, testing, building, and development.
- Nearest formatter, linter, test, build, and compiler configs.
- Commit-message config and hooks; use recent history only as a fallback or sanity check.
- README or developer docs that define workflows agents must follow.

Do not invent a framework, runtime, package manager, command, or project convention when a new repository has not established one.

## Audit Mode

1. Inventory the target's root and applicable nested instructions, including any guides they reference.
2. Build a checklist from the applicable sections of each selected source guide.
3. Compare meaning rather than wording. Classify each applicable source rule as:
   - covered by equivalent target guidance
   - intentionally replaced by a more specific local rule
   - missing, stale, or contradicted
   - not applicable to the target
4. Report `current` when there is no material guidance drift. Report `resync recommended` when an applicable rule or cohesive section is missing, stale, contradicted without a clear local reason, or newly applicable because the project changed.
5. Lead with the status and list only material drift, relevant local overrides, and the guides checked. Do not enumerate every matching rule unless requested.

Do not use textual differences, heading order, prose condensation, timestamps, Git history, or absent version metadata as evidence of drift by themselves. Do not edit, create, format, or otherwise mutate target files in audit mode.

## Merge Rules

- Preserve local architecture, commands, deployment, testing, security, data-handling, ownership, and commit rules.
- Keep repository-wide rules at the root. In multi-project repositories, explain how to find the owning project, select the nearest commands and configs, group commits by boundary, and validate affected projects.
- Prefer the target project's nearest tooling configs and discovered commands over copied style rules or generic commands.
- Treat each source guide's `##` sections as intentional, cohesive units. Keep an applicable section together under the same or a clearly adapted heading instead of scattering its bullets across unrelated target sections.
- Combine sections only when their subjects form a coherent target section. Omit a section only when it does not apply, duplicates a stronger local rule, or belongs in another nested guide.
- Preserve the source guide's conceptual coverage without mechanically copying its headings or irrelevant details.
- Preserve clear technical-writing behavior by meaning: concise result-first responses, short active instructions, consistent terminology, conditions before dependent actions, and intent-focused comments. Do not claim ASD-STE100 compliance unless the target explicitly requires and validates it.
- Keep language guidance concise. If the target references separate language guides, update the relevant guide; otherwise include the applicable sections in the nearest `AGENTS.md`.
- Keep repository guidance compact but durable. Preserve source commit conventions, change boundaries, validation principles, and safety rules unless the target explicitly overrides them; expand repository sections only for concrete project constraints.
- Include private overlays only when explicitly requested. Read `guidance/private/AGENTS.md` first when present, then only the guides it maps or the user names.
- Surface unresolved conflicts, especially around commit format, tooling sources of truth, test commands, module systems, or typing rules.

## Output Expectations

In audit mode, report whether resynchronization is recommended, the guides checked, and the material reasons. In sync mode, the result should read as guidance written for the target project, not as a copy of code-kit. For a single-language project, a reader should immediately recognize the primary language guide as the focus; repository details should appear only as brief supporting constraints. Report the result first, then the files changed, guides applied, unresolved conflicts, and any non-obvious source sections that were moved, combined, or omitted. Do not repeat the request or workflow.
