#import "../thesis.typ": proof, widetilde

== $S S$ 子賽局 <proof-ss>

#proof[
在 $S S$ 中，兩位參與者同時選擇投入。給定 $U$ 的投入 $x_U$，型別為 $V_I = v$ 的 $I$ 的最佳反應為

$
  x_I(v) = sqrt(v x_U) - x_U.
$

$U$ 在選擇 $x_U$ 時，預期 $I$ 會依型別採取上述反應。因此，$U$ 的一階條件為

$
  V EE[
    x_I(V_I) / (x_I(V_I) + x_U)^2
  ] = 1.
$

代入 $x_I(v) + x_U = sqrt(v x_U)$，可得

$
  V EE[
    (sqrt(V_I x_U) - x_U) / (V_I x_U)
  ]
  = V (kappa / sqrt(x_U) - lambda)
  = 1.
$

解此式得

$
  sqrt(x_U^(S S)) = (V kappa) / (1 + V lambda),
  quad
  x_U^(S S) = (V^2 kappa^2) / (1 + V lambda)^2.
$

再將 $x_U^(S S)$ 代回 $I$ 的最佳反應，得到

$
  x_I^(S S)(v)
  = (V kappa sqrt(v)) / (1 + V lambda)
    - (V^2 kappa^2) / (1 + V lambda)^2.
$

由於 $x_I^(S S)(v) + x_U^(S S) = (V kappa sqrt(v)) / (1 + V lambda)$，$I$ 的均衡報酬為

$
  pi_I^(S S)(v)
  =
  (1 - (V kappa) / ((1 + V lambda) sqrt(v))) v
  - x_I^(S S)(v)
  =
  (sqrt(v) - (V kappa) / (1 + V lambda))^2.
$

$U$ 的均衡報酬則為

$
  pi_U^(S S)(v)
  =
  (V kappa) / ((1 + V lambda) sqrt(v)) V
  - (V^2 kappa^2) / (1 + V lambda)^2
  =
  (V^2 kappa) / ((1 + V lambda) sqrt(v))
  - (V^2 kappa^2) / (1 + V lambda)^2.
$

最後對 $V_I$ 取期望，可得

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

== $U I$ 子賽局 <proof-ui>

#proof[
在 $U I$ 中，$U$ 先承諾投入，$I$ 觀察 $x_U$ 後依型別回應。給定 $x_U$ 與型別 $v$，$I$ 的最佳反應為

$
  x_I(v) = sqrt(v x_U) - x_U.
$

因此，$U$ 在第一期的問題為

$
  max_(x_U >= 0)
  EE[V sqrt(x_U / V_I) - x_U]
  =
  max_(x_U >= 0)
  (V sqrt(x_U) kappa - x_U).
$

一階條件為

$
  (V kappa) / (2 sqrt(x_U)) - 1 = 0,
$

故唯一內點解為

$
  x_U^(U I) = (V^2 kappa^2) / 4.
$

代回 $I$ 的最佳反應，得到

$
  x_I^(U I)(v)
  = (V kappa sqrt(v)) / 2 - (V^2 kappa^2) / 4.
$

由於 $x_I^(U I)(v) + x_U^(U I) = (V kappa sqrt(v)) / 2$，逐型別報酬為

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

取事前期望後，

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

== $I U$ 子賽局 <proof-iu>

#proof[
在 $I U$ 中，$I$ 先投入，$U$ 觀察後再回應。給定 $I$ 的投入 $x_I$，$U$ 的最佳反應為

$
  x_U^*(x_I; V) = sqrt(V x_I) - x_I.
$

型別為 $v$ 的 $I$ 預期到此一反應後，選擇 $x_I$ 以最大化

$
  W(x_I; v)
  equiv
  x_I / (x_I + x_U^*(x_I; V)) v - x_I
  =
  v / sqrt(V) sqrt(x_I) - x_I.
$

此目標函數對 $x_I$ 嚴格凹。一階條件為

$
  v / (2 sqrt(V x_I)) - 1 = 0,
$

因此

$
  x_I^(I U)(v) = v^2 / (4 V).
$

將此投入代入 $U$ 的最佳反應，得到

$
  x_U^(I U)(v)
  =
  sqrt(V v^2 / (4 V)) - v^2 / (4 V)
  =
  v (2 V - v) / (4 V).
$

均衡報酬為

$
  pi_I^(I U)(v) = v^2 / (4 V),
  quad
  pi_U^(I U)(v) = (2 V - v)^2 / (4 V).
$

因此，事前報酬為

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

接著檢查誘因相容。固定真實型別 $v$，並考慮任一替代型別 $s != v$。若型別 $v$ 模仿 $s$ 的均衡投入，其投入為 $s^2 / (4 V)$。在 $U$ 依最佳反應回應後，偏離報酬為

$
  widetilde(U)(v, s)
  =
  v / sqrt(V) sqrt(s^2 / (4 V)) - s^2 / (4 V)
  =
  (2 v s - s^2) / (4 V).
$

誠實行動的報酬為 $v^2 / (4 V)$。兩者相減可得

$
  v^2 / (4 V) - widetilde(U)(v, s)
  =
  (v - s)^2 / (4 V) > 0
  quad (s != v).
$

因此，每一型別都嚴格偏好自己的分離行動。混同均衡與半分離均衡皆無法成立，$I U$ 子賽局的完美貝葉斯均衡為唯一分離均衡。
]
