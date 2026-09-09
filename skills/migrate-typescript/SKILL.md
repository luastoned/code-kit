---
name: migrate-typescript
description: Audit or migrate a project to a requested TypeScript version. Use only when explicitly requested as $migrate-typescript.
---

# Migrate TypeScript

## Mode and Target

Use audit mode for compatibility checks, findings, or recommendations. Audit mode does not edit configs, source, manifests, or lockfiles, install dependencies, or run emitting commands. A migration or upgrade request authorizes relevant fixes and dependency changes within its stated scope.

Identify the project, installed and requested compiler versions, and whether the goal includes TypeScript 7 preparation. Preserve the runtime, module system, package manager, emitted output, and public contracts unless the request includes changing them.

Run existing checks where permitted. In migration mode, focused disposable tests using existing tooling are allowed within scope; keep them isolated and remove them when finished. Persistent test changes and reusable harnesses or test infrastructure require an explicit request, even if the harness is temporary or untracked. Report maintained test compatibility changes separately unless requested; audit mode remains read-only.

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
