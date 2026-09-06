# Repository Agent

Use this guide for repository shape, root and nested guidance, ownership boundaries, commit policy, and validation scope. It is especially important for repositories that contain multiple project roots, such as `backend/`, `frontend/`, `packages/*`, `apps/*`, or service-specific folders with their own manifests and tooling.

## Guidance Shape

- Keep repository-wide rules in the root `AGENTS.md`: commit style, CI, repository boundaries, policies for generated and vendor files, root scripts, process managers, and release and deployment coordination.
- Keep implementation rules in the nearest project `AGENTS.md`: commands, architecture, runtime, framework, language, and local tooling for that project.
- During guidance maintenance, keep repository-wide rules in a concise root `AGENTS.md`, even when nested guidance already exists. Ordinary implementation does not require creating missing guidance files.
- Do not duplicate full language guidance in every nested project. Reference the relevant guide or keep only the target-specific parts.

## Working Across Projects

- Identify the owning project before editing. Use the nearest manifest, config files, source root, and `AGENTS.md` for the files being changed.
- Prefer the owning project's commands and configs over root defaults unless the root command is clearly the orchestrator for the whole repo.
- Keep unrelated project changes separate. Do not mix frontend, backend, package, infrastructure, and root coordination edits unless they are part of the same task.
- When a change crosses project boundaries, state the coupling clearly in the final response and validate each affected project when practical.
- Do not apply one project's conventions to another. Framework, runtime, package manager, formatter, linter, and test rules may differ between folders.

## Multi-Project Detection

Use these signals to discover actual project ownership; no fixed number of signals establishes a boundary:

- Multiple manifests or tool configs below the root, such as `backend/package.json` and `frontend/package.json`.
- Workspace markers such as `pnpm-workspace.yaml`, npm or Yarn workspaces, `turbo.json`, `nx.json`, `lerna.json`, or application and package folders.
- Root files that coordinate subprojects, such as process manager configs, compose files, CI workflows, shared formatter and linter config, or root scripts.
- Existing nested `AGENTS.md` files.

## Git And Commits

- Follow explicit commit tooling when present, such as `.commitlintrc*`, `commitlint.config.*`, `package.json` commitlint config, or commit hooks.
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
