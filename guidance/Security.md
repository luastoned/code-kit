# Security Agent

> Applies when: performing security-sensitive development, dual-use or exploit-adjacent tooling, reverse engineering, binary or anti-cheat analysis, credential testing, or defensive security education.

## Code Readability

> Applies when: authoring or reviewing maintained security tooling, proof-of-concept code, or analysis scripts.

Apply the shared [code-readability requirements](./AGENTS.md#code-readability) and [local-consistency rules](./AGENTS.md#changes-and-validation). The rules below do not replace them.

Apply these rules to authored security tooling, proof-of-concept code, and analysis scripts.

## Authorization Context

> Applies when: establishing or reassessing the targets, actions, data, and environment boundaries of security-sensitive work.

- Establish the target, permitted actions, and relevant data or environment boundaries from the request and existing session context.
- Reuse established authorization. Ask only when a material change in target, action, or consequence requires a new decision.
- Access to code, repository guidance, or a tool does not establish permission to act on an external target.

## Operational Safety

> Applies when: performing security analysis or executing tools, experiments, or payloads that handle sensitive evidence or can affect a target.

- Prefer isolated labs, test fixtures, local samples, and non-production targets when they can answer the question.
- Keep commands and tests bounded to the authorized target, data, accounts, and time window.
- Use the least privilege and smallest data set needed for the task.
- Do not expose secrets, credentials, tokens, private keys, or captured sensitive data in committed files, logs, screenshots, or final responses. Keep potentially harmful payloads bounded to the authorized task and target.
- Separate observation from inference, preserve relevant evidence and provenance, and mark uncertain findings explicitly.
- State external side effects before actions that could change target state, availability, accounts, data, or detection posture.

## Related Guides

> Applies when: security work also requires language-specific implementation or IDA-specific analysis guidance.

- Use `C++.md` for C/C++, native code, Windows internals, driver-adjacent work, and hypervisor-adjacent system software.
- Use `IDA.md` for reverse engineering, decompiler-driven analysis, recovered structures, binary provenance, game or client binaries, and anti-cheat analysis.
- Use `TypeScript.md` for web frontend and backend security work, Node.js services, HTTP and API boundaries, and JavaScript and TypeScript tooling.
- Use `Python.md` and `Shell.md` for security automation, analysis scripts, local harnesses, and operational tooling.

## Validation

> Applies when: selecting or running checks for security-sensitive changes or establishing the reproducibility and limits of findings.

Follow the shared [test-work rules](./AGENTS.md#test-work).

- Validate with the smallest representative test that stays within the authorized scope.
- Do not probe live or third-party systems merely to confirm a local code change.
- Record the relevant target, version, configuration, sample, or binary metadata needed to reproduce the result.
- State what could not be verified and whether any conclusion depends on inferred behavior.
