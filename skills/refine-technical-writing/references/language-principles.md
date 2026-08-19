# Technical Language Principles

Use these principles for all writing covered by the skill. They summarize broadly useful guidance from the Google developer documentation style guide. They do not reproduce Google's house style.

## Contents

- [Reference hierarchy](#reference-hierarchy)
- [Audience, purpose, and tone](#audience-purpose-and-tone)
- [Direct and precise language](#direct-and-precise-language)
- [Terminology and names](#terminology-and-names)
- [Global and inclusive language](#global-and-inclusive-language)
- [Grammar and sentence relationships](#grammar-and-sentence-relationships)
- [Requirements, possibility, and time](#requirements-possibility-and-time)
- [Claims and evidence](#claims-and-evidence)
- [Paragraphs and review](#paragraphs-and-review)
- [Local style boundaries](#local-style-boundaries)

## Reference Hierarchy

Use references in this order:

1. Follow project-specific writing guidance, terminology, and audience needs.
2. Apply the selected language principles in this file.
3. Consult the [Google developer documentation style guide](https://developers.google.com/style) when this file does not resolve a general technical-writing question.
4. Consult the [Microsoft Writing Style Guide](https://learn.microsoft.com/en-us/style-guide/welcome/) for unresolved technical-style questions.
5. Consult the [Apple Style Guide](https://support.apple.com/guide/applestyleguide/welcome/web) for Apple terminology, interfaces, and relevant supplementary guidance.

Treat external style guides as references, not compliance targets. Prefer clarity and consistency for the specific readers when guidance conflicts.

## Audience, Purpose, and Tone

- Write for the intended readers and the task they need to complete.
- Put the reader's goal or the document's main purpose before background details.
- Write clear, concise, conversational, friendly, and respectful technical English.
- Address the reader as `you` when direct address makes an instruction clearer.
- Avoid ambiguous `we`, especially when it is unclear whether it means the authors, the product, or the reader.
- Use common contractions when they make prose sound natural. Do not force them into formal, ambiguous, or localized text.
- Avoid filler, pre-announcements, repeated conclusions, excessive `please`, exclamation marks, and phrases such as `please note` or `at this time`.
- Avoid jokes, pop-culture references, cutesy wording, internet slang, and a pushy or patronizing tone.

## Direct and Precise Language

- Prefer familiar, specific words over avoidable jargon, buzzwords, and abstract nouns.
- Use active voice when it identifies responsibility or makes an action easier to follow. Use passive voice when the actor is unknown, irrelevant, or less important than the result.
- Prefer verbs that name an observable action or result.
- Do not anthropomorphize software or hardware when a precise technical verb exists. For example, write that a service `returns` a response rather than that it `tells you` something.
- Avoid metaphors, idioms, and figurative expressions when a literal statement is clearer.
- Do not call a task or concept `easy`, `simple`, `obvious`, or `quick`, and do not use `just` to minimize the work. State the relevant prerequisites or expected scope instead.
- Remove repetition, but retain context that readers need to act safely.

## Terminology and Names

- Use one term for one concept. Do not vary terminology only to avoid repetition.
- Preserve official names, interface labels, API names, commands, paths, filenames, configuration keys, spelling, and capitalization.
- Define a necessary unfamiliar term at first use when the intended readers might not know it.
- Use an abbreviation only when it saves readers time. Define an unfamiliar abbreviation at first use, and omit it when it appears only once.
- Do not use an abbreviation as a verb when a precise verb is available.
- Prefer `for example` and `that is` over `e.g.` and `i.e.` in prose. Avoid `etc.` when a bounded example or clearer category works better.
- Replace vague nouns such as `surface` with the specific interface, document, workflow, or boundary unless the term has an established domain meaning.
- Prefer `authoritative source` or `canonical home` over `source of truth` when either phrase describes the concept accurately.
- Prefer `conventional` or `readable` over describing code or tooling as `boring`.
- Prefer `unrelated change` over `drive-by change`.

## Global and Inclusive Language

- Write for readers across cultures, locations, abilities, and levels of fluency.
- Avoid assumptions about a reader's identity, circumstances, location, equipment, or physical ability.
- Use gender-neutral language and singular `they` when a person's gender is unknown or irrelevant.
- Replace exclusionary, ableist, violent, or disrespectful expressions with precise alternatives. For example, use `consistency check` or `final check` instead of `sanity check` when that is the intended meaning.
- Use diverse, non-stereotyped people and situations in examples.
- Prefer short, unambiguous sentences and standard word order. Avoid dense noun clusters and unnecessary phrasal verbs.
- Include articles such as `a`, `an`, and `the` when omitting them would make a phrase harder to parse or translate.

## Grammar and Sentence Relationships

- Split dense sentences that combine distinct requirements, exceptions, reasons, or outcomes.
- Keep related qualifications with the statement they constrain.
- Put a condition or goal before the action that depends on it.
- Make pronoun antecedents explicit. Replace ambiguous `it`, `this`, `that`, or `they` with the specific noun when needed.
- Write the relationship represented by a slash, such as `and`, `or`, or `per`, when the slash could be ambiguous.
- Avoid ellipses for hesitation or an unspecified continuation. Use them only for an intentional omission where the format supports it.
- Use punctuation to clarify relationships, not to decorate prose. Prefer two sentences over a semicolon when that is easier to read.
- Do not impose a mechanical sentence-length limit. Preserve rhythm and nuance when the prose remains easy to understand.

## Requirements, Possibility, and Time

- Use an imperative or `must` for requirements.
- Use `prefer` or `recommend` for defaults and advice.
- Use `can` for capability or an optional action.
- Use `might` for possibility.
- Use `should` only when its meaning is clear in context. Do not change modality mechanically because doing so can alter a requirement.
- Use present tense for current and generally applicable behavior.
- Use future tense only for an actual future event. Do not use `will` merely to predict ordinary system behavior.
- Do not describe an unreleased feature as available. Distinguish plans, proposals, experiments, and released behavior.
- Avoid relative labels such as `new`, `latest`, and `currently` when a version, date, state, or event would remain accurate longer.
- Preserve lifecycle terms such as `active` when they name defined states.

## Claims and Evidence

- Support factual claims about behavior, compatibility, performance, cost, adoption, or security with available evidence.
- Avoid superlatives, guarantees, and promotional claims unless the evidence justifies them.
- Preserve clear normative rules such as `always` and `never` when they express an intentional requirement rather than an unsupported claim.
- Use `verify` when a check can produce evidence. Use `ensure` only when responsibility extends beyond performing a check.
- State what was run or inspected before reporting a result. Do not turn an expected result into an observed one.
- If evidence is unavailable, name what remains unverified.

## Paragraphs and Review

- Give each paragraph one main idea and put its topic early.
- Split walls of text when headings, short paragraphs, or a list expose the structure more clearly.
- Keep closely related context with the action or claim it explains.
- Read revised prose aloud or inspect it as a reader would. Remove awkward repetition, choppy transitions, and sentences that require rereading.
- Check cross-file terminology and nearby content before treating a local sentence as isolated.

## Local Style Boundaries

Do not automatically import Google's regional spelling, serial comma, punctuation, heading capitalization, emphasis, code formatting, interface formatting, filename conventions, HTML conventions, product terminology, or trademark rules. Preserve the target's established choices unless the user requests a broader redesign.
