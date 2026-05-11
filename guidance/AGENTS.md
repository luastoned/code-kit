# AGENTS.md

Use this file as the entrypoint for repository engineering guidance.

## Language Guides

1. Identify the primary language, runtime, or file type for the task.
2. Load the matching guide below when one applies.
3. If multiple languages are involved, follow the guide for the dominant part of the change and any other guide needed for files you edit.
4. If no guide applies, follow the repository's existing patterns and keep changes minimal and explicit.

Current mapping:

- `C++.md`: C, C++, C/C++ headers, CMake/native libraries, general modern C++ code, and compiler/toolchain configs.
- `Containers.md`: Dockerfiles, Compose files such as `compose.yml`, `compose.yaml`, `docker-compose.yml`, and override variants, `.dockerignore`, dev containers, container build scripts, Kubernetes manifests, Helm charts, and container-related CI config.
- `Python.md`: Python source, Python scripts, pyproject/packaging files, Python lockfiles and dependency manifests, Python CLIs/services, tests, notebooks, and Python tooling configs.
- `Shell.md`: shell scripts, Bash, POSIX sh, zsh snippets, CI shell steps, Make recipes, install/setup scripts, and shell command orchestration.
- `TypeScript.md`: TypeScript, JavaScript, JSX, TSX, all Node.js code, package manager and workspace files, JS/TS tool configs, frontend build tooling, and related web runtime code.

## Private Guides

Local-only private guides may exist under `guidance/private/`. These files are ignored by git.

- `guidance/private/.gitkeep` exists only to keep the private directory in git.
- List `guidance/private/` when local/private guidance is explicitly requested.
- Load relevant private guides only when the user explicitly asks to include private, personal, or local guidance.
- Private guides refine or extend the public mapping for the current machine; do not assume they exist in other checkouts.
- Do not copy private guidance into public files unless the user explicitly asks to publish it.

## Tooling source of truth

- Follow the nearest project formatter, linter, typechecker, test, and build configs for the files being changed.
- Do not hand-enforce rules that tooling owns, such as import ordering, import grouping, quote style, semicolons, trailing commas, package sorting, or generated formatting.
- Run the project-local format, lint, typecheck, test, and build commands when they exist and are relevant to the change.

## Commit messages

- Follow Conventional Commits.
- Use this subject format: `<type>[optional scope][optional !]: <gitmoji> <description>`.

## Notes

- Language-specific guides refine this entrypoint and take precedence for code style decisions within their scope.
- Reuse repository-local patterns before introducing new abstractions, even when a language guide suggests a general preference.
