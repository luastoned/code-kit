# Shell Agent

Apply this guide to shell scripts, command orchestration, CI shell steps, and shell code embedded in build or deployment files.

## Code Readability

Apply the shared [code-readability requirements](./AGENTS.md#code-readability) and [local-consistency rules](./AGENTS.md#changes-and-validation). Language-specific rules below do not replace them.

Preserve pipelines, continuations, here-document contents, and connected `if`/`elif`/`else`/`fi` constructs.

## Core Rules

- Prefer the shell already used by the file: POSIX `sh`, Bash, zsh, or CI runner shell.
- Do not introduce Bash-only features into scripts declared with `#!/bin/sh`.
- Use shell for orchestration and small integration tasks. Prefer Python, Node.js, or another project language when logic becomes complex, data-heavy, or hard to test in shell.
- Be careful with destructive commands, glob expansion, word splitting, and working directories.
- Make working directories, environment-variable contracts, and failure behavior explicit before commands with side effects.

## Context and Tooling

Inspect the following only when it affects the change:

1. What shell is declared by the shebang or CI runner?
2. How is the script invoked by package scripts, Makefiles, CI, Dockerfiles, or docs?
3. Are there portability requirements across Linux, macOS, BusyBox, Alpine, or Windows shells?
4. Are required tools available locally or installed by the project?
5. Is there an existing pattern for logging, argument parsing, temp files, cleanup, or dry runs?

### Strict Mode

- Do not add `set -euo pipefail` without reviewing its effects.
- Use `set -e` only when commands, conditionals, subshells, and cleanup behavior have been reviewed.
- Use `set -u` only when unset optional variables are handled.
- Use `pipefail` only in shells that support it.
- Preserve strict mode in existing scripts and handle expected failures explicitly.

## Language Rules

### Code Organization

- Keep functions small and named by action.
- Prefer long flags in scripts when they improve readability.
- Keep environment-variable contracts near the top of the script or documented in usage text.
- Use `printf` instead of `echo` when output portability or escape handling matters.
- Prefer `command -v tool >/dev/null 2>&1` for dependency checks.

### Safety and Error Handling

- Quote variable expansions unless intentional word splitting is required.
- Use `--` when passing user-controlled values to commands that accept options.
- Prefer `mktemp` for temporary files and directories.
- Clean up temp resources with `trap` when needed.
- Avoid parsing `ls`; use globs, `find`, or structured command output.
- Prefer arrays in Bash for argument lists.
- Avoid `eval`.
- Use `rm` only with clearly bounded paths. Avoid constructing destructive paths from empty or unchecked variables.
- Prefer explicit working directories. If changing directories, handle failure.
- Preserve meaningful exit statuses and stderr when wrapping commands so callers and CI can detect failures.

## Validation

- Run `shellcheck` when available and relevant.
- Run the changed script or the smallest command path that exercises it when practical.
- For CI or Docker shell steps, validate the containing workflow or build when practical.
- If validation cannot run because tools or services are unavailable, state what remains unverified.
