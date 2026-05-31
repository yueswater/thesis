#import "../thesis.typ": c, ca, cp, cy, definition, headingref, lemma, proof, theorem, widetilde

#headingref(<sec-analysis>)分析第 0 階段的內生時序選擇。#headingref(<sec-equilibria>)已求得 $S S$、$U I$ 與 $I U$ 三個投入子賽局的均衡報酬；#headingref(<subsec-stage0-analysis>)將這些報酬代回第 0 階段的策略式賽局，刻畫哪些行動順序可由純策略 Nash 均衡支持。沿用 #c("fu2006") 的記號，令 $F$ 表示選擇第 1 期行動，$S$ 表示選擇第 2 期行動。

== 第 0 階段分析 <subsec-stage0-analysis>

第 0 階段的制度選擇可寫成一個 $2 times 2$ 策略式賽局。橫列為知情者的時點選擇，直欄為不知情者的時點選擇；每一格的第一個元素為知情者的事前報酬，第二個元素為不知情者的事前報酬 (此即@tbl-stage0-payoffs)：

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
    $F$, $S$,
    $F$, $(widetilde(pi)_I^(S S), pi_U^(S S))$, $(widetilde(pi)_I^(I U), pi_U^(I U))$,
    $S$, $(widetilde(pi)_I^(U I), pi_U^(U I))$, $(widetilde(pi)_I^(S S), pi_U^(S S))$,
  ),
  caption: [第 0 階段的期望報酬矩陣],
  supplement: [表],
) <tbl-stage0-analysis>

=== 四個單邊偏離差額 <subsec-stage0-deltas>

#definition(title: [四個單邊偏離差額])[
  第 0 階段的制度比較可由一組抽象的單邊偏離差額表示。令 $Delta_i^J$ 表示：在給定對手時點選擇下，參賽者 $i in {I,U}$ 單邊偏離後，使結果轉為制度 $J in {S S, U I, I U}$ 時的報酬差額。亦即，$Delta_i^J$ 一律定義為偏離後報酬減去偏離前報酬；若 $Delta_i^J > 0$，表示參賽者 $i$ 有誘因偏離至制度 $J$。在本文的 $2 times 2$ 時序賽局中，實際會用到的四個差額可先寫為：

  #set math.equation(numbering: "(1)")
  $
    Delta_I^(U I) & equiv widetilde(pi)_I^(U I) - widetilde(pi)_I^(S S) \
    & = - V kappa nu + (2 V kappa nu) / (1 + V lambda) + (V^2 kappa^2) / 4 - (V^2 kappa^2) / (1 + V lambda)^2. \
    Delta_I^(I U) & equiv widetilde(pi)_I^(I U) - widetilde(pi)_I^(S S) \
    & = EE[V_I^2] / (4 V) - mu + (2 V kappa nu) / (1 + V lambda) - (V^2 kappa^2) / (1 + V lambda)^2. \
    Delta_U^(U I) & equiv pi_U^(U I) - pi_U^(S S) \
    & = (V^2 kappa^2 (1 - V lambda)^2) / (4 (1 + V lambda)^2) >= 0. \
    Delta_U^(S S) & equiv pi_U^(S S) - pi_U^(I U) \
    & = (V^3 kappa^2 lambda) / (1 + V lambda)^2 - (4 V^2 - 4 V mu + EE[V_I^2]) / (4 V).
  $ <eq-stage0-deltas>
  #set math.equation(numbering: none)

  對應的定義可整理如下：

  #figure(
    table(
      columns: 5,
      align: center + horizon,
      stroke: none,
      table.hline(y: 0, stroke: 1pt),
      table.hline(y: 1, stroke: 0.5pt),
      table.hline(y: 5, stroke: 1pt),
      table.header([偏離差額], [發動偏離者], [給定對手策略], [單邊偏離行為], [時序結果移轉]),
      $Delta_I^(U I)$, [知情者], [不知情者選 $F$], [$F arrow S$], [$S S arrow U I$],
      $Delta_I^(I U)$, [知情者], [不知情者選 $S$], [$S arrow F$], [$S S arrow I U$],
      $Delta_U^(U I)$, [不知情者], [知情者選 $S$], [$S arrow F$], [$S S arrow U I$],
      $Delta_U^(S S)$, [不知情者], [知情者選 $F$], [$S arrow F$], [$I U arrow S S$],
    ),
    caption: [單邊偏離差額與時序結果移轉對照表],
    supplement: [表],
  ) <tbl-deviation-definitions>

] <def-stage0-deltas>

#lemma(title: [第 0 階段最佳反應])[
  第 0 階段的純策略最佳反應：
  + $U$ 選 $F$：$I$ 選 $S$ iff $Delta_I^(U I) >= 0$（等號無差）。
  + $U$ 選 $S$：$I$ 選 $F$ iff $Delta_I^(I U) >= 0$（等號無差）。
  + $I$ 選 $F$：$U$ 選 $F$ iff $Delta_U^(S S) >= 0$（等號無差）。
  + $I$ 選 $S$：$U$ 弱偏好 $F$，因 $Delta_U^(U I) >= 0$ 恆成立。
] <subsec-stage0-br>

由#headingref(<subsec-stage0-analysis>)可知，知情者的時序選擇由三個制度的期望報酬差決定，而不知情者的關鍵不對稱來自 $Delta_U^(U I) >= 0$。因此，只要知情者打算後動，不知情者通常偏好先動；僅在 $V lambda = 1$ 的臨界情形，不知情者才會對先後動無異。

#proof[
  第 0 階段尚未觀察 $V_I$，因此知情者比較的是事前報酬。若不知情者選擇 $F$，則知情者選擇 $F$ 時得到 $widetilde(pi)_I^(S S)$，選擇 $S$ 時得到 $widetilde(pi)_I^(U I)$。兩者相減即為 $Delta_I^(U I)$，故 $Delta_I^(U I)$ 的正負決定知情者的最佳反應。

  若不知情者選擇 $S$，則知情者選擇 $F$ 時得到 $widetilde(pi)_I^(I U)$，選擇 $S$ 時得到 $widetilde(pi)_I^(S S)$。兩者相減即為 $Delta_I^(I U)$，故 $Delta_I^(I U)$ 的正負決定知情者的最佳反應。

  對不知情者而言，若知情者選擇 $F$，則不知情者選擇 $F$ 時得到 $pi_U^(S S)$，選擇 $S$ 時得到 $pi_U^(I U)$。兩者相減即為 $Delta_U^(S S)$，故其正負決定不知情者的最佳反應。若知情者選擇 $S$，則不知情者選擇 $F$ 時得到 $pi_U^(U I)$，選擇 $S$ 時得到 $pi_U^(S S)$。兩者相減即為 $Delta_U^(U I)$。由

  $
    Delta_U^(U I)
    =
    (V^2 kappa^2 (1 - V lambda)^2) / (4 (1 + V lambda)^2)
    >= 0
  $

  可知，不知情者在此情形下弱偏好 $F$，且等號成立若且唯若 $V lambda = 1$。
]

#theorem(title: [純策略內生時序均衡])[
  第 0 階段的純策略 Nash 均衡由以下條件完全刻畫：
  + $U I$ iff $Delta_I^(U I) >= 0$；
  + $S S$（立即）iff $Delta_I^(U I) <= 0$ 且 $Delta_U^(S S) >= 0$；
  + $I U$ iff $Delta_I^(I U) >= 0$ 且 $Delta_U^(S S) <= 0$。
] <subsec-stage0-ne>

在本文設定下，制度選擇可直接由#headingref(<subsec-stage0-analysis>)的四個單邊偏離差額判斷(即 @eq-stage0-deltas)，不需再依賴均衡修正。尤其是延後同時行動 $(S,S)$ 只有在 $V lambda = 1$ 的臨界情形才可能成立，因此在一般參數下可排除。

#proof[
  純策略 Nash 均衡要求任一參賽者在給定對方時點策略之下，皆不具備單邊偏離的誘因。我們窮舉第 0 階段所有可能的策略組合進行檢驗：

  + 若給定策略為 $(I:S, U:F)$，誘導制度為 $U I$：
    - $I$ 不偏離至 $F$ 的條件為：$widetilde(pi)_I^(U I) >= widetilde(pi)_I^(S S)$，即 $Delta_I^(U I) >= 0$。
    - $U$ 不偏離至 $S$ 的條件為：$pi_U^(U I) >= pi_U^(S S)$，即 $Delta_U^(U I) >= 0$。
    - 結論：$U I$ 構成純策略均衡若且唯若 $Delta_I^(U I) >= 0$。

  + 若給定策略為 $(I:F, U:F)$，誘導制度為立即同時行動 $S S$：
    - $I$ 不偏離至 $S$ 的條件為：$Delta_I^(U I) <= 0$。
    - $U$ 不偏離至 $S$ 的條件為：$Delta_U^(S S) >= 0$。
    - 結論：立即 $S S$ 構成純策略均衡若且唯若上述兩式同時成立。

  + 若給定策略為 $(I:F, U:S)$，誘導制度為 $I U$：
    - $I$ 不偏離至 $S$ 的條件為：$Delta_I^(I U) >= 0$。
    - $U$ 不偏離至 $F$ 的條件為：$Delta_U^(S S) <= 0$。
    - 結論：$I U$ 構成純策略均衡若且唯若上述兩式同時成立。

  + 若給定策略為 $(I:S, U:S)$，誘導制度為延後同時行動 $S S$：
    - $I$ 不偏離至 $F$ 的條件為：$Delta_I^(I U) <= 0$。
    - $U$ 不偏離至 $F$ 的條件為：$Delta_U^(U I) <= 0$。由於已知 $Delta_U^(U I) >= 0$ 恆成立，此條件退化為 $Delta_U^(U I) = 0$（等價於 $V lambda = 1$）。
    - 結論：延後 $S S$ 構成純策略均衡若且唯若 $Delta_I^(I U) <= 0$ 且 $V lambda = 1$。

  綜上所述，定理命題得證。
]

#lemma(title: [型別層級的事後分解])[
  對任一型別 $v$，定義

  $
    R(v)
    equiv pi_I^(S S)(v) - pi_I^(I U)(v)
    =
    (sqrt(v) - (V kappa) / (1 + V lambda))^2
    - v^2 / (4 V).
  $ <eq-rent-function>

  則 $EE[R(V_I)] = -Delta_I^(I U)$。
]
<subsec-type-decomp>

$R(v)$ 描述的是實現型別在事後對先後動的比較，但第 0 階段決策發生於型別揭露之前，因此真正支配制度選擇的是 $EE[R(V_I)]$，亦即事前平均誘因，而非任一型別的事後偏好。

#proof[
  由定義將 $R(v)$ 對 $V_I$ 取期望，即得

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

  即可求得區間之上下界。
]


== 各分配下的時序結構 <subsec-distribution-structure>

本節將利用前述定義之 $R(v)$ 函數以及期望值關係式 $EE[R(V_I)] = -Delta_I^(I U)$，進一步探討不同機率分配對內生時序結構的影響。本節不僅側重單一型別於事後究竟偏好先動或後動，更著墨於異質的個體偏好，如何在給定的機率分配下進行加總，進而形塑第 0 階段整體的決策誘因。

換言之，分配假設將直接決定 $R(v)$ 在砥柱集合上的權重配置與符號結構，最終主導單邊偏離差額 $Delta_I^(I U)$ 的正負方向。下述將分別藉由兩點分配與均勻分配來闡明此一對應機制：前者著眼於兩個離散型別點的符號組合與機率權重所產生的淨效應；後者則聚焦於砥柱集合內部是否存在 $R(v)=0$ 的臨界點，以及該臨界點如何將連續的型別空間劃分為不同的偏好區塊。

=== 兩點分配 <subsec-binary-structure>

若型別空間服從兩點分配 $V_I in {V_L, V_H}$ 且滿足 $0 < V_L < V_H$，可直接檢視 $R(V_L)$ 與 $R(V_H)$ 的正負號，來拆解知情者整體的決策誘因。

#lemma(title: [兩點分配下的符號判準])[
  #align(center)[
    #table(
      columns: 4,
      inset: (x: 6pt, y: 10pt),
      align: center + horizon,
      stroke: none,
      table.hline(y: 0, stroke: 0.5pt),
      table.hline(y: 1, stroke: 0.3pt),
      table.hline(y: 4, stroke: 0.5pt),
      table.header(stack(dir: ttb, spacing: 0.2em, [符號組合]), [兩型別之事後偏好], [期望值], [偏離差額]),
      [$(-,-)$], [皆偏好先動 $(I U)$], [$< 0$], [$> 0$],
      [$(+,+)$], [皆偏好後動], [$> 0$], [$< 0$],
      [$(+,-)$ 或 $(-,+)$], [偏好相異], [未定], [未定],
    )
  ]
] <lem-binary-structure>

上述引理的核心經濟意涵在於：雖然可透過型別層級的事後比較來細部拆解誘因，但知情者在第 0 階段的實質決策，終究是立基於事前期望差額 $Delta_I^(I U)$ 所拍板定案的。

#proof[
  在兩點分配 $V_I in {V_L, V_H}$ 下，設
  $
    Pr(V_I=V_H) = q in (0,1) quad Pr(V_I=V_L) = 1-q.
  $

  由定義可得

  $
    EE[R(V_I)] = (1-q) R(V_L) + q R(V_H),
    quad
    Delta_I^(I U) = -EE[R(V_I)].
  $

  根據上述結果，討論以下三種情況：

  + 若 $(R(V_L), R(V_H)) = (-,-)$，由於 $q in (0,1)$，期望值 $EE[R(V_I)]$ 實為兩負數之嚴格凸組合，故必有 $EE[R(V_I)] < 0$，可推得 $Delta_I^(I U) > 0$。

  + 若 $(R(V_L), R(V_H)) = (+,+)$，則 $EE[R(V_I)]$ 為兩正數之凸組合，必有 $EE[R(V_I)] > 0$，可推得 $Delta_I^(I U) < 0$。

  + 若兩者符號一正一負，則 $EE[R(V_I)]$ 之正負號無法單憑型別特徵決定，必須仰賴上述的機率加權和；是以 $Delta_I^(I U)$ 的符號將同時受先驗機率 $q$ 與兩型別之報酬差額所驅動。命題得證。

  命題得證。
]

如#ref(<fig-ch5-timing-regions>)所示，在固定 $V=1$ 的兩點分配下，$(mu, delta)$ 會把參數空間劃分為不同的符號區域；這些區域對應 $Delta_I^(I U)$ 與 $Xi_U$ 的正負組合，因而直接對應到第 0 階段的制度誘因。

#figure(
  image("../../../figures/fig5_regions.pdf", width: 130%),
  caption: [兩點分配在 $(mu, delta)$ 平面上的 $(Delta_I^(I U), Xi_U)$ 符號區域。],
  supplement: [圖],
) <fig-ch5-timing-regions>

=== 均勻分配 <subsec-uniform-structure>

若知情者的型別服從均勻分配，記為

$
  V_I tilde U[mu - delta, mu + delta], quad 0 < delta < mu
$

則可依據事後偏離誘因，將型別空間劃分為兩個子集合：偏好後動 (偏離 $I U$) 之型別集合

$
  cal(W)
  equiv {v in [mu - delta, mu + delta] : R(v) > 0},
$

以及偏好先動 (維持 $I U$) 之型別集合

$
  cal(F)
  equiv {v in [mu - delta, mu + delta] : R(v) < 0}.
$

#lemma(title: [均勻分配下之內部臨界點])[
  若 $R(mu - delta) dot R(mu + delta) < 0$，則 $exists v^* in (mu - delta, mu + delta)$ 使 $R(v^*) = 0$，將型別劃分為 $cal(F)$ 與 $cal(W)$；否則全體型別事後偏好一致。
] <lem-uniform-structure>

#proof[
  由於 $R(v)$ 在其定義域 $[mu - delta, mu + delta]$ 上為連續函數，可直接應用中間值定理。

  - 當端點條件 $R(mu - delta) dot R(mu + delta) < 0$ 成立時，表示函數在區間兩端點之符號相異，故必定存在一內部實根 $v^*$ 使得 $R(v^*) = 0$。在 $v^*$ 的兩側，$R(v)$ 的正負號發生反轉，對應於事後偏好的逆轉。

  - 反之，若端點同號且區間內無根，因函數連續，可推得 $R(v)$ 於砥柱集合上恆正或恆負，即全體型別皆偏好同一種時序制度。
]

#figure(
  image("../../../figures/fig5_uniform_regions.pdf", width: 130%),
  caption: [均勻分配於 $(mu, delta)$ 平面上的型別劃分區域。],
  supplement: [圖],
) <fig-ch5-uniform-regions>

如 #ref(<fig-ch5-uniform-regions>) 所示，在均勻分配的設定下，$(mu, delta)$ 參數平面可依據型別空間是否被內部臨界點 $v^*$ 所劃分，歸納為不同的理論結構：
若於整個砥柱集合上皆滿足 $R(v) < 0$，意味著所有型別皆具備一致之事後偏好，皆傾向維持先動；反之，若同一砥柱集合內同時涵蓋了 $R(v)$ 的正值與負值，基於函數的連續性，必定存在至少一個內部臨界點，將型別空間截然劃分為偏好先動與偏好後動兩個子集合。圖中的三個子圖分別透過設定不同的公開獎酬價值 $V$，顯示此種型別劃分如何隨外在競賽環境而變遷。與前述的兩點分配不同，此處探討的比較靜態參數不再是先驗機率權重 $q$，而是直接牽動 $R(v)$ 函數型態的公開獎酬價值 $V$。

此外，圖中虛線代表的是參數的可行邊界 (即 $delta = mu$)；位於該虛線上方之區域將導致型別下界 $mu - delta <= 0$，從而違反本文對於砥柱集合恆正之基本假設。本圖所刻畫之可行參數範圍，可觀察到未出現全體型別皆偏好後動的參數區域。換言之，在給定的均勻分配參數族中，實質上僅能觀察到全局偏好先動，以及存在內部臨界點、型別偏好產生分歧兩種結構。最後，隨著公開獎酬價值 $V$ 的逐步推升，後者所對應的淺色偏好分歧區域亦將隨之顯著擴張，隱含在更大的可行參數集合中，型別間對時序制度的事後排序不再一致；因此，第 0 階段的制度結果將更依賴型別分布的細部結構與臨界點位置，而難以由單一平均比較準則加以概括。

== 混同均衡分析 <subsec-pooling-analysis>

在三種制度中，只有 $I U$ 可能出現先動行為是否傳遞型別訊號的問題：知情者先動，再由不知情者觀察 $x_I$ 後反應。相對地，$S S$ 為同時行動，$U I$ 為不知情者先動，兩者都不是由知情者向不知情者傳遞訊號的子賽局。

然而，在本文設定下，不知情者的最佳反應函數為

$
  x_U^*(x_I; V) = sqrt(V x_I) - x_I,
$

只依賴觀察到的投入 $x_I$ 與自身獎酬 $V$，不依賴對 $V_I$ 的後驗信念。因此，知情者的投入雖可被觀察，但不會透過信念更新改變不知情者的最適反應，隱含在 $I U$ 子賽局中，訊號通道雖存在於資訊結構層次，卻不影響行為方程；均衡比較回到投入與報酬本身。

#lemma(title: [不知情者的直接制度偏好])[
  $
    Xi_U
    equiv pi_U^(U I) - pi_U^(I U)
    =
    (V^2 kappa^2) / 4
    - (4 V^2 - 4 V mu + EE[V_I^2]) / (4 V).
  $ <eq-delta-u-direct>
]
<subsec-u-direct-preference>

#proof[
  由#headingref(<sec-equilibria>)可得
  $
    pi_U^(U I) = (V^2 kappa^2) / 4,
    quad
    pi_U^(I U) = (4 V^2 - 4 V mu + EE[V_I^2]) / (4 V).
  $
  兩式相減即得
  $
    Xi_U
    equiv pi_U^(U I) - pi_U^(I U)
    =
    (V^2 kappa^2) / 4
    - (4 V^2 - 4 V mu + EE[V_I^2]) / (4 V).
  $
  故 $Xi_U$ 的符號直接決定不知情者在 $U I$ 與 $I U$ 的制度排序。又因第 0 階段對 $I U$ 的偏離是與 $S S$ 比較，故其均衡條件仍為 $Delta_U^(S S) <= 0$，而非 $Xi_U$。
]

上述引理區分了制度排序與偏離誘因：$Xi_U$ 只刻畫不知情者對 $U I$ 與 $I U$ 的直接排序，並不等同於策略式賽局中的偏離條件。因此，均衡分析仍須回到 $Delta_U^(S S)$ 並與其他單邊差額聯合判斷。

在此基礎上，本文與 #c("fu2006") 的主要差異可表述為下列定理。

#theorem(title: [$I U$ 子賽局的唯一分離均衡])[
  $I U$ 子賽局的完美貝氏均衡為唯一分離均衡。
] <thm-iu-no-pooling>

#proof[
  由#headingref(<sec-equilibria>)可得，任意真實型別 $v$ 模仿任意替代型別 $s != v$ 時，其誠實行動相對於模仿行動的報酬差為

  $
    (v - s)^2 / (4 V) > 0.
  $

  因此，每一型別都嚴格偏好自己的分離行動，任何混同或半分離配置都違反誘因相容。又因分離行動在#headingref(<sec-equilibria>)已構成完美貝氏均衡，故 $I U$ 子賽局的完美貝氏均衡必為唯一分離均衡。
]

== 福利分析 <subsec-welfare>

#headingref(<subsec-stage0-analysis>)已完整刻畫第 0 階段的均衡：哪一個時序組合可由純策略 Nash 均衡支持，端視四個單邊偏離差額 $Delta_I^(U I)$、$Delta_I^(I U)$、$Delta_U^(S S)$ 與 $Delta_U^(U I)$ 的正負而定。然而均衡與社會福利是兩個不同層面的問題：均衡關心的是給定對手策略，任一參與者是否願意單邊偏離；福利關心的
則是雙方報酬之和的整體大小。在 Tullock 競賽的結構下，此一區別實益在於——獎酬本身固定，雙方投入越多，白費於競賽的資源就越多，社會剩餘就越少。因此本節進行的福利分析，等同於比較三種制度下的總投入：投入越低，越能將資源保留給最終得勝者，而非耗散在競賽過程中。

回到模型，三種制度產生的均衡投入結構各有其特徵——$S S$ 制度為同時行動，雙方在不確定對方真實獎酬的情況下選擇投入，期望投入水平由 $kappa$、$lambda$ 決定；$U I$ 制度為不知情者先動，因不知情者無法觀察 $V_I$，必須以先驗代替後驗來計算投入，事後知情者才依實現型別做出反應；$I U$ 制度則為知情者先動，每一型別在不知情者觀察後並反應選擇投入。三者在型別風險如何被吸收進均衡投入這一點上彼此不同，進而造成總效率的差異。值得注意的是，福利排序對先驗 $q$、砥柱集合的分散度 $delta$ 以及獎酬水準 $V$ 等都有非單調的依賴關係，故在一般參數空間下，不存在某一制度永遠最優的結論。

#theorem(title: [三種制度的總期望福利])[
  三種制度下的總期望福利分別為

  #set math.equation(numbering: "(1)")
  $
    EE[W^(S S)] & =
                  mu - (2 V kappa nu) / (1 + V lambda)
                  + (V^2 kappa^2) / (1 + V lambda)^2
                  + (V^3 kappa^2 lambda) / (1 + V lambda)^2,
  $ <eq-welfare-ss>

  $
    EE[W^(U I)] & =
                  mu - V kappa nu + (V^2 kappa^2) / 2,
  $ <eq-welfare-ui>

  $
    EE[W^(I U)] & =
                  V - mu + EE[V_I^2] / (2 V).
  $ <eq-welfare-iu>
  #set math.equation(numbering: none)

]

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

上述三式呈現一個清晰的結構：$EE[W^(S S)]$ 由事前期望與對稱均衡耗散項組合而成；$EE[W^(U I)]$ 在不知情者先動時，因其無法依型別微調投入，整體耗散結構由 $kappa^2$ 主導；$EE[W^(I U)]$ 則由 $V$、$mu$ 與型別二階矩 $EE[V_I^2]$ 共同刻畫，其中 $EE[V_I^2] = mu^2 + sigma^2$ 隱含分配的變異性 $sigma^2$ 直接影響福利水準。

從三式相減的結果可以看出，福利的排序與均衡的制度排序之間並不存在絕對的對應關係。例如，即使某些參數設定下 $I U$ 被確定為均衡制度，也無法由此直接推斷 $I U$ 的總福利一定高於 $S S$；同樣地，反之亦然。簡言之，均衡中得以實現的制度與能帶來較高總福利的制度，是兩個彼此分立的問題，前者不必然推導出後者。這個結果與 Tullock 競賽相關文獻中所提出的發現是一致的：優勢者的先行承諾可能導致更高程度的投入與資源耗散，而在內生時序條件下經常出現的弱者先行、強者後行安排，也不一定符合總收益最大化或設計者目標的最優解。此一觀察與尋租文獻長期的關切相互呼應：#c("leininger1993") 證明內生（序列）時序可降低租值耗散、達成較具效率的尋租結果，#c("nitzan1994") 隨後對此「更有效率的尋租」命題的成立條件提出修正與補充；而 #c("baik2013") 在不同時序假設下比較兩人懸殊競賽、#c("protopappas2023") 則分析序列競賽中行動順序的操弄，兩者皆顯示福利排序未必與均衡時序一致。準此，均衡時序的決定與其福利後果必須分開評估。故在本文的分析框架下，對不同制度進行比較時，僅僅考慮哪些制度能實現均衡仍稍顯不足，必須進一步在特定參數條件下檢驗福利效果，從而確保準確性與穩健性。

== 小結 <subsec-ch5-summary>

#headingref(<sec-analysis>)將#headingref(<sec-equilibria>)求得的三個子賽局均衡報酬代回第 0 階段的策略式賽局，並透過#headingref(<subsec-stage0-analysis>)完整刻畫了內生時序均衡。核心工具是四個單邊偏離差額 $Delta_I^(U I)$、$Delta_I^(I U)$、$Delta_U^(S S)$ 與 $Delta_U^(U I)$；前三者的正負組合直接決定哪一個時序組合可由純策略 Nash 均衡決定，而第四個差額則因 $Delta_U^(U I) >= 0$ 恆成立，條件會退化成 $V lambda = 1$ 的臨界值——隱含延後同時行動在一般參數下並不會構成均衡。在此基礎上，#headingref(<sec-analysis>)引入 $R(v)$ 函數，將知情者的事後比較拆分至型別層次：

- 在兩點分配下，$R(V_L)$ 與 $R(V_H)$ 的符號組合與機率加權即決定 $Delta_I^(I U)$ 的方向。
- 在均勻分配下，臨界點 $v^*$ 是否落在砥柱集合內決定型別空間是否一分為二。

此外，#headingref(<sec-analysis>)證明 $I U$ 子賽局僅存在唯一的分離均衡——任意真實型別與偽裝型別之間的事後報酬差距恰為 $(v - s)^2 / (4 V) > 0$，導致任何混同或半分離配置都違反誘因相容條件。在傳統訊號賽局中，分離均衡能否成立通常與型別分配的尾部、單調概似比性質等假設密切相關，但在#headingref(<sec-analysis>)的設定下這些限制全部消失，原因正是不知情者的最佳反應方程不依賴對 $V_I$ 的後驗信念。最後，#headingref(<sec-analysis>)對福利進行了獨立分析，指出三種制度下的總福利排序與均衡排序之間沒有固定的單調對應；若欲單憑特定均衡型態逕行斷定其福利效果最優，在 Tullock 競賽的部分參數區間內將會失效。

上述分離結果之所以展現出分配無關性之結果，源於#headingref(<sec-analysis>)的一個關鍵假設：不知情者的獎酬價值為公開常數 $V$。當 $V_U$ 為已知常數時，不知情者的最佳反應函數僅取決於觀察到的投入量，與其對 $V_I$ 的後驗信念無關。換言之，雖然知情者的先動行為在資訊結構上是可觀察的，卻無法透過信念更新來干預不知情者的決策行為，導致訊號傳遞機制無從發揮作用——這也正是為何#headingref(<sec-analysis>)的分離均衡恆成立，而 #c("fu2006") 中須仰賴特定分配假設才能建立的混同均衡，在本文框架下會被完全排除。

然而，此一假設隱含#headingref(<sec-analysis>)的分離結論，在 $V_U$ 與 $V_I$ 是否具備相關性這一維度上仍有待釐清。#headingref(<sec-extension>)將放寬此一假設，允許 $V_U$ 同樣作為兩點隨機變數，並與 $V_I$ 具備部分相關結構。在此更一般的環境下，不知情者在觀察到知情者的投入後，必須同時更新對 $V_I$ 與 $V_U$ 的信念，原因在於高型別訊號不僅代表知情者的競爭力較強，亦暗示不知情者自身的獎酬價值更可能處於高水準。雙向信念更新使得不知情者的行為方程不再獨立於知情者的型別，從而開啟了分離均衡崩潰的可能性。
