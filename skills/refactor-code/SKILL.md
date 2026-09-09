---
name: refactor-code
description: Refactor selected code while preserving behavior and local conventions. Use only when explicitly requested as $refactor-code.
---

# Refactor Code

Work on the files or ownership area selected by the user. Preserve behavior unless a corresponding behavior change is explicitly part of the request.

## Context and Authority

Read applicable root and nested instructions. Use the nearest tooling configuration for behavior it owns, and mapped language or runtime guidance only when relevant constraints affect the refactor. Private guidance applies only when explicitly requested or already active under the project's instructions.

Inspect neighboring code, existing abstractions, callers, tests, and module boundaries as needed to understand the behavior being preserved. Do not load unrelated guides or perform a repository-wide audit by default.

Match equivalent neighboring implementations in naming, temporary results, statement structure, control flow, logging, and error handling. Deviate only for a concrete correctness, safety, or task requirement, and explain the reason. Apply this even when the skill runs without code-kit's shared guidance.

## Simplification Review

Reason from the intended outcome and actual constraints, not from the assumption that the current design is necessary. Challenge weak assumptions against available evidence and identify pieces that add complexity without serving a required purpose.

Look first for what can be deleted entirely, then for what becomes simpler once those pieces are gone. Prefer removing unnecessary work over simplifying it, simplifying over optimizing, and optimizing over automating. This is a decision preference, not a requirement to perform every stage or minimize line count.

Make justified improvements within scope. If the code already meets the goal and is clear to maintain, leave it unchanged; do not invent a refactor to produce a diff.

## Refactor Boundaries

Preserve public APIs, serialized and persisted shapes, environment names, routes, config keys, and cross-boundary behavior unless changes are authorized.

Retain safety checks, compatibility handling, and intentional conventions unless evidence shows they are unnecessary under the actual requirements. Uncertainty alone does not justify deletion.

Run relevant existing checks; focused disposable tests using existing tooling are allowed within scope in every language. Keep scratch tests isolated and remove them when finished. Persistent test changes and reusable harnesses or test infrastructure require an explicit request, even if the harness is temporary or untracked. Report necessary persistent test changes as a gap unless requested; do not weaken tests to make the refactor pass.

Prefer local consistency, clear ownership, and removal of incidental complexity. Refactor duplicated logic when shared behavior has matching semantics and makes maintenance simpler; do not wait for a third copy or merge superficial similarities with different responsibilities. Named methodologies and repetition counts do not mandate a rewrite.

Preserve intent and non-obvious constraints in comments; remove stale narration. Prefer concise one-line implementation comments, using longer comments only when needed to preserve necessary context. Let formatter and linter tooling own presentation rules they actually specify.

If a useful improvement requires broader architecture, dependencies, or ownership changes outside scope, complete independent authorized improvements and explain the remaining decision. Do not silently expand the refactor.

## Required Readability

Apply these requirements to every language in the requested refactor, including scripts and code examples, not just TypeScript. Preserve language syntax, significant whitespace, and literal contents; do not reformat generated or verbatim artifacts whose owning contract requires exact output.

Separate independent logical steps with a single blank line. Group by coherent operation, not by statement category: keep declarations and assignments adjacent to their immediate check, call, or return within that operation. A query buffer and its query, a computed boundary and its guard, or a final value and the return using it must not be split by a blank line. Keep related setup declarations together without treating every data dependency as one function-wide group.

Separate independent guards and control-flow blocks, and separate a completed block from the next independent step. Keep connected constructs such as `if`/`else`, `try`/`catch`/`finally`, and `do`/`while` together, and comments attached to their code. A wrapped declaration or expression does not require a blank line before its tightly coupled use; follow local line-wrapping rules independently. Do not remove meaningful whitespace to reduce line count or invent helpers and comments to substitute for separation.

Add named region markers when distinct responsibilities or multi-stage logic need named sections to make their structure and navigation clear, using the language/editor-supported convention. Base this on logical complexity, not file size or line counts. Preserve established marker style; do not wrap every guard or simple operation, invent unsupported syntax, or use regions to hide unnecessary complexity. Regions supplement blank-line separation.

These requirements apply even when the skill is used without shared guidance. Formatter or linter silence is not an exemption. Follow explicit conflicting target authority and report the conflict rather than silently abandoning readability requirements.

## Completion

Inspect the refactored code for semantic grouping and consistency with equivalent neighboring implementations after formatting. Correct missing separation, unnecessary blank lines within tightly coupled groups, and accidental pattern differences before calling the refactor complete; passing automated checks alone is insufficient.

For changed code, run the smallest relevant checks, including integrated paths when the refactor crosses connected boundaries. Use owning-project validation before unrelated root checks. Fix regressions introduced by the refactor and rerun affected checks.

Before calling the work done, reassess the result against the original goal for remaining unnecessary complexity. Finish when the requested refactor is complete, relevant verification is done, and the final review finds no unresolved issue introduced by the change. Report further optional improvements without extending the task. If blocked, state what remains incomplete. Report changes or why no change was warranted, preserved behavior, and validation or limitations without repeating the plan.
