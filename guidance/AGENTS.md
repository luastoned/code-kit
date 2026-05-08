# AGENTS.md

Use this file as the entrypoint for repository engineering guidance.

## Language Guides

1. Identify the primary language, runtime, or file type for the task.
2. Load the matching guide below when one applies.
3. If multiple languages are involved, follow the guide for the dominant part of the change and any other guide needed for files you edit.
4. If no guide applies, follow the repository's existing patterns and keep changes minimal and explicit.

Current mapping:

- `TypeScript.md`: TypeScript, JavaScript, JSX, TSX, all Node.js code, package manager and workspace files, JS/TS tool configs, frontend build tooling, and related web runtime code.
- `C++.md`: C, C++, C/C++ headers, CMake/native libraries, general modern C++ code, and compiler/toolchain configs.

## Tooling source of truth

- Follow the nearest `.oxfmtrc.json` and `.oxlintrc.json` for the files being changed.
- Do not hand-enforce rules that tooling owns, such as import ordering, import grouping, quote style, semicolons, trailing commas, or package.json sorting.
- Run the project-local format, lint, typecheck, and test commands when they exist and are relevant to the change.

## Commit messages

- Follow Conventional Commits.
- Use this subject format: `<type>[optional scope][optional !]: <gitmoji> <description>`.

## Notes

- Language-specific guides refine this entrypoint and take precedence for code style decisions within their scope.
- Reuse repository-local patterns before introducing new abstractions, even when a language guide suggests a general preference.
