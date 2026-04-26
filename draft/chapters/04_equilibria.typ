#import "../thesis.typ": c, ca, cp, cy, proof, widetilde

本章求解第 0 階段之後的三個投入子賽局：$S S$、$U I$ 與 $I U$。三個子賽局皆以第三節的最佳反應為基礎。為簡化符號，本文令

#set math.equation(numbering: "(1)")
$
  mu equiv EE[V_I], quad
  kappa equiv EE[1 / sqrt(V_I)], quad
  nu equiv EE[sqrt(V_I)], quad
  lambda equiv EE[1 / V_I].
$ <eq-equilibria-moments>
#set math.equation(numbering: none)

本文假設上述期望量存在且有限，並先聚焦於各子賽局皆有內點最佳反應的情形。此處的重點不是型別集合本身，而是不同時序制度如何改變承諾、觀察與反應的順序。

== $S S$：同時行動 <subsec-ss>

在 $S S$ 制度中，$I$ 與 $U$ 同時選擇投入。此時 $I$ 的投入隨自身型別調整，$U$ 則在無法觀察 $V_I$ 的情況下選擇單一投入。均衡投入為

#set math.equation(numbering: "(1)")
$
  x_U^(S S) = (V^2 kappa^2) / (1 + V lambda)^2,
  quad
  x_I^(S S)(v)
  = (V kappa sqrt(v)) / (1 + V lambda)
  - (V^2 kappa^2) / (1 + V lambda)^2.
$ <eq-ss-efforts>
#set math.equation(numbering: none)

給定型別 $V_I = v$，均衡報酬為

$
  pi_I^(S S)(v)
  = (sqrt(v) - (V kappa) / (1 + V lambda))^2,
$ <eq-ss-payoff-i>

$
  pi_U^(S S)(v)
  = (V^2 kappa) / ((1 + V lambda) sqrt(v))
  - (V^2 kappa^2) / (1 + V lambda)^2.
$ <eq-ss-payoff-u>

因此，兩位參與者在 $S S$ 制度下的事前報酬為

$
  widetilde(pi)_I^(S S)
  = mu - (2 V kappa nu) / (1 + V lambda)
  + (V^2 kappa^2) / (1 + V lambda)^2,
$ <eq-ss-ex-ante-i>

$
  pi_U^(S S)
  = (V^3 kappa^2 lambda) / (1 + V lambda)^2.
$ <eq-ss-ex-ante-u>

此一結果顯示，同時行動並不意味著投入對稱。$I$ 仍依型別調整投入，而 $U$ 的投入反映其事前面對的資訊限制。

#proof[見#ref(<proof-ss>)。]

== $U I$：不知情者先動 <subsec-ui>

在 $U I$ 制度中，$U$ 先承諾投入，$I$ 在觀察 $x_U$ 並得知自身型別後再選擇投入。均衡投入為

#set math.equation(numbering: "(1)")
$
  x_U^(U I) = (V^2 kappa^2) / 4,
  quad
  x_I^(U I)(v)
  = (V kappa sqrt(v)) / 2 - (V^2 kappa^2) / 4.
$ <eq-ui-efforts>
#set math.equation(numbering: none)

逐型別均衡報酬為

$
  pi_I^(U I)(v)
  = (sqrt(v) - (V kappa) / 2)^2,
$ <eq-ui-payoff-i>

$
  pi_U^(U I)(v)
  = (V^2 kappa) / (2 sqrt(v)) - (V^2 kappa^2) / 4.
$ <eq-ui-payoff-u>

取事前期望後，

$
  widetilde(pi)_I^(U I)
  = mu - V kappa nu + (V^2 kappa^2) / 4,
$ <eq-ui-ex-ante-i>

$
  pi_U^(U I)
  = (V^2 kappa^2) / 4.
$ <eq-ui-ex-ante-u>

$U I$ 與 $S S$ 的差異在於承諾順序。$U$ 先動時可先設定投入，$I$ 則保留逐型別反應的彈性；因此，$U$ 的均衡投入不再由同時行動的一階條件決定，而是由其 Stackelberg 承諾問題決定。

#proof[見#ref(<proof-ui>)。]

== $I U$：知情者先動 <subsec-iu>

在 $I U$ 制度中，$I$ 先投入，$U$ 觀察後再反應。此時 $I$ 的投入會讓 $U$ 形成關於 $V_I$ 的後驗信念；然而，第三節已說明，$U$ 的最佳反應只依賴已觀察投入與自身獎酬 $V$。因此，後驗信念不進入 $U$ 的反應函數。

在唯一分離均衡中，型別 $v$ 的投入與 $U$ 的後續反應為

#set math.equation(numbering: "(1)")
$
  x_I^(I U)(v) = v^2 / (4 V),
  quad
  x_U^(I U)(v) = v (2 V - v) / (4 V).
$ <eq-iu-efforts>
#set math.equation(numbering: none)

對應的逐型別報酬為

$
  pi_I^(I U)(v) = v^2 / (4 V),
$ <eq-iu-payoff-i>

$
  pi_U^(I U)(v) = (2 V - v)^2 / (4 V).
$ <eq-iu-payoff-u>

因此，$I U$ 制度下的事前報酬為

$
  widetilde(pi)_I^(I U)
  = EE[V_I^2] / (4 V),
$ <eq-iu-ex-ante-i>

$
  pi_U^(I U)
  = (4 V^2 - 4 V mu + EE[V_I^2]) / (4 V).
$ <eq-iu-ex-ante-u>

$I U$ 子賽局的關鍵是分離，而非混合。每一型別都嚴格偏好自己的分離投入，不會模仿其他型別；因此，混合均衡與半分離均衡皆被排除。相較於 #c("fu2006")，本文的 $I U$ 子賽局沒有因信念而產生的均衡選擇問題；訊號雖然存在於觀察層次，卻不會改變 $U$ 的最佳反應。

#proof[見#ref(<proof-iu>)。]

== 小結 <subsec-equilibria-summary>

本節的三個子賽局可整理為一組制度報酬。$S S$ 制度保留同步行動，但 $U$ 的投入必須事前吸收 $I$ 型別不確定性；$U I$ 制度使 $U$ 取得先動承諾地位，$I$ 則保留後動反應；$I U$ 制度使 $I$ 先揭露其投入，但該訊號不會進入 $U$ 的最佳反應。第 0 階段的內生時序選擇，正是比較這三組事前報酬所形成的策略式賽局。
