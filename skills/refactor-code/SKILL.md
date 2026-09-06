---
name: refactor-code
description: Refactor selected code while preserving behavior and local conventions. Use only when explicitly requested as $refactor-code.
---

# Refactor Code

Work on the files or ownership area selected by the user. Preserve behavior unless a corresponding behavior change is explicitly part of the request.

## Context and Authority

Read applicable root and nested instructions. Use the nearest tooling configuration for behavior it owns, and mapped language or runtime guidance only when relevant constraints affect the refactor. Private guidance applies only when explicitly requested or already active under the project's instructions.

Inspect neighboring code, existing abstractions, callers, tests, and module boundaries as needed to understand the behavior being preserved. Do not load unrelated guides or perform a repository-wide audit by default.

## Simplification Review

Reason from the intended outcome and actual constraints, not from the assumption that the current design is necessary. Challenge weak assumptions against available evidence and identify pieces that add complexity without serving a required purpose.

Look first for what can be deleted entirely, then for what becomes simpler once those pieces are gone. Prefer removing unnecessary work over simplifying it, simplifying over optimizing, and optimizing over automating. This is a decision preference, not a requirement to perform every stage or minimize line count.

Make justified improvements within scope. If the code already meets the goal and is clear to maintain, leave it unchanged; do not invent a refactor to produce a diff.

## Refactor Boundaries

Preserve public APIs, serialized and persisted shapes, environment names, routes, config keys, and cross-boundary behavior unless changes are authorized.

Retain safety checks, compatibility handling, and intentional conventions unless evidence shows they are unnecessary under the actual requirements. Uncertainty alone does not justify deletion.

Prefer local consistency, clear ownership, and removal of incidental complexity. Extract abstractions for stable repeated behavior or a concrete boundary; named methodologies and repetition counts do not mandate a rewrite.

Comments should retain intent and non-obvious constraints. Remove stale narration and let formatter and linter tooling own presentation.

If a useful improvement requires broader architecture, dependencies, or ownership changes outside scope, complete independent authorized improvements and explain the remaining decision. Do not silently expand the refactor.

## Completion

For changed code, run the smallest relevant checks, including integrated paths when the refactor crosses connected boundaries. Use owning-project validation before unrelated root checks. Fix regressions introduced by the refactor and rerun affected checks.

Before calling the work done, reassess the result against the original goal for remaining unnecessary complexity. Stop when no concrete, justified improvement remains within scope and relevant verification is complete, or a concrete blocker remains. Report changes or why no change was warranted, preserved behavior, and validation or limitations without repeating the plan.
