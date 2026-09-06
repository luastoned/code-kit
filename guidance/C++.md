# C++ Agent

## Core Rules

- Preserve the repository's existing architecture, naming, formatting, and toolchain assumptions unless the user explicitly asks for a broader refactor.
- Prefer modern C++ for new general-purpose code, but do not force modern idioms into code that is constrained by ABI, platform APIs, embedded-system constraints, runtime limits, security tooling, or project conventions.
- Treat compiler, linker, sanitizer, warning, and platform settings as part of program behavior.
- Do not introduce exceptions, RTTI, threading models, allocation patterns, or dependencies unless they match the target project.
- Make ownership, state transitions, and error paths explicit, especially across ABI, platform API, thread, callback, and allocation boundaries.
- Avoid hidden global state, implicit lifetime conventions, and speculative generic abstractions.

## Before Changing Code

Inspect the following only when it affects the change:

1. What build system and compiler are in use?
2. What C or C++ standard is configured?
3. Are exceptions, RTTI, sanitizers, static runtime, or special linker settings enabled or disabled?
4. Is the code library, application, embedded, platform-native, or security-sensitive code?
5. Are there existing ownership wrappers, error types, logging helpers, allocators, or platform abstractions?

## Modern C++ Defaults

- Prefer RAII for resource ownership.
- Prefer values, references, and smart pointers over raw owning pointers.
- Use raw pointers for non-owning optional references only when that matches local style.
- Prefer `nullptr` over `NULL` or `0`.
- Prefer `enum class` for new scoped enums unless the API requires C-compatible enums or flags.
- Prefer `std::string_view` and `std::span` for read-only views when lifetime is clear and the configured standard supports them.
- Prefer `std::array`, `std::vector`, and project-local containers over manual dynamic arrays.
- Prefer `constexpr` and `const` where they clarify invariants.
- Prefer standard casts over C-style casts.
- Avoid macros for constants and functions when language features fit; preserve macros required by platform headers, build flags, generated code, or instrumentation.

## Error Handling

- Follow the project's existing error model.
- If exceptions are disabled or absent, use explicit status returns, error objects, or existing result types.
- Do not silently ignore failures from allocation, I/O, parsing, synchronization, or platform APIs.
- Preserve relevant error context when propagating or translating errors.

## Headers And Boundaries

- Keep headers minimal and stable.
- Prefer declarations in headers and implementation in source files unless the project intentionally uses header-only templates, inline functions, or generated include patterns.
- Avoid adding transitive includes to widely used headers when a forward declaration is enough.
- Keep public API changes deliberate and documented in the final response.

## Concurrency And Lifetime

- Make ownership and lifetime explicit across threads, callbacks, and async work.
- Avoid detached threads unless the surrounding code already has a safe lifetime pattern for them.
- Prefer existing synchronization primitives and task systems over introducing a new concurrency abstraction.

## Refactoring

- Do not mix large mechanical modernization with behavioral changes.

## Validation

- Prefer the project's local build command.
- Run relevant tests when they exist.
- For build-system or compiler-option changes, validate every affected configuration when practical.
- If local tooling is unavailable, state exactly what could not be verified.
