#import "../thesis.typ": c, ca, cp, cy, proof, widetilde

This section solves the three effort subgames that follow stage 0: $S S$, $U I$, and $I U$. All three build on the best responses derived in Section 3. To simplify notation, we let

#set math.equation(numbering: "(1)")
$
  mu equiv EE[V_I], quad
  kappa equiv EE[1 / sqrt(V_I)], quad
  nu equiv EE[sqrt(V_I)], quad
  lambda equiv EE[1 / V_I].
$ <eq-equilibria-moments>
#set math.equation(numbering: none)

We assume that these expectations exist and are finite, and we focus on cases in which each subgame admits an interior best response. The point of interest is not the type set itself but the way different timing regimes alter the order of commitment, observation, and response.

== $S S$: Simultaneous moves <subsec-ss>

In the $S S$ regime, $I$ and $U$ choose efforts simultaneously. $I$'s effort varies with his type, while $U$ chooses a single effort without observing $V_I$. The equilibrium efforts are

#set math.equation(numbering: "(1)")
$
  x_U^(S S) = (V^2 kappa^2) / (1 + V lambda)^2,
  quad
  x_I^(S S)(v)
  = (V kappa sqrt(v)) / (1 + V lambda)
  - (V^2 kappa^2) / (1 + V lambda)^2.
$ <eq-ss-efforts>
#set math.equation(numbering: none)

Conditional on type $V_I = v$, the equilibrium payoffs are

$
  pi_I^(S S)(v)
  = (sqrt(v) - (V kappa) / (1 + V lambda))^2,
$ <eq-ss-payoff-i>

$
  pi_U^(S S)(v)
  = (V^2 kappa) / ((1 + V lambda) sqrt(v))
  - (V^2 kappa^2) / (1 + V lambda)^2.
$ <eq-ss-payoff-u>

The ex ante payoffs of the two players in the $S S$ regime are therefore

$
  widetilde(pi)_I^(S S)
  = mu - (2 V kappa nu) / (1 + V lambda)
  + (V^2 kappa^2) / (1 + V lambda)^2,
$ <eq-ss-ex-ante-i>

$
  pi_U^(S S)
  = (V^3 kappa^2 lambda) / (1 + V lambda)^2.
$ <eq-ss-ex-ante-u>

This result shows that simultaneity does not imply symmetric effort. $I$ adjusts effort to his type, while $U$'s effort reflects the ex ante informational constraint that he faces.

#proof[See #ref(<proof-ss>).]

== $U I$: Uninformed leader <subsec-ui>

In the $U I$ regime, $U$ commits first and $I$ chooses effort after observing $x_U$ and learning his own type. The equilibrium efforts are

#set math.equation(numbering: "(1)")
$
  x_U^(U I) = (V^2 kappa^2) / 4,
  quad
  x_I^(U I)(v)
  = (V kappa sqrt(v)) / 2 - (V^2 kappa^2) / 4.
$ <eq-ui-efforts>
#set math.equation(numbering: none)

The type-by-type equilibrium payoffs are

$
  pi_I^(U I)(v)
  = (sqrt(v) - (V kappa) / 2)^2,
$ <eq-ui-payoff-i>

$
  pi_U^(U I)(v)
  = (V^2 kappa) / (2 sqrt(v)) - (V^2 kappa^2) / 4.
$ <eq-ui-payoff-u>

Taking ex ante expectations,

$
  widetilde(pi)_I^(U I)
  = mu - V kappa nu + (V^2 kappa^2) / 4,
$ <eq-ui-ex-ante-i>

$
  pi_U^(U I)
  = (V^2 kappa^2) / 4.
$ <eq-ui-ex-ante-u>

The difference between $U I$ and $S S$ lies in the order of commitment. When $U$ moves first he can set his effort in advance, while $I$ retains the flexibility to respond type by type; consequently, $U$'s equilibrium effort is no longer pinned down by the simultaneous-move first-order condition but by his Stackelberg commitment problem.

#proof[See #ref(<proof-ui>).]

== $I U$: Informed leader <subsec-iu>

In the $I U$ regime, $I$ moves first and $U$ responds after observing $I$'s effort. $I$'s effort would, in principle, induce in $U$ a posterior belief about $V_I$. As shown in Section 3, however, $U$'s best response depends only on the observed effort and on his own prize $V$, so the posterior belief does not enter $U$'s reaction function.

In the unique separating equilibrium, the effort of type $v$ and $U$'s subsequent response are

#set math.equation(numbering: "(1)")
$
  x_I^(I U)(v) = v^2 / (4 V),
  quad
  x_U^(I U)(v) = v (2 V - v) / (4 V).
$ <eq-iu-efforts>
#set math.equation(numbering: none)

The corresponding type-by-type payoffs are

$
  pi_I^(I U)(v) = v^2 / (4 V),
$ <eq-iu-payoff-i>

$
  pi_U^(I U)(v) = (2 V - v)^2 / (4 V).
$ <eq-iu-payoff-u>

The ex ante payoffs in the $I U$ regime are therefore

$
  widetilde(pi)_I^(I U)
  = EE[V_I^2] / (4 V),
$ <eq-iu-ex-ante-i>

$
  pi_U^(I U)
  = (4 V^2 - 4 V mu + EE[V_I^2]) / (4 V).
$ <eq-iu-ex-ante-u>

The defining feature of the $I U$ subgame is separation, not pooling. Every type strictly prefers his own separating effort and never mimics another type; pooling and semi-separating equilibria are therefore ruled out. Relative to #c("fu2006"), the $I U$ subgame here has no belief-driven equilibrium-selection problem: a signal exists at the observational level but does not change $U$'s best response.

#proof[See #ref(<proof-iu>).]

== Summary <subsec-equilibria-summary>

The three subgames assemble into a single set of regime payoffs. The $S S$ regime preserves simultaneous action, but $U$'s effort must absorb the ex ante uncertainty about $I$'s type. The $U I$ regime gives $U$ the role of first-move commitment while $I$ retains a type-conditioned response. The $I U$ regime forces $I$ to reveal effort first, but the signal does not enter $U$'s best response. The endogenous stage-0 timing choice is precisely the normal-form game formed by comparing these three sets of ex ante payoffs.
