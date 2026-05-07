#import "../thesis.typ": c, ca, cp, cy, widetilde

We consider a two-player Tullock contest between two risk-neutral players, the informed player ($I$) and the uninformed player ($U$). The informed player is the one who privately observes the realization of his own prize value before the effort stage; the uninformed player knows only the prior distribution $G$ of that value but does not directly observe its realization. The two players compete over whether a policy is implemented; the winner receives his own prize and the loser receives zero. If $I$ wins, his prize is $V_I > 0$; if $U$ wins, his prize is $V_U equiv V > 0$. The contest success function follows the proportional-effort form of #c("tullock1980"), and the endogenous timing structure follows the action-commitment framework of #c("hamilton1990") and #c("fu2006"), in which the two players first decide when to move and then choose their efforts.

The model contains two layers of asymmetry. First, information is asymmetric across players: $U$ knows the prior distribution $G$ of $V_I$ but cannot observe its realization before the time of action; $I$ has not yet observed his own type when choosing the timing at stage 0, and observes $V_I$ privately only after the timing decision is made. Second, the prizes themselves are asymmetric: $I$ receives $V_I$ upon winning and $U$ receives $V$, with no requirement that the two be equal. Consequently, the stage-0 timing decision is based on ex ante expected payoffs; once the effort subgame begins, $I$'s strategy can be conditioned on the realized $V_I$, whereas $U$ can only react to observable actions.

== Information structure <subsec-model-info>

At stage 0, $I$ and $U$ simultaneously choose when to act, with $I$ not yet having observed his own type. Once the timing is fixed, nature draws $V_I$ according to the prior distribution $G$; $I$ privately observes the realization, while $U$ does not directly observe it. The two players then enter the effort subgame at the times committed to in stage 0.

When the analysis specializes to two-point types, we uniformly write $I$'s prize as $V_I in {V_L, V_H}$ with prior probabilities

$
  Pr(V_I = V_H) = q,
  quad
  Pr(V_I = V_L) = 1-q,
  quad
  q in (0,1),
$

where $V_H > V_L > 0$. The case $q = 1/2$ recovers the symmetric two-point distribution as a special case, but the comparative statics in the subsequent sections and the extension in Section 6 are conducted with a general $q$.

== Timeline of the contest <subsec-model-timeline>

Following #c("fu2006"), the stage-0 choice of action time induces three regimes that govern the subsequent contest. If $I$ and $U$ choose the same period, both players choose efforts simultaneously in that period; we call this the $S S$ regime. If $U$ chooses period 1 and $I$ chooses period 2, $U$ commits to his effort first and $I$ chooses after observing $U$'s effort; we call this the $U I$ regime. If $I$ chooses period 1 and $U$ chooses period 2, $I$ commits first and $U$ chooses after observing $I$'s effort; we call this the $I U$ regime.

At stage 0, $I$ and $U$ simultaneously decide whether to move in period 1 or period 2, and the choice has commitment value. After the timing is determined, nature draws $V_I$ from $G$; $I$ privately observes the realization as soon as it is drawn, while $U$ does not directly observe it. The two players then enter the effort subgame at the times chosen at stage 0. If either player has already moved in period 1, the effort is publicly observable in period 2, so the period-2 player can condition his effort on the first mover's effort.

In the $S S$ and $U I$ regimes, $U$ does not receive any signal from $I$'s effort: the former has simultaneous moves, while in the latter $U$ moves first. In the $I U$ regime, $I$'s effort is observed by $U$ and could in principle induce a posterior belief about $V_I$. The key feature of our model, however, is that $U$'s prize is fixed at $V$, so $U$'s best response depends only on the observed effort and his own prize, not on the posterior belief about $V_I$. Relative to #c("fu2006"), we therefore retain the same timing regimes but close the "signal-belief-response" channel.

== Contest payoffs and best responses <subsec-model-payoffs>

Given efforts $x_I >= 0$ and $x_U >= 0$, the Tullock success function is

#set math.equation(numbering: "(1)")
$
  p_I(x_I, x_U) = x_I / (x_I + x_U), quad
  p_U(x_I, x_U) = x_U / (x_I + x_U).
$ <eq-success-functions>
#set math.equation(numbering: none)

Net of effort costs, the payoff of $I$ with type $v$ is

$
  pi_I(x_I, x_U; v)
  = x_I / (x_I + x_U) v - x_I,
$ <eq-payoff-i>

and the payoff of $U$ is

$
  pi_U(x_I, x_U; V)
  = x_U / (x_I + x_U) V - x_U.
$ <eq-payoff-u>

When the opponent's effort is positive and an interior solution exists, the first-order conditions deliver the best responses of the two players:

#set math.equation(numbering: "(1)")
$
  x_I^*(x_U; v) = sqrt(v x_U) - x_U,
$ <eq-br-i>

$
  x_U^*(x_I; V) = sqrt(V x_I) - x_I.
$ <eq-br-u>
#set math.equation(numbering: none)

Imposing non-negativity, these are the interior best responses; in boundary cases one takes the maximum of zero and the expressions above. Crucially, $U$'s best response depends only on $x_I$ and $V$ and contains no posterior belief about $V_I$. This is the principal departure from #c("fu2006") and is the core reason why the $I U$ subgame admits a unique separating equilibrium below.

== Stage-0 regime payoffs <subsec-model-stage0>

Let $pi_I^J(v)$ denote the equilibrium payoff of type $V_I = v$ for $I$ in the effort subgame under regime $J in {S S, U I, I U}$. Because $V_I$ has not yet been realized at stage 0, $I$ compares the ex ante expected payoffs across regimes:

#set math.equation(numbering: "(1)")
$
  widetilde(pi)_I^J equiv EE[pi_I^J(V_I)].
$ <eq-ex-ante-i>

The uninformed player has no private type, but his equilibrium payoff may vary with $V_I$ through $I$'s equilibrium effort. We therefore let

$
  pi_U^J equiv EE[pi_U^J(V_I)]
$ <eq-ex-ante-u>
#set math.equation(numbering: none)

denote $U$'s expected payoff under regime $J$. The stage-0 timing choice can be written as the following normal-form game, with $I$'s strategies in rows and $U$'s in columns:

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
    [Period 1], [Period 2],
    [Period 1], $(widetilde(pi)_I^(S S), pi_U^(S S))$, $(widetilde(pi)_I^(I U), pi_U^(I U))$,
    [Period 2], $(widetilde(pi)_I^(U I), pi_U^(U I))$, $(widetilde(pi)_I^(S S), pi_U^(S S))$,
  ),
  caption: [Stage-0 regime payoffs from the timing choice.],
  supplement: [Table],
) <tbl-stage0-payoffs>

The analysis below first solves the equilibrium payoffs of the $S S$, $U I$, and $I U$ effort subgames and then substitutes them back into the matrix above to compare stage-0 timing incentives. Because $I$ does not yet know his own type at stage 0, any type-level gain or loss from moving early or late is at most an ex post decomposition; the timing choice is genuinely governed by the two ex ante expected payoff definitions above.
