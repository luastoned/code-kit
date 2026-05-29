# IDA Reverse-Engineering Agent

Use this guide when working from IDA, decompiled binaries, reverse-engineered game/client logic, or vendor dumps derived from IDA.

## Core Rules

- Treat IDA as the source of truth. Repository files such as `vendor/`, notes, or copied decompiler output are downstream artifacts.
- Do not hand-clean a vendor dump first and leave IDA behind. Rename and type things in IDA, re-decompile, then update the repository copy from that decompile.
- Preserve uncertainty explicitly. If a name, type, field, or behavior is inferred rather than proven, mark it as inferred in comments or notes.
- Prefer mechanically faithful decompiler output over attractive pseudocode when the goal is parity with a binary.
- Keep recovered code scoped to the functions and structures needed for the current investigation.

## Function Workflow

For every function you identify:

1. Rename the function in IDA to the best known name.
2. Set the function prototype when argument or return types are known.
3. Rename arguments to reflect their role.
4. Rename important locals and temporaries when doing so makes the decompile materially clearer.
5. Set local variable types where the type is known or strongly supported by surrounding code.
6. Re-decompile after the IDA changes.
7. Copy or update the repository artifact from the post-rename, post-type IDA decompile.
8. Record the binary/module, build or version metadata, address, and any remaining uncertainty in the repository artifact or audit notes.

Do not skip IDA renames just because a local vendor file already has a good manual name. Apply the name in IDA first, then regenerate or sync the dump.

## Struct And Type Workflow

Reconstruct structures in IDA whenever possible:

- Create named structs for repeated pointer layouts, object fields, records, vector-like storage, trace results, filters, handles, and runtime attributes.
- Use existing IDA structs before declaring duplicates.
- Apply struct pointer types to function arguments, globals, fields, and locals.
- Give struct fields semantic names when offsets and usage support them.
- Preserve padding fields where needed so offsets remain accurate.
- Prefer exact field sizes and signedness when known.
- Use pointer element types for arrays and caches, for example `Vector *`, `Record *`, or `int *`, so the decompiler can emit indexed field access instead of raw byte math.
- Re-decompile all affected callers after applying struct types; better types often clarify downstream code.

When a struct is partial, name it anyway if it materially improves the analysis, but keep unknown fields as padding or explicitly named unknown fields.

## Names And Confidence

- Use descriptive names based on observed behavior, call sites, strings, vtable slots, imports, RTTI, or known SDK/source equivalents.
- Avoid overclaiming names that are only guesses. Prefer names such as `TraceCandidateSlotStore` over a precise engine class name if the class identity is not proven.
- Include module/build/address comments or notes for recovered functions, especially when copied into `vendor/`.
- Keep original module, build/version, and address provenance visible enough that the function can be found again in IDA.

## Decompiler Output

- After each rename/type pass, trust the new IDA decompile more than earlier repository dumps.
- If the decompiler still emits awkward expressions, fix types in IDA before editing the dump by hand.
- Manual cleanup is acceptable only for comments, ordering, or small readability notes that do not change semantics.
- Do not remove important casts, constants, offsets, or branches just because they look noisy.
- Keep magic constants until their meaning is proven, then name or document them.

## Cross-Checking

Use multiple signals before treating recovered behavior as authoritative:

- Callers and callees.
- Cross-references to strings, globals, vtables, and imported functions.
- Struct field offsets and repeated access patterns.
- Known open-source SDKs or matching engine/game source when available.
- Runtime validation against traces, tests, captures, or demo data.

If repository behavior diverges from IDA, assume the repository is wrong until validation proves otherwise.

## Documentation

For every recovered area, keep a short audit trail:

- Function name, module, build/version metadata, address, and size when available.
- For frequently updated game/client binaries, include patch version, client/server version, Steam build ID or depot manifest when available, binary timestamp/hash, and source path.
- Structs created or refined in IDA.
- Function prototypes and important argument meanings.
- Which callers were re-decompiled after typing.
- What remains missing, opaque, or outside the current IDA database.

The goal is reproducible reverse engineering: the next engineer should be able to open IDA, search the renamed symbol, and continue from the typed database rather than repeating the same recovery work.
