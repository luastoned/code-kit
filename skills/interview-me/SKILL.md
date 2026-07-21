---
name: interview-me
description: Interview the user to turn an ambiguous, consequential request into a confirmed statement of intent before planning or implementation. Use only when the user explicitly invokes `$interview-me` or names the `interview-me` skill.
---

# Interview Me

## Goal

Discover the outcome the user actually wants before committing to a direction. Produce a concise, confirmed statement of intent—not a plan, specification, task list, or implementation.

## Interview Scope

Continue across multiple turns until the user confirms the intent, chooses to proceed with assumptions, or stops the interview. Do not use this workflow as a substitute for ordinary clarification when the skill was not explicitly invoked.

## Workflow

1. Read the conversation and inspect relevant project artifacts before asking anything. Do not ask for information already available or cheaply discoverable.
2. When another active skill provides domain-specific discovery, let that workflow own the questions unless the user explicitly invoked `$interview-me`. In that case, use its required inputs as interview topics instead of running two separate question flows.
3. Open with a brief working interpretation of the request and name the uncertainty that matters most. Do not assign a numerical confidence score.
4. Ask one focused question at a time. Make each question depend on what is already known and the user's previous answer.
5. When evidence supports a likely answer, include the guess and its reason so the user can correct it quickly. Do not invent a guess merely to fill a format.
6. Explore only dimensions that can change the direction, such as:
   - the desired outcome and who benefits;
   - what prompted the request and why it matters;
   - what observable result would count as success;
   - the binding constraint or tradeoff;
   - what must remain unchanged or explicitly out of scope.
7. Challenge vague quality words only when they hide a decision. Ask what terms such as “clean,” “modern,” “scalable,” or “best practice” mean for this particular outcome.
8. Respect delegation. If the user asks the agent to choose, propose the missing detail, or proceed with its best judgment, record that as permission to decide rather than forcing another answer.
9. Stop interviewing once the remaining unknowns would not materially change the next stage. If the conversation stalls, state what remains unresolved and offer to continue or proceed with explicit assumptions.

## Confirm The Intent

Restate the result compactly using only the fields that matter:

- Outcome
- User or context
- Success
- Constraints and delegated decisions
- Out of scope

Include motivation or urgency when it affects the direction. Ask the user to confirm or correct the restatement, and accept any unambiguous agreement. If they correct it, revise the restatement without restarting the interview.

## Handoff

After confirmation, continue only with the next action the user requested. Do not silently turn the interview into planning or implementation. If the user requested only an interview, return the confirmed intent and stop.

Save the intent to a file only when the user requests persistence. Follow the target project's documentation conventions instead of imposing a fixed path.

## Guardrails

- Do not run a generic questionnaire or mechanically cover every possible field.
- Do not repeat questions, ask questions only for reassurance, or prolong the interview after the direction is clear.
- Do not steer the user toward a familiar artifact when a simpler outcome would satisfy the need.
- Do not treat ordinary delegation as ambiguity or demand a more emphatic confirmation than the user naturally gives.
- Do not block non-interactive work merely because an ideal interview is unavailable; proceed with safe assumptions or report the specific decision that truly requires live input.
