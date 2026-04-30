#import "../thesis.typ": c, ca, cp, cy, lemma, proof, theorem, widetilde

This section analyzes the endogenous timing choice at stage 0. Section 4 has derived the equilibrium payoffs in the three effort subgames $S S$, $U I$, and $I U$; we now substitute these payoffs into the stage-0 normal-form game and characterize which orders of moves can be supported by pure-strategy Nash equilibrium. Following the notation of #c("fu2006"), let $F$ denote choosing to act in period 1 and $S$ denote choosing to act in period 2.

== Stage-0 analysis <subsec-stage0-analysis>

The stage-0 regime choice is a $2 times 2$ normal-form game. Rows are $I$'s timing choice and columns are $U$'s timing choice; the first entry of each cell is $I$'s ex ante payoff and the second is $U$'s ex ante payoff:

#figure(
  table(
    columns: (auto, auto, auto),
    inset: 6pt,
    align: center,
    [], [$U$: $F$], [$U$: $S$],
    [$I$: $F$], [$(widetilde(pi)_I^(S S), pi_U^(S S))$], [$(widetilde(pi)_I^(I U), pi_U^(I U))$],
    [$I$: $S$], [$(widetilde(pi)_I^(U I), pi_U^(U I))$], [$(widetilde(pi)_I^(S S), pi_U^(S S))$],
  ),
  caption: [Stage-0 expected payoff matrix.],
  supplement: [Table],
) <tbl-stage0-analysis>

We define the four unilateral deviation differences.

When $U$ chooses $F$, $I$'s switch from $F$ to $S$ changes the outcome from $S S$ to $U I$, with difference

$
  Delta_I^(U I)
  equiv widetilde(pi)_I^(U I) - widetilde(pi)_I^(S S)
  =
  - V kappa nu + (2 V kappa nu) / (1 + V lambda)
  + (V^2 kappa^2) / 4
  - (V^2 kappa^2) / (1 + V lambda)^2.
$ <eq-delta-i-ui>

When $U$ chooses $S$, $I$'s switch from $S$ to $F$ changes the outcome from $S S$ to $I U$, with difference

$
  Delta_I^(I U)
  equiv widetilde(pi)_I^(I U) - widetilde(pi)_I^(S S)
  =
  EE[V_I^2] / (4 V)
  - mu + (2 V kappa nu) / (1 + V lambda)
  - (V^2 kappa^2) / (1 + V lambda)^2.
$ <eq-delta-i-iu>

When $I$ chooses $S$, $U$'s switch from $S$ to $F$ changes the outcome from $S S$ to $U I$, with difference

$
  Delta_U^(U I)
  equiv pi_U^(U I) - pi_U^(S S)
  =
  (V^2 kappa^2) / 4
  - (V^3 kappa^2 lambda) / (1 + V lambda)^2
  =
  V^2 kappa^2 (1 - V lambda)^2 / (4 (1 + V lambda)^2)
  >= 0.
$ <eq-delta-u-ui>

When $I$ chooses $F$, $U$'s switch from $S$ to $F$ changes the outcome from $I U$ to $S S$, with difference

$
  Delta_U^(S S)
  equiv pi_U^(S S) - pi_U^(I U)
  =
  (V^3 kappa^2 lambda) / (1 + V lambda)^2
  - (4 V^2 - 4 V mu + EE[V_I^2]) / (4 V).
$ <eq-delta-u-ss>

#lemma(title: [Stage-0 best responses])[
  The stage-0 best responses are determined by the four unilateral deviation differences:

  1. If $U$ chooses $F$, then $I$ chooses $S$ when $Delta_I^(U I) > 0$, chooses $F$ when $Delta_I^(U I) < 0$, and is indifferent when $Delta_I^(U I) = 0$.
  2. If $U$ chooses $S$, then $I$ chooses $F$ when $Delta_I^(I U) > 0$, chooses $S$ when $Delta_I^(I U) < 0$, and is indifferent when $Delta_I^(I U) = 0$.
  3. If $I$ chooses $F$, then $U$ chooses $F$ when $Delta_U^(S S) > 0$, chooses $S$ when $Delta_U^(S S) < 0$, and is indifferent when $Delta_U^(S S) = 0$.
  4. If $I$ chooses $S$, $U$'s comparison is governed by $Delta_U^(U I)$. Because $Delta_U^(U I) >= 0$, $U$ weakly prefers $F$, with indifference between $F$ and $S$ only when $V lambda = 1$.
] <subsec-stage0-br>

$I$'s timing choice is determined by the differences in expected payoffs across the three regimes; the key asymmetry on $U$'s side comes from $Delta_U^(U I) >= 0$. Hence whenever $I$ plans to move second, $U$ generically prefers to move first, with indifference confined to the knife-edge case $V lambda = 1$.

#proof[
  At stage 0, $V_I$ has not yet been observed, so $I$ compares ex ante payoffs. If $U$ chooses $F$, then $I$ obtains $widetilde(pi)_I^(S S)$ by choosing $F$ and $widetilde(pi)_I^(U I)$ by choosing $S$. Their difference is $Delta_I^(U I)$, whose sign therefore determines $I$'s best response.

  If $U$ chooses $S$, then $I$ obtains $widetilde(pi)_I^(I U)$ by choosing $F$ and $widetilde(pi)_I^(S S)$ by choosing $S$. Their difference is $Delta_I^(I U)$, whose sign therefore determines $I$'s best response.

  For $U$, if $I$ chooses $F$ then $U$ obtains $pi_U^(S S)$ by choosing $F$ and $pi_U^(I U)$ by choosing $S$; their difference is $Delta_U^(S S)$, whose sign determines $U$'s best response. If $I$ chooses $S$ then $U$ obtains $pi_U^(U I)$ by choosing $F$ and $pi_U^(S S)$ by choosing $S$; their difference is $Delta_U^(U I)$. From

  $
    Delta_U^(U I)
    =
    V^2 kappa^2 (1 - V lambda)^2 / (4 (1 + V lambda)^2)
    >= 0,
  $

  $U$ weakly prefers $F$ in this case, with equality if and only if $V lambda = 1$.
]

#theorem(title: [Characterization of pure-strategy endogenous timing equilibria])[
  The pure-strategy Nash equilibria at stage 0 are characterized as follows:

  1. $U I$ is a pure-strategy Nash equilibrium if and only if $Delta_I^(U I) >= 0$.
  2. Immediate simultaneous action $S S$ is a pure-strategy Nash equilibrium if and only if $Delta_I^(U I) <= 0$ and $Delta_U^(S S) >= 0$.
  3. $I U$ is a pure-strategy Nash equilibrium if and only if $Delta_I^(I U) >= 0$ and $Delta_U^(S S) <= 0$.
  4. Delayed simultaneous action $S S$ is a pure-strategy Nash equilibrium if and only if $Delta_I^(I U) <= 0$ and $Delta_U^(U I) = 0$.

  Moreover, $Delta_U^(U I) = 0$ if and only if $V lambda = 1$, so for generic parameters with $V lambda != 1$ the delayed simultaneous outcome $(S, S)$ cannot be a pure-strategy equilibrium.
] <subsec-stage0-ne>

In our setting, regime selection is read directly from the four unilateral deviation differences without recourse to equilibrium refinements. In particular, the delayed simultaneous outcome $(S, S)$ requires the knife-edge $V lambda = 1$ and is therefore ruled out for generic parameters.

#proof[
  A pure-strategy Nash equilibrium requires that, given the opponent's timing, neither player wishes to deviate unilaterally. Consider first $(I:S, U:F)$, which induces the $U I$ regime. The condition that $I$ does not deviate to $F$ is $widetilde(pi)_I^(U I) >= widetilde(pi)_I^(S S)$, i.e. $Delta_I^(U I) >= 0$. The condition that $U$ does not deviate to $S$ is $pi_U^(U I) >= pi_U^(S S)$, i.e. $Delta_U^(U I) >= 0$, which always holds. Hence $U I$ is an equilibrium if and only if $Delta_I^(U I) >= 0$.

  Under $(I:F, U:F)$ the outcome is immediate $S S$. Non-deviation by $I$ to $S$ requires $Delta_I^(U I) <= 0$; non-deviation by $U$ to $S$ requires $Delta_U^(S S) >= 0$. Hence immediate $S S$ is an equilibrium if and only if both inequalities hold.

  Under $(I:F, U:S)$ the outcome is $I U$. Non-deviation by $I$ to $S$ requires $Delta_I^(I U) >= 0$; non-deviation by $U$ to $F$ requires $Delta_U^(S S) <= 0$. Hence $I U$ is an equilibrium if and only if both inequalities hold.

  Finally, under $(I:S, U:S)$ the outcome is delayed $S S$. Non-deviation by $I$ to $F$ requires $Delta_I^(I U) <= 0$; non-deviation by $U$ to $F$ requires $Delta_U^(U I) <= 0$. Since $Delta_U^(U I) >= 0$, the latter is equivalent to $Delta_U^(U I) = 0$, i.e. $V lambda = 1$. Hence delayed $S S$ is an equilibrium if and only if $Delta_I^(I U) <= 0$ and $Delta_U^(U I) = 0$.
]

#lemma(title: [Type-level ex post decomposition])[
  Although the stage-0 regime choice is based on ex ante payoffs, type-level payoff differences can still be used to decompose $I$'s timing incentive. For each realized type $v$, let

  $
    R(v)
    equiv pi_I^(S S)(v) - pi_I^(I U)(v)
    =
    (sqrt(v) - (V kappa) / (1 + V lambda))^2
    - v^2 / (4 V).
  $ <eq-rent-function>

  Then

  $
    EE[R(V_I)]
    =
    widetilde(pi)_I^(S S) - widetilde(pi)_I^(I U)
    =
    - Delta_I^(I U).
  $ <eq-ex-ante-decomp>

  Furthermore, $R(v) <= 0$ is equivalent to

  $
    (V kappa) / (1 + V lambda)
    in
    [sqrt(v) - v / (2 sqrt(V)), sqrt(v) + v / (2 sqrt(V))].
  $ <eq-type-interval>
]
<subsec-type-decomp>

$R(v)$ describes the ex post comparison between moving early and moving late for a realized type, but the stage-0 decision occurs before the type is revealed, so the regime choice is governed by $EE[R(V_I)]$ — the average ex ante incentive — rather than by any single type's ex post preference.

#proof[
  By definition,

  $
    R(v)
    =
    pi_I^(S S)(v) - pi_I^(I U)(v)
    =
    (sqrt(v) - (V kappa) / (1 + V lambda))^2
    - v^2 / (4 V).
  $

  Taking expectations over $V_I$ gives

  $
    EE[R(V_I)]
    =
    widetilde(pi)_I^(S S) - widetilde(pi)_I^(I U)
    =
    - Delta_I^(I U).
  $

  Next, $R(v) <= 0$ is equivalent to

  $
    abs(sqrt(v) - (V kappa) / (1 + V lambda))
    <=
    v / (2 sqrt(V)).
  $

  Since $v / (2 sqrt(V)) > 0$, this absolute-value inequality can be rewritten as

  $
    sqrt(v) - v / (2 sqrt(V))
    <=
    (V kappa) / (1 + V lambda)
    <=
    sqrt(v) + v / (2 sqrt(V)),
  $

  which is the interval condition stated above.
]


== Timing structure across distributions <subsec-distribution-structure>

We use $R(v)$ and the identity $EE[R(V_I)] = -Delta_I^(I U)$ to describe the timing structure under different distributions. The point of interest is not whether a single type prefers to move early or late ex post but how these type-level comparisons aggregate, under a given distribution, into the overall stage-0 incentive. In other words, the distribution determines how $R(v)$ is weighted on its support and how the resulting sign pattern combines into the sign of $Delta_I^(I U)$. Below we use the two-point and uniform distributions to exhibit this correspondence: the former isolates the sign combination of two type points and their probability weights, while the latter focuses on whether a critical point with $R(v) = 0$ lies in the support and on how this point partitions the type space.

=== Two-point distribution <subsec-binary-structure>

If $V_I in {v_L, v_H}$ with $0 < v_L < v_H$, we can compare $R(v_L)$ and $R(v_H)$ directly.

#lemma(title: [Sign criterion under the two-point distribution])[
  Let $V_I in {v_L, v_H}$ with $0 < v_L < v_H$.

  1. If $(R(v_L), R(v_H))$ has signs $(-, -)$, then both types prefer to move first ($I U$) ex post; thus $EE[R(V_I)] < 0$, equivalent to $Delta_I^(I U) > 0$.
  2. If $(R(v_L), R(v_H))$ has signs $(+, +)$, then both types prefer to move second (relative to $I U$) ex post; thus $EE[R(V_I)] > 0$, equivalent to $Delta_I^(I U) < 0$.
  3. If the signs differ, i.e. $(+, -)$ or $(-, +)$, then the sign of $Delta_I^(I U)$ is determined by the probability-weighted average $EE[R(V_I)]$, that is, jointly by the type probabilities and the payoff differences across the two types.
] <lem-binary-structure>

The point is that type-level comparisons can decompose the incentive, but the actual stage-0 decision is still governed by the expected difference $Delta_I^(I U)$.

#proof[
  Under the two-point distribution $V_I in {v_L, v_H}$, set $Pr(V_I = v_H) = p in (0, 1)$ and $Pr(V_I = v_L) = 1 - p$. By definition,

  $
    EE[R(V_I)] = (1 - p) R(v_L) + p R(v_H),
    quad
    Delta_I^(I U) = -EE[R(V_I)].
  $

  If $(R(v_L), R(v_H)) = (-, -)$, then $EE[R(V_I)] < 0$ and $Delta_I^(I U) > 0$. If $(R(v_L), R(v_H)) = (+, +)$, then $EE[R(V_I)] > 0$ and $Delta_I^(I U) < 0$. When the signs differ, the sign of $EE[R(V_I)]$ is determined by the probability-weighted sum, and the sign of $Delta_I^(I U)$ is therefore determined jointly by the type probabilities and the magnitudes of the type-level payoff differences.
]

As shown in #ref(<fig-ch5-timing-regions>), under the two-point distribution with $V = 1$ fixed, the parameter pair $(mu, delta)$ partitions the parameter space into distinct sign regions. These regions correspond to sign combinations of $Delta_I^(I U)$ and $Delta_U$ and therefore map directly into the stage-0 regime incentives.

#figure(
  image("../../../figures/fig5_regions.pdf", width: 90%),
  caption: [Sign regions of $(Delta_I^(I U), Delta_U)$ on the $(mu, delta)$ plane under the two-point distribution.],
  supplement: [Figure],
) <fig-ch5-timing-regions>

=== Uniform distribution <subsec-uniform-structure>

If $V_I ~ cal(U)[mu - delta, mu + delta]$, where $cal(U)(dot.c)$ denotes the uniform distribution and $0 < delta < mu$, define

$
  cal(W)
  equiv {v in [mu - delta, mu + delta]: R(v) > 0},
$

and

$
  cal(F)
  equiv {v in [mu - delta, mu + delta]: R(v) < 0}.
$

#lemma(title: [Threshold criterion under the uniform distribution])[
  Under the uniform distribution $V_I ~ cal(U)[mu - delta, mu + delta]$, the continuity of $R(v)$ in $v$ implies that any solution to $R(v) = 0$ lying in the support partitions the support into the regions $cal(W)$ and $cal(F)$.

  1. If $R(mu - delta)$ and $R(mu + delta)$ have opposite signs, there exists a critical value $v^* in (mu - delta, mu + delta)$ at which the ex post type comparison reverses direction.
  2. If the two endpoints share the same sign, no root may lie in the support; this corresponds to all types preferring the same direction (all move first, or all move second).
] <lem-uniform-structure>

#proof[
  Under $V_I ~ cal(U)[mu - delta, mu + delta]$, the support is the closed interval $[mu - delta, mu + delta]$. By construction $R(v)$ is continuous on this interval, so the intermediate value theorem determines whether $R(v) = 0$ has a root in the support.

  - If $R(mu - delta)$ and $R(mu + delta)$ have opposite signs, the intermediate value theorem yields a root $v^* in (mu - delta, mu + delta)$ with $R(v^*) = 0$. The sign of $R(v)$ flips on either side of $v^*$, so the ex post type comparison reverses direction.

  - If the endpoints share the same sign, the intermediate value theorem does not guarantee an interior root, so no root may lie in the support; all types then prefer the same direction (all move first or all move second).
]

== Pooling analysis <subsec-pooling-analysis>

Of the three regimes, only $I U$ raises the question of whether the leader's effort transmits type information: $I$ moves first and $U$ responds after observing $x_I$. The other two regimes do not: $S S$ has simultaneous moves, and $U I$ has $U$ moving first; in neither case does $I$ signal to $U$.

In our setting, however, $U$'s best response is

$
  x_U^*(x_I; V) = sqrt(V x_I) - x_I,
$

which depends only on the observed effort $x_I$ and on $U$'s own prize $V$, not on the posterior belief about $V_I$. Hence, although $I$'s effort can be observed, it does not change $U$'s optimal response through belief updating. Implicit in the $I U$ subgame is that the signaling channel exists at the level of the information structure but does not affect the behavioral equations; equilibrium comparisons therefore reduce to comparisons of efforts and payoffs themselves.

#lemma(title: [Direct timing preference of the uninformed])[
  $U$'s direct preference between the two sequential regimes can be written as

  $
    Delta_U
    equiv pi_U^(U I) - pi_U^(I U)
    =
    (V^2 kappa^2) / 4
    - (4 V^2 - 4 V mu + EE[V_I^2]) / (4 V).
  $ <eq-delta-u-direct>

  If $Delta_U >= 0$, $U$ weakly prefers to move first when comparing $U I$ with $I U$ directly; if $Delta_U < 0$, $U$ prefers to move second. This quantity is useful for ranking the two sequential regimes but is not the deviation condition that makes $I U$ a Nash equilibrium; the binding deviation condition for $I U$ is $Delta_U^(S S) <= 0$.
]
<subsec-u-direct-preference>

#proof[
  From Section 4,
  $
    pi_U^(U I) = (V^2 kappa^2) / 4,
    quad
    pi_U^(I U) = (4 V^2 - 4 V mu + EE[V_I^2]) / (4 V).
  $
  Subtracting yields
  $
    Delta_U
    equiv pi_U^(U I) - pi_U^(I U)
    =
    (V^2 kappa^2) / 4
    - (4 V^2 - 4 V mu + EE[V_I^2]) / (4 V).
  $
  The sign of $Delta_U$ thus determines $U$'s direct ranking of $U I$ and $I U$. Because the relevant deviation from $I U$ at stage 0 is to $S S$, the equilibrium condition is $Delta_U^(S S) <= 0$ rather than $Delta_U$.
]

The lemma above distinguishes "regime ranking" from "deviation incentive": $Delta_U$ describes only $U$'s direct ranking of $U I$ and $I U$ and is not the deviation condition in the normal-form game. Equilibrium analysis still requires returning to $Delta_U^(S S)$ and combining it with the other unilateral differences.

On this basis, the principal departure from #c("fu2006") in our model can be stated as the following theorem.

#theorem(title: [Unique separating equilibrium in the $I U$ subgame])[
  In our model, the perfect Bayesian equilibrium of the $I U$ subgame is the unique separating equilibrium; pooling and semi-separating equilibria cannot be sustained.
] <thm-iu-no-pooling>

#proof[
  From Section 4, when a true type $v$ mimics any alternative type $s != v$, the payoff difference between honest play and mimicry is

  $
    (v - s)^2 / (4 V) > 0.
  $

  Each type therefore strictly prefers his own separating action, so no pooling or semi-separating profile can satisfy incentive compatibility. Combined with the fact that the separating profile already constitutes a perfect Bayesian equilibrium in Section 4, the perfect Bayesian equilibrium of the $I U$ subgame must be the unique separating equilibrium.
]

== Welfare analysis <subsec-welfare>

#theorem(title: [Welfare ranking generally differs from the equilibrium ranking])[
  Let total expected welfare be
  $
    EE[W] = widetilde(pi)_I + pi_U.
  $

  Total expected welfare in the three regimes is

  #set math.equation(numbering: "(1)")
  $
    EE[W^(S S)] & =
                  mu - (2 V kappa nu) / (1 + V lambda)
                  + (V^2 kappa^2) / (1 + V lambda)^2
                  + (V^3 kappa^2 lambda) / (1 + V lambda)^2,
  $ <eq-welfare-ss>

  $
    EE[W^(U I)] & =
                  mu - V kappa nu + (V^2 kappa^2) / 2,
  $ <eq-welfare-ui>

  $
    EE[W^(I U)] & =
                  V - mu + EE[V_I^2] / (2 V).
  $ <eq-welfare-iu>
  #set math.equation(numbering: none)

  Within the feasible parameter region, the ranking of these three quantities generally does not coincide with the stage-0 equilibrium ranking. Equilibrium conditions check unilateral deviation incentives, whereas welfare aggregates the two players' payoffs; there is no fixed monotonic correspondence between them.
]

#proof[
  Total expected welfare in each regime is the sum of the two players' ex ante payoffs. In the $S S$ regime,

  $
    EE[W^(S S)]
    =
    widetilde(pi)_I^(S S) + pi_U^(S S)
    =
    mu - (2 V kappa nu) / (1 + V lambda)
    + (V^2 kappa^2) / (1 + V lambda)^2
    + (V^3 kappa^2 lambda) / (1 + V lambda)^2.
  $

  In the $U I$ regime,

  $
    EE[W^(U I)]
    =
    widetilde(pi)_I^(U I) + pi_U^(U I)
    =
    mu - V kappa nu + (V^2 kappa^2) / 2.
  $

  In the $I U$ regime,

  $
    EE[W^(I U)]
    =
    widetilde(pi)_I^(I U) + pi_U^(I U)
    =
    EE[V_I^2] / (4 V)
    + (4 V^2 - 4 V mu + EE[V_I^2]) / (4 V)
    =
    V - mu + EE[V_I^2] / (2 V).
  $

  This establishes the three expressions in the statement.
]
