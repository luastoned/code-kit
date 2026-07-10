# AGENTS.md

This repository stores shared coding resources that are reused across other projects. Treat it as source material for downstream repos, not as an application or library.

## Repository Layout

- `configs/`: shared tooling defaults.
- `guidance/`: reusable agent guidance that can be copied, linked, or adapted into target projects.
- `guidance/private/`: local-only overlays and guidance that should not be published.
- `skills/`: shareable agent skills and their support files.
- `references/`: structured lookup data reused by tooling and agent workflows.
- `scripts/`: repository maintenance helpers for validation and skill installation.
- `docs/`: reference notes and links that do not belong in executable config.

## Working In This Repo

- Keep changes small, explicit, and easy to reuse from other projects.
- Preserve the distinction between this repo's maintenance guidance and downstream project guidance.
- Update `guidance/AGENTS.md` when changing the reusable root guidance intended for downstream projects.
- Update the relevant mapped guide in `guidance/` when changing language, runtime, or tool-specific downstream guidance.
- Update `configs/AGENTS.md` when adding, removing, or changing the intended use of files in `configs/`.
- Keep personal, sensitive, or project-specific private overlays under `guidance/private/`; only `.gitkeep` should be tracked there.
- Update `skills/sync-agent-guidance/` when changing how guidance is adapted into target projects.
- Keep scripts non-interactive, safe around existing files, and runnable from any working directory.
- Update `configs/` only for tooling behavior that should become a shared default or reusable fragment.
- Keep `README.md` focused on what this repo contains and how other locations consume it.
- Keep docs in `docs/` when the information is reference material rather than an instruction agents must follow.

## Editing Guidance Files

- Write reusable guidance in a project-neutral way unless the file is explicitly for one project.
- Prefer concrete rules over broad preferences.
- Do not duplicate the same rule across multiple files unless each file needs to stand alone in downstream use.
- When a rule belongs to tooling, put it in the relevant config instead of prose.
- When a rule depends on a target project, describe how to discover the target's local convention instead of hard-coding one here.

## Skills

- Always use `$skill-creator` when creating a new skill or making substantial updates to an existing skill.
- Skill directories must include a `SKILL.md` with frontmatter `name` and `description`.
- Keep skill workflows procedural and scoped to actions an agent can actually perform.
- Store reusable agent prompts or metadata under the skill directory when they belong to that skill.
- Avoid adding generated or machine-local files to skills.

## Validation

- There is no project build by default.
- Run `python3 scripts/validate.py` for repository-wide changes.
- For Markdown-only changes, review the rendered structure and check links or paths you changed.
- For config changes, validate against the relevant tool when that tool is available locally.
- For skill changes, read the full `SKILL.md`, make sure the workflow still matches the files in the skill directory, and run `$skill-creator` validation with `quick_validate.py`.

## Commit Messages

- Follow Conventional Commits 1.0.0.
- Use this subject format: `<type>[optional scope][optional !]: <gitmoji> <description>`.
- Choose the type by intent, for example `feat`, `fix`, `docs`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, or `revert`.
- Keep the description imperative, concise, and lowercase unless it names a proper noun.
