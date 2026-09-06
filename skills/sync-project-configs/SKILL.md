---
name: sync-project-configs
description: Merge relevant code-kit configuration fragments into a target project. Use only when explicitly requested as $sync-project-configs.
---

# Sync Project Configs

Merge shared defaults with target-specific configuration. An audit request is read-only; applying or syncing authorizes relevant config edits within the requested project.

## Discovery

Resolve the user-supplied source or resolve symlinks to this skill and use `configs/` in the code-kit root two directories above it. Read its `AGENTS.md` for the authoritative file inventory and application conditions. If unavailable, check known source locations before asking for the path.

List source and matching target files, including dotfiles, with `rg --files --hidden` or equivalent. Do not copy source `configs/AGENTS.md` into the target.

Inspect existing configs, manifests, lockfiles, workspace boundaries, and local tool commands relevant to the fragments. Apply only tools the project uses or the user is adopting. Undocumented fragments require clarification of their purpose before application.

## Merge Decisions

- Copy a missing fragment only when relevant; merge existing structured files instead of replacing them.
- Preserve target paths, generated-file exclusions, runtimes, framework integrations, and semantic overrides.
- Recursively merge objects. Union ignore lists only when their syntax and ordering semantics permit it; preserve order-sensitive rules.
- Preserve conflicting scalar values and report the conflict. Ask only when a necessary change cannot meet the request without choosing between materially different conventions.
- Prefer an existing valid target schema when it is more specific.
- Treat partial manifests as fragments: merge scripts, not entire package manifests.
- Do not add dependencies or commands solely because the source mentions them. Broader migrations require a request that includes that work.
- Apply alias and runtime settings only under the source inventory's compatibility conditions.

## Completion

For an audit, report proposed copies, merges, skips, and conflicts without editing.

For a sync, patch the relevant files, parse changed structured configs with a suitable local parser, and run the affected tools when available. Continue through fixes introduced by the merge. Report copied, merged, skipped, and deferred fragments, preserved choices, and verification limits.
