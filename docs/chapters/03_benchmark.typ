#import "../thesis.typ": SS, c, definition, headingref, impt, proof, proposition, stmtref, term, widetilde

本章處理 $V_I perp V_U$ 的#term("獨立同分配", english: "independent and identically distributed") benchmark。當知情者的投入揭示 $V_I$ 時，不知情者對自身獎酬的後驗期望仍維持不變；因此，本章作為後續部分相關模型的零相關比較基準。

== 基準模型：獎酬型別之獨立同分配 <subsec-iid-benchmark>

本文延續 #c("fu2006") 之符號設定，以 $I$ 表示知情者、$U$ 表示不知情者。令 $V_I, V_U in {v_H, v_L}$，且 $v_H > v_L > 0$。

在基準模型中，$V_I$ 與 $V_U$ 彼此獨立且同分配。若高型別出現的機率為 $q in (0,1)$，則有

$
  Pr(V_I = v_H) & = Pr(V_U = v_H) = q, \
  Pr(V_I = v_L) & = Pr(V_U = v_L) = 1 - q.
$

以下若以 $v_i$ 或 $v_j$ 表示型別值，均約定 $i,j in {H,L}$；在獨立同分配設定下，

$
  Pr(V_I = v_i, V_U = v_j) = Pr(V_I = v_i) Pr(V_U = v_j).
$

其 joint distribution 可寫為下列列聯表：

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
    $v_H$, $v_L$,
    $v_H$, $q^2$, $q(1-q)$,
    $v_L$, $q(1-q)$, $(1-q)^2$,
  ),
  caption: [$(V_I, V_U)$ 之聯合機率分配列聯表 (基準模型)],
  supplement: [表],
) <tbl-benchmark-joint>

第 0 階段，兩位參與者同時選擇行動時點；此時尚未觀察型別。待時序確定後，自然決定 $(V_I, V_U)$ 的實現值。知情者在投入前觀察自身獎酬 $v_I$；不知情者僅知其分配與資訊結構。

本文沿用 #c("hamilton1990") 與 #c("fu2006") 的兩期承諾架構。若雙方選擇於同一期投入，則形成同時行動的 SS 時序；若不知情者先動、知情者後動，則形成 UI 時序；若知情者先動、不知情者後動，則形成 IU 時序。

== 子賽局均衡 <subsec-bench-subgame-equilibria>

由於 $V_I perp V_U$，本章中 $widetilde(V)_U (mu) = overline(v)$ 對所有後驗信念 $mu$ 成立，其中 $overline(v) = q v_H + (1-q) v_L$。因此，不知情者在三個子賽局中的有效獎酬均為無條件期望值 $overline(v)$。以下分別刻畫 SS、UI 與 IU 三個子賽局之均衡。

#definition(title: [事前期望報酬])[
  在第 0 階段，知情者尚未觀察自身型別之實現值，不知情者全程無法直接觀察型別。因此，時序比較須以型別實現前的期望報酬為依據，稱為#term("事前期望報酬", english: "ex ante payoff")。對知情者而言，其在時序 $J in {SS, U I, I U}$ 下之事前期望報酬定義為
  $
    widetilde(pi)_I^(J) equiv q pi_I^(J)(v_H) + (1-q) pi_I^(J)(v_L),
  $
  其中 $pi_I^(J)(v)$ 為型別 $v$ 知情者在時序 $J$ 下的均衡報酬。不知情者本身不掌握型別資訊，其均衡報酬直接即為事前期望報酬，記為 $widetilde(pi)_U^(J)$。
] <def-bench-ex-ante-payoff>

均衡結構因而由複合係數 $hat(A)$ 與 $hat(B)$ 簡潔表達。定義兩個彙整均衡公式的複合係數：

$
  hat(A)
  equiv overline(v) (q / sqrt(v_H) + (1-q) / sqrt(v_L)),
  quad
  hat(B)
  equiv overline(v) (q / v_H + (1-q) / v_L).
$ <eq-bench-a0b0>

由 Jensen 不等式，$hat(B) = overline(v) dot EE[1\/V_I] >= overline(v) \/ EE[V_I] = 1$，等號成立若且唯若 $V_I$ 退化為常數。

=== SS 子賽局 <subsubsec-bench-ss>

首先考慮雙方同時投入的 SS 時序。在此子賽局中，知情者雖已觀察自身型別，並可依型別選擇不同投入；不知情者則無法在行動前觀察任何來自知情者的投入訊號，故其決策必須建立在事前資訊之上。在獨立同分配基準模型下，由於型別彼此獨立，後驗信念的更新不影響不知情者的最佳反應。

#proposition(
  title: [SS 子賽局之均衡: 基準模型],
)[
  在獨立同分配基準模型的 SS 子賽局中，若均衡位於內點，則不知情者之均衡投入為
  $
    x_U^(SS) = hat(A)^2 / (1 + hat(B))^2.
  $
  型別 $v in {v_H, v_L}$ 之知情者均衡投入為
  $
    x_I^(SS)(v) = sqrt(v) hat(A) / (1 + hat(B)) - hat(A)^2 / (1 + hat(B))^2.
  $
  對應之知情者#term("各型別報酬", english: "type-contingent payoff")與不知情者事前期望報酬分別為
  $
    pi_I^(SS)(v) = (sqrt(v) - hat(A) / (1 + hat(B)))^2,
    quad
    widetilde(pi)_U^(SS) = hat(A)^2 hat(B) / (1 + hat(B))^2.
  $
] <prop-bench-ss-equilibrium>

#proof[
  給定不知情者均衡投入 $x_U^*$，型別 $v$ 知情者以 $x_I^*(v) = sqrt(v x_U^*) - x_U^*$ 作為最佳反應 (若內點解存在)。在 Nash 均衡中，不知情者將知情者策略 $x_I^*(v)$ 取為既定，解事前極大化問題

  $
    max_(x_U >= 0)
    overline(v) [q x_U / (x_I^*(v_H) + x_U) + (1-q) x_U / (x_I^*(v_L) + x_U)] - x_U,
  $

  其中獨立性確保 $EE[V_U | x_I] = overline(v)$。對上式取關於 $x_U$ 之一階條件，在均衡處令 $x_U = x_U^*$ 並代入 $x_I^*(v) + x_U^* = sqrt(v x_U^*)$，可得

  $
    overline(v) [q (sqrt(v_H x_U^*) - x_U^*) / (v_H x_U^*) + (1-q) (sqrt(v_L x_U^*) - x_U^*) / (v_L x_U^*)] = 1.
  $

  整理後即為 $hat(A) \/ sqrt(x_U^*) - hat(B) = 1$，解得 $sqrt(x_U^(SS)) = hat(A) \/ (1 + hat(B))$，從而得 $x_U^(SS)$ 與 $x_I^(SS)(v)$。代回報酬函數可得 $pi_I^(SS)(v)$ 與 $widetilde(pi)_U^(SS)$。
]

=== UI 子賽局 <subsubsec-bench-ui>

接著考慮不知情者先行投入的 UI 時序。在此子賽局中，不知情者先選擇投入 $x_U$，此時尚無法觀察知情者型別；知情者在觀察到 $x_U$ 後，依其型別 $v in {v_H, v_L}$ 選擇最佳反應。UI 時序同樣不涉及訊號傳遞所引發的後驗信念更新——不知情者先動而無訊號可循，知情者後動而型別已知，無需推斷對手資訊。在獨立同分配基準模型下，此一特性使先行者優勢純粹反映行動次序，而不涉及任何資訊揭露效果。

#proposition(
  title: [UI 子賽局之均衡: 基準模型],
)[
  在獨立同分配基準模型的 UI 子賽局中，若均衡位於內點，則不知情者之均衡投入為
  $
    x_U^(U I) = hat(A)^2 / 4.
  $
  型別 $v in {v_H, v_L}$ 之知情者均衡投入為
  $
    x_I^(U I)(v) = sqrt(v) hat(A) / 2 - hat(A)^2 / 4.
  $
  對應之知情者各型別報酬與不知情者事前期望報酬分別為
  $
    pi_I^(U I)(v) = (sqrt(v) - hat(A) / 2)^2,
    quad
    widetilde(pi)_U^(U I) = hat(A)^2 / 4.
  $
] <prop-bench-ui-equilibrium>

#proof[
  不知情者先承諾 $x_U$，知情者觀察後以 $x_I^*(v; x_U) = sqrt(v x_U) - x_U$ 最佳反應。不知情者預期知情者之反應，其目標函數化簡為

  $
    widetilde(pi)_U^(U I)(x_U)
    = overline(v) [q x_U / sqrt(v_H x_U) + (1-q) x_U / sqrt(v_L x_U)] - x_U
    = hat(A) sqrt(x_U) - x_U.
  $

  一階條件 $hat(A) \/ (2 sqrt(x_U)) = 1$ 給出 $x_U^(U I) = hat(A)^2 \/ 4$，其餘結果由代入得到。
]

UI 與 SS 的差異在於不知情者的決策架構：在 SS 中，不知情者取知情者的均衡策略為既定常數，一階條件因而包含型別加權的贏率成本項 $hat(B)$；在 UI 中，不知情者先行鎖定 $x_U$，知情者之反應被代入目標函數，該迴圈消失，目標函數化為 $hat(A) sqrt(x_U) - x_U$。由此可得

$
  widetilde(pi)_U^(U I) - widetilde(pi)_U^(SS)
  = hat(A)^2 / 4 - hat(A)^2 hat(B) / (1 + hat(B))^2
  = hat(A)^2 (1 - hat(B))^2 / (4(1 + hat(B))^2)
  >= 0,
$ <eq-bench-ui-vs-ss>

等號成立若且唯若 $hat(B) = 1$，即 $V_I$ 退化為常數。因此，不知情者在獨立同分配基準模型下恆弱偏好 UI 時序。

=== IU 子賽局 <subsubsec-bench-iu>

最後考慮知情者先行投入的 IU 時序。與 SS、UI 不同，IU 子賽局中知情者的投入先於不知情者行動而成為可觀察訊號；不知情者觀察 $x_I$ 後形成後驗信念 $mu$，並依此選擇投入。然而，在獨立同分配基準模型下，$widetilde(V)_U (mu) = overline(v)$ 對所有後驗信念 $mu$ 恆成立，不知情者之最佳反應因而不受後驗信念影響，訊號—信念—反應鏈條在此被切斷。這直接導致誘因相容條件以閉式嚴格成立。

#proposition(
  title: [IU 子賽局之唯一分離均衡: 基準模型],
)[
  在獨立同分配基準模型的 IU 子賽局中，存在唯一之完美貝氏均衡，即以下分離均衡：型別 $v in {v_H, v_L}$ 之知情者均衡投入為

  $
    x_I^(I U)(v) = v^2 / (4 overline(v)).
  $

  不知情者之後續最佳反應為

  $
    x_U^(I U)(v) = v (2 overline(v) - v) / (4 overline(v)).
  $

  對應報酬為

  $
    pi_I^(I U)(v) = v^2 / (4 overline(v)),
    quad
    pi_U^(I U)(v) = (2 overline(v) - v)^2 / (4 overline(v)).
  $

  混同均衡與半分離均衡均不存在。
] <prop-bench-iu-equilibrium>

#proof[
  由於 $widetilde(V)_U (mu) = overline(v)$ 與 $mu$ 無關，不知情者對任意 $x_I > 0$ 的最佳反應均為 $x_U^*(x_I) = sqrt(x_I overline(v)) - x_I$。知情者面對的延續報酬因而化為

  $
    pi_I (x_I; v) = v sqrt(x_I / overline(v)) - x_I,
  $

  其關於 $x_I$ 之一階條件給出 $x_I^(I U)(v) = v^2 \/ (4 overline(v))$，從而得 $x_U^(I U)(v)$ 與各型別報酬。

  分離均衡須滿足雙向誘因相容條件。設 $mu(x_H) = 1$、$mu(x_L) = 0$，均衡路徑外信念取 $mu(x) = 1$。

  第一，#impt("高型別模仿低型別")之誘因差額：若高型別以 $x_L = v_L^2 \/ (4 overline(v))$ 行動，不知情者形成信念 $mu = 0$ 並以 $sqrt(x_L overline(v)) - x_L = v_L (2 overline(v) - v_L) \/ (4 overline(v))$ 回應，高型別之模仿報酬為 $v_H v_L \/ (2 overline(v)) - v_L^2 \/ (4 overline(v))$。誘因差額為
  $
    v_H^2 / (4 overline(v)) - (v_H v_L / (2 overline(v)) - v_L^2 / (4 overline(v))) = (v_H - v_L)^2 / (4 overline(v)) > 0.
  $

  第二，#impt("低型別模仿高型別")之誘因差額：若低型別以 $x_H = v_H^2 \/ (4 overline(v))$ 行動，不知情者形成信念 $mu = 1$ 並以 $v_H (2 overline(v) - v_H) \/ (4 overline(v))$ 回應，低型別之模仿報酬為 $v_H v_L \/ (2 overline(v)) - v_H^2 \/ (4 overline(v))$。誘因差額為
  $
    v_L^2 / (4 overline(v)) - (v_H v_L / (2 overline(v)) - v_H^2 / (4 overline(v))) = (v_H - v_L)^2 / (4 overline(v)) > 0.
  $

  兩條誘因差額均嚴格為正且與先驗機率 $q$ 無關，故分離均衡在任意 $q in (0,1)$ 下恆成立。

  最後排除混同與半分離均衡。由於 $V_I perp V_U$ 使 $widetilde(V)_U (mu) = overline(v)$ 與後驗信念無關，型別 $v$ 知情者之延續報酬為
  $
    pi_I (x_I; v) = v sqrt(x_I \/ overline(v)) - x_I,
  $
  其關於 $x_I$ 嚴格凹，唯一最適投入為 $v^2 \/ (4 overline(v))$。由於 $v_H eq.not v_L$，兩型別之唯一最適投入互異，故不存在可同時使兩型別皆採最適反應的共同投入 $x_P$。因此，混同均衡與半分離均衡均不存在。
]

此結果的核心在於誘因差額之閉式表達式 $(v_H - v_L)^2 \/ (4 overline(v))$：其值僅取決於型別間距與事前均值，與先驗機率 $q$ 及分配形式均無關。此一與信念無關的常數差額，正是 $widetilde(V)_U (mu) = overline(v)$ 對所有 $mu$ 恆成立所帶來的結構性簡化：不知情者之最佳反應強度不受後驗信念影響，故高、低型別各自選擇分離投入時所能獲取的報酬純粹由自身型別決定。

== 內生時序均衡 <subsec-bench-endogenous-timing>

承接前節三個子賽局之均衡報酬，本節分析第 0 階段的時序選擇。由#stmtref(<prop-bench-iu-equilibrium>, "命題", "proposition-counter")可知，IU 子賽局之完美貝氏均衡唯一且為分離均衡，各時序下的事前報酬可直接代入。以下以四個單邊偏離差額刻畫時序比較：

#definition(title: [單邊偏離差額])[
  令 $Delta_i^(J)$ 表示參賽者 $i in {I, U}$ 在給定對手時點選擇下，單邊偏離至時序 $J$ 時的報酬差額，定義為偏離後報酬減去偏離前報酬。於本章之 $2 times 2$ 時序賽局中，實際用到的四個差額為

  $
    Delta_I^(U I) equiv widetilde(pi)_I^(U I) - widetilde(pi)_I^(SS),
    quad
    Delta_I^(I U) equiv widetilde(pi)_I^(I U) - widetilde(pi)_I^(SS),
  $
  $
    Delta_U^(U I) equiv widetilde(pi)_U^(U I) - widetilde(pi)_U^(SS),
    quad
    Delta_U^(SS) equiv widetilde(pi)_U^(SS) - widetilde(pi)_U^(I U).
  $

  若差額為正，表示該參賽者有偏離誘因；若差額為負，則表示其不願偏離。
] <def-bench-deviation>

其中事前期望報酬整理如下：

$
   widetilde(pi)_I^(SS) & = q pi_I^(SS)(v_H) + (1-q) pi_I^(SS)(v_L), \
  widetilde(pi)_I^(U I) & = q pi_I^(U I)(v_H) + (1-q) pi_I^(U I)(v_L), \
  widetilde(pi)_I^(I U) & = (q v_H^2 + (1-q) v_L^2) / (4 overline(v)) = EE[V_I^2] / (4 overline(v)).
$

由前述 UI 與 SS 之報酬差可直接得到

$
  Delta_U^(U I)
  = hat(A)^2 (1 - hat(B))^2 / (4(1 + hat(B))^2)
  >= 0,
$

等號成立若且唯若 $hat(B) = 1$，即 $V_I$ 退化。因此，不知情者在獨立同分配基準模型下弱偏好 UI 時序。$Delta_I^(U I)$ 與 $Delta_I^(I U)$ 的正負取決於 $v_H$、$v_L$、$q$ 的具體數值，無法由 $hat(B) >= 1$ 單獨確定。

#proposition(
  title: [第 0 階段純策略均衡: 基準模型],
)[
  在獨立同分配基準模型中，第 0 階段之純策略 Nash 均衡以下列條件完全刻畫：

  #set enum(numbering: "(1)")

  + UI 若且唯若 $Delta_I^(U I) >= 0$；
  + SS (立即) 若且唯若 $Delta_I^(U I) <= 0$ 且 $Delta_U^(SS) >= 0$；
  + IU 若且唯若 $Delta_I^(I U) >= 0$ 且 $Delta_U^(SS) <= 0$。
] <prop-bench-timing>

在獨立同分配基準模型下，知情者的時序偏好純粹由事前期望報酬的大小決定，IU 子賽局之唯一分離均衡確保該時序下的事前報酬無需區分均衡型態，不涉及訊號扭曲。

== 小結 <subsec-bench-summary>

本章在獨立同分配基準模型下完整刻畫了三個子賽局的均衡結構。SS 與 UI 子賽局之均衡報酬由複合係數 $hat(A)$、$hat(B)$ 統一表達，使型別加權邊際效果得以在同一參數骨架下比較。不知情者在 UI 時序下的事前期望報酬不低於 SS，其差額 $hat(A)^2 (1 - hat(B))^2 \/ (4(1+hat(B))^2)$ 嚴格反映先行承諾所消除的雙向競爭壓力。IU 子賽局則存在唯一分離均衡：由於 $widetilde(V)_U (mu) = overline(v)$ 與後驗信念無關，高、低型別的雙向模仿差額均等於 $(v_H - v_L)^2 \/ (4 overline(v))$，此一常數與先驗機率 $q$ 及分配形式均無關，構成訊號機制關閉時的理論基準。

本章的核心貢獻在於透過獨立性假設隔離訊號傳導，為後續#headingref(<sec-analysis>)的比較提供清晰的起點。在基準模型中，投入所誘發的後驗信念雖仍依貝氏法則更新，卻不改變不知情者的最佳反應，訊號—信念—反應鏈條在此被完全切斷。因此，第 0 階段的時序選擇完全由#stmtref(<def-bench-deviation>, "定義", "definition-counter")所定義之四個單邊偏離差額的正負決定，無需區分均衡型態，亦不涉及分離扭曲。任何後續模型中相對於此基準所額外出現的揭露成本、分離扭曲或時序翻轉，均可歸因於資訊相關性所恢復的信念反應機制，而非資訊不對稱本身。
