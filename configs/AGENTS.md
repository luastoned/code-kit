# AGENTS.md

This directory contains shared config fragments and defaults. Treat these files as source material to apply or merge into target projects, not as universally complete project configs.

## Rules

- Inspect the target project before copying anything.
- Apply configs only when the corresponding tool is relevant to the target.
- Prefer merging structured configs over replacing existing target files.
- Preserve target-specific settings such as paths, generated directories, runtime assumptions, framework plugins, and tool-specific overrides.
- Do not add dependencies or commands just because a shared config exists.
- Do not replace an entire package manifest when only scripts are needed.
- Validate changed config files with the relevant parser or tool when available.

## Files

- `.oxfmtrc.json`: shared Oxc formatter defaults.
- `.oxlintrc.json`: shared Oxc linter defaults.
- `package.json`: partial package manifest containing shared script defaults. Merge relevant scripts into the target `package.json` only when the corresponding tools are installed or intentionally being adopted.
- `tsconfig.json`: partial TypeScript config for Node.js and TypeScript projects. It is especially suited to Node 24+ projects that type-check with TypeScript, execute source with `tsx`, bundle with esbuild, and run bundled output with Node.js.
  - Merge `target`, `module`, and `moduleResolution` only when they fit the target runtime and build pipeline.
  - During project setup or configuration synchronization, if no existing alias maps to the primary source root, add `~/*` (`./src/*` for a conventional layout), even when unused. Ordinary code edits do not require introducing an alias. Preserve existing source-root aliases instead of adding a redundant one; resolve conflicting `~/*` semantics before changing them.
  - Use `include: ["src/**/*"]` for a conventional application source layout. Adapt to established layouts and preserve type-check coverage for maintained tooling configs or scripts outside `src/`, through appropriate existing or scoped configurations. Do not relocate files or silently discard existing include patterns to match this fragment. `include` selects initial files, not a strict import boundary; `rootDir` controls emitted layout and is not a substitute for file selection.
  - Verify aliases across the affected runtime, build, and existing tests. Complete resolver support within scope; if compatibility or authorization blocks it, report the blocker and ask how to proceed rather than silently skipping the alias.
  - Keep compiler-version migration separate from ordinary config merging. Use `migrate-typescript` only when the request includes a migration audit or upgrade.
