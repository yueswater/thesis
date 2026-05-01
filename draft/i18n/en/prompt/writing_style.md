# Writing Style Guide for the English Edition

Reference journals: *American Economic Review*, *Journal of Economic Theory*, *Games and Economic Behavior*, and similar peer-reviewed outlets in microeconomic theory and contest theory.

---

## 1. Citation format

- In-text citations follow the "Author (year)" convention with parentheses, e.g., `#c("fu2006")`, `Hurley and Shogren (1998)`.
- Two authors are joined by `and`; three or more authors are listed in full on first mention, e.g., `Baik, Lee, and Lee (2022)`.
- When the citation is embedded in the sentence as the subject:
  - ✓ `#c("fu2006") shows that ...`
  - ✓ `Hurley and Shogren (1998) find that ...`
  - ✗ Avoid leading with a citation followed by a clause without a verb linking the two.
- Parenthetical (non-subject) citations: `... (Fu, 2006)`.
- Multiple consecutive citations: `Wang (1998), Kamien and Tauman (2002), and Filippini (2005) all find that ...`.

---

## 2. Voice and pronouns

- Use the first-person plural "we" throughout the paper, even when the work is single-authored — this is the standard convention in economics journals.
  - ✓ "We show that ..."
  - ✓ "We assume that ..."
  - ✓ "Our main results are threefold."
- Avoid the singular first person ("I").
- Passive voice is acceptable when describing the model mechanism, but prefer active voice for stating results.

---

## 3. Sentences and paragraphs

- Begin each paragraph with a topic sentence that states the paragraph's main point.
- Keep sentence length moderate; avoid sentences with more than three coordinate clauses.
- Use commas for short coordinate items and semicolons for longer parallel items.
- Paragraph indentation: first line indented (handled by the Typst template).

---

## 4. Introduction structure

1. **Opening**: motivate from a real-world phenomenon or broad context, leading into the research question.
2. **Departure / contribution**: state the difference from the benchmark literature, identifying the precise modification at the level of beliefs or mechanism.
3. **Literature thread**: connect related work logically rather than as a list — e.g., "X finds that ...; Y further establishes that ..."
4. **Model preview**: outline the setup and a concrete example.
5. **Main results**: "Our main results are threefold. First, ... Second, ... Third, ..."
6. **Contribution placement**: "Relative to the existing literature, ... has not been explicitly addressed."
7. **Roadmap**: "The remainder of the paper proceeds as follows. Section 2 ...; Section 3 ...; ...; Section N concludes."

---

## 5. Terminology (must be consistent throughout)

| English | Note |
|---------|------|
| contest | not "tournament" in this paper |
| rent-seeking | hyphenated |
| asymmetric information | preferred over "incomplete information" |
| separating equilibrium | |
| pooling equilibrium | |
| subgame | one word |
| best response / reaction function | use "best response" by default |
| prior / posterior belief | |
| endogenous timing | |
| contest success function | |
| informed / uninformed player | use $I$ and $U$ in symbols |
| effort | not "investment" or "input" |
| prize value | for the player's reward upon winning |
| incentive compatibility (IC) | abbreviate after first use |

---

## 6. Mathematical notation

- Inline math uses `$...$`, e.g., `$mu$`, `$delta$`, `$V$`.
- Avoid heavy inline formulas in the introduction; describe results in prose first.
- Define symbols on first appearance, e.g., "the mean prize value $mu$".

---

## 7. Other conventions

- Use ASCII punctuation throughout the English text (commas, periods, semicolons, parentheses).
- English author names and years use parentheses `()`; em-dash `—` is preferred over hyphens for parenthetical interruption.
- Footnotes are reserved for supplementary remarks and should not carry the main argument.
- Avoid bullet points in the main body; use them only for enumerating cases inside lemmas or theorems.
- Avoid LLM-typical filler: "delve into", "intricate" (in proofs), "harness", "elegant(ly)", "It is worth noting that", "marvelous".
- Replace "In the rest of this paper" with "The remainder of the paper proceeds as follows."
