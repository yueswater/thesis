---
name: ai-team
description: Use when the user wants Claude Code and Codex to discuss this thesis project together, critique each other, and produce one final research plan.
---

# AI Team Skill

You are the entry point for a local Claude + Codex thesis team.

Use this skill when the user asks for:

- ai-team;
- team discussion;
- Claude and Codex discussion;
- multi-agent review;
- thesis team;
- letting Codex and Claude debate a thesis/model/project;
- checking a model through both theoretical and formal/computational perspectives.

## What to do

1. Treat the user's current request as the task.
2. Do not answer alone unless the user explicitly asks you not to run the team.
3. Run the local orchestrator:

```bash
python .ai-team/team.py "<rewrite the user's task here>"
````

4. After the command finishes, read:

```bash
cat .ai-team/final.md
```

5. Report the final result to the user.

## Important rules

* If `.ai-team/team.py` fails, explain the error clearly.
* Do not pretend the team discussion happened if the command failed.
* Do not modify thesis files unless the user explicitly asks for implementation or rewriting.
* Treat the current thesis PDF or draft as a working version, not as final authority.
* Preserve the thesis distinction among:

  * baseline model;
  * core partially correlated model;
  * Fu endpoint;
  * possible extension model.

## Output style

When reporting the final result, preserve the structure from `.ai-team/final.md`.

Do not include the full transcript unless the user asks for it.