#import "../thesis.typ": c, definition, lemma, proof, proposition, widetilde

This section embeds the baseline model of Section 5 into a more general correlated structure. The reason the analysis of the $I U$ subgame in Section 5.3 yielded a unique separating equilibrium is that the uninformed player's prize value was fixed at the public constant $V$, so his best response depended only on the observed effort and was insensitive to the posterior belief about $I$'s type. We now relax this assumption: the uninformed player's prize is also a two-point random variable, and we allow it to be positively correlated with the informed player's type. Under this structure, observing a high-type signal simultaneously implies that the opponent is stronger and that one's own prize is more likely to be high; the uninformed player's decision is no longer decoupled from beliefs, and the separating equilibrium need no longer hold.

== Partial correlation structure <subsec-ext-setup>

This subsection further generalizes the information environment of the baseline model. Unlike Section 5, the uninformed player's prize is no longer a known public constant but a random variable taking values in the same support, that is, $V_U in {V_L, V_H}$. In other words, before the contest begins, the two players face correlated uncertainty about each other's and their own prize values.

#definition(title: [Partially correlated types])[
  Define two conditional probabilities

  $
    p_H equiv Pr(V_U = V_H | V_I = V_H),
    quad
    p_L equiv Pr(V_U = V_L | V_I = V_L).
  $

  $p_H$ captures the probability that, when player $I$ is high-type, player $U$ also faces a high-value environment; $p_L$ captures the symmetric statement at the low type. Combined with the prior $Pr(V_I = V_H) = q$, the joint distribution of $(V_I, V_U)$ is

  $
    Pr(V_I = V_H, V_U = V_H) & = q p_H, \
    Pr(V_I = V_H, V_U = V_L) & = q (1-p_H), \
    Pr(V_I = V_L, V_U = V_H) & = (1-q)(1-p_L), \
    Pr(V_I = V_L, V_U = V_L) & = (1-q) p_L.
  $

  In contingency-table form:

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
          #place(top + right, dx: -6pt, dy: 4pt)[$V_U$]
          #place(bottom + left, dx: 6pt, dy: -4pt)[$V_I$]
          #place(top + left, line(start: (0pt, 0pt), end: (64pt, 32pt), stroke: 0.4pt))
        ],
      ),
      $V_H$, $V_L$,
      $V_H$, $q p_H$, $q (1-p_H)$,
      $V_L$, $(1-q)(1-p_L)$, $(1-q) p_L$,
    ),
    caption: [Joint probability distribution of $(V_I, V_U)$.],
    supplement: [Table],
  ) <tbl-ext-joint>
] <def-partial-corr>

For the marginal distribution of $V_U$ to coincide with that of $V_I$ — that is, for the two players to share the same high-type marginal probability $q$ ($Pr(V_U = V_H) = q$) — the probability parameters must satisfy the marginal-consistency restriction

$
  (1-q)(1-p_L) = q(1-p_H).
$ <eq-ext-marginal-consistency>

Under the parameter combinations above, three theoretically representative benchmark configurations of the information structure can be identified:

1. Statistical independence: when $p_H = q$ and $p_L = 1-q$, the two players' prize values are mutually unaffected, and the model reduces to the baseline environment without correlation.
2. Perfect positive correlation: when $p_H = p_L = 1$, the two players are necessarily in the same prize environment, which closely matches the setting of #c("fu2006").
3. Partial positive correlation: when $q < p_H < 1$ and $1-q < p_L < 1$ jointly satisfy the marginal-consistency restriction, this section investigates how the separating and pooling equilibria evolve in this more general environment.

== Belief-weighted prize and best response <subsec-ext-br>

Under the partially correlated information structure, the uninformed player's decision logic is more involved than in the baseline. Because $V_U$ is statistically related to $V_I$, the signal $I$ sends — namely the effort $x_I$ — not only reveals $I$'s own strength but also indirectly carries information about $U$'s prize.

Let $m(x_I)$ denote $U$'s posterior belief that "the opponent is high-type ($V_I = V_H$)" after observing $I$'s effort:

$
  m(x_I) equiv Pr(V_I = V_H | x_I) in [0,1].
$

Given the posterior $m$, $U$'s expectation of his own prize is no longer a single constant but a probability-weighted effective prize $hat(V)_U$:

$
  hat(V)_U(m) & = E[V_U | x_I] \
              & = m Pr(V_U | V_I = V_H) + (1-m) Pr(V_U | V_I = V_L) \
              & = m [p_H V_H + (1-p_H) V_L] + (1-m) [(1-p_L) V_H + p_L V_L].
$ <eq-vhat-u>

Under this definition, when $U$ is certain about $I$'s type, the effective prize reduces to the conditional expectation under each type:

$
  hat(V)_U(1) = p_H V_H + (1-p_H) V_L,
  quad
  hat(V)_U(0) = (1-p_L) V_H + p_L V_L.
$

To see how a change in belief affects the effective prize, differentiating with respect to $m$ gives

$
  (d hat(V)_U(m)) / (d m)
  =
  (p_H + p_L - 1)(V_H - V_L).
$ <eq-ext-vhat-derivative>

The sensitivity of the effective prize to belief therefore depends on the sign of the correlation. At the independence point ($p_H = q$, $p_L = 1 - q$), the derivative is exactly zero, so belief updating has no informational value; once the two players' prizes are positively correlated ($p_H + p_L > 1$), however, a higher posterior belief raises $U$'s expectation of his own effective prize through the correlation structure.

Building on this effective prize, $U$'s best response in the more general environment is as follows.

#lemma(title: [$U$'s best response under partial correlation])[
  Given $I$'s effort $x_I > 0$ and $U$'s posterior belief $m in [0,1]$, the interior best response of $U$ is

  $
    x_U^*(x_I, m) = sqrt(x_I hat(V)_U(m)) - x_I.
  $ <eq-ext-br>

  If the information structure satisfies the positive-correlation condition, $U$'s effort is monotonically increasing in his assessment of $I$'s strength.
] <lem-ext-br>

#proof[
  Under the Tullock contest, $U$ maximizes his expected payoff,

  $
    max_x_U hat(pi)_U = hat(V)_U(m) dot x_U / (x_I + x_U) - x_U,
  $

  whose first-order condition is

  $
    (x_I hat(V)_U(m)) / (x_I + x_U)^2 = 1.
  $

  Solving for the positive root yields $x_U^*(x_I, m) = sqrt(x_I hat(V)_U(m)) - x_I$. The marginal effect of belief on behavior is

  $
    (d x_U^*)/(d m) & =
                      (partial x_U^*) / (partial hat(V)_U) dot (d hat(V)_U) / (d m) \
                    & =
                      (sqrt(x_I) / (2 sqrt(hat(V)_U(m)))) dot (p_H + p_L - 1)(V_H - V_L).
  $

  Under $p_H + p_L > 1$ and prize heterogeneity ($V_H > V_L$), this derivative is strictly positive #footnote("The intuition is that, when the prizes are positively correlated by type, the uninformed player's assessments of \"the opponent's strength\" and \"his own benefit\" move together. When $U$ observes $I$'s effort and revises upward the posterior probability that the opponent is high-type, the positive correlation implies that $U$'s own prize is also more likely to be high. The expectation of a higher prize partially offsets the deterrence from facing a stronger opponent and induces $U$ to commit more resources to the contest.").
]

== Separating equilibrium, incentive compatibility, and critical boundary <subsec-ext-boundary>

This subsection investigates the conditions under which the separating equilibrium continues to exist in the generalized information structure. Consider a candidate separating profile in which the high-type and low-type informed players choose distinct equilibrium efforts and induce the on-path beliefs

$
  m(x_H) = 1,
  quad
  m(x_L) = 0.
$

Under this profile, the on-path efforts and corresponding payoffs of the two types are

$
  x_H & = V_H^2 / (4 hat(V)_U(1)),
        quad
        pi_H & = V_H^2 / (4 hat(V)_U(1)), \
  x_L & = V_L^2 / (4 hat(V)_U(0)),
        quad
        pi_L & = V_L^2 / (4 hat(V)_U(0)).
$

Whether the separating equilibrium is sustained turns on whether the high-type has an incentive to "mimic the low type" in exchange for a reduced response from the opponent. If the high-type imitates the low-type, the deviation payoff is

$
  widetilde(pi)_H
  =
  V_L (2 V_H - V_L) / (4 hat(V)_U(0)).
$ <eq-ext-dev-h>

The high-type incentive-compatibility (IC) condition is

$
  V_H^2 / hat(V)_U(1)
  >=
  V_L (2 V_H - V_L) / hat(V)_U(0).
$ <eq-ext-ich>

Rearranging, the condition can be written as a ratio of effective prizes under the two posteriors:

$
  hat(V)_U(1) / hat(V)_U(0) <= R = V_H^2 / (V_L (2 V_H - V_L)).
$ <eq-ext-sep-condition>

Here $R > 1$ is a constant that measures the magnitude of type heterogeneity. For the low-type, mimicking the high-type yields the deviation payoff

$
  widetilde(pi)_L^d
  =
  V_H (2 V_L - V_H) / (4 hat(V)_U(1)).
$

The low-type IC condition is therefore

$
  V_L^2 / (4 hat(V)_U(0))
  >=
  V_H (2 V_L - V_H) / (4 hat(V)_U(1)),
$

equivalently,

$
  hat(V)_U(1) / hat(V)_U(0)
  >=
  V_H (2 V_L - V_H) / V_L^2.
$

In the positively correlated region of interest, $hat(V)_U(1) > hat(V)_U(0)$, so the left-hand side is strictly greater than $1$. On the other hand, letting $rho equiv V_H / V_L > 1$, the right-hand side equals $2 rho - rho^2 = 1 - (rho - 1)^2 < 1$. The low-type IC condition is therefore automatically satisfied; only the high-type IC condition is binding.

#proposition(title: [Existence condition for the separating equilibrium])[
  In the $I U$ subgame, the pure-strategy separating equilibrium exists if and only if the high-type incentive-compatibility condition holds. Equivalently, when the ratio of effective prizes under the two posteriors is below the critical threshold $R$, the separating equilibrium is sustained:
  $
    hat(V)_U(1) / hat(V)_U(0) <= R.
  $
  If this condition fails, the high-type's competitive gain from mimicking (a sharply reduced opponent effort) outweighs the marginal gain from honest play, and the separating equilibrium collapses.
] <prop-ext-separation>

#proof[
  Consider the candidate separating profile defined above. Under honest revelation, the high-type's equilibrium payoff is

  $
    pi_H = V_H^2 / (4 hat(V)_U(1)).
  $

  If the high-type instead mimics the low-type, $U$ responds along the low-type path, and the deviation payoff is

  $
    widetilde(pi)_H^d
    =
    V_L (2 V_H - V_L) / (4 hat(V)_U(0)).
  $

  The high-type IC condition is therefore

  $
    pi_H >= widetilde(pi)_H^d,
  $

  that is,

  $
    V_H^2 / (4 hat(V)_U(1))
    >=
    V_L (2 V_H - V_L) / (4 hat(V)_U(0)).
  $

  Multiplying both sides by $4 hat(V)_U(1) hat(V)_U(0)$ yields

  $
    hat(V)_U(1) / hat(V)_U(0)
    <=
    V_H^2 / (V_L (2 V_H - V_L))
    =
    R.
  $

  Turn now to the low-type. Honest play yields $pi_L = V_L^2 / (4 hat(V)_U(0))$; mimicking the high-type yields the deviation payoff

  $
    widetilde(pi)_L^d
    =
    V_H (2 V_L - V_H) / (4 hat(V)_U(1)).
  $

  The low-type IC condition is therefore equivalent to

  $
    hat(V)_U(1) / hat(V)_U(0)
    >=
    V_H (2 V_L - V_H) / V_L^2.
  $

  In the positively correlated region of interest, $hat(V)_U(1) / hat(V)_U(0) > 1$. On the other hand, letting $rho equiv V_H / V_L > 1$, the right-hand side equals

  $
    2 rho - rho^2 = 1 - (rho - 1)^2 < 1.
  $

  The low-type IC condition is therefore automatic and never binds. Consequently, the candidate separating profile constitutes a pure-strategy separating equilibrium if and only if the high-type IC condition holds; equivalently, if and only if

  $
    hat(V)_U(1) / hat(V)_U(0) <= R.
  $
]

#proposition(title: [Critical boundary])[
  Setting the high-type IC condition with equality yields the critical boundary

  $
    p_L^*(p_H)
    =
    (R V_H - V_L - p_H (V_H - V_L)) / (R (V_H - V_L)).
  $ <eq-ext-boundary>

  Points below this boundary satisfy the separating condition; points above it generate a profitable mimicry incentive for the high-type.
] <prop-ext-boundary>

#proof[
  Let $Delta V equiv V_H - V_L$. From
  $
    hat(V)_U(1) & = p_H V_H + (1-p_H) V_L \
                & = V_L + p_H Delta V,
  $
  and
  $
    hat(V)_U(0) & = (1-p_L) V_H + p_L V_L \
                & = V_H - p_L Delta V,
  $
  setting the high-type IC condition with equality gives
  $
    V_L + p_H Delta V = R (V_H - p_L Delta V).
  $
  Solving for $p_L$ delivers the critical boundary stated above.
]

As @fig-ch6-phpl-regions shows, the independence point $(q, 1-q)$ and the perfect-correlation point $(1, 1)$ lie on opposite sides of the boundary, illustrating how the correlation structure fundamentally alters the game:

1. At the independence point $(p_H, p_L) = (q, 1-q)$,
  $
    hat(V)_U(1) = hat(V)_U(0) = q V_H + (1-q) V_L,
  $
  so the ratio is $1 < R$; this point lies in Region I, and the separating equilibrium holds strictly.
2. At the perfect-correlation point $(1, 1)$,
  $
    hat(V)_U(1) = V_H,
    quad
    hat(V)_U(0) = V_L,
  $
  so the ratio is $V_H / V_L > R$; this point lies in Region II, and separation fails.
3. Under partial correlation, the ratio lies between $1$ and $V_H / V_L$, and whether $(p_H, p_L)$ falls in Region I or II is determined by the position of the critical boundary $p_L^*(p_H)$. The points $A$, $B$, $C$ in @fig-ch6-phpl-regions correspond to three representative independence points $(q, 1 - q)$ at $q = 0.3, 0.5, 0.7$; all three lie inside Region I, showing that whenever statistical independence is preserved, the high-type IC condition holds strictly regardless of the prior.

#figure(
  image("../../../figures/fig6_qs_regions.png", width: 100%),
  caption: [Two regions on the $(p_H, p_L)$ plane separated by the critical boundary.],
  supplement: [Figure],
) <fig-ch6-phpl-regions>

== Comparative statics and the continuous spectrum <subsec-ext-summary>

Define the correlation ratio function

$
  rho(p_H, p_L) & equiv
                  hat(V)_U(1) / hat(V)_U(0) \
                & =
                  (p_H V_H + (1-p_H) V_L) / ((1-p_L) V_H + p_L V_L).
$

Comparative statics with respect to the conditional-probability parameters give

$
  (d rho)/(d p_H) = (V_H - V_L) / hat(V)_U(0) > 0,
  quad
  (d rho)/(d p_L) = hat(V)_U(1) (V_H - V_L) / hat(V)_U(0)^2 > 0.
$

Both raising $p_H$ and raising $p_L$ shrink the separating region; their economic interpretations differ, however. An increase in $p_H$ raises the strength of the opponent that the high-type faces under honest revelation (a negative push); an increase in $p_L$ reduces the opponent's strength under mimicry of the low-type (a positive pull). Since the gradient ratio satisfies

$
  ((d rho)/(d p_L)) / ((d rho)/(d p_H))
  =
  rho(p_H, p_L)
  >= 1,
$

within the positively correlated region a marginal change in $p_L$ destroys the separating equilibrium more powerfully than a marginal change in $p_H$.

Finally, imposing the marginal-consistency restriction, all economically feasible parameter combinations form a path connecting "independence" and "perfect correlation." Moving along this path traces a continuous spectrum that smoothly transitions from our baseline model to the setting of #c("fu2006"). This not only demonstrates that our framework offers broader explanatory range, but also reveals that the pooling equilibrium emphasized in the existing literature is, in our framework, a degenerate consequence of separating-equilibrium collapse at the extreme.

== Pooling equilibrium and mimicry incentives <subsec-ext-pooling>

As Section 6.3 makes clear, once the correlation parameters $(p_H, p_L)$ cross the critical boundary $p_L^*(p_H)$ into Region II, the high-type's deviation payoff from mimicry exceeds his honest-revelation equilibrium payoff, and the separating equilibrium collapses. The failure of the separating structure does not, however, mean that the game is left without an equilibrium. This subsection further argues that, when the separating equilibrium collapses, a pure-strategy pooling equilibrium — in which the high-type actively mimics the low-type — takes over. By establishing the existence of this pooling equilibrium, we both complete the equilibrium picture in Region II and produce a continuous transition from the necessary separation in the baseline to the perfectly correlated setting of #c("fu2006").

Consider a candidate pooling profile in which $I$ chooses the same equilibrium effort $x_P > 0$ regardless of his type. Because the two types take identical actions on the equilibrium path, $U$ cannot distinguish $I$'s true type from observing $x_P$; by Bayes' rule, $U$'s posterior remains at the prior,

$
  m(x_P) = q.
$

By the effective-prize and best-response formulas in Section 6.2, $U$'s effective prize is $hat(V)_U(q)$ and his best response is

$
  x_U^*(x_P, q) = sqrt(x_P hat(V)_U(q)) - x_P.
$

Type $v in {V_L, V_H}$'s on-path expected payoff is therefore

$
  pi_P (v) = v sqrt(x_P / hat(V)_U(q)) - x_P.
$ <eq-ext-pool-payoff>

Sustaining a pooling equilibrium relies on imposing a strong enough penalty on deviations. To this end, we adopt the most pessimistic off-path belief: if $U$ observes any effort $x != x_P$, $U$ assigns full probability to the high-type, that is,

$
  m(x) = 1, quad forall x != x_P.
$

This belief specification can be viewed as a "strongest-defense" assumption: any off-path effort immediately leads $U$ to revise his assessment of the opponent upward to the high-type and to elicit the most aggressive competitive response. Under this belief, $U$'s effective prize rises to its upper bound $hat(V)_U(1)$ and the corresponding best response is

$
  x_U^*(x, 1) = sqrt(x hat(V)_U(1)) - x.
$

Given this strong counter-attack, if a type-$v$ informed player considers deviating to some $x$, his maximization problem is

$
  max_x quad v sqrt(x / hat(V)_U(1)) - x.
$

The first-order condition gives the optimal deviation effort

$
  x_d (v) = v^2 / (4 hat(V)_U(1)),
$

and the maximal deviation payoff

$
  widetilde(pi)_d (v) = v^2 / (4 hat(V)_U(1)).
$ <eq-ext-pool-dev>

The pooling equilibrium is sustained as long as both types' on-path payoffs are at least as large as their maximal deviation payoffs. From the on-path expected payoff and the maximal deviation payoff above, the IC conditions for the two types can be written down separately. The high-type IC condition is

$
  V_H sqrt(x_P / hat(V)_U(q)) - x_P
  >=
  V_H^2 / (4 hat(V)_U(1));
$ <eq-ext-pool-ich>

the low-type IC condition is

$
  V_L sqrt(x_P / hat(V)_U(q)) - x_P
  >=
  V_L^2 / (4 hat(V)_U(1)).
$ <eq-ext-pool-icl>

#proposition(title: [Existence of the pooling equilibrium])[
  Under a positively correlated information structure, if the two types' IC conditions admit a common real solution in $x_P > 0$, the $I U$ subgame admits a pure-strategy pooling equilibrium characterized by effort $x_P$. Three components jointly sustain this equilibrium: the on-path strategy $x_I = x_P$; $U$'s best response $x_U^*(x_P, q)$; and the most pessimistic off-equilibrium-path belief $m(x != x_P) = 1$.
] <prop-ext-pooling>

#proof[
  Let $alpha equiv 1 - hat(V)_U(q) / hat(V)_U(1)$. Under positive correlation, the derivative computation in Section 6.2 implies that $hat(V)_U(1) > hat(V)_U(q)$ holds throughout, so $alpha in (0, 1)$. The IC condition for any type $v in {V_L, V_H}$ can be rewritten as a quadratic inequality in $sqrt(x_P)$:

  $
    (sqrt(x_P))^2 - v / sqrt(hat(V)_U(q)) sqrt(x_P) + v^2 / (4 hat(V)_U(1)) <= 0.
  $

  The discriminant is $v^2 alpha \/ hat(V)_U(q) > 0$, ensuring a real solution. The solution interval to type $v$'s IC condition $I C_v$ can therefore be written as

  $
    sqrt(x_P) in [y_v^-, y_v^+],
    quad
    y_v^(plus.minus) = v / (2 sqrt(hat(V)_U(q))) (1 plus.minus sqrt(alpha)).
  $

  Both endpoints scale linearly in the true type $v$. Since $V_H > V_L$, the intersection of the two types' solution intervals is bounded below by the high-type's lower endpoint and above by the low-type's upper endpoint:

  $
    sqrt(x_P) in [y_(V_H)^-, y_(V_L)^+]
    =
    [V_H (1 - sqrt(alpha)) / (2 sqrt(hat(V)_U(q))), V_L (1 + sqrt(alpha)) / (2 sqrt(hat(V)_U(q)))].
  $

  For this common solution interval to be non-empty,

  $
    V_H (1 - sqrt(alpha)) <= V_L (1 + sqrt(alpha)),
  $

  which rearranges to

  $
    sqrt(alpha) >= (V_H - V_L) / (V_H + V_L).
  $ <eq-ext-pool-alpha>

  Whenever this non-emptiness condition holds, there exists $x_P > 0$ in the parameter space at which the two types' IC conditions are simultaneously satisfied. Combined with $U$'s best response and the most pessimistic off-path belief, the equilibrium effort $x_P$ delivers a self-enforcing pure-strategy pooling equilibrium. This completes the proof.
]

The non-emptiness condition $sqrt(alpha) >= (V_H - V_L) / (V_H + V_L)$ provides a clean view of the comparative statics: it shows how the existence of the pooling equilibrium varies continuously with the strength of correlation. At the independence point $(q, 1-q)$, the derivative computation in Section 6.2 yields $hat(V)_U(1) = hat(V)_U(q)$, so $alpha = 0$, the non-emptiness condition fails, and the pooling equilibrium does not exist; this matches the conclusion in Section 6.3 that the independence point lies in Region I and the separating equilibrium necessarily holds.

As correlation strengthens, however, and $(p_H, p_L)$ crosses the critical boundary toward the perfect-correlation point $(1, 1)$, $hat(V)_U(1)$ rises substantially toward $V_H$, while $hat(V)_U(q)$ — weighted by the prior $q in (0, 1)$ — only reaches $q V_H + (1-q) V_L$. The widening gap drives $alpha$ upward monotonically from zero. In other words, the stronger the positive correlation, the more aggressive the uninformed player's potential counter-attack under the most pessimistic off-path belief. This deterrent effect sharply reduces the maximal deviation payoff $widetilde(pi)_d (v) = v^2 / (4 hat(V)_U(1))$, slackens both types' IC conditions, and eventually pushes the system past the non-empty-intersection threshold.

To visualize this comparative-statics conclusion on the $(p_H, p_L)$ plane, @fig-ch6-pooling-regions plots the separating critical boundary $p_L^*(p_H)$ from Section 6.3 together with the pooling non-degeneracy boundary $sqrt(alpha) = (V_H - V_L) \/ (V_H + V_L)$ derived here, with baseline values $V_H = 2$, $V_L = 1$, $q = 0.5$. Both boundaries are linear, and the pooling boundary always lies below the separating boundary. The plane decomposes into three regions with distinct economic content:

+ Pure separating region (Region I): the high-type IC condition holds strictly and pooling has no solution; the unique pure-strategy equilibrium is separating.

+ Coexistence region (Region C): both separating and pooling equilibria hold; multiple equilibria are present.

+ Pure pooling region (Region II): the separating structure collapses and the pooling equilibrium takes over.

Notably, the independence point $(q, 1-q)$ always lies in the interior of Region I, consistent with the conclusion in Section 6.3 that "statistical independence implies separation must hold." As the information structure moves along the marginal-consistency path toward $(1, 1)$, the parameter combination passes through Region C and arrives at Region II — a visual illustration of the central thesis that "when separation collapses, pooling takes over."

#figure(
  image("../../../figures/fig6_pooling_regions.pdf", width: 100%),
  caption: [Separating and pooling boundaries on the $(p_H, p_L)$ plane.],
  supplement: [Figure],
) <fig-ch6-pooling-regions>

In economic terms, the proposition above clarifies the mechanism through which the pooling equilibrium replaces the separating equilibrium: when the two players' information is highly correlated, the competitive cost of full revelation becomes too large. Anticipating $U$'s aggressive counter-attack, the high-type gives up the separating strategy and chooses the same equilibrium effort $x_P$ as the low-type to conceal his strength. The low-type, by contrast, has a small true value $V_L$, so deviating to trigger the pessimistic belief delivers an extremely thin marginal gain; the low-type IC condition is satisfied automatically and there is no incentive to deviate. Defense and concealment, respectively, lead the two types to converge on a single effort level $x_P$, and the pooling equilibrium is established.

To sum up, the extended model in this section traces out the continuous influence of information correlation on the endogenous-timing equilibrium. At the independence endpoint $(q, 1-q)$, the game admits a unique pure-strategy separating equilibrium; as positive correlation strengthens and crosses the critical boundary $p_L^*(p_H)$, the separating structure collapses and is replaced by the pooling equilibrium; and at the perfect-correlation endpoint $(1, 1)$, the model coincides exactly with the original setting of #c("fu2006"). By constructing this smooth "separating-pooling" theoretical spectrum, the section not only unifies the timing dynamics across heterogeneous settings but also shows that the pooling equilibrium emphasized in the existing literature is in fact a degenerate special case of our generalized information structure at extreme parameters.
