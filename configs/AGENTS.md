# AGENTS.md

This directory contains shared config fragments and defaults. Treat these files as source material to apply or merge into target projects, not as universally complete project configs.

## Rules

- Inspect the target project before copying anything.
- Apply configs only when the corresponding tool is relevant to the target.
- Prefer merging structured configs over replacing existing target files.
- Preserve target-specific settings such as paths, generated directories, runtime assumptions, framework plugins, and tool-specific overrides.
- Do not add dependencies or commands just because a shared config exists.
- Do not replace an existing package manifest wholesale when only scripts are needed.
- Validate changed config files with the relevant parser or tool when available.

## Files

- `.oxfmtrc.json`: shared Oxc formatter defaults.
- `.oxlintrc.json`: shared Oxc linter defaults.
- `package.json`: partial package manifest containing shared script defaults. Merge relevant scripts into the target `package.json` only when the corresponding tools are installed or intentionally being adopted.
- `tsconfig.json`: partial TypeScript config for Node/TypeScript projects, especially Node 24+ projects that typecheck with TypeScript, execute source with `tsx`, bundle with esbuild, and run bundled output with Node.
  - Merge `target`, `module`, and `moduleResolution` only when they fit the target runtime and build pipeline.
  - Add the `~/*` path alias even when the target does not use it yet; avoiding deep relative imports is an intentional shared default. Map it to the primary source root, using `./src/*` for a new or conventional `src/` layout, and preserve other aliases.
  - Do not skip `~/*` because it is unused or absent. If it already has conflicting semantics, report the conflict before changing established behavior. If the runtime, build, or test pipeline needs resolver support, keep the alias and report the required follow-up instead of substituting a different alias.
  - Remove deprecated `baseUrl` for TypeScript 6.0 compatibility when it only prefixes `paths`; move that prefix into each `paths` entry instead. Preserve old lookup-root behavior only when the target truly depends on it, using an explicit catch-all path mapping.
  - For one-time TypeScript 6.0+ migration audits beyond this config merge, use the `migrate-typescript` skill.
