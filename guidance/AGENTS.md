# AGENTS.md

Use this file as the entrypoint for repository engineering guidance.

## Guide Selection

1. Identify the repository shape, primary language, runtime, or file type for the task.
2. Load `Repositories.md` for repository shape, root and nested guidance, ownership, commit boundaries, and validation scope.
3. Load `Security.md` for security-sensitive, dual-use, reverse engineering, exploit-adjacent, or defensive security work.
4. Load the matching language or runtime guide below when one applies.
5. If multiple guides apply, follow the repository guide for ownership and tooling boundaries, then security guidance when relevant, then the language guide for files you edit.
6. If no guide applies, follow the repository's existing patterns and keep changes minimal and explicit.

Current mapping:

- `C++.md`: C, C++, C/C++ headers, CMake projects, native libraries, general modern C++ code, and compiler or toolchain configs.
- `Containers.md`: Dockerfiles, Compose files such as `compose.yml`, `compose.yaml`, `docker-compose.yml`, and override variants, `.dockerignore`, dev containers, container build scripts, Kubernetes manifests, Helm charts, and container-related CI config.
- `IDA.md`: IDA Pro and Hex-Rays work, binary reverse engineering, decompiler-driven vendor dumps, recovered structures and types, and workflows where IDA is the authoritative source.
- `Python.md`: Python source, Python scripts, project metadata and packaging files, Python lockfiles and dependency manifests, Python CLIs and services, tests, notebooks, and Python tooling configs.
- `Security.md`: authorized defensive security, dual-use tooling, exploit-adjacent programming, web attack vectors, credential testing, reverse engineering, game mods and trainers, anti-cheat analysis, and related security research.
- `Shell.md`: shell scripts, Bash, POSIX sh, zsh snippets, CI shell steps, Make recipes, installation and setup scripts, and shell command orchestration.
- `TypeScript.md`: TypeScript, JavaScript, JSX, TSX, all Node.js code, package manager and workspace files, JavaScript and TypeScript tool configs, frontend build tooling, and related web runtime code.
- `Repositories.md`: repository shape, root and nested `AGENTS.md`, multi-project ownership, commit boundaries, repository-wide tooling, and validation scope.

## Private Guides

Local-only private guides may exist under `guidance/private/`. These files are ignored by git.

- `guidance/private/.gitkeep` exists only to keep the private directory in git.
- List `guidance/private/` when local or private guidance is explicitly requested.
- Load relevant private guides only when the user explicitly asks to include private, personal, or local guidance.
- Private guides refine or extend the public mapping for the current machine; do not assume they exist in other checkouts.
- Do not copy private guidance into public files unless the user explicitly asks to publish it.

## Working style

- Answer directly and precisely. Put the result first.
- Keep responses concise and proportional to the task. Use short paragraphs, lists, commands, or tables only when they improve clarity. Do not repeat the request, plan, and result.
- Separate facts, conclusions, assumptions, and speculation.
- For documents and external sources, cite relevant evidence before synthesis.
- Break complex tasks into verifiable steps and state important intermediate results.
- Ask at most one clarifying question, only when the task is blocked; otherwise proceed with a stated assumption.

## Technical writing

- Follow project-specific writing conventions first. Otherwise apply selected language principles from the [Google developer documentation style guide](https://developers.google.com/style) to technical instructions, agent guidance, and reference documentation.
- Treat the guide as an editorial reference, not a compliance target. Use its language principles without importing Google-specific branding, US spelling, heading capitalization, emphasis, or layout conventions.
- Write clear, concise, conversational, and respectful technical English for a global audience.
- Prefer short sentences with one topic or instruction each. Use active voice when it makes ownership clearer, and address the reader directly when useful.
- Use one consistent term for each concept. Do not alternate synonyms only for style.
- Put a condition before the action that depends on it.
- Use numbered steps for sequential procedures. Start each step with an imperative action and keep one meaningful action or decision per step when practical.
- Use an imperative or `must` for requirements, `prefer` or `recommend` for defaults, `can` for capability, and `might` for possibility. Use `should` only when its meaning is clear.
- Avoid unnecessary jargon, idioms, culturally specific references, and claims that a task is simple or easy.
- Avoid time-relative labels such as `new`, `latest`, or `currently` when a version, date, state, or event is more precise.
- Support factual claims about behavior, compatibility, performance, cost, adoption, or security with available evidence. Avoid unsupported superlatives and guarantees.
- Prefer verbs that name an observable action. Use `verify` for evidence-producing checks, and state what remains unverified when a check cannot run.
- Preserve deliberate product, design, or community voice when plain technical language would remove useful meaning.

## Code changes

- Prioritize correctness, minimality, readability, and consistency with the repository.
- Change only what the task requires.
- Add abstractions, indirection, dependencies, or optimizations only with concrete justification.
- Make ownership, state, and error paths clear.
- Write comments to explain intent, constraints, or non-obvious trade-offs. Do not narrate what the code already expresses, and remove stale comments when behavior changes.
- Use a short multiline comment at the top of a script or module only when it explains file-wide purpose, constraints, usage, or side effects that the name and structure do not make clear.
- Inside an implementation, prefer one concise line per comment. Use a longer block only when shortening it would remove necessary safety, algorithm, protocol, or compatibility context.
- Sentence fragments and compact conditions such as `If A, then B` are acceptable when they remain unambiguous. Do not force fragments when a complete sentence is clearer.
- Add a blank line after a statement that spans multiple lines before the next sibling statement, including an assignment whose value is a multiline function call. Omit the blank line only when the statements are parts of the same syntactic construct, such as `if`/`else` or `try`/`catch`/`finally`.
- Use search to locate relevant code before reading large files, and verify only the changed areas needed after edits.

## Tooling authority

- Follow the nearest project formatter, linter, typechecker, test, and build configs for the files being changed.
- Do not hand-enforce rules that tooling owns, such as import ordering, import grouping, quote style, semicolons, trailing commas, package sorting, or generated formatting.
- Run the project-local format, lint, typecheck, test, and build commands when they exist and are relevant to the change.

## Commit messages

- Follow Conventional Commits.
- Use this subject format: `<type>[optional scope][optional !]: <gitmoji> <description>`.

## Notes

- Language-specific guides refine this entrypoint and take precedence for code style decisions within their scope.
- Reuse repository-local patterns before introducing new abstractions, even when a language guide suggests a general preference.
- Treat named practices such as KISS, DRY, YAGNI, SOLID, and the Rule of Three as optional lenses, not automatic refactor mandates. Apply them explicitly only when they fit the task, and ask before making broad methodology-driven changes.
