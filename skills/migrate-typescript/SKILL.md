---
name: migrate-typescript
description: Audit and migrate TypeScript projects for TypeScript 6.0+ compatibility. Use only when the user explicitly invokes `$migrate-typescript` or names the `migrate-typescript` skill.
---

# Migrate TypeScript

## Overview

Audit a target TypeScript project for TypeScript 6.0 deprecations, default changes, and upgrade risks. This is one-time migration work, not ongoing project guidance. Keep fixes scoped, preserve the target runtime and build model, and validate with the project's own type-check command.

## Workflow

1. Identify the target project directory from the user request or current working directory.
2. Inspect TypeScript context before editing:
   - `package.json`, lockfiles, workspace files, and package manager.
   - Installed and requested TypeScript versions, and whether the goal is TypeScript 6 compatibility, TypeScript 7 preparation, or both.
   - `tsconfig*.json` files and any `extends` chain.
   - Build and runtime path: bundled app, direct Node.js execution, library emit, framework-managed build, browser app, Bun, or mixed workspace.
   - JavaScript inputs and `allowJs` or `checkJs` when TypeScript 7 preparation is in scope.
   - Existing type-check and build scripts and CI commands.
3. Establish the authoritative version-specific evidence before applying the checklist:
   - Prefer the installed or requested compiler's diagnostics and behavior for the target version.
   - Verify version-specific claims against current official TypeScript release notes or compiler documentation when they are reachable.
   - Treat the checks below as a focused starting point, not a substitute for current compiler evidence. Follow official documentation and observed compiler behavior when they differ, and report any stale checklist item.
4. Check config files for TypeScript 6.0 deprecations:
   - `target: "ES5"`.
   - `downlevelIteration`.
   - `moduleResolution: "node"`, `"node10"`, or `"classic"`.
   - `module: "amd"`, `"umd"`, `"system"`, or `"none"`.
   - `baseUrl`.
   - `esModuleInterop: false` or `allowSyntheticDefaultImports: false`.
   - `alwaysStrict: false`.
   - `outFile`.
5. Check for TypeScript 6.0 behavior changes:
   - Missing explicit `types` when the project relies on Node, test runner, or runtime globals.
   - Missing explicit `rootDir` when source lives under `src/` and the intended emitted output excludes `dist/src/...`.
   - Reliance on the old `strict: false` default.
   - Reliance on the old `module` or `target` defaults when emitted syntax or module format matters.
   - Reliance on the old `noUncheckedSideEffectImports: false` default.
   - Reliance on the old `libReplacement: true` default in projects that replace built-in library declaration files.
   - Package scripts or docs that run `tsc some-file.ts` in a directory with `tsconfig.json`.
   - `ignoreDeprecations: "6.0"`; treat it as a temporary compatibility bridge and a blocker for TypeScript 7 preparation, not as a deprecated option itself.
6. Search source and docs for deprecated syntax:
   - Legacy namespace declarations written as `module Name {}`. Ambient `declare module "pkg"` declarations remain valid.
   - Import assertions using `assert` instead of import attributes using `with`.
   - `/// <reference no-default-lib="true" />`.
7. When TypeScript 7 preparation is in scope and the project includes JavaScript inputs, inspect JavaScript and JSDoc diagnostics with the TypeScript 7 compiler when available. Fix reported compatibility issues instead of applying broad speculative JSDoc rewrites.
8. Make scoped fixes when the target runtime or build model is ambiguous or the migration could change published output. Otherwise apply the clear migration directly.
9. Validate:
   - Parse changed JSON files.
   - Run the project-local typecheck script when available.
   - Otherwise run the most appropriate local TypeScript check, usually `tsc --noEmit` or `tsc -p tsconfig.json --noEmit`.
   - For TypeScript 7 preparation, run the equivalent TypeScript 6 check with `stableTypeOrdering` when supported.
   - Verify that `ignoreDeprecations` is not hiding remaining migration work.
   - Use `stableTypeOrdering` for comparison only; do not add it as a permanent project setting.
   - If `tsgo` or `@typescript/native-preview` is already available or the user requested it, run the equivalent TypeScript 7 check and compare diagnostics. Do not install it solely for validation without permission.
   - If validation cannot run because dependencies or TypeScript are unavailable, say so clearly.

## Migration Rules

- For bundled apps, Bun-style projects, or projects where esbuild, Vite, Rollup, or Webpack handles module transformation, prefer `module: "Preserve"` with `moduleResolution: "Bundler"` when compatible.
- For direct Node.js execution from `tsc` output, prefer Node-aware settings such as `module: "NodeNext"` and `moduleResolution: "NodeNext"` when the project is ready for ESM or CommonJS semantics.
- For `baseUrl` used only as a prefix for `paths`, remove `baseUrl` and move the prefix into each `paths` entry.
- For rare projects that depended on `baseUrl` as a lookup root, preserve the behavior with an explicit catch-all `paths` mapping such as `"*": ["./src/*"]`.
- Do not make strictness upgrades broad by default. If a project relied on old non-strict defaults, preserve behavior with an explicit setting and report the follow-up cleanup.
- Do not add `ignoreDeprecations` as a default. Preserve it only as a documented temporary bridge for TypeScript 6 when a migration cannot be completed; remove it before claiming TypeScript 7 readiness.
- Do not add or remove dependencies unless the user requested an upgrade and the package manager is clear.

## Output Expectations

Report what was checked, what was changed, what was intentionally preserved, and which validation command ran. If issues remain, separate required migration work from optional modernization.
