#import "../thesis.typ": proof, widetilde

== $S S$ subgame <proof-ss>

#proof[
  In $S S$, the two players choose effort simultaneously. Given $U$'s effort $x_U$, the best response of type $V_I = v$ for $I$ is

  $
    x_I(v) = sqrt(v x_U) - x_U.
  $

  When choosing $x_U$, $U$ anticipates this type-contingent response by $I$. Therefore, the first-order condition for $U$ is

  $
    V EE[
      x_I(V_I) / (x_I(V_I) + x_U)^2
    ] = 1.
  $

  Substituting $x_I(v) + x_U = sqrt(v x_U)$ gives

  $
    V EE[
      (sqrt(V_I x_U) - x_U) / (V_I x_U)
    ]
    = V (kappa / sqrt(x_U) - lambda)
    = 1.
  $

  Solving yields

  $
    sqrt(x_U^(S S)) = (V kappa) / (1 + V lambda),
    quad
    x_U^(S S) = (V^2 kappa^2) / (1 + V lambda)^2.
  $

  Substituting $x_U^(S S)$ back into $I$'s best response gives

  $
    x_I^(S S)(v)
    = (V kappa sqrt(v)) / (1 + V lambda)
    - (V^2 kappa^2) / (1 + V lambda)^2.
  $

  Since $x_I^(S S)(v) + x_U^(S S) = (V kappa sqrt(v)) / (1 + V lambda)$, $I$'s equilibrium payoff is

  $
    pi_I^(S S)(v)
    =
    (1 - (V kappa) / ((1 + V lambda) sqrt(v))) v
    - x_I^(S S)(v)
    =
    (sqrt(v) - (V kappa) / (1 + V lambda))^2.
  $

  $U$'s equilibrium payoff is

  $
    pi_U^(S S)(v)
    =
    (V kappa) / ((1 + V lambda) sqrt(v)) V
    - (V^2 kappa^2) / (1 + V lambda)^2
    =
    (V^2 kappa) / ((1 + V lambda) sqrt(v))
    - (V^2 kappa^2) / (1 + V lambda)^2.
  $

  Taking expectations over $V_I$, we obtain

  $
    widetilde(pi)_I^(S S)
    =
    mu - (2 V kappa nu) / (1 + V lambda)
    + (V^2 kappa^2) / (1 + V lambda)^2,
  $

  $
    pi_U^(S S)
    =
    (V^2 kappa) / (1 + V lambda) kappa
    - (V^2 kappa^2) / (1 + V lambda)^2
    =
    (V^3 kappa^2 lambda) / (1 + V lambda)^2.
  $
]

== Derivation of the critical boundary <proof-ext-boundary>

#proof[
  Start from the high-type incentive-compatibility condition in Section 6.3:

  $
    V_H^2 / hat(V)_U(1)
    >=
    V_L (2 V_H - V_L) / hat(V)_U(0).
  $

  Setting equality, and letting

  $
    R & equiv
        V_H^2 / (V_L (2 V_H - V_L)),
  $

  the critical boundary satisfies

  $
    hat(V)_U(1) = R hat(V)_U(0).
  $

  Substituting

  $
    hat(V)_U(1) & = p_H V_H + (1-p_H) V_L,
                  quad
                  hat(V)_U(0) & = (1-p_L) V_H + p_L V_L,
  $

  yields

  $
    p_H V_H + (1-p_H) V_L
    =
    R[(1-p_L) V_H + p_L V_L].
  $

  Solving for $p_L$,

  $
    p_L^*(p_H)
    =
    (
    R V_H - V_L - p_H (V_H - V_L)
    ) / (R (V_H - V_L)),
  $

  which is the critical-boundary expression in the main text. We check the two benchmark points.

  1. At the independence point $(p_H, p_L) = (q, 1-q)$,
  $
    hat(V)_U(1) = hat(V)_U(0) = q V_H + (1-q) V_L.
  $
  The main-text condition becomes $1 <= R$. Since $V_H > V_L > 0$ implies $R > 1$, the separating condition holds strictly.

  2. At the perfect-correlation point $(1, 1)$,
  $
    hat(V)_U(1) = V_H,
    quad
    hat(V)_U(0) = V_L,
  $
  so the ratio is $V_H / V_L$. The inequality
  $
    V_H / V_L > V_H^2 / (V_L (2 V_H - V_L))
  $
  is equivalent to $V_H > V_L$, so this point lies above the boundary and the separating equilibrium fails.
]

== $U I$ subgame <proof-ui>

#proof[
  In $U I$, $U$ commits effort first, and $I$ responds by type after observing $x_U$. Given $x_U$ and type $v$, $I$'s best response is

  $
    x_I(v) = sqrt(v x_U) - x_U.
  $

  Therefore, $U$ solves in period 1

  $
    max_(x_U >= 0)
    EE[V sqrt(x_U / V_I) - x_U]
    =
    max_(x_U >= 0)
    (V sqrt(x_U) kappa - x_U).
  $

  The first-order condition is

  $
    (V kappa) / (2 sqrt(x_U)) - 1 = 0,
  $

  so the unique interior solution is

  $
    x_U^(U I) = (V^2 kappa^2) / 4.
  $

  Substituting back into $I$'s best response gives

  $
    x_I^(U I)(v)
    = (V kappa sqrt(v)) / 2 - (V^2 kappa^2) / 4.
  $

  Since $x_I^(U I)(v) + x_U^(U I) = (V kappa sqrt(v)) / 2$, type-by-type payoffs are

  $
    pi_I^(U I)(v)
    =
    (sqrt(v) - (V kappa) / 2)^2,
  $

  $
    pi_U^(U I)(v)
    =
    (V^2 kappa) / (2 sqrt(v)) - (V^2 kappa^2) / 4.
  $

  Taking ex ante expectations,

  $
    widetilde(pi)_I^(U I)
    =
    mu - V kappa nu + (V^2 kappa^2) / 4,
  $

  $
    pi_U^(U I)
    =
    (V^2 kappa) / 2 kappa - (V^2 kappa^2) / 4
    =
    (V^2 kappa^2) / 4.
  $
]

== $I U$ subgame <proof-iu>

#proof[
  In $I U$, $I$ chooses effort first and $U$ responds after observing it. Given $I$'s effort $x_I$, $U$'s best response is

  $
    x_U^*(x_I; V) = sqrt(V x_I) - x_I.
  $

  Anticipating this response, type $v$ of $I$ chooses $x_I$ to maximize

  $
    W(x_I; v)
    equiv
    x_I / (x_I + x_U^*(x_I; V)) v - x_I
    =
    v / sqrt(V) sqrt(x_I) - x_I.
  $

  This objective is strictly concave in $x_I$. The first-order condition is

  $
    v / (2 sqrt(V x_I)) - 1 = 0,
  $

  hence

  $
    x_I^(I U)(v) = v^2 / (4 V).
  $

  Substituting this into $U$'s best response gives

  $
    x_U^(I U)(v)
    =
    sqrt(V v^2 / (4 V)) - v^2 / (4 V)
    =
    v (2 V - v) / (4 V).
  $

  Equilibrium payoffs are

  $
    pi_I^(I U)(v) = v^2 / (4 V),
    quad
    pi_U^(I U)(v) = (2 V - v)^2 / (4 V).
  $

  Therefore, ex ante payoffs are

  $
    widetilde(pi)_I^(I U)
    =
    EE[V_I^2] / (4 V),
  $

  $
    pi_U^(I U)
    =
    EE[(2 V - V_I)^2] / (4 V)
    =
    (4 V^2 - 4 V mu + EE[V_I^2]) / (4 V).
  $

  Next, check incentive compatibility. Fix true type $v$, and consider any alternative type $s != v$. If type $v$ mimics $s$'s equilibrium action, effort is $s^2 / (4 V)$. After $U$ responds according to the best response, the deviation payoff is

  $
    widetilde(U)(v, s)
    =
    v / sqrt(V) sqrt(s^2 / (4 V)) - s^2 / (4 V)
    =
    (2 v s - s^2) / (4 V).
  $

  The truthful-action payoff is $v^2 / (4 V)$. Their difference is

  $
    v^2 / (4 V) - widetilde(U)(v, s)
    =
    (v - s)^2 / (4 V) > 0
    quad (s != v).
  $

  Hence every type strictly prefers its own separating action. Pooling and semi-separating equilibria cannot be sustained, and the perfect Bayesian equilibrium of the $I U$ subgame is the unique separating equilibrium.
]
