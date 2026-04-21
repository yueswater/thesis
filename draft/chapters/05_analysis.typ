#import "../thesis.typ": c, ca, cp, cy, proof, widetilde

本節分析第 0 階段的內生時序選擇。第四節已求得 $S S$、$U I$ 與 $I U$ 三個投入子賽局的均衡報酬；本節將這些報酬代回第 0 階段的策略式賽局，刻畫哪些行動順序可由純策略 Nash 均衡支持。沿用 #c("fu2006") 的記號，令 $F$ 表示選擇第 1 期行動，$S$ 表示選擇第 2 期行動。

== 第 0 階段報酬矩陣 <subsec-stage0-matrix>

第 0 階段的制度選擇可寫成一個二乘二策略式賽局。橫列為 $I$ 的時點選擇，直欄為 $U$ 的時點選擇；每一格的第一個元素為 $I$ 的事前報酬，第二個元素為 $U$ 的事前報酬：

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

此一矩陣的重點在於，兩個 $S S$ 格子雖然都代表同時行動，但其時點不同；一個是立即同時行動，另一個是延後同時行動。由於本文假設第 0 階段尚未觀察型別，兩者在事前報酬上相同。因此，時序選擇的核心是比較 $S S$、$U I$ 與 $I U$ 三組制度報酬。

本文以下定義四個單邊偏離差額。當 $U$ 選擇 $F$ 時，$I$ 從 $F$ 改選 $S$ 會使結果由 $S S$ 變成 $U I$，其差額為

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

這四個差額各自對應一個單邊偏離。尤其，$Delta_U^(U I)$ 恆為非負，且等號成立當且僅當 $V lambda = 1$。因此，在一般情形下，若 $I$ 已選擇第 2 期，$U$ 會嚴格偏好在第 1 期先動，而不是與 $I$ 一起延後同時行動。

== 第一階段最佳反應 <subsec-stage0-br>

第一階段的最佳反應由上述四個差額直接決定。若 $U$ 選擇 $F$，則 $I$ 在 $Delta_I^(U I) > 0$ 時選擇 $S$，在 $Delta_I^(U I) < 0$ 時選擇 $F$，在等號成立時對兩個時點無差異。若 $U$ 選擇 $S$，則 $I$ 在 $Delta_I^(I U) > 0$ 時選擇 $F$，在 $Delta_I^(I U) < 0$ 時選擇 $S$，在等號成立時無差異。

相同地，若 $I$ 選擇 $F$，則 $U$ 在 $Delta_U^(S S) > 0$ 時選擇 $F$，在 $Delta_U^(S S) < 0$ 時選擇 $S$，在等號成立時無差異。若 $I$ 選擇 $S$，則 $U$ 的比較由 $Delta_U^(U I)$ 決定；由於此差額弱為正，$U$ 弱偏好選擇 $F$，且只有在 $V lambda = 1$ 時才會同時將 $F$ 與 $S$ 視為最佳反應。

#proof[見#ref(<proof-stage0-br>)。]

== 純策略內生時序均衡 <subsec-stage0-ne>

第 0 階段的純策略 Nash 均衡可由四個單邊偏離條件完全刻畫。$U I$，也就是 $(I:S, U:F)$，為純策略 Nash 均衡，若且唯若

$
  Delta_I^(U I) >= 0.
$ <eq-ne-ui>

立即同時行動 $S S$，也就是 $(I:F, U:F)$，為純策略 Nash 均衡，若且唯若

$
  Delta_I^(U I) <= 0
  , quad
  Delta_U^(S S) >= 0.
$ <eq-ne-ss-early>

$I U$，也就是 $(I:F, U:S)$，為純策略 Nash 均衡，若且唯若

$
  Delta_I^(I U) >= 0
  , quad
  Delta_U^(S S) <= 0.
$ <eq-ne-iu>

延後同時行動 $S S$，也就是 $(I:S, U:S)$，為純策略 Nash 均衡，若且唯若

$
  Delta_I^(I U) <= 0
  , quad
  Delta_U^(U I) = 0.
$ <eq-ne-ss-late>

由於 $Delta_U^(U I) = 0$ 等價於 $V lambda = 1$，延後同時行動只可能出現在此一臨界情形。在一般情形 $V lambda != 1$ 下，第 0 階段的純策略均衡只能出現在 $U I$、$I U$ 與立即同時行動 $S S$ 之間。

#proof[見#ref(<proof-stage0-ne>)。]

== 型別層級的事後分解 <subsec-type-decomp>

雖然第 0 階段的制度選擇以事前報酬為基礎，型別層級的報酬差仍可用來分解 $I$ 的時序誘因。對任一實現型別 $v$，定義後動相對於先動的報酬差為

$
  R(v)
  equiv pi_I^(S S)(v) - pi_I^(I U)(v)
  =
  (sqrt(v) - (V kappa) / (1 + V lambda))^2
  - v^2 / (4 V).
$ <eq-rent-function>

若 $R(v) > 0$，該型別在事後比較上偏好 $S S$；若 $R(v) < 0$，該型別在事後比較上偏好 $I U$。然而，$R(v)$ 不是第 0 階段的條件式策略，因為第 0 階段尚未觀察型別。它只是將事前差額拆解為不同實現型別的報酬差。

對 $R(V_I)$ 取期望，可得

$
  EE[R(V_I)]
  =
  widetilde(pi)_I^(S S) - widetilde(pi)_I^(I U)
  =
  - Delta_I^(I U).
$ <eq-ex-ante-decomp>

因此，$I$ 是否在 $U$ 選擇 $S$ 時偏好先動，取決於 $R(V_I)$ 的事前平均，而不是任一特定型別的事後偏好。進一步地，$R(v) <= 0$ 等價於

$
  (V kappa) / (1 + V lambda)
  in
  [sqrt(v) - v / (2 sqrt(V)), sqrt(v) + v / (2 sqrt(V))].
$ <eq-type-interval>

此式刻畫的是單一型別的事後比較。它有助於理解不同型別如何貢獻事前差額，但不能取代第 0 階段的期望報酬比較。

#proof[見#ref(<proof-type-decomp>)。]

== 不知情者的直接時序偏好 <subsec-u-direct-preference>

$U$ 在兩個序列制度之間的直接偏好，也可用一個差額表示。定義

$
  Delta_U
  equiv pi_U^(U I) - pi_U^(I U)
  =
  (V^2 kappa^2) / 4
  - (4 V^2 - 4 V mu + EE[V_I^2]) / (4 V).
$ <eq-delta-u-direct>

若 $Delta_U >= 0$，則 $U$ 在直接比較 $U I$ 與 $I U$ 時弱偏好自己先動；若 $Delta_U < 0$，則 $U$ 在直接比較上偏好後動。這個差額有助於理解 $U$ 對兩個序列制度的排序，但它不是 $I U$ 是否成為 Nash 均衡的單邊偏離條件。$I U$ 均衡所需的 $U$ 條件是 $Delta_U^(S S) <= 0$，也就是 $U$ 不願從後動偏離到立即同時行動。

== 福利比較 <subsec-welfare>

最後，本文比較三種制度下的總期望福利。令總期望福利為 $EE[W] = widetilde(pi)_I + pi_U$。由第四節的均衡報酬相加可得

$
  EE[W^(S S)]
  =
  mu - (2 V kappa nu) / (1 + V lambda)
  + (V^2 kappa^2) / (1 + V lambda)^2
  + (V^3 kappa^2 lambda) / (1 + V lambda)^2,
$ <eq-welfare-ss>

$
  EE[W^(U I)]
  =
  mu - V kappa nu + (V^2 kappa^2) / 2,
$ <eq-welfare-ui>

$
  EE[W^(I U)]
  =
  V - mu + EE[V_I^2] / (2 V).
$ <eq-welfare-iu>

福利比較與第 0 階段的均衡條件沒有固定方向。原因在於，均衡條件檢查的是單邊偏離誘因，而福利比較加總了兩位參與者的報酬。某一制度可能是均衡，卻不一定最大化總期望福利；反之，福利較高的制度也未必能由第 0 階段的個別誘因支持。

#proof[見#ref(<proof-welfare>)。]
