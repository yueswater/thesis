#import "../thesis.typ": c, ca, cp, cy, lemma, proof, theorem, widetilde

本章分析第 0 階段的內生時序選擇。第四節已求得 $S S$、$U I$ 與 $I U$ 三個投入子賽局的均衡報酬；本節將這些報酬代回第 0 階段的策略式賽局，刻畫哪些行動順序可由純策略 Nash 均衡支持。沿用 #c("fu2006") 的記號，令 $F$ 表示選擇第 1 期行動，$S$ 表示選擇第 2 期行動。

== 第 0 階段分析 <subsec-stage0-analysis>

第 0 階段的制度選擇可寫成一個 $2 times 2$ 策略式賽局。橫列為 $I$ 的時點選擇，直欄為 $U$ 的時點選擇；每一格的第一個元素為 $I$ 的事前報酬，第二個元素為 $U$ 的事前報酬：

#figure(
  table(
    columns: (auto, auto, auto),
    inset: 6pt,
    align: center,
    [], [$U$: $F$], [$U$: $S$],
    [$I$: $F$], [$(widetilde(pi)_I^(S S), pi_U^(S S))$], [$(widetilde(pi)_I^(I U), pi_U^(I U))$],
    [$I$: $S$], [$(widetilde(pi)_I^(U I), pi_U^(U I))$], [$(widetilde(pi)_I^(S S), pi_U^(S S))$],
  ),
  caption: [第 0 階段的期望報酬矩陣],
  supplement: [表],
) <tbl-stage0-analysis>

令四個單邊偏離差額分別為：

當 $U$ 選擇 $F$ 時，$I$ 從 $F$ 改選 $S$ 會使結果由 $S S$ 變成 $U I$，其差額為

$
  Delta_I^(U I)
  equiv widetilde(pi)_I^(U I) - widetilde(pi)_I^(S S)
  =
  - V kappa nu + (2 V kappa nu) / (1 + V lambda)
  + (V^2 kappa^2) / 4
  - (V^2 kappa^2) / (1 + V lambda)^2.
$ <eq-delta-i-ui>

當 $U$ 選擇 $S$ 時，$I$ 從 $S$ 改選 $F$ 會使結果由 $S S$ 變成 $I U$，其差額為

$
  Delta_I^(I U)
  equiv widetilde(pi)_I^(I U) - widetilde(pi)_I^(S S)
  =
  EE[V_I^2] / (4 V)
  - mu + (2 V kappa nu) / (1 + V lambda)
  - (V^2 kappa^2) / (1 + V lambda)^2.
$ <eq-delta-i-iu>

當 $I$ 選擇 $S$ 時，$U$ 從 $S$ 改選 $F$ 會使結果由 $S S$ 變成 $U I$，其差額為

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

當 $I$ 選擇 $F$ 時，$U$ 從 $S$ 改選 $F$ 會使結果由 $I U$ 變成 $S S$，其差額為

$
  Delta_U^(S S)
  equiv pi_U^(S S) - pi_U^(I U)
  =
  (V^3 kappa^2 lambda) / (1 + V lambda)^2
  - (4 V^2 - 4 V mu + EE[V_I^2]) / (4 V).
$ <eq-delta-u-ss>

#lemma(title: [第 0 階段最佳反應])[
  第 0 階段的最佳反應由四個單邊偏離差額決定：

  1. 若 $U$ 選擇 $F$，則 $I$ 在 $Delta_I^(U I) > 0$ 時選擇 $S$，在 $Delta_I^(U I) < 0$ 時選擇 $F$，在等號成立時無異。
  2. 若 $U$ 選擇 $S$，則 $I$ 在 $Delta_I^(I U) > 0$ 時選擇 $F$，在 $Delta_I^(I U) < 0$ 時選擇 $S$，在等號成立時無異。
  3. 若 $I$ 選擇 $F$，則 $U$ 在 $Delta_U^(S S) > 0$ 時選擇 $F$，在 $Delta_U^(S S) < 0$ 時選擇 $S$，在等號成立時無異。
  4. 若 $I$ 選擇 $S$，則 $U$ 的比較由 $Delta_U^(U I)$ 決定。由於 $Delta_U^(U I) >= 0$，$U$ 弱偏好選擇 $F$，且只有在 $V lambda = 1$ 時對 $F, S$ 無異。
] <subsec-stage0-br>

$I$ 的時序選擇由三個制度的期望報酬差決定，而 $U$ 的關鍵不對稱來自 $Delta_U^(U I) >= 0$。因此，只要 $I$ 打算後動，$U$ 通常偏好先動；僅在 $V lambda = 1$ 的臨界情形，$U$ 才會對先後動無異。

#proof[見#ref(<proof-stage0-br>)。]

#theorem(title: [純策略內生時序均衡的刻畫])[
  第 0 階段的純策略 Nash 均衡由下列條件完全刻畫：

  1. $U I$，為純策略 Nash 均衡，若且唯若 $Delta_I^(U I) >= 0$。
  2. 立即同時行動 $S S$，為純策略 Nash 均衡，若且唯若 $Delta_I^(U I) <= 0$ 且 $Delta_U^(S S) >= 0$。
  3. $I U$，為純策略 Nash 均衡，若且唯若 $Delta_I^(I U) >= 0$ 且 $Delta_U^(S S) <= 0$。
  4. 延後同時行動 $S S$，為純策略 Nash 均衡，若且唯若 $Delta_I^(I U) <= 0$ 且 $Delta_U^(U I) = 0$。

  此外，$Delta_U^(U I) = 0$ 當且僅當 $V lambda = 1$，故在一般情況 $V lambda != 1$ 下，延後同時行動 $(S,S)$ 不可能是純策略均衡。
] <subsec-stage0-ne>

在本文設定下，制度選擇可直接由四個單邊偏離差額判斷，不需再依賴均衡修正。尤其是延後同時行動 $(S,S)$ 只有在 $V lambda = 1$ 的臨界情形才可能成立，因此在一般參數下可排除。

#proof[見#ref(<proof-stage0-ne>)。]

#lemma(title: [型別層級的事後分解])[
  雖然第 0 階段的制度選擇以事前報酬為基礎，型別層級的報酬差仍可用來分解 $I$ 的時序誘因。對任一實現型別 $v$，令

  $
    R(v)
    equiv pi_I^(S S)(v) - pi_I^(I U)(v)
    =
    (sqrt(v) - (V kappa) / (1 + V lambda))^2
    - v^2 / (4 V).
  $ <eq-rent-function>

  則

  $
    EE[R(V_I)]
    =
    widetilde(pi)_I^(S S) - widetilde(pi)_I^(I U)
    =
    - Delta_I^(I U).
  $ <eq-ex-ante-decomp>

  且 $R(v) <= 0$ 等價於

  $
    (V kappa) / (1 + V lambda)
    in
    [sqrt(v) - v / (2 sqrt(V)), sqrt(v) + v / (2 sqrt(V))].
  $ <eq-type-interval>
]
<subsec-type-decomp>

$R(v)$ 描述的是實現型別在事後對先後動的比較，但第 0 階段決策發生於型別揭露之前，因此真正支配制度選擇的是 $EE[R(V_I)]$，亦即事前平均誘因，而非任一型別的事後偏好。

#proof[見#ref(<proof-type-decomp>)。]


== 各分配下的時序結構 <subsec-distribution-structure>

以下利用前述 $R(v)$ 與 $EE[R(V_I)] = -Delta_I^(I U)$，說明不同分配下的時序結構。本節關心的不只是單一型別在事後偏好先動或後動，更在於這些型別比較如何在給定分配下加總成第 0 階段的整體誘因。換言之，分配假設會改變 $R(v)$ 在砥柱集合上的權重與符號結構，進而改變 $Delta_I^(I U)$ 的符號。下述分別用二點分配與均勻分配呈現這個對應關係：前者聚焦於兩個型別點的符號組合及其機率加權，後者聚焦於砥柱集合內是否存在 $R(v)=0$ 的臨界點，以及該臨界點如何劃分型別區域。

=== 二點分配 <subsec-binary-structure>

若 $V_I in {v_L, v_H}$ 且 $0 < v_L < v_H$，則可直接比較 $R(v_L)$ 與 $R(v_H)$：

#lemma(title: [二點分配下的符號判準])[
  在二點分配 $V_I in {v_L, v_H}$ 下，令 $0 < v_L < v_H$。

  1. 若 $(R(v_L), R(v_H))$ 的符號組合為 $(-,-)$，則兩種型別事後都偏好先動（$I U$）；因此 $EE[R(V_I)] < 0$，等價於 $Delta_I^(I U) > 0$。
  2. 若 $(R(v_L), R(v_H))$ 的符號組合為 $(+,+)$，則兩種型別事後都偏好後動（相對於 $I U$ 而言）；因此 $EE[R(V_I)] > 0$，等價於 $Delta_I^(I U) < 0$。
  3. 若符號相異，即 $(+,-)$ 或 $(-,+)$，則 $Delta_I^(I U)$ 的符號由機率加權平均 $EE[R(V_I)]$ 決定，亦即由型別機率與兩個型別的報酬差共同決定。
] <lem-binary-structure>

此處重點是：型別層級比較可用來分解誘因，但第 0 階段真正決策仍由期望差額 $Delta_I^(I U)$ 決定。

#proof[見#ref(<proof-binary-structure>)。]

=== 均勻分配 <subsec-uniform-structure>

若 $V_I ~ cal(U)[mu - delta, mu + delta]$，其中 $cal(U)(dot.c)$ 為均勻分配，$0 < delta < mu$，可定義

$
  cal(W)
  equiv {v in [mu - delta, mu + delta]: R(v) > 0},
$

以及

$
  cal(F)
  equiv {v in [mu - delta, mu + delta]: R(v) < 0}.
$

#lemma(title: [均勻分配下的臨界點判準])[
  在均勻分配 $V_I ~ cal(U)[mu - delta, mu + delta]$ 下，因 $R(v)$ 對 $v$ 連續，可把 $R(v)=0$（且落在砥柱集合內）的解，視為 $cal(W)$ 與 $cal(F)$ 的分界點。

  1. 若 $R(mu - delta)$ 與 $R(mu + delta)$ 異號，則存在臨界值 $v^* in (mu - delta, mu + delta)$，使型別在事後比較上出現方向反轉。
  2. 若兩端同號，則砥柱集合內可能無根，對應全部型別同向偏好（全先動或全後動）的情形。
] <lem-uniform-structure>

#proof[見#ref(<proof-uniform-structure>)。]

== 混合均衡分析 <subsec-pooling-analysis>

在三種制度中，只有 $I U$ 可能出現「先動行為是否傳遞型別訊息」的問題：知情者先動，再由不知情者觀察 $x_I$ 後反應。相對地，$S S$ 為同時行動，$U I$ 為不知情者先動，兩者都不是由知情者向不知情者傳遞訊號的子賽局。

然而，在本文設定下，$U$ 的最佳反應函數為

$
  x_U^*(x_I; V) = sqrt(V x_I) - x_I,
$

只依賴觀察到的投入 $x_I$ 與自身獎酬 $V$，不依賴對 $V_I$ 的後驗信念。因此，$I$ 的投入雖可被觀察，但不會透過「信念更新」改變 $U$ 的最適反應，隱含在 $I U$ 子賽局中，訊號通道雖存在於資訊結構層次，卻不影響行為方程；均衡比較回到投入與報酬本身。
故本文的混合/半混合討論可簡化為：在既有反應結構下，不需額外引入均衡修正即可判斷可行均衡，且第四節已給出唯一分離均衡結果。

#lemma(title: [不知情者的直接時序偏好])[
  $U$ 在兩個序列制度之間的直接偏好可寫為

  $
    Delta_U
    equiv pi_U^(U I) - pi_U^(I U)
    =
    (V^2 kappa^2) / 4
    - (4 V^2 - 4 V mu + EE[V_I^2]) / (4 V).
  $ <eq-delta-u-direct>

  若 $Delta_U >= 0$，則 $U$ 在直接比較 $U I$ 與 $I U$ 時弱偏好自己先動；若 $Delta_U < 0$，則偏好後動。此量有助於排序兩個序列制度，但它不是 $I U$ 是否為 Nash 均衡的偏離條件；對 $I U$ 而言，關鍵是 $Delta_U^(S S) <= 0$。
]
<subsec-u-direct-preference>

#proof[
  由第四節可得
  $
    pi_U^(U I) = (V^2 kappa^2) / 4,
    quad
    pi_U^(I U) = (4 V^2 - 4 V mu + EE[V_I^2]) / (4 V).
  $
  兩式相減即得
  $
    Delta_U
    equiv pi_U^(U I) - pi_U^(I U)
    =
    (V^2 kappa^2) / 4
    - (4 V^2 - 4 V mu + EE[V_I^2]) / (4 V).
  $
  故 $Delta_U$ 的符號直接決定 $U$ 在 $U I$ 與 $I U$ 的制度排序。又因第 0 階段對 $I U$ 的偏離是與 $S S$ 比較，故其均衡條件仍為 $Delta_U^(S S) <= 0$，而非 $Delta_U$。
]

上述引理區分了「制度排序」與「偏離誘因」：$Delta_U$ 只刻畫 $U$ 對 $U I$ 與 $I U$ 的直接排序，並不等同於策略式賽局中的偏離條件。因此，均衡分析仍須回到 $Delta_U^(S S)$ 並與其他單邊差額聯合判斷。

#theorem(title: [福利排序與均衡排序一般不一致])[
  令總期望福利為
  $
    EE[W] = widetilde(pi)_I + pi_U
  $

  三種制度下的總期望福利分別為

  $
    E[W^(S S)] & = mu - (2 V kappa nu) / (1 + V lambda)
                 + (V^2 kappa^2) / (1 + V lambda)^2
                 + (V^3 kappa^2 lambda) / (1 + V lambda)^2 \
    E[W^(U I)] & = mu - V kappa nu + (V^2 kappa^2) / 2 \
    E[W^(I U)] & = V - mu + E[V_I^2] / (2 V)
  $

  在可行參數區域內，上述三者的排序一般不與第 0 階段的均衡排序一致；換言之，均衡條件檢查單邊偏離誘因，而福利排序是雙方報酬的加總，兩者沒有固定單調對應。
] <subsec-welfare>

#proof[見#ref(<proof-welfare>)。]
