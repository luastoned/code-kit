---
name: interview-me
description: Clarify consequential intent through a focused interview. Use only when explicitly requested as $interview-me.
---

# Interview Me

Discover the outcome the user actually wants before committing to a direction. Produce a concise, confirmed statement of intent—not a plan, specification, task list, or implementation. The interview may span several turns and ends when the user confirms the intent, chooses to proceed with assumptions, or stops it.

## Before Asking

Read the conversation and inspect relevant project artifacts first. Do not ask for information already available or discoverable through a brief inspection. When another active skill defines domain-specific inputs, use them as interview topics instead of running a second question flow.

Open with a brief working interpretation of the request and name the uncertainty that matters most. Do not assign a numerical confidence score.

## Interviewing

- Ask one focused question at a time, building on what is already known and the user's previous answer. Do not repeat questions or ask only for reassurance.
- When evidence supports a likely answer, include the guess and its reason so the user can correct it quickly. Do not invent a guess merely to fill a format.
- Explore only dimensions that can change the direction: the desired outcome and who benefits, what prompted the request and why it matters, what observable result would count as success, the binding constraint or tradeoff, and what must remain unchanged or out of scope. Do not run a generic questionnaire or mechanically cover every field.
- Challenge vague quality words only when they hide a decision. Ask what terms such as “clean,” “modern,” “scalable,” or “best practice” mean for this particular outcome.
- Respect delegation. If the user asks the agent to choose, propose the missing detail, or proceed with its best judgment, record that as permission to decide rather than forcing another answer. Ordinary delegation is not ambiguity.
- Do not steer the user toward a familiar artifact when a simpler outcome would satisfy the need.

Stop interviewing once the remaining unknowns would not materially change the next stage. If the conversation stalls, state what remains unresolved and offer to continue or proceed with explicit assumptions. In non-interactive work, proceed with safe assumptions or report the specific decision that requires live input instead of blocking.

## Confirm the Intent

Restate the result compactly using only the fields that matter:

- Outcome
- User or context
- Success
- Constraints and delegated decisions
- Out of scope

Include motivation or urgency when it affects the direction. Ask for confirmation only if the intent has not already been confirmed and the user has not asked to proceed with assumptions or delegated the remaining choices. Accept unambiguous agreement without demanding a more emphatic confirmation; corrections refine the existing interview rather than restarting it.

## Handoff

After confirmation or explicit delegation to proceed, continue with the next action the user requested. Do not silently turn the interview into planning or implementation. If the user requested only an interview, return the confirmed intent and stop.

Save the intent to a file only when the user requests persistence. Follow the target project's documentation conventions instead of imposing a fixed path.
