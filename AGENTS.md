# AGENTS.md

This repository stores shared coding resources that are reused across other projects. Treat it as source material for downstream repos, not as an application or library.

## Repository Layout

- `configs/`: shared tooling defaults.
- `guidance/`: reusable agent guidance that can be copied, linked, or adapted into target projects.
- `guidance/private/`: local-only overlays and guidance that must not be published.
- `skills/`: shareable agent skills and their support files.
- `references/`: structured lookup data reused by tooling and agent workflows.
- `scripts/`: repository maintenance helpers for validation and skill installation.
- `docs/`: workflows, repository flow diagrams, reference notes, and links that do not belong in executable config.

## Working In This Repo

- Keep changes small, explicit, easy to maintain, and straightforward to reuse from other projects. Avoid speculative abstractions and framework-like ceremony.
- Apply the [shared code-readability requirements](guidance/AGENTS.md#code-readability) to maintained code in every language, including scripts and code examples. Semantic blank-line separation is required even when no formatter or linter enforces it.
- Preserve the distinction between this repo's maintenance guidance and downstream project guidance.
- Update `guidance/AGENTS.md` when changing the reusable root guidance intended for downstream projects.
- Update the relevant mapped guide in `guidance/` when changing language, runtime, or tool-specific downstream guidance.
- Update `configs/AGENTS.md` when adding, removing, or changing the intended use of files in `configs/`.
- Keep personal, sensitive, or project-specific private overlays under `guidance/private/`; only `.gitkeep` may be tracked there.
- Update `skills/sync-agent-guidance/` when changing how guidance is adapted into target projects.
- When a workflow contract in `docs/workflows/` changes, bump its version: major for removed or incompatible behavior, minor for added or tightened behavior, patch for wording only. Add a changelog entry to its reference document; keep version numbers only in the workflow documents and their changelogs. Adoption upgrades apply only listed changes, so check the entry against the contract's full diff since the previous version before releasing.
- Keep scripts non-interactive, safe around existing files, and runnable from any working directory.
- Update `configs/` only for tooling behavior intended as a shared default or reusable fragment.
- Keep `README.md` focused on what this repo contains and how other locations consume it.
- Keep docs in `docs/` when the information is reference material rather than an instruction agents must follow.
- Update `docs/repository-flow.md` when repository ownership, validation, installation, synchronization, or downstream consumption paths change.

## Editing Guidance Files

- Write reusable guidance in a project-neutral way unless the file is explicitly for one project.
- Prefer concrete rules tied to project constraints, intentional conventions, or demonstrated failure modes. Remove obsolete model workarounds and redundant generic advice without losing useful defaults.
- Preserve each contract's trigger, required behavior, intentional defaults, exceptions, and completion condition when editing or condensing guidance. Compress explanations and duplication, not meaning or strength. Keep required detail reachable through applicable references; ask before resolving uncertain changes in meaning.
- Keep required operating rules compact. Link optional rationale, examples, and mode-specific detail with clear reading conditions.
- Keep public language guides structurally consistent: a scope introduction, then `Code Readability`, `Core Rules`, `Context and Tooling`, `Language Rules`, and `Validation`. Link to the canonical shared readability and local-consistency rules rather than duplicating them; keep only language-specific notes beneath the links. Put specialized rules under descriptive subsections. Operational guides cover tools, platforms, or procedures rather than a programming language, such as containers, reverse engineering, repositories, and security. They may retain their task-specific structure, but place shared readability immediately after the introduction when applicable.
- Preserve user decisions and existing authorization. Define completion and escalation by outcome, risk, and scope rather than mandatory review pauses.
- Do not duplicate the same rule across multiple files unless each file needs to stand alone in downstream use.
- Prefer config for mechanically enforceable rules; retain reusable guidance defaults where downstream tooling may not enforce them.
- When a rule depends on a target project, describe how to discover the target's local convention instead of hard-coding one here.

## Skills

- Always use `$skill-creator` when creating a new skill or making substantial updates to an existing skill.
- Skill directories must include a `SKILL.md` with frontmatter `name` and `description`.
- Make task-oriented skills explicit-only by default: set `policy.allow_implicit_invocation: false` in `agents/openai.yaml` and align the frontmatter description with explicit invocation.
- Enable implicit invocation only for safe, read-only assistance that does not redirect the user's workflow, and make that exception deliberate in metadata and wording.
- Keep skill workflows scoped to actions an agent can perform. State outcomes and decision criteria; require fixed sequences only where ordering protects correctness or safety.
- Keep descriptions concise and discriminating. Preserve explicit-only invocation while removing repeated capability lists.
- Evaluate substantial skill changes with representative requests, checking scope, conditional reading, and completion behavior rather than heading or wording equality.
- Link only to files inside the skill directory. Name other code-kit sources as paths from the code-kit root, which the skill locates by resolving its symlink; relative links outside the skill break once it is installed or copied.
- Store reusable agent prompts or metadata under the skill directory when they belong to that skill.
- Avoid adding generated or machine-local files to skills.

## Validation

- There is no project build by default.
- Follow the shared [test-work rules](guidance/AGENTS.md#test-work).
- Run `python3 scripts/validate.py` for repository-wide changes.
- For Markdown-only changes, review the rendered structure and check links or paths you changed.
- For config changes, validate against the relevant tool when that tool is available locally.
- For skill changes, read the full `SKILL.md`, make sure the workflow still matches the files in the skill directory, and run `$skill-creator` validation with `quick_validate.py`.

## Commit Messages

- Follow Conventional Commits 1.0.0.
- Use this subject format: `<type>[optional scope][optional !]: <gitmoji> <description>`.
- Choose the type by intent, for example `feat`, `fix`, `docs`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, or `revert`.
- Keep the description imperative, concise, and lowercase unless it names a proper noun.
