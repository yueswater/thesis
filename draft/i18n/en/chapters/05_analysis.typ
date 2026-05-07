#import "../thesis.typ": c, ca, cp, cy, definition, lemma, proof, theorem, widetilde

This section analyzes the endogenous timing choice at stage 0. Section 4 has derived the equilibrium payoffs in the three effort subgames $S S$, $U I$, and $I U$; we now substitute these payoffs into the stage-0 normal-form game and characterize which orders of moves can be supported by pure-strategy Nash equilibrium. Following the notation of #c("fu2006"), let $F$ denote choosing to act in period 1 and $S$ denote choosing to act in period 2.

== Stage-0 analysis <subsec-stage0-analysis>

The stage-0 regime choice can be written as a $2 times 2$ normal-form game. Rows are $I$'s timing choice and columns are $U$'s timing choice; the first entry of each cell is $I$'s ex ante payoff and the second is $U$'s ex ante payoff (this is exactly @tbl-stage0-payoffs):

#figure(
  table(
    columns: 3,
    inset: 8pt,
    align: center + horizon,
    stroke: none,
    table.hline(y: 1, stroke: 0.4pt),
    table.vline(x: 1, stroke: 0.4pt),
    table.cell(
      inset: 0pt,
      box(width: 64pt, height: 32pt)[
        #place(top + right, dx: -6pt, dy: 4pt)[$U$]
        #place(bottom + left, dx: 6pt, dy: -4pt)[$I$]
        #place(top + left, line(start: (0pt, 0pt), end: (64pt, 32pt), stroke: 0.4pt))
      ],
    ),
    $F$, $S$,
    $F$, $(widetilde(pi)_I^(S S), pi_U^(S S))$, $(widetilde(pi)_I^(I U), pi_U^(I U))$,
    $S$, $(widetilde(pi)_I^(U I), pi_U^(U I))$, $(widetilde(pi)_I^(S S), pi_U^(S S))$,
  ),
  caption: [Stage-0 expected payoff matrix.],
  supplement: [Table],
) <tbl-stage0-analysis>

=== Four unilateral deviation differences <subsec-stage0-deltas>

#definition(title: [Four unilateral deviation differences])[
  The stage-0 regime comparison can be expressed through a set of abstract unilateral deviation differences. For player $i in {I, U}$ and regime $J in {S S, U I, I U}$, let $Delta_i^J$ denote the change in $i$'s payoff when $i$ unilaterally deviates, given the opponent's timing, so that the resulting regime becomes $J$. By construction, $Delta_i^J$ is always defined as the post-deviation payoff minus the pre-deviation payoff; if $Delta_i^J > 0$, player $i$ has an incentive to deviate towards regime $J$. The four differences relevant for the $2 times 2$ stage-0 game are

  #set math.equation(numbering: "(1)")
  $
    Delta_I^(U I) & equiv widetilde(pi)_I^(U I) - widetilde(pi)_I^(S S) \
    & = - V kappa nu + (2 V kappa nu) / (1 + V lambda) + (V^2 kappa^2) / 4 - (V^2 kappa^2) / (1 + V lambda)^2. \
    Delta_I^(I U) & equiv widetilde(pi)_I^(I U) - widetilde(pi)_I^(S S) \
    & = EE[V_I^2] / (4 V) - mu + (2 V kappa nu) / (1 + V lambda) - (V^2 kappa^2) / (1 + V lambda)^2. \
    Delta_U^(U I) & equiv pi_U^(U I) - pi_U^(S S) \
    & = (V^2 kappa^2 (1 - V lambda)^2) / (4 (1 + V lambda)^2) >= 0. \
    Delta_U^(S S) & equiv pi_U^(S S) - pi_U^(I U) \
    & = (V^3 kappa^2 lambda) / (1 + V lambda)^2 - (4 V^2 - 4 V mu + EE[V_I^2]) / (4 V).
  $ <eq-stage0-deltas>
  #set math.equation(numbering: none)

  The corresponding interpretation is summarized as follows:

  #figure(
    table(
      columns: 5,
      align: center + horizon,
      stroke: none,
      table.hline(y: 0, stroke: 1pt),
      table.hline(y: 1, stroke: 0.5pt),
      table.hline(y: 5, stroke: 1pt),
      table.header([Difference], [Deviator], [Opponent's strategy], [Unilateral deviation], [Regime transition]),
      $Delta_I^(U I)$, [Informed], [Uninformed plays $F$], [$F arrow S$], [$S S arrow U I$],
      $Delta_I^(I U)$, [Informed], [Uninformed plays $S$], [$S arrow F$], [$S S arrow I U$],
      $Delta_U^(U I)$, [Uninformed], [Informed plays $S$], [$S arrow F$], [$S S arrow U I$],
      $Delta_U^(S S)$, [Uninformed], [Informed plays $F$], [$S arrow F$], [$I U arrow S S$],
    ),
    caption: [Definitions of the unilateral deviation differences and the associated regime transitions.],
    supplement: [Table],
  ) <tbl-deviation-definitions>

] <def-stage0-deltas>

#lemma(title: [Stage-0 best responses])[
  The stage-0 best responses are determined by the four unilateral deviation differences defined above:

  1. If $U$ chooses $F$, $I$ chooses $S$ when $Delta_I^(U I) > 0$, $F$ when $Delta_I^(U I) < 0$, and is indifferent when $Delta_I^(U I) = 0$.
  2. If $U$ chooses $S$, $I$ chooses $F$ when $Delta_I^(I U) > 0$, $S$ when $Delta_I^(I U) < 0$, and is indifferent when $Delta_I^(I U) = 0$.
  3. If $I$ chooses $F$, $U$ chooses $F$ when $Delta_U^(S S) > 0$, $S$ when $Delta_U^(S S) < 0$, and is indifferent when $Delta_U^(S S) = 0$.
  4. If $I$ chooses $S$, $U$ weakly prefers $F$ because $Delta_U^(U I) >= 0$, with indifference only when $V lambda = 1$.
] <subsec-stage0-br>

By the definitions above, $I$'s timing choice is determined by the differences in expected payoffs across the three regimes; the key asymmetry on $U$'s side comes from $Delta_U^(U I) >= 0$. Hence whenever $I$ plans to move second, $U$ generically prefers to move first, with indifference confined to the knife-edge case $V lambda = 1$.

#proof[
  At stage 0, $V_I$ has not yet been observed, so $I$ compares ex ante payoffs. If $U$ chooses $F$, then $I$ obtains $widetilde(pi)_I^(S S)$ by choosing $F$ and $widetilde(pi)_I^(U I)$ by choosing $S$. The difference is $Delta_I^(U I)$, whose sign therefore determines $I$'s best response.

  If $U$ chooses $S$, then $I$ obtains $widetilde(pi)_I^(I U)$ by choosing $F$ and $widetilde(pi)_I^(S S)$ by choosing $S$. The difference is $Delta_I^(I U)$, whose sign therefore determines $I$'s best response.

  For $U$, if $I$ chooses $F$, then $U$ obtains $pi_U^(S S)$ by choosing $F$ and $pi_U^(I U)$ by choosing $S$; the difference is $Delta_U^(S S)$, whose sign determines $U$'s best response. If $I$ chooses $S$, then $U$ obtains $pi_U^(U I)$ by choosing $F$ and $pi_U^(S S)$ by choosing $S$; the difference is $Delta_U^(U I)$. From

  $
    Delta_U^(U I)
    =
    (V^2 kappa^2 (1 - V lambda)^2) / (4 (1 + V lambda)^2)
    >= 0,
  $

  $U$ weakly prefers $F$, with equality if and only if $V lambda = 1$.
]

#theorem(title: [Pure-strategy endogenous timing equilibria])[
  The pure-strategy Nash equilibria at stage 0 are completely characterized as follows:

  1. $U I$ is a pure-strategy Nash equilibrium if and only if $Delta_I^(U I) >= 0$.
  2. Immediate simultaneous action $S S$ is a pure-strategy Nash equilibrium if and only if $Delta_I^(U I) <= 0$ and $Delta_U^(S S) >= 0$.
  3. $I U$ is a pure-strategy Nash equilibrium if and only if $Delta_I^(I U) >= 0$ and $Delta_U^(S S) <= 0$.
  4. Delayed simultaneous action $S S$ is a pure-strategy Nash equilibrium if and only if $Delta_I^(I U) <= 0$ and $Delta_U^(U I) = 0$.

  Moreover, $Delta_U^(U I) = 0$ if and only if $V lambda = 1$, so for generic parameters with $V lambda != 1$ the delayed simultaneous outcome $(S, S)$ cannot be a pure-strategy equilibrium.
] <subsec-stage0-ne>

In our setting, regime selection can be read directly from the four unilateral deviation differences in @eq-stage0-deltas without recourse to equilibrium refinements. In particular, the delayed simultaneous outcome $(S, S)$ requires the knife-edge $V lambda = 1$ and is therefore ruled out for generic parameters.

#proof[
  A pure-strategy Nash equilibrium requires that, given the opponent's timing, neither player has a unilateral incentive to deviate. We exhaust the four possible strategy profiles at stage 0:

  + Under $(I:S, U:F)$, the induced regime is $U I$:
    - The condition that $I$ does not deviate to $F$ is $widetilde(pi)_I^(U I) >= widetilde(pi)_I^(S S)$, i.e. $Delta_I^(U I) >= 0$.
    - The condition that $U$ does not deviate to $S$ is $pi_U^(U I) >= pi_U^(S S)$, i.e. $Delta_U^(U I) >= 0$, which holds by construction.
    - Conclusion: $U I$ is a pure-strategy equilibrium if and only if $Delta_I^(U I) >= 0$.

  + Under $(I:F, U:F)$, the induced regime is immediate $S S$:
    - Non-deviation by $I$ to $S$ requires $Delta_I^(U I) <= 0$.
    - Non-deviation by $U$ to $S$ requires $Delta_U^(S S) >= 0$.
    - Conclusion: immediate $S S$ is a pure-strategy equilibrium if and only if both inequalities hold.

  + Under $(I:F, U:S)$, the induced regime is $I U$:
    - Non-deviation by $I$ to $S$ requires $Delta_I^(I U) >= 0$.
    - Non-deviation by $U$ to $F$ requires $Delta_U^(S S) <= 0$.
    - Conclusion: $I U$ is a pure-strategy equilibrium if and only if both inequalities hold.

  + Under $(I:S, U:S)$, the induced regime is delayed $S S$:
    - Non-deviation by $I$ to $F$ requires $Delta_I^(I U) <= 0$.
    - Non-deviation by $U$ to $F$ requires $Delta_U^(U I) <= 0$. Since $Delta_U^(U I) >= 0$ always holds, this condition reduces to $Delta_U^(U I) = 0$, i.e. $V lambda = 1$.
    - Conclusion: delayed $S S$ is a pure-strategy equilibrium if and only if $Delta_I^(I U) <= 0$ and $V lambda = 1$.

  This completes the proof.
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

$R(v)$ describes the ex post comparison between moving early and moving late for a realized type, but the stage-0 decision occurs before the type is revealed. The regime choice is therefore governed by $EE[R(V_I)]$ — the ex ante average incentive — rather than by any single type's ex post preference.

#proof[
  Taking expectations of $R(v)$ over $V_I$,

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

  which delivers the upper and lower bounds of the interval.
]


== Timing structure across distributions <subsec-distribution-structure>

We now use the function $R(v)$ defined above and the identity $EE[R(V_I)] = -Delta_I^(I U)$ to investigate how different distributions shape the endogenous timing structure. The point of interest is not whether a single type prefers to move first or second ex post, but how heterogeneous individual preferences aggregate, under a given distribution, into the overall stage-0 incentive.

In other words, the distributional assumption directly determines the weighting and sign structure of $R(v)$ on the support and ultimately the sign of the unilateral deviation difference $Delta_I^(I U)$. We illustrate this correspondence through the two-point and uniform distributions: the former emphasizes the net effect produced by the sign combination of two discrete type points and their probability weights, while the latter focuses on whether a critical point with $R(v) = 0$ lies in the support and how that point partitions a continuous type space into different preference regions.

=== Two-point distribution <subsec-binary-structure>

When the type space follows a two-point distribution $V_I in {V_L, V_H}$ with $0 < V_L < V_H$, we can decompose $I$'s overall incentive directly by inspecting the signs of $R(V_L)$ and $R(V_H)$.

#lemma(title: [Sign criterion under the two-point distribution])[
  Under the two-point distribution $V_I in {V_L, V_H}$ with $0 < V_L < V_H$:

  #align(center)[
    #table(
      columns: 4,
      inset: (x: 6pt, y: 10pt),
      align: center + horizon,
      stroke: none,
      table.hline(y: 0, stroke: 0.5pt),
      table.hline(y: 1, stroke: 0.3pt),
      table.hline(y: 4, stroke: 0.5pt),
      table.header(stack(dir: ttb, spacing: 0.2em, [Sign pattern]), [Ex post type preferences], [Expectation], [Deviation difference]),
      [$(-,-)$], [Both prefer to move first ($I U$)], [$< 0$], [$> 0$],
      [$(+,+)$], [Both prefer to move second], [$> 0$], [$< 0$],
      [$(+,-)$ or $(-,+)$], [Preferences differ], [Indeterminate], [Indeterminate],
    )
  ]
] <lem-binary-structure>

The economic content of this lemma is that, although type-level ex post comparisons can decompose the incentive, $I$'s actual stage-0 decision is ultimately determined by the ex ante expected difference $Delta_I^(I U)$.

#proof[
  Under the two-point distribution $V_I in {V_L, V_H}$, set
  $
    Pr(V_I = V_H) = q in (0, 1) quad Pr(V_I = V_L) = 1 - q.
  $

  By definition,

  $
    EE[R(V_I)] = (1 - q) R(V_L) + q R(V_H),
    quad
    Delta_I^(I U) = -EE[R(V_I)].
  $

  Consider three cases:

  + If $(R(V_L), R(V_H)) = (-, -)$, then because $q in (0, 1)$, $EE[R(V_I)]$ is a strict convex combination of two negative numbers, so $EE[R(V_I)] < 0$ and $Delta_I^(I U) > 0$.

  + If $(R(V_L), R(V_H)) = (+, +)$, then $EE[R(V_I)]$ is a convex combination of two positive numbers, so $EE[R(V_I)] > 0$ and $Delta_I^(I U) < 0$.

  + If the two signs differ, the sign of $EE[R(V_I)]$ cannot be determined by the type-level signs alone but depends on the probability-weighted sum; the sign of $Delta_I^(I U)$ is therefore driven jointly by the prior probability $q$ and the type-level payoff differences.

  This completes the proof.
]

As shown in @fig-ch5-timing-regions, under the two-point distribution with $V = 1$ fixed, the parameter pair $(mu, delta)$ partitions the parameter space into different sign regions; these regions correspond to sign combinations of $Delta_I^(I U)$ and $Delta_U$ and therefore map directly into the stage-0 regime incentives.

#figure(
  image("../../../figures/fig5_regions.pdf", width: 130%),
  caption: [Sign regions of $(Delta_I^(I U), Delta_U)$ on the $(mu, delta)$ plane under the two-point distribution.],
  supplement: [Figure],
) <fig-ch5-timing-regions>

=== Uniform distribution <subsec-uniform-structure>

If $I$'s type follows a uniform distribution, written

$
  V_I tilde U[mu - delta, mu + delta], quad 0 < delta < mu,
$

then the support can be partitioned, according to the ex post deviation incentive, into the set of types that prefer to move second (deviating from $I U$),

$
  cal(W)
  equiv {v in [mu - delta, mu + delta] : R(v) > 0},
$

and the set of types that prefer to move first (remaining in $I U$),

$
  cal(F)
  equiv {v in [mu - delta, mu + delta] : R(v) < 0}.
$

#lemma(title: [Interior threshold and type partition under the uniform distribution])[
  Under the uniform distribution:

  + If the endpoints satisfy $R(mu - delta) dot R(mu + delta) < 0$, then there exists at least one interior threshold $v^* in (mu - delta, mu + delta)$ with $R(v^*) = 0$. This threshold partitions the type space into a region preferring to move first ($cal(F)$) and a region preferring to move second ($cal(W)$).

  + If $R(mu - delta) dot R(mu + delta) > 0$ and the equation $R(v) = 0$ has no real root in the support, then all types share the same ex post preference (all prefer to move first, or all prefer to move second).
] <lem-uniform-structure>

#proof[
  Since $R(v)$ is continuous on its domain $[mu - delta, mu + delta]$, the intermediate value theorem applies directly.

  - If $R(mu - delta) dot R(mu + delta) < 0$, the function takes opposite signs at the endpoints, so there exists an interior root $v^*$ with $R(v^*) = 0$. The sign of $R(v)$ flips on either side of $v^*$, corresponding to a reversal of ex post preference.

  - Conversely, if the endpoints share the same sign and the equation has no root in the support, continuity implies that $R(v)$ is uniformly positive or uniformly negative on the support, so all types prefer the same timing regime.
]

#figure(
  image("../../../figures/fig5_uniform_regions.pdf", width: 130%),
  caption: [Type-partition regions on the $(mu, delta)$ plane under the uniform distribution.],
  supplement: [Figure],
) <fig-ch5-uniform-regions>

As shown in @fig-ch5-uniform-regions, under the uniform distribution, the $(mu, delta)$ parameter plane can be classified by whether the type space is split by an interior threshold $v^*$. If $R(v) < 0$ throughout the support, all types share the same ex post preference and all favor moving first; conversely, if $R(v)$ takes both positive and negative values within the same support, continuity guarantees at least one interior threshold that partitions the support into types preferring to move first and types preferring to move second. The three panels correspond to different values of the public prize $V$ and show how the type partition shifts with the external contest environment. Unlike the two-point case, the comparative-statics parameter here is no longer the prior probability weight $q$ but the public prize $V$, which directly alters the shape of $R(v)$.

The dashed line in the figure marks the feasibility boundary $delta = mu$; above this line the lower endpoint of the support would satisfy $mu - delta <= 0$, violating the assumption that the support is strictly positive. Within the feasible region plotted, no parameter combination produces a region in which all types prefer to move second. In other words, in this family of uniform distributions, only two structures are observed: "all types prefer to move first," and "an interior threshold splits the types into divergent preferences." Finally, as the public prize $V$ increases, the light-shaded split region expands substantially, implying that, over a larger feasible parameter set, types no longer share a common ex post ranking of the timing regimes; the stage-0 regime choice therefore depends more heavily on the fine structure of the type distribution and the location of the threshold and is harder to capture by any single average comparison.

== Pooling analysis <subsec-pooling-analysis>

Of the three regimes, only $I U$ raises the question of whether the leader's effort transmits type information: $I$ moves first and $U$ responds after observing $x_I$. The other two regimes do not: $S S$ is simultaneous, and $U I$ has $U$ moving first; in neither case does $I$ signal to $U$.

In our setting, however, $U$'s best response is

$
  x_U^*(x_I; V) = sqrt(V x_I) - x_I,
$

which depends only on the observed effort $x_I$ and on $U$'s own prize $V$, not on the posterior belief about $V_I$. Hence, although $I$'s effort can be observed, it does not change $U$'s optimal response through belief updating. In the $I U$ subgame the signaling channel exists at the level of the information structure but does not affect the behavioral equations; equilibrium comparisons therefore reduce to comparisons of efforts and payoffs themselves.

#lemma(title: [Direct timing preference of the uninformed])[
  $U$'s direct preference between the two sequential regimes can be written as

  $
    Delta_U
    equiv pi_U^(U I) - pi_U^(I U)
    =
    (V^2 kappa^2) / 4
    - (4 V^2 - 4 V mu + EE[V_I^2]) / (4 V).
  $ <eq-delta-u-direct>

  If $Delta_U >= 0$, $U$ weakly prefers to move first when comparing $U I$ and $I U$ directly; if $Delta_U < 0$, $U$ prefers to move second. This quantity helps rank the two sequential regimes but is not the deviation condition for $I U$ to be a Nash equilibrium; the binding deviation condition for $I U$ is $Delta_U^(S S) <= 0$.
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

The lemma above distinguishes "regime ranking" from "deviation incentive": $Delta_U$ describes only $U$'s direct ranking of $U I$ and $I U$ and is not the deviation condition in the normal-form game. Equilibrium analysis therefore must return to $Delta_U^(S S)$ and combine it with the other unilateral differences.

On this basis, the principal departure from #c("fu2006") in our model can be stated as the following theorem.

#theorem(title: [Unique separating equilibrium of the $I U$ subgame])[
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

Section 5.1 has fully characterized the stage-0 equilibrium: which timing combination can be supported by a pure-strategy Nash equilibrium depends on the signs of the four unilateral deviation differences $Delta_I^(U I)$, $Delta_I^(I U)$, $Delta_U^(S S)$, and $Delta_U^(U I)$. "Equilibrium" and "social welfare," however, are two different questions: equilibrium asks whether, given the opponent's strategy, any player wishes to deviate unilaterally; welfare asks about the magnitude of the sum of payoffs. Under the Tullock contest, this distinction matters because the prize itself is fixed: the more effort the two players exert, the more resources are dissipated in the contest and the smaller the social surplus. The welfare analysis below is therefore equivalent to comparing total effort across the three regimes — the lower the effort, the more resources are preserved for the eventual winner rather than dissipated in the contest.

Returning to the model, the equilibrium effort structures generated by the three regimes have distinct features. In the $S S$ regime, both players choose efforts simultaneously without observing the opponent's true prize, and the expected effort levels are governed by $kappa$ and $lambda$. In the $U I$ regime, $U$ moves first, and because $U$ cannot observe $V_I$, $U$ must use the prior in place of the posterior in computing his effort, after which $I$ responds to the realized type. In the $I U$ regime, $I$ moves first and each type chooses effort knowing $U$ will observe and respond. The three regimes differ in how the type risk is absorbed into equilibrium effort, which translates into differences in total efficiency. The welfare ranking depends non-monotonically on the prior $q$, the dispersion $delta$ of the support, and the prize $V$, so no single regime dominates uniformly across the parameter space.

#theorem(title: [Welfare and equilibrium rankings generally disagree])[
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

  Within the feasible parameter region, the ranking of these three quantities generally does not coincide with the stage-0 equilibrium ranking. Equilibrium conditions check unilateral deviation incentives, whereas welfare aggregates the two players' payoffs; there is no fixed monotonic correspondence between the two.
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

The three expressions exhibit a clear structure: $EE[W^(S S)]$ combines the ex ante mean with a symmetric-equilibrium dissipation term; $EE[W^(U I)]$ has $U$ moving first without the ability to fine-tune effort by type, so the dissipation structure is dominated by $kappa^2$; and $EE[W^(I U)]$ is jointly determined by $V$, $mu$, and the second moment $EE[V_I^2]$, where $EE[V_I^2] = mu^2 + sigma^2$ implies that the variance $sigma^2$ of the distribution directly affects the welfare level.

The pairwise differences make it clear that there is no fixed correspondence between the welfare ranking and the equilibrium ranking. Even under parameter combinations in which $I U$ is the equilibrium regime, the total welfare under $I U$ need not exceed that under $S S$; the converse is equally possible. In short, "which regime is realized in equilibrium" and "which regime delivers higher total welfare" are two distinct questions, and the former does not imply the latter. This finding is consistent with results in the broader Tullock-contest literature: commitment by the strong player can lead to higher effort and resource dissipation, and the "weak leads, strong follows" arrangement that often emerges under endogenous timing need not be the welfare-maximizing or designer-preferred outcome. Different studies adopt different welfare criteria, but all suggest that the determination of equilibrium timing and the evaluation of welfare effects must be treated as separate considerations #ca("dixit1987"), #cy("dixit1987"); #ca("baikshogren1992"), #cy("baikshogren1992"); #ca("leininger1993"), #cy("leininger1993"); #ca("nitzan1994"), #cy("nitzan1994"); #ca("baik2013"), #cy("baik2013"); #ca("protopappas2023"), #cy("protopappas2023"). In our framework, comparing regimes therefore requires more than checking which regimes can be supported in equilibrium; the welfare effects must be examined under the relevant parameter conditions in order to ensure accuracy and robustness.

== Summary <subsec-ch5-summary>

This section substitutes the equilibrium payoffs of the three subgames derived in Section 4 back into the stage-0 normal-form game and, through Section 5.1, fully characterizes the endogenous timing equilibrium. The core tool is the set of four unilateral deviation differences $Delta_I^(U I)$, $Delta_I^(I U)$, $Delta_U^(S S)$, and $Delta_U^(U I)$; the sign combinations of the first three directly determine which timing combination can be supported by pure-strategy Nash equilibrium, while the fourth difference, satisfying $Delta_U^(U I) >= 0$ identically, reduces to the knife-edge condition $V lambda = 1$ — implying that "delayed simultaneous action" is generically not an equilibrium. Building on this, we introduce the function $R(v)$ and decompose $I$'s ex post comparison at the type level:

- Under the two-point distribution, the sign combination of $R(V_L)$ and $R(V_H)$ together with the probability weights determines the direction of $Delta_I^(I U)$.
- Under the uniform distribution, whether the threshold $v^*$ lies in the support determines whether the type space is split into two regions.

In addition, we show that the $I U$ subgame admits only the unique separating equilibrium — the ex post payoff gap between honest play and mimicry by any pair $(v, s)$ is exactly $(v - s)^2 / (4 V) > 0$, so any pooling or semi-separating profile violates incentive compatibility. In standard signaling games, the existence of a separating equilibrium typically depends on assumptions about the tail of the type distribution or the monotone-likelihood-ratio property; in our setting these restrictions disappear because $U$'s best response does not depend on the posterior belief about $V_I$. Finally, we conduct an independent welfare analysis and show that the welfare ranking and the equilibrium ranking exhibit no fixed monotonic correspondence; inferring welfare optimality from a particular equilibrium pattern alone fails over part of the Tullock-contest parameter space.

The distribution-free nature of the separation result rests on a key assumption maintained throughout this section: the uninformed player's prize value is a public constant $V$. When $V_U$ is a known constant, $U$'s best response depends only on the observed effort and is independent of the posterior belief about $V_I$. In other words, although $I$'s leading action is observable in the information structure, it cannot affect $U$'s decision through belief updating, so the signaling channel is inoperative — which is precisely why the separation result here holds universally, while the pooling equilibrium that #c("fu2006") sustains under specific distributional assumptions is entirely ruled out in our framework.

This assumption, however, leaves open one dimension along which the separation conclusion may be qualified: whether $V_U$ is correlated with $V_I$. Section 6 relaxes this assumption by allowing $V_U$ to be a two-point random variable with a partially correlated structure with $V_I$. In that more general environment, after observing $I$'s effort, $U$ must update beliefs about both $V_I$ and $V_U$ simultaneously, because a high-type signal not only conveys that $I$ is more competitive but also implies that $U$'s own prize is more likely to be high. This bilateral belief updating means that $U$'s behavioral equation no longer separates from $I$'s type, opening the possibility that the separating equilibrium breaks down.
