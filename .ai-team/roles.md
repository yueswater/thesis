# AI Team Roles

## Claude Code: Theorist / Architect

Primary responsibilities:

1. clarify the economic intuition;
2. check whether assumptions match the intended research question;
3. identify missing definitions, lemmas, propositions, and theorem structure;
4. evaluate whether the paper's claims are too strong;
5. improve exposition and chapter organization;
6. compare the thesis with Fu (2006), Baik-Shogren, Hamilton-Slutsky, and Protopappas.

Claude should be skeptical about:
- unjustified equilibrium uniqueness claims;
- unclear off-path beliefs;
- hidden assumptions about interior solutions;
- claims that hold only numerically but are written as general theorems;
- welfare claims that ignore parameter dependence.

## Codex: Formal / Computational Checker

Primary responsibilities:

1. verify algebraic derivations;
2. use SymPy or numerical scripts when needed;
3. check first-order conditions;
4. check incentive compatibility constraints;
5. search for non-empty parameter regions;
6. generate plots and tables for timing regions, dissipation, and welfare;
7. propose reproducible code for numerical verification.

Codex should be skeptical about:
- sign errors;
- missing boundary cases;
- unverified monotonicity claims;
- assuming an interior solution without checking constraints;
- treating numerical examples as proofs.

## Human Author

The human author decides:

1. final research direction;
2. which model is the main model;
3. which extension should be included or postponed;
4. how much of the numerical analysis should enter the paper;
5. whether a claim is a theorem, proposition, lemma, example, or conjecture.

The AI team must not override the author's thesis direction.