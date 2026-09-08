# AGENTS.md

Use this entrypoint to find engineering guidance relevant to the task. Read applicable root and nested instructions; load supplemental guides only when their constraints affect the requested work.

## Guide Selection

Current mapping:

- `C++.md`: C/C++, headers, native libraries, CMake, compiler and linker settings, ABI, ownership, and lifetime.
- `Containers.md`: Docker, Compose, dev containers, Kubernetes, Helm, and container build or deployment behavior.
- `IDA.md`: IDA and Hex-Rays analysis, recovered types, and synchronization of decompiler-derived artifacts.
- `Python.md`: Python source, packaging, scripts, notebooks, runtime boundaries, and tooling.
- `Security.md`: authorized security research, defensive testing, reverse engineering, and security-sensitive operations.
- `Shell.md`: shell scripts, CI shell steps, Make recipes, and command orchestration.
- `TypeScript.md`: JavaScript, TypeScript, Node.js, web runtime boundaries, and related tooling.
- `Repositories.md`: ownership across projects, guidance placement, commit boundaries, and validation scope.

Use `Repositories.md` when ownership or repository-wide coordination needs clarification. Load additional language or runtime guides for maintained code affected by the task, not incidental examples or generated files.

## Authority

- Follow applicable project instructions for scope, architecture, commands, security, and ownership.
- Use the nearest formatter, linter, compiler, and runtime configuration for behavior those tools own. Shared language preferences do not override it.
- Use mapped guides for constraints and defaults the target has not established, including when no formatter or linter enforces them. Preserve local conventions; a preference in a shared guide is not a request to migrate the project.
- Treat named practices such as KISS, DRY, YAGNI, SOLID, and the Rule of Three as optional decision aids.

## Completion and Decisions

- Infer the requested endpoint from the conversation: advice, verified local changes, a pull request, integration, or release. Do not treat one endpoint as permission for the next.
- For implementation, continue through relevant verification and fixes caused by the change until the authorized endpoint is reached. Reuse valid results unless new evidence requires another check.
- Carry forward user decisions and authorization. Ask when missing information would materially change the outcome and cannot be discovered or reasonably inferred.
- Continue independent work while a decision is pending. Stop dependent work before an undelegated product choice, material scope expansion, consequential risk acceptance, or action requiring new permission.
- Report the result, material evidence, and remaining limitations. Distinguish observed results from inference; do not present an unrun check as successful.

## Changes and Validation

- Preserve unrelated work, public contracts, and project-specific behavior outside the requested change.
- Keep code straightforward to understand, operate, and maintain. Avoid speculative generality, unnecessary indirection, and framework-like ceremony.
- Before modifying an existing operation, inspect the nearest equivalent implementations and match their established pattern: local variable names, temporary results, statement structure, control flow, logging, error handling, and semantic spacing. Do not guess the pattern or replace it with a personal preference. If equivalent initializers use `const initOk = await module.init()`, retain that shape and name rather than inventing a module-specific variable or inlining the condition.
- Keep localized fixes localized. Deviate from an established pattern only for a concrete correctness, safety, or task requirement; explain the reason rather than silently introducing a competing style. Before handing off, compare the changed code with its local equivalents and correct accidental inconsistencies within scope. A passing formatter or test suite does not replace this comparison.
- Add dependencies, abstractions, or optimizations only when a concrete need within scope justifies their maintenance cost. Reuse suitable local patterns before adding new layers.
- Comments explain intent, constraints, or non-obvious behavior. Let tooling own formatting it actually specifies.
- Prefer concise one-line implementation comments; use longer blocks or file-level comments when needed for safety, algorithms, protocols, compatibility, or non-obvious file-wide context.
- Select verification by affected behavior and risk. Start with the smallest relevant check and include integrated paths when changes cross boundaries.
- Discover local test side effects before running unfamiliar commands. Reuse documented permission for disposable local tests; do not assume tests lack production access.
- Update durable documentation when the change affects the truth it describes.

## Test Work

- Test development is opt-in for every language. Do not create, extend, or modify tests or test-related assets unless the user explicitly requests that work. This includes test cases in existing files, fixtures, mocks, snapshots, harnesses, test-only helpers, testing or coverage configuration, scripts, CI jobs, and dependencies. Temporary or untracked test code is not an exception.
- A request to implement, fix, refactor, migrate, or verify code does not by itself authorize test development. When explicitly requested, keep test work within that scope; do not scaffold a broader testing system.
- Existing tests and other existing checks may still be run when relevant, safe, and authorized. Ordinary output from those checks is not test development, but do not use snapshot-update or baseline-regeneration modes without a request covering those changes.
- Fix implementation regressions within scope without weakening assertions or changing expected results to make checks pass. If completing verification requires test changes or missing test infrastructure, report the gap and request direction only when it blocks the requested endpoint. Do not create tests merely to satisfy a generic verification instruction.

## Code Readability

These requirements apply to maintained code in every language, including scripts and code examples, whether or not a language-specific guide exists. Preserve language syntax, significant whitespace, and literal data; do not modify generated or verbatim artifacts whose owning contract requires exact output.

- Separate independent logical steps with a single blank line. A group represents one coherent operation, not one statement category: setup, validation, computation, and a result can belong together when they serve that operation.
- Keep a declaration or assignment adjacent to the check, call, or return that immediately consumes it within the same operation. Do not insert a blank line between a query buffer and its query, a computed boundary and its guard, or a final value and the return using it. Keep related setup declarations together; data dependency alone does not merge an entire function into one group.
- Separate independent guards and control-flow blocks, and separate a completed block from the next independent step. Keep connected constructs such as `if`/`else`, `try`/`catch`/`finally`, and `do`/`while` together, and keep comments attached to the code they explain.
- Line wrapping does not define group boundaries. A multiline declaration or expression does not require a blank line before its tightly coupled use. Follow local wrapping rules without forcing conditions onto one line or splitting related statements merely because they wrap.
- These spacing rules are requirements, not optional polish. Do not remove semantic separation to minimize line count, or introduce helpers, abstractions, or narration merely to avoid using blank lines.
- Inspect semantic spacing before handing off changed code. A passing formatter or linter does not establish compliance; tooling silence or absence does not waive these rules. If explicit target instructions or tooling conflict, follow the applicable authority and report the conflict rather than silently dropping the requirement.

## Communication and Writing

Follow local terminology and voice. Lead with the result, use concrete language, and keep explanations proportional to the decision. Cite material external evidence near the claim it supports. Preserve the meaning of requirements, commands, and examples when editing prose.

## Commit Messages

Follow local commit tooling and explicit project policy. When neither establishes a format, use Conventional Commits with this shared default:

`<type>[optional scope][optional !]: <gitmoji> <description>`

## Private Guides

Private guides under `guidance/private/` are local-only. List and read them only when the user explicitly requests private, personal, or local guidance. Do not copy them into public files without explicit publication authorization. The tracked `.gitkeep` only preserves the directory.
