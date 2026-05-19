# Repository Agent

Use this guide for repository shape, root-vs-nested guidance, ownership boundaries, commit policy, and validation scope. It is especially important for repositories that contain multiple project roots, such as `backend/`, `frontend/`, `packages/*`, `apps/*`, or service-specific folders with their own manifests and tooling.

## Guidance Shape

- Keep repo-wide rules in the root `AGENTS.md`: commit style, CI, repository boundaries, generated/vendor policy, root scripts, process managers, and release/deployment coordination.
- Keep implementation rules in the nearest project `AGENTS.md`: commands, architecture, runtime, framework, language, and local tooling for that project.
- If a nested project already has guidance but the repository root does not, create or preserve a concise root `AGENTS.md` instead of putting repo-wide rules into one project.
- Do not duplicate full language guidance in every nested project. Reference the relevant guide or keep only the target-specific parts.

## Working Across Projects

- Identify the owning project before editing. Use the nearest manifest, config files, source root, and `AGENTS.md` for the files being changed.
- Prefer the owning project's commands and configs over root defaults unless the root command is clearly the orchestrator for the whole repo.
- Keep unrelated project changes separate. Do not mix frontend, backend, package, infrastructure, and root coordination edits unless they are part of the same task.
- When a change crosses project boundaries, state the coupling clearly in the final response and validate each affected project when practical.
- Do not let one project's conventions leak into another. Framework, runtime, package manager, formatter, linter, and test rules may differ between folders.

## Multi-Project Detection

Treat the target as a multi-project repository when two or more of these are present:

- Multiple manifests or tool configs below the root, such as `backend/package.json` and `frontend/package.json`.
- Workspace markers such as `pnpm-workspace.yaml`, npm/yarn workspaces, `turbo.json`, `nx.json`, `lerna.json`, or app/package folders.
- Root files that coordinate subprojects, such as process manager configs, compose files, CI workflows, shared formatter/linter config, or root scripts.
- Existing nested `AGENTS.md` files.

## Git And Commits

- Follow explicit commit tooling when present, such as `.commitlintrc*`, `commitlint.config.*`, `package.json` commitlint config, or commit hooks.
- Otherwise follow explicit repository or source guidance for commit format.
- Treat recent history as a sanity check or fallback only; do not copy a bad or inconsistent commit style when clearer guidance exists.
- Before staging, review changed paths by project/root area and separate unrelated edits.
- Keep project changes in separate commits when practical, and keep root coordination changes separate when they are not tightly coupled.
- Stage moves and deletions together to preserve rename detection.
- Do not commit local credentials, generated blobs, dependency folders, or nested Git checkouts unless explicitly requested.

## Validation

- Run the smallest relevant validation command for each affected project first.
- Use root-level validation when the root script is the documented orchestrator or when shared config changes affect multiple projects.
- If validation is skipped for an affected project, state why.
