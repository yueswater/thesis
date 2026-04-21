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

== 第 0 階段最佳反應 <proof-stage0-br>

#proof[
第 0 階段尚未觀察 $V_I$，因此 $I$ 比較的是事前報酬。若 $U$ 選擇 $F$，則 $I$ 選擇 $F$ 時得到 $widetilde(pi)_I^(S S)$，選擇 $S$ 時得到 $widetilde(pi)_I^(U I)$。兩者相減即為 $Delta_I^(U I)$，故 $Delta_I^(U I)$ 的正負決定 $I$ 的最佳反應。

若 $U$ 選擇 $S$，則 $I$ 選擇 $F$ 時得到 $widetilde(pi)_I^(I U)$，選擇 $S$ 時得到 $widetilde(pi)_I^(S S)$。兩者相減即為 $Delta_I^(I U)$，故 $Delta_I^(I U)$ 的正負決定 $I$ 的最佳反應。

對 $U$ 而言，若 $I$ 選擇 $F$，則 $U$ 選擇 $F$ 時得到 $pi_U^(S S)$，選擇 $S$ 時得到 $pi_U^(I U)$。兩者相減即為 $Delta_U^(S S)$，故其正負決定 $U$ 的最佳反應。若 $I$ 選擇 $S$，則 $U$ 選擇 $F$ 時得到 $pi_U^(U I)$，選擇 $S$ 時得到 $pi_U^(S S)$。兩者相減即為 $Delta_U^(U I)$。由

$
  Delta_U^(U I)
  =
  V^2 kappa^2 (1 - V lambda)^2 / (4 (1 + V lambda)^2)
  >= 0
$

可知，$U$ 在此情形下弱偏好 $F$，且等號成立當且僅當 $V lambda = 1$。
]

== 純策略內生時序均衡 <proof-stage0-ne>

#proof[
純策略 Nash 均衡要求任一參與者在給定對方時點選擇時都不願單邊偏離。先考慮 $(I:S, U:F)$，其誘導制度為 $U I$。$I$ 不偏離至 $F$ 的條件是 $widetilde(pi)_I^(U I) >= widetilde(pi)_I^(S S)$，即 $Delta_I^(U I) >= 0$。$U$ 不偏離至 $S$ 的條件是 $pi_U^(U I) >= pi_U^(S S)$，即 $Delta_U^(U I) >= 0$；此條件恆成立。因此，$U I$ 為均衡若且唯若 $Delta_I^(U I) >= 0$。

在 $(I:F, U:F)$ 下，結果為立即同時行動 $S S$。$I$ 不偏離至 $S$ 的條件為 $Delta_I^(U I) <= 0$；$U$ 不偏離至 $S$ 的條件為 $Delta_U^(S S) >= 0$。故立即 $S S$ 為均衡若且唯若兩條不等式同時成立。

在 $(I:F, U:S)$ 下，結果為 $I U$。$I$ 不偏離至 $S$ 的條件為 $Delta_I^(I U) >= 0$；$U$ 不偏離至 $F$ 的條件為 $Delta_U^(S S) <= 0$。故 $I U$ 為均衡若且唯若兩條不等式同時成立。

最後，在 $(I:S, U:S)$ 下，結果為延後同時行動 $S S$。$I$ 不偏離至 $F$ 的條件為 $Delta_I^(I U) <= 0$；$U$ 不偏離至 $F$ 的條件為 $Delta_U^(U I) <= 0$。由 $Delta_U^(U I) >= 0$ 可知，後者等價於 $Delta_U^(U I) = 0$，亦即 $V lambda = 1$。因此，延後 $S S$ 為均衡若且唯若 $Delta_I^(I U) <= 0$ 且 $Delta_U^(U I) = 0$。
]

== 型別層級分解 <proof-type-decomp>

#proof[
由定義，

$
  R(v)
  =
  pi_I^(S S)(v) - pi_I^(I U)(v)
  =
  (sqrt(v) - (V kappa) / (1 + V lambda))^2
  - v^2 / (4 V).
$

對 $V_I$ 取期望，即得

$
  EE[R(V_I)]
  =
  widetilde(pi)_I^(S S) - widetilde(pi)_I^(I U)
  =
  - Delta_I^(I U).
$

接著，$R(v) <= 0$ 等價於

$
  abs(sqrt(v) - (V kappa) / (1 + V lambda))
  <=
  v / (2 sqrt(V)).
$

由於 $v / (2 sqrt(V)) > 0$，上述絕對值不等式可改寫為

$
  sqrt(v) - v / (2 sqrt(V))
  <=
  (V kappa) / (1 + V lambda)
  <=
  sqrt(v) + v / (2 sqrt(V)).
$

這即為主文中的區間條件。
]

== 二點分配下的符號判準 <proof-binary-structure>

#proof[
在二點分配 $V_I in {v_L, v_H}$ 下，設 $Pr(V_I=v_H)=p in (0,1)$，$Pr(V_I=v_L)=1-p$。由定義可得

$
  EE[R(V_I)] = (1-p) R(v_L) + p R(v_H),
  quad
  Delta_I^(I U) = -EE[R(V_I)].
$

若 $(R(v_L), R(v_H)) = (-,-)$，則 $EE[R(V_I)] < 0$，故 $Delta_I^(I U) > 0$。若 $(R(v_L), R(v_H)) = (+,+)$，則 $EE[R(V_I)] > 0$，故 $Delta_I^(I U) < 0$。若一正一負，則 $EE[R(V_I)]$ 的符號由上述機率加權和決定，從而 $Delta_I^(I U)$ 的符號亦由型別機率與兩個型別的報酬差共同決定。命題得證。
]

== 均勻分配下的臨界點判準 <proof-uniform-structure>

#proof[
在均勻分配 $V_I ~ U[mu-delta, mu+delta]$ 下，砥柱集合為閉區間 $[mu-delta, mu+delta]$。由主文定義，$R(v)$ 在該區間上連續，因此可用介值定理判斷 $R(v)=0$ 的根是否存在於砥柱集合內。

若 $R(mu-delta)$ 與 $R(mu+delta)$ 異號，則依介值定理存在 $v^* in (mu-delta, mu+delta)$ 使 $R(v^*)=0$。這表示在 $v^*$ 兩側，$R(v)$ 的符號改變，故型別的事後先後動比較發生方向反轉。

若兩端同號，介值定理不保證存在內點根；因此砥柱集合內可能無根，對應全體型別同向偏好的情形（全先動或全後動）。
]

== 福利比較 <proof-welfare>

#proof[
三種制度下的總期望福利定義為兩位參與者事前報酬之和。在 $S S$ 制度中，

$
  EE[W^(S S)]
  =
  widetilde(pi)_I^(S S) + pi_U^(S S)
  =
  mu - (2 V kappa nu) / (1 + V lambda)
  + (V^2 kappa^2) / (1 + V lambda)^2
  + (V^3 kappa^2 lambda) / (1 + V lambda)^2.
$

在 $U I$ 制度中，

$
  EE[W^(U I)]
  =
  widetilde(pi)_I^(U I) + pi_U^(U I)
  =
  mu - V kappa nu + (V^2 kappa^2) / 2.
$

在 $I U$ 制度中，

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

故主文中的三式成立。
]
