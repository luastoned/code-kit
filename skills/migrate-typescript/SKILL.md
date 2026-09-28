---
name: migrate-typescript
description: Audit or migrate a project to a requested TypeScript version. Use only when explicitly requested as $migrate-typescript.
---

# Migrate TypeScript

## Mode and Target

Use audit mode for compatibility checks, findings, or recommendations. Audit mode does not edit configs, source, manifests, or lockfiles, install dependencies, or run emitting commands. A migration or upgrade request authorizes relevant fixes and dependency changes within its stated scope.

Identify the project, installed and requested compiler versions, and whether the goal includes TypeScript 7 preparation. Preserve the runtime, module system, package manager, emitted output, and public contracts unless the request includes changing them.

Run existing checks where permitted. In migration mode, apply the test-work rules below and report needed test compatibility changes separately. Audit mode remains read-only.

<!-- code-kit shared block: guidance/AGENTS.md#test-work -->

- Run existing tests and checks when relevant and safe; use snapshot-update or baseline-regeneration modes only on request.
- Focused throwaway tests that use existing tooling and verify or investigate the requested work are fine. Keep them out of maintained files and remove them when done.
- Add or change maintained tests, fixtures, test configuration, or test infrastructure, including reusable harnesses even when temporary or untracked, only when asked. When verification needs them, report the gap instead.
- Fix regressions in the implementation; do not weaken assertions or expected results to make checks pass.

<!-- /code-kit shared block -->

## Investigation

Read applicable project guidance and inspect manifests, lockfiles, `tsconfig` inheritance, compiler integrations, and relevant typecheck/build commands. Discover whether TypeScript emits runtime code, declarations, or only checks a bundler-managed project.

Before applying version-specific migration rules, verify their claims against the requested compiler's diagnostics or behavior and available official release notes or compiler documentation. Report unavailable evidence; do not wait for a mismatch before checking the rules.

Read [TypeScript 6 migration checks](references/typescript-6.md) only when the source or target versions make that transition relevant. Treat stale reference items as findings, not instructions to force an incompatible change.

Establish existing diagnostics when useful. In audit mode, use a non-emitting check without incremental-state writes, or inspect existing output if the project command has side effects. Do not treat passing type checks alone as proof that emitted paths or runtime resolution are preserved.

## Migration and Completion

Apply clear fixes within the requested upgrade. Preserve old defaults explicitly when adopting stricter behavior would broaden the task. Ask only when a necessary change requires an undelegated runtime, output, or compatibility decision.

Parse configuration with a parser appropriate for JSON or JSONC. Run project-local checks and exercise affected runtime resolution or emitted artifacts when relevant. Fix introduced failures and rerun affected checks. Do not add deprecation suppression to claim a completed migration.

Run another compiler only when available or included in the requested upgrade; request any genuinely missing installation permission rather than assuming it from a compatibility audit.

For audits, report required migration work, optional modernization, and evidence without editing. For migrations, report changes, preserved behavior, versions checked, and remaining limitations.
