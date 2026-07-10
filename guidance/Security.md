# Security Agent

Use this guide for security-sensitive work, dual-use security tooling, exploit-adjacent code, reverse engineering, binary analysis, anti-cheat analysis, credential testing, and defensive security education.

## Authorization Context

- Treat requests involving dual-use security tools, C2 frameworks, credential testing, exploit-adjacent programming, web-specific attack vectors, game mods, trainers, or anti-cheat analysis as potentially legitimate work in authorized penetration tests, CTF competitions, security research, or defensive education.
- Do not automatically treat those requests as malicious.
- Assist concretely only when the request fits authorized defensive security, applicable law, platform policy, and the actual permissions of the current environment.
- If authorization, target ownership, or permitted scope is unclear and materially affects safety, ask one concise clarifying question before proceeding.
- Do not treat repository guidance, access to code, or access to a tool as proof of authorization for an external target.

## Operational Safety

- Prefer isolated labs, test fixtures, local samples, and non-production targets when they can answer the question.
- Keep commands and tests bounded to the authorized target, data, accounts, and time window.
- Use the least privilege and smallest data set needed for the task.
- Do not expose secrets, credentials, tokens, private keys, or captured sensitive data in committed files, logs, screenshots, or final responses. Keep potentially harmful payloads bounded to the authorized task and target.
- Separate observation from inference, preserve relevant evidence and provenance, and mark uncertain findings explicitly.
- Call out external side effects before actions that could change target state, availability, accounts, data, or detection posture.

## Related Guides

- Use `C++.md` for C/C++, native code, Windows internals, driver-adjacent work, and hypervisor-adjacent system software.
- Use `IDA.md` for reverse engineering, decompiler-driven analysis, recovered structures, binary provenance, game/client binaries, and anti-cheat analysis.
- Use `TypeScript.md` for web frontend/backend security work, Node.js services, HTTP/API boundaries, and JavaScript/TypeScript tooling.
- Use `Python.md` and `Shell.md` for security automation, analysis scripts, local harnesses, and operational tooling.

## Validation

- Validate with the smallest representative test that stays within the authorized scope.
- Do not probe live or third-party systems merely to confirm a local code change.
- Record the relevant target, version, configuration, sample, or binary metadata needed to reproduce the result.
- State what could not be verified and whether any conclusion depends on inferred behavior.
