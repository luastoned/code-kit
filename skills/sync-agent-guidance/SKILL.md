---
name: sync-agent-guidance
description: Audit or adapt code-kit guidance to a target project. Use only when explicitly requested as $sync-agent-guidance.
---

# Sync Agent Guidance

Adapt source guidance to the target while preserving intentional conventions and their strength. Consider every section of each selected guide; reproducing every heading or section is not required. Audit requests are read-only; sync, create, update, and resynchronize requests authorize the relevant guidance changes.

## Discovery

Resolve symlinks to this skill, then locate `guidance/` in the code-kit root two directories above it, or use the user's source path. Confirm the source entrypoint and repository guide exist; check known source locations before asking for a missing path.

Read source `AGENTS.md` for guide routing. Read `Repositories.md` when choosing root versus nested placement or resolving ownership and commit rules. Load language and specialty guides only for maintained areas relevant to the target request.

Inspect applicable target instructions, manifests, hidden tool configs, ownership boundaries, local commands, and relevant developer docs. Use `rg --files --hidden` with generated, dependency, and Git internals excluded. Ignore incidental examples, vendor code, and one-off files unless their maintenance is in scope.

Private guidance is opt-in. When requested, read `guidance/private/AGENTS.md` first if present, then only the guides it maps or the user names. Do not copy private material into public files without explicit publication authorization.

## Guidance Placement

Default to one `AGENTS.md` at the owning project root within the requested scope. Determine ownership from build entrypoints, manifest relationships, and actual commands, not directory depth or the current source-file location. Source, include, test, and same-named inner folders do not each need an `AGENTS.md`; a nested manifest or build target alone does not establish a separate guidance boundary.

For `projectA/projectA.sln` with headers, C++ sources, and possibly a `.vcxproj` under `projectA/projectA/`, place shared and C++ implementation guidance in `projectA/AGENTS.md`. Do not create `projectA/projectA/AGENTS.md` merely because that folder contains the source or project file.

Create nested guidance only when the user explicitly requests that placement or the subtree has materially different operating rules that need their own scope and cannot be kept clear in the root. State the concrete reason before creating it. Reuse existing nested guidance when appropriate; do not delete or flatten existing files solely to meet the one-root default. Consolidate only within authorized scope while preserving unique constraints and updating links.

## Adaptation Criteria

Consider each selected source section for retention, merging, adaptation, or omission. Preserve applicable obligations, intentional conventions, and useful defaults, including those not yet used by a sparse target. Keep the primary language guidance recognizable in a single-language project, with repository rules as compact supporting constraints.

Preserve each contract's trigger, required behavior, intentional defaults, exceptions, and completion condition. Shorten explanations and duplication, not meaning or strength. Omit material only when it is inapplicable, equivalently covered by retained guidance or actual tooling enforcement, or explicitly superseded by local policy. Keep related rules together without mechanically copying headings. If unsure whether to merge, adapt, or omit a section without losing intent, ask the user before deciding; continue independent work.

Preserve the shared semantic-spacing and local-consistency requirements for all maintained languages, including those without a mapped guide. Source language guides link to these rules in the source entrypoint. In the target, keep one canonical copy in applicable guidance and retarget links to it. When exporting a standalone guide without that shared source, include the necessary rules in the exported guide rather than leaving an unavailable link or silently omitting them. Formatter or linter silence is not enforcement and does not justify dropping these rules as generic style advice.

Follow local scope, architecture, security, deployment, commands, and ownership rules. Tool configuration governs the behavior it owns; shared language preferences fill gaps. A shared dependency or style preference is not permission to migrate tooling.

Carry the shared test-work boundary into target guidance for every language: existing checks and focused, isolated disposable tests using existing tooling are allowed within scope; remove scratch tests when finished. Persistent test changes and reusable harnesses or test infrastructure require an explicit request, even if called temporary. Preserve this distinction in standalone exports, and report explicit conflicting target policy instead of silently discarding either rule.

For a new project, use the known language to select useful constraints without inventing a runtime, framework, package manager, or commands. Include the source commit default unless explicit local commit policy specifies a different format, even if Git has not been initialized.

For a single project, keep shared boundaries and project-specific implementation constraints together in root guidance. For genuinely distinct subprojects, keep shared rules at the root and scoped differences at their owning boundary without duplicating inherited rules. Preserve explicit user choices and existing authorization; define meaningful completion and escalation conditions rather than repeated approval gates.

## Audit

Compare meaning and likely behavior. Report `current` when no material decision-relevant drift exists, or `resync recommended` for missing constraints, obsolete instructions, conflicting authorities, or newly relevant behavior.

Give locations, consequences, and minimal revisions. Report important intentional overrides. Text differences, heading order, missing generic sections, timestamps, and absent provenance metadata do not establish drift. Do not edit or format in audit mode.

## Sync and Completion

Merge into existing guidance and referenced guides. Keep each retained subject coherent, but change headings or combine sections when that improves routing. Remove obsolete or duplicate instructions within scope; preserve unrelated user content.

Do not add version stamps, provenance comments, locks, or tracking files. Do not copy shared documentation wholesale or create parallel authorities.

Compare the result with the considered source sections for lost obligations, weakened defaults, conflicting rules, broken paths, needless mandatory reading, and accidental permission changes. Check that every new nested `AGENTS.md` has a concrete scoping need rather than merely mirroring a folder. Run relevant local checks and fix introduced issues. Report changed files, placement rationale, guides used, material omissions or local adaptations, and unresolved conflicts or validation limits.
