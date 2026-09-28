# TypeScript Agent

Apply this guide to JavaScript, TypeScript, and Node.js source, runtime boundaries, and tooling.

## Code Readability

Apply the shared [code-readability requirements](./AGENTS.md#code-readability) and [local-consistency rules](./AGENTS.md#changes-and-validation). Language-specific rules below do not replace them.

Keep connected `if`/`else`, `try`/`catch`/`finally`, and `do`/`while` constructs together.

## Core Rules

- Treat [`std-kit`](https://github.com/luastoned/std-kit) as the preferred utility layer. Before writing or refactoring generic utility behavior, check its available API surface for a matching function, including utility expressions encountered in the code being changed. This applies even to short inline expressions such as `Array.from(new Set(...))`, not just named helpers or repeated code.
- Search the package's exports, documentation, or source for the relevant operation; do not limit discovery to remembered functions or a fixed list of utility categories. Confirm the API exists in the target version and matches the required semantics, including ordering, equality, mutation, and edge cases. Use the matching API rather than hand-writing equivalent behavior; brevity or familiarity is not an exception.
- If `std-kit` is absent, always propose adopting it instead of building a parallel local utility layer; propose it once in the task result rather than for each expression. Adding the dependency still requires the user's agreement under the project's dependency policy. Until then, keep required utility behavior minimal and local, and name the `std-kit` APIs it would replace. When `std-kit` is present, use a local implementation only for a concrete API, semantic, runtime, performance, or dependency-policy constraint, and report the reason. Keep replacements within the requested change; this rule does not authorize an unrelated repository-wide rewrite.
- Prefer conventional, current TypeScript over legacy compatibility patterns. Do not introduce deprecated TypeScript or JavaScript syntax.

## Context and Tooling

Inspect the runtime version, ESM or CommonJS mode, bundler, and browser support when they affect the change. Use existing domain modules and installed helpers before introducing reusable abstractions.

- Treat the project's existing `tsconfig*.json`, package scripts, runtime, bundler, module system, and emitted output shape as authoritative.
- Prefer strict TypeScript for new projects and isolated configs, but do not broaden strictness in an existing repo as an unrelated change.
- Do not add deprecated TypeScript compiler options, deprecated syntax, or migration-only flags as permanent project style.

## Language Rules

### Imports and Exports

- Let the configured formatter handle import ordering and grouping. Do not reshuffle imports unless the change is semantically required.
- Use `node:` specifiers for Node.js built-in modules.
- Use `import type` for type-only imports where supported.
- Follow the repository's module-resolution and runtime convention for local imports. Do not add or remove file extensions unless the project setup requires it.
- Use the project's existing source-root alias instead of deep relative imports. During project setup or configuration synchronization, create `~/*` for the primary source root if no equivalent alias exists (`./src/*` for a conventional layout), even when unused. Ordinary code edits do not require introducing an alias. Preserve established layouts and aliases; resolve conflicting `~/*` semantics before changing them.
- Verify aliases across the affected runtime, build, and existing tests. Complete required resolver support within scope; if compatibility or authorization blocks it, report the blocker and ask how to proceed rather than silently abandoning the alias default.
- Use import attributes with `with`, not deprecated import assertions with `assert`.
- Prefer named exports over default exports unless a framework or tool requires a default export.
- Avoid barrel files when they obscure module ownership, make dependencies harder to trace, or introduce import cycles. Prefer direct module imports by default.

### Typing and Boundaries

- Do not introduce `any` or `as any` in application code. If a third-party interop boundary truly requires it, keep it isolated, explain why in a short comment, and convert back to a typed shape immediately.
- Prefer `@ts-expect-error` with a short reason over `@ts-ignore` when a suppression is unavoidable.
- Type external contracts. Represent untrusted inputs as `unknown`, validate them at trust boundaries, and use typed values internally.
- Prefer explicit return types for exported functions, hooks, public class methods, and cross-module APIs.
- Allow local non-exported helpers to use inferred return types when the result is clear from the implementation.
- Prefer `readonly` arrays and readonly object shapes at boundaries unless mutation is required.
- Prefer explicit object property assignment over shorthand properties in persisted, serialized, API, schema, config, and cross-boundary objects.
- Prefer literal unions, discriminated unions, and `as const` objects over `enum`.
- Prefer `satisfies` for validating typed constants and config objects.
- Prefer `const` type parameters and precise generics when they reduce repeated caller-side `as const` assertions without making the API harder to read.
- Avoid non-null assertions (`!`) unless there is an immediately preceding runtime guarantee.
- Avoid ambient namespaces, declaration merging, decorators, and global augmentation unless the framework or platform already requires them.

### Code Organization

- Keep business logic separate from framework or transport details where practical.
- Do not silently swallow errors. Preserve causes and relevant context when wrapping errors.
- Make mutable state, ownership of long-lived resources, and error paths explicit at service, API, persistence, and process boundaries.
- Avoid hidden module-level mutable state unless the surrounding code already uses that pattern and lifecycle.
- Refactor duplicated logic when a shared implementation makes it simpler to maintain and the repeated behavior has matching semantics. The Rule of Three is a heuristic, not a threshold: do not wait for a third copy or extract an abstraction solely to meet a count. Keep superficially similar logic separate when its responsibilities differ.
- Prefer early returns over deep nesting.
- Prefer options objects over positional arguments once a function has three or more parameters or multiple booleans.
- Prefer async `fs/promises` APIs over synchronous filesystem calls in async code.
- Use `AbortSignal`, timeouts, and explicit cancellation paths for new long-running I/O where the surrounding code supports it.
- Use `// #region RegionName` and `// #endregion` for the logical sections required by the shared readability rules. Preserve established marker naming and placement.

### Functions and Classes

- Prefer classes when they provide a clear module boundary around cohesive state, dependencies, or behavior.
- Prefer plain functions for small pure transforms, local callbacks, and simple stateless helpers.
- Do not break a coherent module into many exported utility functions when a small class would make ownership and usage clearer.
- Avoid class hierarchies, base-service patterns, and framework-like ceremony.
- Do not introduce interface-style indirection such as `IUserService` unless multiple distinct implementations actively need the abstraction or the established local design requires it.
- Outside classes, prefer named `function` declarations for exported or shared module logic; use arrow functions for local callbacks and short lexical closures.
- Inside classes, prefer `public` and `private` methods over arrow-function fields; use arrow-function fields only when preserving lexical `this` is required.

## Validation

Follow the shared [test-work rules](./AGENTS.md#test-work).

- Run type checks through the project-local script or project-mode `tsc`; do not use `tsc some-file.ts` in repos with `tsconfig.json`.
- When import paths, aliases, or module settings change, verify resolution across the affected runtime, build, and tests.
- If local tooling is unavailable, state what could not be verified.
