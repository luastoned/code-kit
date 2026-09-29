# AGENTS.md

> Applies when: planning, performing, or reviewing repository work, or preparing engineering guidance for it.

Use this entrypoint to find engineering guidance relevant to the task. Read applicable root and nested instructions; load supplemental guides only when their constraints affect the requested work.

An `Applies when` block states a guide or section's trigger, not permission to act. Section triggers refine their guide's scope; individual rule conditions and exceptions still apply. For durable target guidance, assess triggers against maintained work and explicitly planned setup, not just the current edit. No section is included solely because of its name or location.

## Guide Selection

> Applies when: choosing which language, runtime, or operational guidance a task needs.

Current mapping:

- `C++.md`: C/C++, headers, native libraries, CMake, compiler and linker settings, ABI, ownership, and lifetime.
- `Containers.md`: Docker, Compose, dev containers, Kubernetes, Helm, and container build or deployment behavior.
- `IDA.md`: IDA and Hex-Rays analysis, recovered types, and synchronization of decompiler-derived artifacts.
- `Python.md`: Python source, packaging, scripts, notebooks, runtime boundaries, and tooling.
- `Security.md`: authorized security research, defensive testing, reverse engineering, and security-sensitive operations.
- `Shell.md`: POSIX shell, Bash, zsh, and PowerShell scripts, CI shell steps, Make recipes, and command orchestration.
- `TypeScript.md`: JavaScript, TypeScript, Node.js, web runtime boundaries, and related tooling.
- `Repositories.md`: ownership across projects, guidance placement, commit boundaries, and validation scope.

Use `Repositories.md` when ownership or repository-wide coordination needs clarification. Load additional language or runtime guides for maintained code affected by the task, not incidental examples or generated files.

## Authority

> Applies when: resolving which project instructions, tool settings, or shared defaults govern a decision.

- Follow applicable project instructions for scope, architecture, commands, security, and ownership.
- Use the nearest formatter, linter, compiler, and runtime configuration for behavior those tools own. Shared language preferences do not override it.
- Use mapped guides for constraints and defaults the target has not established, including when no formatter or linter enforces them. Preserve local conventions; a preference in a shared guide is not a request to migrate the project.
- Treat named practices such as KISS, DRY, YAGNI, SOLID, and the Rule of Three as optional decision aids.

## Completion and Decisions

> Applies when: determining a task's endpoint, deciding whether to continue or escalate, or reporting its result.

- Infer the requested endpoint from the conversation: advice, verified local changes, a pull request, integration, or release. Do not treat one endpoint as permission for the next.
- For implementation, continue through relevant verification and fixes caused by the change until the authorized endpoint is reached. Reuse valid results unless new evidence requires another check.
- Carry forward user decisions and authorization. Ask when missing information would materially change the outcome and cannot be discovered or reasonably inferred.
- Continue independent work while a decision is pending. Stop dependent work before an undelegated product choice, material scope expansion, consequential risk acceptance, or action requiring new permission.
- Report the result, material evidence, and remaining limitations. Distinguish observed results from inference; do not present an unrun check as successful.

## Changes and Validation

> Applies when: planning, making, reviewing, or verifying changes to maintained code, configuration, or documentation.

- Preserve unrelated work, public contracts, and project-specific behavior outside the requested change.
- Keep code straightforward to understand, operate, and maintain. Avoid speculative generality, unnecessary indirection, and framework-like ceremony.
- Before modifying an existing operation, inspect the nearest equivalent implementations and match their established pattern: local variable names, temporary results, statement structure, control flow, logging, error handling, and semantic spacing. Do not guess the pattern or replace it with a personal preference. If equivalent initializers use `const initOk = await module.init()`, retain that shape and name rather than inventing a module-specific variable or inlining the condition.
- Keep localized fixes localized. Deviate from an established pattern only for a concrete correctness, safety, or task requirement; explain the reason rather than silently introducing a competing style. Before handing off, compare the changed code with its local equivalents and correct accidental inconsistencies within scope. A passing formatter or test suite does not replace this comparison.
- Add dependencies, abstractions, or optimizations only when a concrete need within scope justifies their maintenance cost. Reuse suitable local patterns before adding new layers.
- Comments explain intent, constraints, or non-obvious behavior. Let tooling own formatting it actually specifies.
- Prefer concise one-line implementation comments; use longer blocks or file-level comments when needed for safety, algorithms, protocols, compatibility, or non-obvious file-wide context.
- Select verification by affected behavior and risk. Start with the smallest relevant check and include integrated paths when changes cross boundaries.
- Discover local test side effects before running unfamiliar commands. Reuse documented permission for throwaway local tests; do not assume tests lack production access.
- Update durable documentation when the change affects the truth it describes.

## Test Work

> Applies when: verifying or investigating requested work, or considering running, adding, or changing tests, checks, or test infrastructure.

- Run existing tests and checks when relevant and safe; use snapshot-update or baseline-regeneration modes only on request.
- Focused throwaway tests that use existing tooling and verify or investigate the requested work are fine. Keep them out of maintained files and remove them when done.
- Add or change maintained tests, fixtures, test configuration, or test infrastructure, including reusable harnesses even when temporary or untracked, only when asked. When verification needs them, report the gap instead.
- Fix regressions in the implementation; do not weaken assertions or expected results to make checks pass.

## Code Readability

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

## Communication and Writing

> Applies when: writing or revising documentation, explanations, findings, or task handoffs.

Follow local terminology and voice. Lead with the result, use concrete language, and keep explanations proportional to the decision. Cite material external evidence near the claim it supports. Preserve the meaning of requirements, commands, and examples when editing prose.

## Commit Messages

> Applies when: preparing a commit message or establishing commit policy, including before a repository's first commit.

Use Conventional Commits with gitmoji unless explicit local policy specifies a different format. Tooling that merely accepts other formats or inconsistent recent history does not override this standard:

`<type>[optional scope][optional !]: <gitmoji> <description>`

## Private Guides

> Applies when: considering access to, use of, or publication of private or personal guidance.

Private guides under `guidance/private/` are local-only. List and read them only when the user explicitly requests private, personal, or local guidance. Do not copy them into public files without explicit publication authorization. The tracked `.gitkeep` only preserves the directory.
