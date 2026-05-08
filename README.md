# code-kit

Shared resources for working on code across projects.

## Contents

- `configs/`: versioned tooling defaults.
- `guidance/`: reusable agent and language guidance.
- `references/`: structured reference data reused across projects.
- `skills/`: shareable Codex skills.
- `docs/`: notes, links, and conventions that do not belong in executable configs.

## Intended Use

Keep this repo as the source of truth for common coding resources. Consumer locations can symlink to files or folders here when tools expect a specific path.

Example links:

```bash
ln -sf /code/utilities/code-kit/configs/.oxfmtrc.json /code/.oxfmtrc.json
ln -sf /code/utilities/code-kit/configs/.oxlintrc.json /code/.oxlintrc.json
ln -sf /code/utilities/code-kit/configs/tsconfig.json /code/tsconfig.json
ln -sfn /code/utilities/code-kit/skills/sync-agent-guidance ~/.codex/skills/sync-agent-guidance
ln -sfn /code/utilities/code-kit/skills/sync-project-configs ~/.codex/skills/sync-project-configs
```

TypeScript `paths` entries are resolved from the `tsconfig.json` that declares them. Use the shared `configs/tsconfig.json` only when it is copied or linked into the consuming project root, so `~/*` maps to that project's `./src/*`. Do not add `baseUrl` just for paths; TypeScript 6.0 deprecates it, and path mappings should include their explicit project-relative prefixes.
