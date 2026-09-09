# TypeScript 6 Migration Checks

Use these checks for TypeScript 6 compatibility or preparation from TypeScript 6 to 7. Apply the skill's evidence requirements before using this checklist; the [official TypeScript 6 release notes](https://www.typescriptlang.org/docs/handbook/release-notes/typescript-6-0.html) are the version-specific documentation starting point.

## Configuration and Source Checks

1. Check config files for TypeScript 6.0 deprecations:
   - `target: "ES5"`.
   - `downlevelIteration`.
   - `moduleResolution: "node"`, `"node10"`, or `"classic"`.
   - `module: "amd"`, `"umd"`, `"system"`, or `"none"`.
   - `baseUrl`.
   - `esModuleInterop: false` or `allowSyntheticDefaultImports: false`.
   - `alwaysStrict: false`.
   - `outFile`.
2. Check for TypeScript 6.0 behavior changes:
   - Missing explicit `types` when the project relies on Node, test runner, or runtime globals.
   - Missing explicit `rootDir` when source lives under `src/` and the intended emitted output excludes `dist/src/...`.
   - Reliance on the old `strict: false` default.
   - Reliance on the old `module` or `target` defaults when emitted syntax or module format matters.
   - Reliance on the old `noUncheckedSideEffectImports: false` default.
   - Reliance on the old `libReplacement: true` default in projects that replace built-in library declaration files.
   - Package scripts or docs that run `tsc some-file.ts` in a directory with `tsconfig.json`.
   - `ignoreDeprecations: "6.0"`; treat it as a temporary compatibility bridge and a blocker for TypeScript 7 preparation, not as a deprecated option itself.
3. Search source and docs for deprecated syntax:
   - Legacy namespace declarations written as `module Name {}`. Ambient `declare module "pkg"` declarations remain valid.
   - Import assertions using `assert` instead of import attributes using `with`.
   - `/// <reference no-default-lib="true" />`.
4. When TypeScript 7 preparation is in scope and the project includes JavaScript inputs, inspect JavaScript and JSDoc diagnostics with the TypeScript 7 compiler when available. Fix reported compatibility issues instead of applying broad speculative JSDoc rewrites.

## Migration Rules

- For bundled apps, Bun-style projects, or projects where esbuild, Vite, Rollup, or Webpack handles module transformation, prefer `module: "Preserve"` with `moduleResolution: "Bundler"` when compatible.
- For direct Node.js execution from `tsc` output, prefer Node-aware settings such as `module: "NodeNext"` and `moduleResolution: "NodeNext"` when the project is ready for ESM or CommonJS semantics.
- For `baseUrl` used only as a prefix for `paths`, remove `baseUrl` and move the prefix into each `paths` entry.
- For rare projects that depended on `baseUrl` as a lookup root, preserve the behavior with an explicit catch-all `paths` mapping such as `"*": ["./src/*"]`.
- Do not make strictness upgrades broad by default. If a project relied on old non-strict defaults, preserve behavior with an explicit setting and report the follow-up cleanup.
- Do not add `ignoreDeprecations` as a default. Preserve it only as a documented temporary bridge for TypeScript 6 when a migration cannot be completed; remove it before claiming TypeScript 7 readiness.
- Do not add or remove dependencies unless the user requested an upgrade and the package manager is clear.

## Compiler Comparison

For TypeScript 7 preparation, run the equivalent TypeScript 6 check with `stableTypeOrdering` when supported. Use it for comparison only, not as a permanent setting. Compare diagnostics and relevant declaration output with the requested TypeScript 7 compiler when available. Inspect JavaScript and JSDoc diagnostics if those inputs are part of the project; do not apply speculative rewrites.
