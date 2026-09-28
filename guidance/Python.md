# Python Agent

Apply this guide to Python source, scripts, packaging, notebooks, and tooling.

## Code Readability

Apply the shared [code-readability requirements](./AGENTS.md#code-readability) and [local-consistency rules](./AGENTS.md#changes-and-validation). Language-specific rules below do not replace them.

Preserve indentation and connected `if`/`elif`/`else`, `try`/`except`/`else`/`finally`, and loop/`else` constructs.

## Core Rules

- Prefer the repository's existing package manager, layout, and tooling when they are already established.
- For new Python projects or unopinionated tooling, prefer `uv` and `uvx` over older workflows such as direct `pip`, ad hoc virtualenv commands, or global tool installs.
- Do not introduce broad rewrites, new dependencies, or stricter project-wide tooling unless the task requires it.

## Context and Tooling

Inspect the following only when it affects the change:

1. Which Python versions are supported?
2. Which project metadata exists: `pyproject.toml`, `uv.lock`, `requirements*.txt`, `setup.py`, `setup.cfg`, `tox.ini`, or lockfiles?
3. Which tools are configured for format, lint, type checking, tests, packaging, and scripts?
4. Are there existing helpers for logging, config, errors, validation, CLI parsing, IO, or dependency injection?
5. Is the code an application, library, CLI, script collection, notebook workflow, service, or test utility?

- Prefer project-local commands from `pyproject.toml`, task runners, Makefiles, or docs.
- Prefer `uv sync`, `uv run`, `uv add`, and `uv lock` when the project uses `uv` or has no established alternative.
- Prefer `uvx` for one-off Python tools when no project-local tool is configured.
- Do not replace Poetry, Hatch, PDM, pip-tools, tox, nox, or Make-based workflows in existing projects unless the user asks for a migration.
- Do not install Python packages globally.
- Follow the configured tools for their roles: formatters and linters such as Ruff, Black, and isort; type checkers such as mypy and pyright; and test runners such as pytest.
- Follow the repository's configured type checker. Do not impose strict mypy or pyright settings on a project that has not opted into them.

## Language Rules

### Typing and Boundaries

- Type public APIs, exported functions, class methods, CLI boundaries, service boundaries, and data models.
- Type complex internal helpers when annotations make behavior clearer.
- Local variables do not need annotations unless inference is poor or the type is intentionally narrow.
- Prefer precise standard types and protocols over `Any`.
- Use `Any` only at unavoidable dynamic or third-party boundaries, and narrow back to typed values quickly.
- Prefer `TypedDict`, `dataclass`, `NamedTuple`, `Protocol`, `Literal`, and explicit domain types when they improve boundary clarity.
- Runtime validation still matters for untrusted input, config, files, network payloads, environment variables, and user input.

### Code Organization

- Use `# region RegionName` and `# endregion` for the logical sections required by the shared readability rules. Preserve established marker naming and placement.
- Prefer `pathlib.Path` for filesystem paths in new code unless the surrounding code uses strings heavily.
- Prefer context managers for files, locks, temp resources, network sessions, and database connections.
- Prefer explicit exceptions with useful context over bare `except` or silent failure.
- Keep module-level side effects minimal, especially in importable library code.
- Prefer dependency injection through simple parameters or constructors over global mutable state.
- Make resource ownership, mutable state, and error paths explicit at CLI, service, file, network, database, and subprocess boundaries.
- Avoid hidden global state and implicit conventions that make tests depend on machine-local state or import order.
- Use dataclasses or small classes when they clarify cohesive state; use functions for simple stateless behavior.

### Async and I/O

- Match the existing sync or async model.
- Do not mix blocking I/O into async paths without using the project's established executor or thread pattern.
- Use timeouts and cancellation paths for network or long-running I/O when the surrounding code supports them.
- Close sessions, clients, subprocesses, files, and streams deterministically.

## Validation

Follow the shared [test-work rules](./AGENTS.md#test-work).

- For CLI or script changes, verify the command path when practical.
- For package metadata changes, validate lockfiles and import behavior when practical.
- If dependencies or Python tooling are unavailable, state what could not be verified.
