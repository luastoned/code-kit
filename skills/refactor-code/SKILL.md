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

Run relevant existing checks. Focused throwaway tests using existing tooling are fine; keep them out of maintained files and remove them when done. Add or change maintained tests, fixtures, test configuration, or test infrastructure, including reusable harnesses even when temporary or untracked, only when asked. When verification needs them, report the gap instead. Do not weaken tests to make the refactor pass.

Prefer local consistency, clear ownership, and removal of incidental complexity. Refactor duplicated logic when shared behavior has matching semantics and makes maintenance simpler; do not wait for a third copy or merge superficial similarities with different responsibilities. Named methodologies and repetition counts do not mandate a rewrite.

Preserve intent and non-obvious constraints in comments; remove stale narration. Prefer concise one-line implementation comments, using longer comments only when needed to preserve necessary context. Let formatter and linter tooling own presentation rules they actually specify.

If a useful improvement requires broader architecture, dependencies, or ownership changes outside scope, complete independent authorized improvements and explain the remaining decision. Do not silently expand the refactor.

## Required Readability

These requirements apply to maintained code in every language, including scripts and code examples, whether or not a language-specific guide exists. Preserve language syntax, significant whitespace, and literal data; do not modify generated or verbatim artifacts whose owning contract requires exact output.

- Separate independent logical steps with a single blank line. A group represents one coherent operation, not one statement category: setup, validation, computation, and a result can belong together when they serve that operation.
- Keep a declaration or assignment adjacent to the check, call, or return that immediately consumes it within the same operation. Do not insert a blank line between a query buffer and its query, a computed boundary and its guard, or a final value and the return using it. Keep related setup declarations together; data dependency alone does not merge an entire function into one group.
- Separate independent guards and control-flow blocks, and separate a completed block from the next independent step. Keep connected constructs such as `if`/`else`, `try`/`catch`/`finally`, and `do`/`while` together, and keep comments attached to the code they explain.
- Line wrapping does not define group boundaries. A multiline declaration or expression does not require a blank line before its tightly coupled use. Follow local wrapping rules without forcing conditions onto one line or splitting related statements merely because they wrap.
- These spacing rules are requirements, not optional polish. Do not remove semantic separation to minimize line count, or introduce helpers, abstractions, or narration merely to avoid using blank lines.
- Add named region markers when distinct responsibilities or multi-stage logic need named sections to make their structure and navigation clear, using the language/editor-supported convention. Base this on logical complexity, not file size or line counts. Preserve established marker style; do not wrap every guard or simple operation, invent unsupported syntax, or use regions to hide unnecessary complexity. Regions supplement semantic blank lines, not replace them.
- Inspect semantic spacing before handing off changed code. A passing formatter or linter does not establish compliance; tooling silence or absence does not waive these rules. If explicit target instructions or tooling conflict, follow the applicable authority and report the conflict rather than silently dropping the requirement.

Apply these requirements even when the project has no shared guidance. Unless the project establishes a different marker style, use `// #region Name` and `// #endregion` in JavaScript and TypeScript, `# region Name` and `# endregion` in Python and POSIX shells, and `#region Name` and `#endregion` in PowerShell. In C++, use `#pragma region Name` and `#pragma endregion` only when every compiler and flag set the project builds with accepts them without warnings; otherwise omit region markers.

## Completion

Inspect the refactored code for semantic grouping and consistency with equivalent neighboring implementations after formatting. Correct missing separation, unnecessary blank lines within tightly coupled groups, and accidental pattern differences before calling the refactor complete; passing automated checks alone is insufficient.

For changed code, run the smallest relevant checks, including integrated paths when the refactor crosses connected boundaries. Use owning-project validation before unrelated root checks. Fix regressions introduced by the refactor and rerun affected checks.

Before calling the work done, reassess the result against the original goal for remaining unnecessary complexity. Finish when the requested refactor is complete, relevant verification is done, and the final review finds no unresolved issue introduced by the change. Report further optional improvements without extending the task. If blocked, state what remains incomplete. Report changes or why no change was warranted, preserved behavior, and validation or limitations without repeating the plan.
