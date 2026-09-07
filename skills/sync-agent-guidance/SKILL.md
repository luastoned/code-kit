---
name: sync-agent-guidance
description: Audit or adapt code-kit guidance to a target project. Use only when explicitly requested as $sync-agent-guidance.
---

# Sync Agent Guidance

Adapt instructions for decisions agents will actually face in the target. Source-section coverage is not a goal. Audit requests are read-only; sync, create, update, and resynchronize requests authorize the relevant guidance changes.

## Discovery

Resolve symlinks to this skill, then locate `guidance/` in the code-kit root two directories above it, or use the user's source path. Confirm the source entrypoint and repository guide exist; check known source locations before asking for a missing path.

Read source `AGENTS.md` for guide routing. Read `Repositories.md` when choosing root versus nested placement or resolving ownership and commit rules. Load language and specialty guides only for maintained areas relevant to the target request.

Inspect applicable target instructions, manifests, hidden tool configs, ownership boundaries, local commands, and relevant developer docs. Use `rg --files --hidden` with generated, dependency, and Git internals excluded. Ignore incidental examples, vendor code, and one-off files unless their maintenance is in scope.

Private guidance is opt-in. When requested, read `guidance/private/AGENTS.md` first if present, then only the guides it maps or the user names. Do not copy private material into public files without explicit publication authorization.

## Adaptation Criteria

Retain a source rule when it changes a likely decision, preserves a non-obvious constraint, addresses a demonstrated failure, or establishes a useful default the target lacks.

Omit generic advice, instructions already enforced by tooling, irrelevant operational detail, and redundant restatements. Deliberate condensation or omission of such material is not drift. Do not reproduce every source heading or make language guidance dominate merely to prove coverage.

Preserve the shared semantic-spacing and local-consistency requirements for all maintained languages, including those without a mapped guide. Source language guides link to these rules in the source entrypoint. In the target, keep one canonical copy in applicable guidance and retarget links to it. When exporting a standalone guide without that shared source, include the necessary rules in the exported guide rather than leaving an unavailable link or silently omitting them. Formatter or linter silence is not enforcement and does not justify dropping these rules as generic style advice.

Follow local scope, architecture, security, deployment, commands, and ownership rules. Tool configuration governs the behavior it owns; shared language preferences fill gaps. A shared dependency or style preference is not permission to migrate tooling.

For a new project, use the known language to select useful constraints without inventing a runtime, framework, package manager, or commands. Include the source commit default when no local policy exists, even if Git has not been initialized.

Keep root guidance focused on shared boundaries and discovery. Put project-specific implementation constraints near their owner. Preserve explicit user choices and existing authorization; define meaningful completion and escalation conditions rather than repeated approval gates.

## Audit

Compare meaning and likely behavior. Report `current` when no material decision-relevant drift exists, or `resync recommended` for missing constraints, obsolete instructions, conflicting authorities, or newly relevant behavior.

Give locations, consequences, and minimal revisions. Report important intentional overrides. Text differences, heading order, missing generic sections, timestamps, and absent provenance metadata do not establish drift. Do not edit or format in audit mode.

## Sync and Completion

Merge into existing guidance and referenced guides. Keep each retained subject coherent, but change headings or combine sections when that improves routing. Remove obsolete or duplicate instructions within scope; preserve unrelated user content.

Do not add version stamps, provenance comments, locks, or tracking files. Do not copy shared documentation wholesale or create parallel authorities.

Review the final instructions for conflicting rules, broken paths, needless mandatory reading, and accidental permission changes. Run relevant local checks and fix introduced issues. Report changed files, guides used, material omissions or local adaptations, and unresolved conflicts or validation limits.
