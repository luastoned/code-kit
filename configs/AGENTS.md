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
- `tsconfig.json`: partial TypeScript config for the `~/* -> ./src/*` path mapping. Use only when that alias matches the target project. Do not add `baseUrl` just for paths.
