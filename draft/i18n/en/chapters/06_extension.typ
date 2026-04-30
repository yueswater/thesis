#import "../thesis.typ": c, definition, lemma, proof, proposition, theorem

This section augments the baseline model with a partially correlated type structure. The aim is to answer a sharper question: under what conditions does the unique separating outcome of the $I U$ subgame in the previous sections break down and revert to the pooling outcome of #c("fu2006")?

The crucial feature of Section 5 is that the uninformed player's continuation best response does not depend on the posterior belief about the informed player's type, so the signal can be observed but does not alter the opponent's response. This section opens that channel: when $U$'s prize is partially correlated with $I$'s type, $U$'s best response shifts through the posterior belief, and a separating equilibrium no longer obtains automatically.

== Partial correlation structure <subsec-ext-setup>

Consider two-point types $v_I in {V_H, V_L}$ with $V_H > V_L > 0$ and equal prior probabilities $1/2$. Unlike before, $U$'s prize is no longer a public constant but is drawn from a conditional distribution given $v_I$.

#definition(title: [Partially correlated types])[
  Given parameters $q, s in [0, 1]$,

  $
    Pr(v_U = V_H | v_I = V_H) & = q,
                                quad
                                Pr(v_U = V_L | v_I = V_H) & = 1 - q, \
    Pr(v_U = V_L | v_I = V_L) & = s,
                                quad
                                Pr(v_U = V_H | v_I = V_L) & = 1 - s.
  $

  Two benchmarks anchor the parameter space:
  1. $(q, s) = (1/2, 1/2)$: types are independent, recovering the baseline model;
  2. $(q, s) = (1, 1)$: types are perfectly correlated, corresponding to the limit environment of #c("fu2006").
] <def-partial-corr>

Combining the prior $Pr(v_I = V_H) = Pr(v_I = V_L) = 1/2$ yields the joint distribution

$
  Pr(v_I = V_H, v_U = V_H) = q/2,
  quad
  Pr(v_I = V_H, v_U = V_L) = (1 - q)/2,
$

$
  Pr(v_I = V_L, v_U = V_H) = (1 - s)/2,
  quad
  Pr(v_I = V_L, v_U = V_L) = s/2.
$

Let $mu(x_I)$ denote $U$'s posterior probability of the high-type event after observing $x_I$. Define

$
  overline(V)_H = q V_H + (1 - q) V_L,
  quad
  overline(V)_L = (1 - s) V_H + s V_L,
$

and the belief-weighted prize

$
  hat(V)_U(mu) = mu overline(V)_H + (1 - mu) overline(V)_L.
$ <eq-vhat-u>

By construction
$
  overline(V)_H = EE[v_U | v_I = V_H], quad overline(V)_L = EE[v_U | v_I = V_L],
$
and by the law of iterated expectations
$
  hat(V)_U(mu) = EE[v_U | x_I] = mu overline(V)_H + (1 - mu) overline(V)_L.
$
The parameters $q$ and $s$ thus enter the conditional expectations and, through them, the effective prize that $U$ faces in the contest. Furthermore,
$
  overline(V)_H - overline(V)_L = (q + s - 1)(V_H - V_L),
$
so the monotonicity of $hat(V)_U(mu)$ in $mu$ is governed by $q + s - 1$: it is weakly increasing when $q + s >= 1$ and strictly decreasing when $q + s < 1$.

== Belief-dependent best response <subsec-ext-br>

In the $I U$ subgame, $U$ faces an observed effort $x_I$ and a posterior $mu$, and solves

$
  max_(x_U >= 0) U_U(x_I, x_U | mu)
  =
  max_(x_U >= 0)
  [
    x_U/(x_I + x_U) hat(V)_U(mu) - x_U
  ].
$

#lemma(title: [Best response of $U$ under partial correlation])[
  Given $x_I > 0$ and $mu in [0, 1]$, $U$'s interior best response is

  $
    x_U^*(x_I, mu) = sqrt(x_I hat(V)_U(mu)) - x_I.
  $ <eq-ext-br>

  When $q + s > 1$, the interior region satisfies $(d x_U^*) / (d mu) > 0$.
] <lem-ext-br>

#proof[
  The first-order condition is
  $
    x_I hat(V)_U(mu) / (x_I + x_U)^2 = 1.
  $
  Solving for the positive root gives $x_I + x_U = sqrt(x_I hat(V)_U(mu))$, which yields the best response above. Differentiating,
  $
    (d x_U^*) / (d mu)
    =
    (overline(V)_H - overline(V)_L) / (2 sqrt(hat(V)_U(mu) / x_I));
  $
  when $q + s > 1$, $overline(V)_H - overline(V)_L > 0$, so the derivative is positive.
]

In the baseline model, the best response depends only on the observed effort and not on beliefs; in this section, the best response depends on beliefs, and this difference is precisely the source of whether separation can be sustained.

== Separation conditions and the critical boundary <subsec-ext-boundary>

We first focus on the region $q + s >= 1$ (independence to positive correlation). Consider a candidate separating equilibrium in which the high and low types choose different efforts and on-path beliefs are

$
  mu(x_H) = 1, quad mu(x_L) = 0.
$

In this configuration, the two types face effective opponent prizes $overline(V)_H$ and $overline(V)_L$ respectively, so

$
   x_H & = V_H^2 / (4 overline(V)_H),
         quad
         x_L  & = V_L^2 / (4 overline(V)_L), \
  pi_H & = V_H^2 / (4 overline(V)_H),
         quad
         pi_L & = V_L^2 / (4 overline(V)_L).
$

If the high type instead mimics the low type, the deviation payoff is

$
  U_H^d = (V_L (2 V_H - V_L)) / (4 overline(V)_L).
$

The high type's incentive-compatibility condition is therefore

$
  V_H^2 / overline(V)_H
  >=
  (V_L (2 V_H - V_L)) / overline(V)_L.
$ <eq-ext-ich>

Substituting $overline(V)_H = q V_H + (1 - q) V_L$ and $overline(V)_L = (1 - s) V_H + s V_L$, this condition becomes

$
  V_H^2 / [q V_H + (1 - q) V_L]
  >=
  (V_L (2 V_H - V_L)) / [(1 - s) V_H + s V_L].
$ <eq-ext-ich-qs>

The left-hand side, depending on $q$, governs the strength of $U$'s response on the high-type path; the right-hand side, depending on $s$, governs $U$'s response on the mimicry path.

#proof[
  On the candidate separating path, an honest high type chooses $x_H = V_H^2 / (4 overline(V)_H)$ with payoff
  $
    pi_H = V_H^2 / (4 overline(V)_H).
  $

  If the high type mimics the low type by choosing $x_L = V_L^2 / (4 overline(V)_L)$, then $U$ responds with the low-type belief, and the high type's deviation payoff is
  $
    U_H^d = (V_L (2 V_H - V_L)) / (4 overline(V)_L).
  $

  Incentive compatibility requires $pi_H >= U_H^d$, i.e.
  $
    V_H^2 / (4 overline(V)_H) >= (V_L (2 V_H - V_L)) / (4 overline(V)_L).
  $
  Rearranging gives the stated condition.
]

In the region $q + s >= 1$, deviation by the low type to mimic the high type cannot improve on the equilibrium path, so the only binding condition arises from the high type.

#theorem(title: [Existence of a separating equilibrium and critical boundary in the positively correlated region])[
  In the region $q + s >= 1$, the $I U$ subgame admits the candidate pure-strategy separating perfect Bayesian equilibrium described above if and only if the high-type incentive-compatibility condition holds; equivalently, the inequality in $(q, s)$ form above is satisfied. Setting this condition with equality yields the critical boundary

  #set math.equation(numbering: "(1)")
  $
    s^*(q)
    =
    (
    V_H^3
    - V_L (2 V_H - V_L) [q V_H + (1 - q) V_L]
    ) / (V_H^2 (V_H - V_L)).
  $ <eq-ext-boundary>

  Hence:
  1. Separation is sustained when $s <= s^*(q)$.
  2. When $s > s^*(q)$, mimicry by the high type is profitable, separation breaks down, and the regime enters the pooling region.
] <thm-ext-boundary>

#proof[
  Existence of a separating equilibrium is necessary and sufficient for the high type to lack a profitable mimicry deviation, which is the high-type incentive-compatibility condition. The detailed derivation appears in
  #context if query(<proof-ext-boundary>).len() > 0 [
    #ref(<proof-ext-boundary>)
  ] else [
    Appendix "Section 6: critical boundary derivation"
  ].
]

#figure(
  image("../../../figures/fig6_qs_regions.pdf", width: 100%),
  caption: [Equilibrium partition in the $(q, s)$ parameter space.],
  supplement: [Figure],
) <fig-ch6-qs-regions>

In #ref(<fig-ch6-qs-regions>), two regions arise within $q + s >= 1$: region I corresponds to the separating equilibrium and region II to the pooling equilibrium in which the high type mimics the low type. The boundary $s^*(q)$ is the locus on which the high type's incentive compatibility binds. Differentiating the boundary expression (eq. @eq-ext-boundary[]) with respect to $q$ gives
$
  (d s^*(q)) / (d q) = - (V_L (2 V_H - V_L)) / (V_H^2) < 0.
$
Thus the higher $q$ is, the lower the upper bound on $s$ for which separation is sustained; for any given $q$, separation breaks down once $s$ exceeds this upper bound, and the pair $(q, s)$ enters the pooling region.

== Incentive reversal in the negatively correlated region and the critical ratio <subsec-ext-negative>

The previous subsection focused on $q + s >= 1$. When $q + s < 1$,
$
  overline(V)_H - overline(V)_L = (q + s - 1)(V_H - V_L)
$
is negative, so $overline(V)_H < overline(V)_L$. By the definition of the belief-weighted prize, $hat(V)_U(mu)$ is therefore strictly decreasing in $mu$: the more confident $U$ is that $I$ is the high type, the lower $U$'s effective prize and the weaker $U$'s continuation effort response. The direction of the deviation incentive is reversed relative to the previous subsection: in the negatively correlated region, the dominant deviation may be the low type mimicking the high type — that is, bluffing.

Continuing with the candidate separating path of the previous subsection, the honest payoff of the low type is

$
  pi_L = V_L^2 / (4 overline(V)_L).
$

If the low type deviates and mimics the high type, the chosen effort is $x_H = V_H^2 / (4 overline(V)_H)$, inducing the posterior $mu = 1$. By the best response derived above,

$
  x_U^*(x_H, 1)
  =
  sqrt(x_H overline(V)_H) - x_H
  =
  V_H/2 - V_H^2 / (4 overline(V)_H).
$

The total effort and the low type's winning probability are therefore

$
  x_H + x_U^*(x_H, 1) = V_H / 2,
  quad
  x_H / (x_H + x_U^*(x_H, 1)) = V_H / (2 overline(V)_H).
$

The low type's deviation payoff simplifies to

$
  U_L^d
  =
  (V_H V_L) / (2 overline(V)_H) - V_H^2 / (4 overline(V)_H)
  =
  V_H (2 V_L - V_H) / (4 overline(V)_H).
$ <eq-ext-uld>

The low-type incentive-compatibility condition is therefore

$
  V_L^2 / (4 overline(V)_L) >= V_H (2 V_L - V_H) / (4 overline(V)_H),
$

equivalently

$
  V_L^2 overline(V)_H >= V_H (2 V_L - V_H) overline(V)_L.
$ <eq-ext-icl>

If $2 V_L <= V_H$, the right-hand side is non-positive while $pi_L > 0$, so $I C_L$ holds automatically and region III is empty. We focus on the case $2 V_L > V_H$. Setting the inequality with equality and substituting

$
  overline(V)_H = q V_H + (1 - q) V_L,
  quad
  overline(V)_L = (1 - s) V_H + s V_L,
$

gives

$
  V_L^2 [q V_H + (1 - q) V_L] & =
                                V_H (2 V_L - V_H) [(1 - s) V_H + s V_L] \
                              & =
                                V_H (2 V_L - V_H) [V_H - s (V_H - V_L)].
$

Rearranging yields

$
  s V_H (2 V_L - V_H) (V_H - V_L)
  =
  V_H^2 (2 V_L - V_H)
  - V_L^2 [q V_H + (1 - q) V_L].
$

The low-type critical boundary is therefore

$
  s_L^*(q)
  =
  (
  V_H^2 (2 V_L - V_H)
  - V_L^2 [q V_H + (1 - q) V_L]
  ) / (V_H (2 V_L - V_H) (V_H - V_L)).
$ <eq-ext-sl-boundary>

Its slope is

$
  (d s_L^*(q)) / (d q)
  =
  - V_L^2 / (V_H (2 V_L - V_H))
  < 0.
$

#proposition(title: [Necessary and sufficient condition for region III to be non-empty])[
  Under $V_I in {V_H, V_L}$, $(q, s) in [0, 1]^2$, and $V_H > V_L > 0$, there exists $(q, s)$ at which the low-type incentive-compatibility condition is violated (i.e. region III is non-empty) if and only if
  $
    V_H / V_L < phi = (1 + sqrt(5)) / 2.
  $
] <prop-ext-region3>

#proof[
  Consider first $2 V_L <= V_H$. By the deviation payoff above, $U_L^d <= 0$ while the honest payoff $pi_L = V_L^2 / (4 overline(V)_L) > 0$, so $I C_L$ holds for every $(q, s)$ and region III is empty. In this case $V_H / V_L >= 2 > phi$, consistent with the statement. Consider next $2 V_L > V_H$. Violating $I C_L$ is equivalent to

  $
    V_L^2 overline(V)_H < V_H (2 V_L - V_H) overline(V)_L.
  $

  The left-hand side is strictly increasing in $q$ and the right-hand side is strictly decreasing in $s$, so the most likely violation occurs at $(q, s) = (0, 0)$. Substituting yields

  $
    V_L^3 < V_H^2 (2 V_L - V_H).
  $

  Setting $rho = V_H / V_L > 1$ and dividing by $V_L^3$,

  $
    rho^3 - 2 rho^2 + 1 < 0.
  $

  Since

  $
    (rho - 1) (rho^2 - rho - 1)
    = rho^3 - rho^2 - rho - rho^2 + rho + 1
    = rho^3 - 2 rho^2 + 1,
  $

  we have

  $
    rho^3 - 2 rho^2 + 1 < 0
    equiv
    (rho - 1) (rho^2 - rho - 1) < 0.
  $

  Because $rho > 1$ implies $rho - 1 > 0$, the inequality is equivalent to $rho^2 - rho - 1 < 0$, that is, $rho < phi$. The reverse implication is analogous, completing the proof.
]

#figure(
  image("../../../figures/fig6_golden_ratio_threshold.pdf", width: 95%),
  caption: [Critical condition for the existence of region III #footnote[The left panel shows how the area of region III in $(q, s) in [0, 1]^2$ varies with $rho = V_H / V_L$ and vanishes exactly at $rho = phi$. The right panel plots the two roots of $f(rho) = rho^3 - 2 rho^2 + 1$: $rho = 1$ (the degenerate case) and $rho = phi approx 1.618$.]],
  supplement: [Figure],
) <fig-ch6-golden-ratio>

#ref(<fig-ch6-golden-ratio>) shows that the critical ratio $rho^* = phi$ arises from the interlocking of two scales: on the one hand, equilibrium effort in a Tullock contest scales quadratically; on the other, the partial correlation structure enters the effective prize linearly through the conditional expectation. When $rho^2 = rho + 1$, the low type's winning-probability gain from mimicry exactly balances the additional effort cost; once $rho$ exceeds this threshold, the cost of signal exaggeration systematically dominates the strategic gain, and region III disappears.

To keep notation consistent with the previous subsection, let $s_H^*(q)$ denote the high-type critical boundary in eq. @eq-ext-boundary[]. The full $(q, s)$ partition can then be summarized as follows.

#figure(
  text(size: 10pt)[
    #table(
      columns: (0.95fr, 2.0fr, 0.75fr, 1.7fr, 1.45fr),
      stroke: none,
      inset: 5pt,
      align: center,
      table.hline(y: 0, stroke: 0.7pt),
      table.hline(y: 1, stroke: 0.4pt),
      table.hline(y: 5, stroke: 0.7pt),
      [Region], [Condition], [Binding IC], [Economic mechanism], [Corresponding region],
      [$q + s >= 1$], [$s <= s_H^*(q)$], [None], [Neither type gains from mimicry], [I (separating)],
      [$q + s >= 1$], [$s > s_H^*(q)$], [$I C_H$], [High type mimics low type], [II (pooling)],
      [$q + s < 1$], [$s >= s_L^*(q)$ or $V_H / V_L >= phi$], [None], [Low-type deviation unprofitable], [I (extended)],
      [$q + s < 1$], [$s < s_L^*(q)$ and $V_H / V_L < phi$], [$I C_L$], [Low type mimics high type], [III (pooling)],
    )
  ],
  caption: [Equilibrium classification across the full $(q, s)$ parameter space.],
  supplement: [Table],
) <tbl-ext-regions-full>

#figure(
  image("../../../figures/fig6_qs_regions_main.pdf", width: 95%),
  caption: [Equilibrium partition under partially correlated types $(q, s)$ #footnote("Region I is the separating equilibrium; region II is bound by the high type's IC and continues the conclusion of the previous subsection; region III is a new pooling region in the negatively correlated zone bound by the low type's IC. The benchmark point $(0.5, 0.704)$ matches the boundary of the previous subsection.")],
  supplement: [Figure],
) <fig-ch6-qs-regions-main>

#ref(<fig-ch6-qs-regions-main>) and table @tbl-ext-regions-full[] together display the full structure of this section: regions II and III correspond to mimicry incentives in opposite directions, both expanding outward from the separating region I.

In terms of literature, work on bargaining under asymmetric information has mostly focused on how the proposer's private information (such as reservation prices and discount rates) shapes mechanism performance; representative surveys include #c("ausubel2002"), with related discussion in #c("cramton1992"). Our $(q, s)$ framework instead separates "asymmetric information" and "prize correlation" into two distinct dimensions, allowing the incentive reversal to be tracked continuously through a single set of parameters. With respect to spillovers in contests, classic discussions such as Baik and Shogren (1992) and Leininger (1993) treat the correlation structure as exogenously given; our setup, by contrast, lets the correlation structure itself determine when the signaling channel is active. This complements the surveys of contest design in #c("konrad2009") and the analyses of asymmetric-information contests in #c("warneryd2003") and #c("dentermorgansisak2022"). Overall, the propositions above provide a verifiable closed-form threshold for when the information structure suffices to break a separating equilibrium, rather than a comparison of isolated parameter points.

== Summary <subsec-ext-summary>

The central contribution of this section is to nest the necessarily separating result derived in the model of Section 5 and the pooling-permitting framework of #c("fu2006") within a single continuously varying information structure, allowing direct comparison and unification. The parameters $q$ and $s$ control $U$'s conditional expected prize: $q$ governs $U$'s effective stake on the high-type path, and $s$ governs $U$'s effective stake on the low-type path. When the two parameters make $U$'s continuation response more sensitive to the posterior belief, the relative payoff of honest disclosure by the high type falls while the deviation payoff from mimicking the low type rises, eventually altering the equilibrium structure of the $I U$ subgame.

The critical boundary $s^*(q)$ delineates the range over which the separating equilibrium survives. Given $q$, when $s$ exceeds this boundary, the high type can profit by deviating, and the separating equilibrium collapses into a pooling equilibrium. The slope of $s^*(q)$ encodes the core intuition: when the two parties' payoffs are highly correlated (i.e. $q$ rises), the opponent's expected resistance is stronger, raising the cost of honest disclosure for the high type and pushing the high type toward concealment, which shrinks the feasible region for separation.

The two extreme corners of the parameter space delineate the theoretical spectrum of the model. At $(q, s) = (1/2, 1/2)$, the two valuations are independent, beliefs have no substantive effect on $U$'s expected prize, and the model collapses to the baseline of the previous sections, sustaining the unique separating equilibrium. At $(q, s) = (1, 1)$, valuations are perfectly correlated and the model reduces to the special case of #c("fu2006"); the high type then conceals in the face of strong expected resistance, and the separating equilibrium collapses. At the institutional level, this section clarifies that the survival of the first-mover advantage depends on whether the two parties' payoffs are correlated enough to force concealment by the high type — and the absolute threshold for the transition from separating to pooling is precisely the critical boundary $s^*(q)$.
