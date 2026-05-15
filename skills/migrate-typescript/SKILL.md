---
name: migrate-typescript
description: Audit and migrate TypeScript projects for TypeScript 6.0+ compatibility. Use when Codex needs to check deprecated compiler options or syntax, update tsconfig files for modern TypeScript, validate a TypeScript upgrade, or prepare a repository for TypeScript 7.0.
---

# Migrate TypeScript

## Overview

Audit a target TypeScript project for TypeScript 6.0 deprecations, default changes, and upgrade risks. This is one-time migration work, not ongoing project guidance. Keep fixes scoped, preserve the target runtime/build model, and validate with the project's own typecheck.

## Workflow

1. Identify the target project directory from the user request or current working directory.
2. Inspect TypeScript context before editing:
   - `package.json`, lockfiles, workspace files, and package manager.
   - Installed or requested TypeScript version.
   - `tsconfig*.json` files and any `extends` chain.
   - Build/runtime path: bundled app, direct Node execution, library emit, framework-managed build, browser app, Bun, or mixed workspace.
   - Existing typecheck/build scripts and CI commands.
3. Check config files for TypeScript 6.0 deprecations:
   - `target: "ES5"`.
   - `downlevelIteration`.
   - `moduleResolution: "node"`, `"node10"`, or `"classic"`.
   - `module: "amd"`, `"umd"`, `"system"`, or `"none"`.
   - `baseUrl`.
   - `esModuleInterop: false` or `allowSyntheticDefaultImports: false`.
   - `alwaysStrict: false`.
   - `outFile`.
   - `ignoreDeprecations`.
4. Check for TypeScript 6.0 behavior changes:
   - Missing explicit `types` when the project relies on Node, test runner, or runtime globals.
   - Missing explicit `rootDir` when source lives under `src/` and emitted output should not include `dist/src/...`.
   - Reliance on the old `strict: false` default.
   - Package scripts or docs that run `tsc some-file.ts` in a directory with `tsconfig.json`.
5. Search source and docs for deprecated syntax:
   - Legacy namespace declarations written as `module Name {}`. Ambient `declare module "pkg"` declarations remain valid.
   - Import assertions using `assert` instead of import attributes using `with`.
   - `/// <reference no-default-lib="true" />`.
6. Make scoped fixes when the correct migration is clear. Ask only when the target runtime/build model is ambiguous or the migration could change published output.
7. Validate:
   - Parse changed JSON files.
   - Run the project-local typecheck script when available.
   - Otherwise run the most appropriate local TypeScript check, usually `tsc --noEmit` or `tsc -p tsconfig.json --noEmit`.
   - If validation cannot run because dependencies or TypeScript are unavailable, say so clearly.

## Migration Rules

- For bundled apps, Bun-style projects, or projects where esbuild/Vite/Rollup/Webpack handles module transformation, prefer `module: "Preserve"` with `moduleResolution: "Bundler"` when compatible.
- For direct Node execution from `tsc` output, prefer Node-aware settings such as `module: "NodeNext"` and `moduleResolution: "NodeNext"` when the project is ready for ESM/CJS semantics.
- For `baseUrl` used only as a prefix for `paths`, remove `baseUrl` and move the prefix into each `paths` entry.
- For rare projects that depended on `baseUrl` as a lookup root, preserve the behavior with an explicit catch-all `paths` mapping such as `"*": ["./src/*"]`.
- Do not make strictness upgrades broad by default. If a project relied on old non-strict defaults, preserve behavior with an explicit setting and call out a follow-up cleanup.
- Do not add `ignoreDeprecations` as a default. Use it only as a temporary bridge when a migration cannot be completed in the current pass.
- Do not add or remove dependencies unless the user requested an upgrade and the package manager is clear.

## Output Expectations

Report what was checked, what was changed, what was intentionally preserved, and which validation command ran. If issues remain, separate required migration work from optional modernization.
