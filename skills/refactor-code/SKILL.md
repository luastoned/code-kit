---
name: refactor-code
description: Refactor selected code while preserving behavior and local conventions. Use only when explicitly requested as $refactor-code.
---

# Refactor Code

Work on the files or ownership area selected by the user. Preserve behavior unless a corresponding behavior change is explicitly part of the request.

## Context and Authority

Read applicable root and nested instructions. Use the nearest tooling configuration for behavior it owns, and mapped language or runtime guidance only when relevant constraints affect the refactor. Local-only or private guidance applies only when explicitly requested or already active under the project's instructions.

Inspect neighboring code, existing abstractions, callers, tests, and module boundaries as needed to understand the behavior being preserved. Do not load unrelated guides or perform a repository-wide audit by default.

Match equivalent neighboring implementations in naming, temporary results, statement structure, control flow, logging, and error handling. Deviate only for a concrete correctness, safety, or task requirement, and explain the reason. Apply this even when the project has no shared guidance.

## Simplification Review

Reason from the intended outcome and actual constraints, not from the assumption that the current design is necessary. Challenge weak assumptions against available evidence and identify pieces that add complexity without serving a required purpose.

Look first for what can be deleted entirely, then for what becomes simpler once those pieces are gone. Prefer removing unnecessary work over simplifying it, simplifying over optimizing, and optimizing over automating. This is a decision preference, not a requirement to perform every stage or minimize line count.

Make justified improvements within scope. If the code already meets the goal and is clear to maintain, leave it unchanged; do not invent a refactor to produce a diff.

## Refactor Boundaries

Preserve public APIs, serialized and persisted shapes, environment names, routes, config keys, and cross-boundary behavior unless changes are authorized.

Retain safety checks, compatibility handling, and intentional conventions unless evidence shows they are unnecessary under the actual requirements. Uncertainty alone does not justify deletion.

<!-- code-kit shared block: guidance/AGENTS.md#test-work -->

> Applies when: verifying or investigating requested work, or considering running, adding, or changing tests, checks, or test infrastructure.

- Run existing tests and checks when relevant and safe; use snapshot-update or baseline-regeneration modes only on request.
- Focused throwaway tests that use existing tooling and verify or investigate the requested work are fine. Keep them out of maintained files and remove them when done.
- Add or change maintained tests, fixtures, test configuration, or test infrastructure, including reusable harnesses even when temporary or untracked, only when asked. When verification needs them, report the gap instead.
- Fix regressions in the implementation; do not weaken assertions or expected results to make checks pass.

<!-- /code-kit shared block -->

Prefer local consistency, clear ownership, and removal of incidental complexity. Refactor duplicated logic when shared behavior has matching semantics and makes maintenance simpler; do not wait for a third copy or merge superficial similarities with different responsibilities. Named methodologies and repetition counts do not mandate a rewrite.

Preserve intent and non-obvious constraints in comments; remove stale narration. Prefer concise one-line implementation comments, using longer comments only when needed to preserve necessary context. Let formatter and linter tooling own presentation rules they actually specify.

If a useful improvement requires broader architecture, dependencies, or ownership changes outside scope, complete independent authorized improvements and explain the remaining decision. Do not silently expand the refactor.

## Required Readability

<!-- code-kit shared block: guidance/AGENTS.md#code-readability -->

> Applies when: writing, modifying, or reviewing maintained code, including scripts and documentation examples in any language.

These requirements apply whether or not a language-specific guide exists. Preserve language syntax, significant whitespace, and literal data; do not modify generated or verbatim artifacts whose owning contract requires exact output.

- Separate independent logical operations with one blank line, including adjacent statements of the same kind, such as unrelated calls or independent guards. A group is one coherent operation; the boundaries below are the minimum, not the only ones.
- Always start a new group:
  - when the statement kind changes between imports, exports, variable declarations or value-introducing assignments, other declarations, ordinary statements, control flow, and exits (`return`, `throw`, `break`, `continue`);
  - before loops, `try`, `switch`, and standalone blocks, and between a multiline `if` and a following `if`;
  - before a multiline `return`, and before any other exit whose preceding group spans more than one line;
  - around multiline function-valued declarations, between consecutive multiline calls, between a multiline call and a call to a different target, and between independent multiline module-level declarations;
  - after a standalone awaited operation, before a synchronous expression statement.
- A statement may stay with the preceding group despite a kind change or exit boundary when it uses a value introduced by the declaration or assignment directly before it (for an `if`, in its condition, even when the `if` is multiline), when it is a plain assignment next to a declaration, when it is an `if` whose condition reads a value the preceding statement mutated, or when it is an exit after a single-line group. Consecutive standalone awaits may stay together, even when multiline, when they form one coherent operation. These exceptions never override the boundaries before loops, `try`, `switch`, standalone blocks, and multiline returns, or around multiline function-valued declarations. Otherwise, wrapping alone does not split a group.
- Keep connected constructs such as `if`/`else`, `try`/`catch`/`finally`, and `do`/`while` together, and keep comments attached to the code they explain.
- These rules are requirements, not polish. Do not remove separation to save lines, or add helpers, abstractions, or narration to avoid blank lines.
- Add named region markers, in the language's supported syntax, when distinct responsibilities or multi-stage logic need named sections. Judge by logical complexity, not length; regions supplement blank lines and must not hide unnecessary complexity.
- A spacing linter owns the boundaries it enforces, but it cannot detect independent operations within one kind; judge those yourself. Apply the full model by hand where no linter runs, including other languages, skipped test files, and documentation examples. Passing or absent tooling does not waive these rules; report conflicts with explicit target instructions or tooling instead of silently dropping either.

<!-- /code-kit shared block -->

Apply these requirements even when the project has no shared guidance. Unless the project establishes a different marker style, use `// #region Name` and `// #endregion` in JavaScript and TypeScript, `# region Name` and `# endregion` in Python and POSIX shells, and `#region Name` and `#endregion` in PowerShell. In C++, use `#pragma region Name` and `#pragma endregion` only when every compiler and flag set the project builds with accepts them without warnings; otherwise omit region markers.

## Completion

Inspect the refactored code for semantic grouping and consistency with equivalent neighboring implementations after formatting. Correct missing separation, unnecessary blank lines within tightly coupled groups, and accidental pattern differences before calling the refactor complete; passing automated checks alone is insufficient.

For changed code, run the smallest relevant checks, including integrated paths when the refactor crosses connected boundaries. Use owning-project validation before unrelated root checks. Fix regressions introduced by the refactor and rerun affected checks.

Before calling the work done, reassess the result against the original goal for remaining unnecessary complexity. Finish when the requested refactor is complete, relevant verification is done, and the final review finds no unresolved issue introduced by the change. Report further optional improvements without extending the task. If blocked, state what remains incomplete. Report changes or why no change was warranted, preserved behavior, and validation or limitations without repeating the plan.
