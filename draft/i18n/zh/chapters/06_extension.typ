#import "../thesis.typ": c, definition, headingref, lemma, proof, proposition, widetilde

#headingref(<sec-extension>)將#headingref(<sec-analysis>)的基準模型納入一個更具一般性的相關結構中。在#headingref(<subsec-pooling-analysis>)對 $I U$ 子賽局的分析中之所以得到唯一分離均衡，關鍵在於不知情者的獎酬價值固定為公開常數 $V$，導致其最佳反應僅取決於觀察到知情者的投入量，而不受對知情者型別後驗信念之影響。#headingref(<sec-extension>)放寬此一假設，將不知情者的獎酬價值與知情者均為兩點隨機變數，並允許其與知情者的型別呈正向相關。在此架構下，觀察到高型別訊號將同時隱含對手實力較強與自身獎酬價值較高雙重意涵，使得不知情者的決策不再與信念脫鉤，分離均衡也就不再必然成立。

== 部分相關結構 <subsec-ext-setup>

在#headingref(<subsec-ext-setup>)中，我們將基準模型的資訊環境進一步一般化。與#headingref(<sec-analysis>)的設定不同的是，不知情者的獎酬價值不再是已知的公開常數，而是同樣取值於同一砥柱集合的隨機變數，即 $V_U in {V_L, V_H}$。易言之，在賽局開始前，雙方對於彼此以及自身的獎酬價值均存在具關聯之不確定性。

#definition(title: [部分相關型別])[
  定義兩個條件機率

  $
    p_H equiv Pr(V_U = V_H | V_I = V_H),
    quad
    p_L equiv Pr(V_U = V_L | V_I = V_L).
  $

  $p_H$ 反映了當參賽者 $I$ 為高型別時，參賽者 $U$ 同樣身處高價值環境的機率；$p_L$ 則反映了低型別下的對稱性。據此，$(V_I, V_U)$ 的聯合機率可表述為：

  $
    Pr(V_I = V_H, V_U = V_H) & = q p_H, \
    Pr(V_I = V_H, V_U = V_L) & = q (1-p_H), \
    Pr(V_I = V_L, V_U = V_H) & = (1-q)(1-p_L), \
    Pr(V_I = V_L, V_U = V_L) & = (1-q) p_L.
  $

  以列聯表呈現則如下表所示：

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
      $V_H$, $V_L$,
      $V_H$, $q p_H$, $q (1-p_H)$,
      $V_L$, $(1-q)(1-p_L)$, $(1-q) p_L$,
    ),
    caption: [$(V_I, V_U)$ 之聯合機率分配列聯表],
    supplement: [表],
  ) <tbl-ext-joint>
] <def-partial-corr>

注意到，若要使 $V_U$ 的邊際機率分佈與 $V_I$ 保持一致，即雙方共享同一個高型別邊際機率 $q$ ($Pr(V_U = V_H) = q$)，則機率參數必須滿足以下邊際一致性限制：

$
  (1-q)(1-p_L) = q(1-p_H).
$ <eq-ext-marginal-consistency>

根據上述參數組合，我們可以將資訊結構歸納為以下三種具備理論代表性的基準狀態：

1. 統計獨立：當 $p_H = q$ 且 $p_L = 1-q$ 時，雙方的獎酬價值互不影響，此時模型退化回獎酬價值不具相關性的基本情境。
2. 完全正相關：當 $p_H = p_L = 1$ 時，雙方必然處於相同的標的環境，與 #c("fu2006") 的設定高度吻合。
3. 部分正相關：當參數滿足 $q < p_H < 1$ 且 $1-q < p_L < 1$，並符合前述邊際一致性限制時，#headingref(<sec-extension>)將在此更具一般性的環境下，探討分離均衡與混同均衡的變遷機制。

== 信念加權獎酬與最佳反應 <subsec-ext-br>

在部分相關的資訊結構下，不知情者的決策邏輯較基準模型更為複雜。由於不知情者的獎酬價值與知情者的型別存在統計相關性，因此知情者所發出的訊號 (即投入量 $x_I$) 不僅揭露了知情者自身強弱，同時也間接提供了關於不知情者獎酬的資訊。

令 $m(x_I)$ 表示不知情者在觀察到知情者的投入量 $x_I$ 後，對「對手為高型別 ($V_I = V_H$)」的後驗信念：

$
  m(x_I) equiv Pr(V_I = V_H | x_I) in [0,1].
$

給定此後驗信念 $m$，不知情者對於自身獎酬的預期不再是單一常數，而是根據機率結構加權後的有效獎酬 $hat(V)_U$：

$
  hat(V)_U(m) & = E[V_U | x_I] \
              & = m Pr(V_U | V_I = V_H) + (1-m) Pr(V_U | V_I = V_L) \
              & = m [p_H V_H + (1-p_H) V_L] + (1-m) [(1-p_L) V_H + p_L V_L].
$ <eq-vhat-u>

在此定義下，當不知情者確信知情者的型別時，其有效獎酬分別退化為特定型別下的條件期望值：

$
  hat(V)_U(1) = p_H V_H + (1-p_H) V_L,
  quad
  hat(V)_U(0) = (1-p_L) V_H + p_L V_L.
$

為了觀察信念變動如何影響有效獎酬，對 $m$ 進行一階微分可得：

$
  (d hat(V)_U(m)) / (d m)
  =
  (p_H + p_L - 1)(V_H - V_L).
$ <eq-ext-vhat-derivative>

從上式可知，有效獎酬對信念的敏感度取決於相關係數的符號。在統計獨立點 ($p_H=q, p_L=1-q$) 上，導數恰為零，代表信念更新不具備資訊價值；然而，只要雙方獎酬價值具備正相關性 ($p_H+p_L > 1$)，較高的後驗信念便會透過相關性結構，顯著提高不知情者對自身有效獎酬的預期。

基於此有效獎酬，我們可以給出不知情者在一般化環境下的最佳反應行為：

#lemma(title: [部分相關下 $U$ 的最佳反應])[
  給定知情者的投入量 $x_I > 0$ 與不知情者的後驗信念 $m in [0,1]$，不知情者的內點最佳反應函數為：

  $
    x_U^*(x_I, m) = sqrt(x_I hat(V)_U(m)) - x_I.
  $ <eq-ext-br>

  若資訊結構滿足正相關性條件，則不知情者的投入量將隨其對知情者實力評估而單調遞增。
  // 即
  // $
  //   (d x_U^*)/(d m) > 0.
  // $ <eq-ext-u-effort>
] <lem-ext-br>

#proof[
  在 Tullock 競賽的架構下，不知情者極大化其預期報酬，即

  $
    max_x_U hat(pi)_U = hat(V)_U(m) dot x_U / (x_I + x_U) - x_U
  $

  其對應的一階條件為：

  $
    (x_I hat(V)_U(m)) / (x_I + x_U)^2 = 1.
  $
  移項並解得正根後，即可得 $x_U^*(x_I, m) = sqrt(x_I hat(V)_U(m)) - x_I$。進一步分析信念對行為的邊際影響：
  $
    (d x_U^*)/(d m) & =
                      (partial x_U^*) / (partial hat(V)_U) dot (d hat(V)_U) / (d m) \
                    & =
                      (sqrt(x_I) / (2 sqrt(hat(V)_U(m)))) dot (p_H + p_L - 1)(V_H - V_L).
  $
  在 $p_H+p_L > 1$ 且獎酬價值具備異質性 ($V_H > V_L$) 的假設下，上述導數項嚴格為正 #footnote("其直覺在於：當獎酬價值具備型別正相關性時，不知情者對於「對手實力」與「自身利益」的判斷會產生連動。當不知情者觀察到知情者的投入並上修對對手為高型別的後驗信念時，由於雙方型別呈正向相關，隱含不知情者自身的獎酬價值更可能處於高水準。此種「獎品價值更高」的預期心理，抵銷了對手變強帶來的威懾效應，誘發其投入更多資源進行競爭。")。
]

== 分離均衡、誘因相容與臨界邊界 <subsec-ext-boundary>

#headingref(<subsec-ext-boundary>)旨在探討分離均衡在一般化資訊結構下的存續條件。考慮一個候選分離配置，其中高型別與低型別參賽者分別選擇不同的均衡投入量，並誘發不知情者產生以下的路徑上信念：

$
  m(x_H) = 1,
  quad
  m(x_L) = 0.
$

在此配置下，兩類型參賽者在均衡路徑上的投入水平與對應報酬分別為：

$
  x_H & = V_H^2 / (4 hat(V)_U(1)),
        quad
        pi_H & = V_H^2 / (4 hat(V)_U(1)), \
  x_L & = V_L^2 / (4 hat(V)_U(0)),
        quad
        pi_L & = V_L^2 / (4 hat(V)_U(0)).
$

分離均衡能否維持，核心在於高型別參賽者是否具備「模仿低型別」以換取對手降低投入的偏離動機。若高型別選擇偽裝成低型別，其偏離報酬表現為：

$
  widetilde(pi)_H
  =
  V_L (2 V_H - V_L) / (4 hat(V)_U(0)).
$ <eq-ext-dev-h>

據此，高型別的誘因相容條件可表示為：

$
  V_H^2 / hat(V)_U(1)
  >=
  V_L (2 V_H - V_L) / hat(V)_U(0).
$ <eq-ext-ich>

經整理，上述條件可轉換為兩類信念下有效獎酬的比值關係：

$
  hat(V)_U(1) / hat(V)_U(0) <= R = V_H^2 / (V_L (2 V_H - V_L)).
$ <eq-ext-sep-condition>

其中 $R > 1$ 為衡量型別差異程度的常數。對於低型別而言，若其模仿高型別，其偏離報酬為

$
  widetilde(pi)_L^d
  =
  V_H (2 V_L - V_H) / (4 hat(V)_U(1)).
$

因此，低型別的誘因相容條件為

$
  V_L^2 / (4 hat(V)_U(0))
  >=
  V_H (2 V_L - V_H) / (4 hat(V)_U(1)),
$

亦即

$
  hat(V)_U(1) / hat(V)_U(0)
  >=
  V_H (2 V_L - V_H) / V_L^2.
$

在本文關心的正相關區域，$hat(V)_U(1) > hat(V)_U(0)$，故左式嚴格大於 $1$；另一方面，若令 $rho equiv V_H / V_L > 1$，則右式可寫成 $2 rho - rho^2 = 1 - (rho - 1)^2 < 1$。因此，低型別的誘因相容條件自動成立，真正具約束力者僅為高型別。

#proposition(title: [分離均衡的存在條件])[
  在 $I U$ 子賽局中，純策略分離均衡存在若且唯若高型別之誘因相容條件成立。亦即，當兩類後驗信念下的有效獎酬比值低於臨界閾值 $R$ 時，分離均衡始能穩健存在：
  $
    hat(V)_U(1) / hat(V)_U(0) <= R.
  $
  若此條件失效，則高型別將因偽裝帶來的競爭優勢 (對手投入大幅下降) 超過真實型別的邊際報酬，導致分離均衡崩潰。
] <prop-ext-separation>

#proof[
  考慮#headingref(<subsec-ext-boundary>)前述的候選分離配置。若高型別誠實揭露，則其均衡報酬為

  $
    pi_H = V_H^2 / (4 hat(V)_U(1)).
  $

  若高型別改為模仿低型別，則不知情者會沿低型別路徑反應，因此其偏離報酬為

  $
    widetilde(pi)_H^d
    =
    V_L (2 V_H - V_L) / (4 hat(V)_U(0)).
  $

  因而，高型別的誘因相容條件為

  $
    pi_H >= widetilde(pi)_H^d,
  $

  也就是

  $
    V_H^2 / (4 hat(V)_U(1))
    >=
    V_L (2 V_H - V_L) / (4 hat(V)_U(0)).
  $

  兩邊同乘 $4 hat(V)_U(1) hat(V)_U(0)$ 後，可改寫為

  $
    hat(V)_U(1) / hat(V)_U(0)
    <=
    V_H^2 / (V_L (2 V_H - V_L))
    =
    R.
  $

  再看低型別。其誠實報酬為 $pi_L = V_L^2 / (4 hat(V)_U(0))$；若模仿高型別，偏離報酬為

  $
    widetilde(pi)_L^d
    =
    V_H (2 V_L - V_H) / (4 hat(V)_U(1)).
  $

  因此，低型別的誘因相容條件等價於

  $
    hat(V)_U(1) / hat(V)_U(0)
    >=
    V_H (2 V_L - V_H) / V_L^2.
  $

  在本文關心的正相關區域，$hat(V)_U(1) / hat(V)_U(0) > 1$。另一方面，令 $rho equiv V_H / V_L > 1$，則右式為

  $
    2 rho - rho^2 = 1 - (rho - 1)^2 < 1.
  $

  故低型別的誘因相容條件必然成立，不會成為約束。於是，候選分離配置能否構成純策略分離均衡，若且唯若高型別的誘因相容條件成立；等價地，若且唯若

  $
    hat(V)_U(1) / hat(V)_U(0) <= R.
  $
]

#proposition(title: [臨界邊界])[
  將高型別誘因相容條件取等號，可得臨界邊界

  $
    p_L^*(p_H)
    =
    (R V_H - V_L - p_H (V_H - V_L)) / (R (V_H - V_L)).
  $ <eq-ext-boundary>

  位於該邊界下方的點滿足分離條件；位於其上方的點則會使高型別出現有利可圖的偽裝誘因。
] <prop-ext-boundary>

#proof[
  令 $Delta V equiv V_H - V_L$。由
  $
    hat(V)_U(1) & = p_H V_H + (1-p_H) V_L \
                & = V_L + p_H Delta V,
  $
  以及
  $
    hat(V)_U(0) & = (1-p_L) V_H + p_L V_L \
                & = V_H - p_L Delta V,
  $
  把高型別誘因相容條件取等號後寫成
  $
    V_L + p_H Delta V = R (V_H - p_L Delta V).
  $
  解出 $p_L$ 即得上式的臨界邊界。
]

由@fig-ch6-phpl-regions 可見，獨立點 $(q, 1-q)$ 與完全相關點 $(1, 1)$ 分處邊界兩側，揭櫫資訊相關性如何根本性地改變賽局性質：

1. 在獨立點 $(p_H,p_L)=(q,1-q)$，有
  $
    hat(V)_U(1) = hat(V)_U(0) = q V_H + (1-q) V_L,
  $
  故比值恰為 $1<R$；該點落在區域 I，分離均衡嚴格成立。
2. 在完全相關點 $(1,1)$，有
  $
    hat(V)_U(1)=V_H,
    quad
    hat(V)_U(0)=V_L,
  $
  故比值為 $V_H/V_L > R$；該點落在區域 II，分離失敗。
3. 在部分相關情形下，比值介於 $1$ 與 $V_H/V_L$ 之間，點 $(p_H,p_L)$ 究竟落在區域 I 或 II，端視臨界邊界 $p_L^*(p_H)$ 的位置而定。圖 @fig-ch6-phpl-regions[] 中的點 $A$、$B$、$C$ 分別對應三個代表性的獨立點 $(q,1-q)$，其中 $q=0.3, 0.5, 0.7$；三點都位於區域 I 內，說明只要維持統計獨立，不論先驗如何改變，高型別誘因相容條件仍嚴格成立。

#figure(
  image("../../../figures/fig6_qs_regions.png", width: 100%),
  caption: [$(p_H, p_L)$ 平面以臨界邊界切成的兩個區域。],
  supplement: [圖],
) <fig-ch6-phpl-regions>

== 比較靜態與連續光譜 <subsec-ext-summary>

定義相關性比值函數

$
  rho(p_H, p_L) & equiv
                  hat(V)_U(1) / hat(V)_U(0) \
                & =
                  (p_H V_H + (1-p_H) V_L) / ((1-p_L) V_H + p_L V_L).
$

透過對條件機率參數進行比較靜態分析，可得：

$
  (d rho)/(d p_H) = (V_H - V_L) / hat(V)_U(0) > 0,
  quad
  (d rho)/(d p_L) = hat(V)_U(1) (V_H - V_L) / hat(V)_U(0)^2 > 0.
$

因此，提高 $p_H$ 或提高 $p_L$ 都會壓縮分離區域；然而，兩者的經濟意涵截然不同：$p_H$ 的上升增加了如實揭露型別時所面臨的對手競爭強度 (負向推力)；而 $p_L$ 的上升則降低了偽裝成低型別時所面對的對手強度 (正向拉力)。由於梯度之比

$
  ((d rho)/(d p_L)) / ((d rho)/(d p_H))
  =
  rho(p_H, p_L)
  >= 1,
$

顯示在正相關區域內，$p_L$ 的邊際變動對分離均衡的破壞力更勝於 $p_H$。

最後，若納入邊際一致性限制，則所有經濟上可行的參數組合將構成一條連接「獨立」與「完全相關」的路徑。沿著此路徑移動，即展現了從本文基準模型平滑過渡至 #c("fu2006") 設定的連續光譜，不僅可證明本文模型具備更廣泛的參數解釋力，亦顯示了傳統文獻中的混合均衡，實則為本框架下分離均衡崩潰後的特定退化結果。
