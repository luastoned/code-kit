# Repository Agent

Use this guide for repository shape, root and nested guidance, ownership boundaries, commit policy, and validation scope across all languages and toolchains.

## Guidance Shape

- Keep repository-wide rules in the root `AGENTS.md`: commit style, CI, repository boundaries, policies for generated and vendor files, root scripts, process managers, and release and deployment coordination.
- For a single project, keep implementation rules alongside shared rules in its root `AGENTS.md`: commands, architecture, runtime, framework, language, and local tooling. Ordinary source, include, test, or same-named inner folders do not require separate guidance.
- Add a nested `AGENTS.md` only for an explicitly requested location or materially different operating rules that need subtree scope and cannot be kept clear at the root. Explain the scoping need; directory depth, source files, or a nested manifest alone are not sufficient.
- During guidance maintenance, keep repository-wide rules in a concise root `AGENTS.md`, even when nested guidance already exists. Ordinary implementation does not require creating missing guidance files.
- Do not duplicate full language guidance in every nested project. Reference the relevant guide or keep only the target-specific parts.
- Preserve useful existing nested guidance. Consolidation must stay within the authorized scope, retain unique constraints, and update affected links; the one-root default does not authorize deleting existing files.

A project may contain nested source directories, multiple manifests, and several build targets without needing guidance for each one. Place shared commands and implementation rules at the owning project root; reserve nested guidance for materially different scoped operating rules.

## Working Across Projects

- Identify the owning project before editing. Use build entrypoints, manifest relationships, config files, and applicable `AGENTS.md` files; the nearest source folder or manifest is not automatically a separate project boundary.
- Prefer the owning project's commands and configs over root defaults unless the root command is clearly the orchestrator for the whole repo.
- Keep unrelated project changes separate. Do not mix frontend, backend, package, infrastructure, and root coordination edits unless they are part of the same task.
- When a change crosses project boundaries, state the coupling clearly in the final response and validate each affected project when practical.
- Do not apply one project's conventions to another. Framework, runtime, package manager, formatter, linter, and test rules may differ between folders.

## Multi-Project Detection

Use these signals to discover actual project ownership; no fixed number of signals establishes a boundary:

- Multiple manifests or tool configurations below the root, interpreted through their relationships rather than counted as separate projects automatically.
- Workspace or build definitions that identify independently maintained components.
- Root configuration or scripts that coordinate component-specific build, test, runtime, or deployment commands.
- Existing nested `AGENTS.md` files.

## Git And Commits

- Follow explicit commit policy enforced by repository configuration, hooks, or CI checks when present.
- Otherwise follow explicit repository or source guidance for commit format.
- Use recent history only as a consistency check or fallback. Do not copy a poor or inconsistent commit style when clearer guidance exists.
- Stage or commit only when the task authorizes it. Before staging, review changed paths by project or root area and separate unrelated edits.
- Keep project changes in separate commits when practical, and keep root coordination changes separate when they are not tightly coupled.
- Stage moves and deletions together to preserve rename detection.
- Do not commit local credentials, generated blobs, dependency folders, or nested Git checkouts unless explicitly requested.

## Validation

- Run the smallest relevant validation command for each affected project first.
- Use root-level validation when the root script is the documented orchestrator or when shared config changes affect multiple projects.
- If validation is skipped for an affected project, state why.
