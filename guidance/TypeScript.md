# TypeScript Agent

Apply this guide to JavaScript, TypeScript, and Node.js source, runtime boundaries, and tooling.

## Code Readability

Apply the shared [code-readability requirements](./AGENTS.md#code-readability) and [local-consistency rules](./AGENTS.md#changes-and-validation). Language-specific rules below do not replace them.

Keep connected `if`/`else`, `try`/`catch`/`finally`, and `do`/`while` constructs together.

## Core Rules

- When the project uses [`std-kit`](https://github.com/luastoned/std-kit), reuse matching utilities after checking their semantics. It is the shared preference when choosing a utility layer, not a prerequisite for ordinary edits or a reason to add a dependency by itself.
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
- Preserve the project's import-path convention. When establishing an alias within scope, prefer `~/*` mapped to the primary source root.
- Verify a new alias across runtime, build, and tests. Complete resolver support within the authorized change or defer the alias and report the missing support.
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
- Extract shared behavior when stable duplication, ownership, or a public contract justifies it. Repetition counts are a heuristic, not a prerequisite.
- Prefer early returns over deep nesting.
- Prefer options objects over positional arguments once a function has three or more parameters or multiple booleans.
- Prefer async `fs/promises` APIs over synchronous filesystem calls in async code.
- Use `AbortSignal`, timeouts, and explicit cancellation paths for new long-running I/O where the surrounding code supports it.
- Preserve region markers when the project uses them; file length alone does not require adding them.

### Functions and Classes

- Prefer classes when they provide a clear module boundary around cohesive state, dependencies, or behavior.
- Prefer plain functions for small pure transforms, local callbacks, and simple stateless helpers.
- Do not break a coherent module into many exported utility functions when a small class would make ownership and usage clearer.
- Avoid class hierarchies, base-service patterns, and framework-like ceremony.
- Introduce interface-style indirection only when it serves a concrete purpose, such as a public contract, dependency isolation, or multiple implementations.
- Outside classes, prefer named `function` declarations for exported or shared module logic; use arrow functions for local callbacks and short lexical closures.
- Inside classes, prefer `public` and `private` methods over arrow-function fields; use arrow-function fields only when preserving lexical `this` is required.

## Validation

Follow the shared [test-work boundary](./AGENTS.md#test-work): test development and related assets require an explicit request; running existing checks does not.

- Run type checks through the project-local script or project-mode `tsc`; do not use `tsc some-file.ts` in repos with `tsconfig.json`.
- When import paths, aliases, or module settings change, verify resolution across the affected runtime, build, and tests.
- If local tooling is unavailable, state what could not be verified.
