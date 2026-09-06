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
  - When establishing a source alias within scope, prefer `~/*` mapped to the primary source root (`./src/*` for a conventional layout). Preserve established aliases; an unused shared default does not by itself require adoption.
  - Verify new aliases across runtime, build, and tests. Complete resolver support within the authorized change or defer the alias and report the missing support. Preserve conflicting target semantics until a change is decided.
  - Keep compiler-version migration separate from ordinary config merging. Use `migrate-typescript` only when the request includes a migration audit or upgrade.
