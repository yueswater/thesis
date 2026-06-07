#import "../thesis.typ": c, ca, definition, example, headingref, lemma, proposition, widetilde

#headingref(<sec-analysis>)將#headingref(<sec-model>)的獨立同分配基準模型納入一個更具一般性的相關結構中。在基準模型中，$V_I$ 與 $V_U$ 具有相同邊際分配但彼此統計獨立；因此，即使不知情者能由知情者的投入推論其型別，該推論也不會改變其對自身獎酬的條件期望，訊號—信念—反應通道在基準情形下被關閉。

本章進一步允許 $V_I$ 與 $V_U$ 呈現正相關，並以單一相關參數 $rho in [0,1]$ 描述從統計獨立到完全相關的連續變化。在此架構下，知情者的投入不僅揭露其自身型別，也同時改變不知情者對自身獎酬的評估，分離均衡因此不再必然成立，混同均衡與並存區域亦隨之浮現。本文以單一相關參數 $rho in [0, 1]$ 描述從統計獨立到完全相關的光譜，而 #c("fu2006") 所處理的完全相關設定是 $rho = 1$ 端點上的特殊情形。

== 部分相關結構 <subsec-main-setup>

在#headingref(<subsec-main-setup>)中，我們將基準模型的資訊環境進一步一般化。與#headingref(<sec-model>)的獨立同分配基準不同的是，本章不再假設 $V_I$ 與 $V_U$ 統計獨立，而是允許兩者在維持相同邊際分配的前提下呈現正相關。本文進一步假設雙方共享同一高型別邊際機率 $q$，亦即 $Pr(V_I = v_H) = Pr(V_U = v_H) = q$；在此對稱邊際之下，$(V_I, V_U)$ 的聯合分配僅剩單一自由度，恰可由兩變數間的相關係數完整描述。

#definition(title: [相關型別與相關參數])[
  令 $H_I equiv bb(1){V_I = v_H}$ 與 $H_U equiv bb(1){V_U = v_H}$ 為兩個服從 Bernoulli$(q)$ 的指示變數，並以單一參數 $rho in [0, 1]$ 表示兩者之（皮爾森）相關係數。則 $(V_I, V_U)$ 的聯合分配由對角質量

  $
    a equiv Pr(V_I = v_H, V_U = v_H) = q^2 + rho q (1-q)
  $ <eq-main-joint-a>

  完全決定。在對稱邊際 $Pr(V_I = v_H) = Pr(V_U = v_H) = q$ 之下，其餘三格機率隨之確定：

  $
    Pr(V_I = v_H, V_U = v_H) & = q^2 + rho q (1-q), \
    Pr(V_I = v_H, V_U = v_L) & = q (1-q)(1 - rho), \
    Pr(V_I = v_L, V_U = v_H) & = q (1-q)(1 - rho), \
    Pr(V_I = v_L, V_U = v_L) & = (1-q)^2 + rho q (1-q).
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
      $v_H$, $v_L$,
      $v_H$, $q^2 + rho q (1-q)$, $q (1-q)(1-rho)$,
      $v_L$, $q (1-q)(1-rho)$, $(1-q)^2 + rho q (1-q)$,
    ),
    caption: [$(V_I, V_U)$ 之聯合機率分配列聯表],
    supplement: [表],
  ) <tbl-main-joint>
] <def-partial-corr>

由聯合分配可直接導出兩個條件機率，它們都成為相關參數 $rho$ 的乾淨線性函數：

#[
  #set math.equation(numbering: "(1)")
  $
    theta_H & equiv Pr(V_U = v_H | V_I = v_H) = q + rho (1-q),
              quad \
    theta_L & equiv Pr(V_U = v_H | V_I = v_L) = q (1 - rho).
  $ <eq-main-cond-from-rho>
]依 $rho$ 的取值，三種特殊情形值得指出：

1. 統計獨立（$rho = 0$）：$a = q^2$，雙方獎酬互不影響，模型回到不具相關性的基準。
2. 完全正相關（$rho = 1$）：$a = q$，兩個非對角機率歸零，雙方必然同型，對應 #c("fu2006") 的設定。
3. 部分正相關（$0 < rho < 1$）：本章的核心分析範圍，探討分離均衡與混同均衡如何隨相關性連續變遷。

== 信念加權獎酬與最佳反應 <subsec-main-br>

在部分相關的資訊結構下，不知情者的決策邏輯較基準模型更為複雜。由於不知情者的獎酬價值與知情者的型別存在統計相關性，因此知情者所發出的訊號 (即投入量 $x_I$) 不僅揭露了知情者自身強弱，同時也間接提供了關於不知情者獎酬的資訊。

令 $m(x_I)$ 表示不知情者在觀察到知情者的投入量 $x_I$ 後，對對手為高型別 ($V_I = v_H$) 的後驗信念：

$
  m(x_I) equiv Pr(V_I = v_H | x_I) in [0,1].
$

給定此後驗信念 $m$，不知情者對於自身獎酬的預期不再是固定值，而是依相關結構加權後的有效獎酬 $hat(V)_U$。將條件機率的單參數表達式 @eq-main-cond-from-rho 代入後，有效獎酬可化為 $rho$ 與 $m$ 的簡潔形式（令 $Delta V equiv v_H - v_L$）：

#[
  #set math.equation(numbering: "(1)")
  $
    hat(V)_U(m) & = E[V_U | x_I] \
                & = m [theta_H v_H + (1-theta_H) v_L] + (1-m) [theta_L v_H + (1-theta_L) v_L] \
                & = v_L + [q + rho (m - q)] Delta V.
  $ <eq-vhat-u>
]

兩個特殊信念下，有效獎酬分別為

$
  hat(V)_U(1) = v_L + [q + rho (1-q)] Delta V,
  quad
  hat(V)_U(0) = v_L + q (1 - rho) Delta V.
$

當不知情者維持先驗信念 $m = q$ 時，有效獎酬等於無條件期望，與相關性無關：

#[
  #set math.equation(numbering: "(1)")
  $
    hat(V)_U(q) = v_L + q Delta V = q v_H + (1-q) v_L.
  $ <eq-vhat-q>
]

對 $m$ 微分得：

#[
  #set math.equation(numbering: "(1)")
  $
    (d hat(V)_U(m)) / (d m)
    =
    rho Delta V.
  $ <eq-main-vhat-derivative>
]

有效獎酬對信念的敏感度由 $rho Delta V$ 決定。$rho = 0$ 時導數為零，信念更新不影響不知情者的行為；只要 $rho > 0$，後驗信念上升便會按比例 $rho Delta V$ 提高其對自身獎酬的預期。

基於此有效獎酬，我們可以給出不知情者在一般化環境下的最佳反應行為：

#lemma(title: [部分相關下不知情者的最佳反應])[
  給定 $x_I > 0$ 與後驗信念 $m in [0,1]$，不知情者的最佳反應為

  $
    x_U^*(x_I, m) = sqrt(x_I hat(V)_U(m)) - x_I.
  $ <eq-main-br>
] <lem-main-br>

（見附錄。）

#example(title: [部分相關對最佳反應的影響])[
  以 $v_H = 2$、$v_L = 1$、$q = 0.5$ 為基準，對比統計獨立 ($rho = 0$) 與正相關 ($rho = 0.6$) 兩種情境，可直觀呈現引理的核心差異。在統計獨立下，有效獎酬 $hat(V)_U(m) = q v_H + (1-q) v_L = 1.5$ 與信念 $m$ 無關，故對任意觀察到的 $x_I = 1$，不知情者的最佳反應恆為 $x_U^* = sqrt(1.5) - 1 approx 0.225$，與基準模型完全一致。反觀 $rho = 0.6$ 的情境，$hat(V)_U(0) = 1.2$ 而 $hat(V)_U(1) = 1.8$（對應條件機率 $theta_H = 0.8$、$theta_L = 0.2$），因此當不知情者從確信對手為低型別 ($m = 0$) 轉變至確信對手為高型別 ($m = 1$) 時，其最佳反應從 $sqrt(1.2) - 1 approx 0.095$ 躍升至 $sqrt(1.8) - 1 approx 0.342$，增幅超過三倍。
]

上述反差揭示了一個有別於標準競賽直覺的雙重推斷機制。在一般競賽中，觀察到對手投入增加通常誘發不知情者降低投入 (威懾效應)；然而在正相關的環境下，高強度投入所傳遞的對手為高型別訊號，同步意味著不知情者自身的獎酬也更可能是 $v_H$。正是獎品價值更高的激勵效應抵銷乃至超越了威懾效應，才使得 $d x_U^* \/ d m > 0$ 得以成立。這一機制是後文分析的核心：不知情者面對高型別訊號時不再退縮，分離均衡的存在條件因此需要重新檢驗。

== 分離均衡、誘因相容與臨界邊界 <subsec-main-boundary>

#headingref(<subsec-main-boundary>)旨在探討分離均衡在一般化資訊結構下的存續條件。考慮以下分離配置，其中高型別與低型別參賽者分別選擇不同的均衡投入量，並誘發不知情者產生以下的路徑上信念：

$
  m(x_H) = 1,
  quad
  m(x_L) = 0.
$

在此配置下，兩類型參賽者在均衡路徑上的投入水平與對應報酬分別為：

$
  x_H & = v_H^2 / (4 hat(V)_U(1)),
        quad
        pi_H & = v_H^2 / (4 hat(V)_U(1)), \
  x_L & = v_L^2 / (4 hat(V)_U(0)),
        quad
        pi_L & = v_L^2 / (4 hat(V)_U(0)).
$

分離均衡能否維持，核心在於高型別參賽者是否具備模仿低型別、以換取對手降低投入的偏離動機。若高型別選擇偽裝成低型別，其偏離報酬表現為：

$
  widetilde(pi)_H
  =
  (v_L (2 v_H - v_L)) / (4 hat(V)_U(0)).
$ <eq-main-dev-h>

據此，高型別的誘因相容條件可表示為：

$
  v_H^2 / hat(V)_U(1)
  >=
  (v_L (2 v_H - v_L)) / hat(V)_U(0).
$ <eq-main-ich>

經整理後，上述條件可轉換為兩類信念下有效獎酬的比值關係：

#[
  #set math.equation(numbering: "(1)")
  $
    hat(V)_U(1) / hat(V)_U(0) <= R = v_H^2 / (v_L (2 v_H - v_L)).
  $ <eq-main-sep-condition>
]

其中 $R > 1$ 為衡量型別差異程度的常數。對於低型別而言，若其模仿高型別，其偏離報酬為

$
  widetilde(pi)_L^d
  =
  (v_H (2 v_L - v_H)) / (4 hat(V)_U(1)).
$

因此，低型別的誘因相容條件為

$
  v_L^2 / (4 hat(V)_U(0))
  >=
  (v_H (2 v_L - v_H)) / (4 hat(V)_U(1)),
$

亦即

$
  hat(V)_U(1) / hat(V)_U(0)
  >=
  (v_H (2 v_L - v_H)) / v_L^2.
$

在本文關心的正相關區域，$hat(V)_U(1) > hat(V)_U(0)$，故左式嚴格大於 $1$；另一方面，若令 $k equiv v_H \/ v_L > 1$，則右式可寫成 $2 k - k^2 = 1 - (k - 1)^2 < 1$。低型別的誘因相容條件在正相關區域恆成立，原因在於其獎酬價值 $v_L$ 較低，若欲模仿高型別的產出水平，其面臨的邊際成本將遠超其邊際收益，導致向上模仿在經濟上不具效益；高型別面臨的狀況則截然不同，若其偽裝成低型別，雖會降低勝率，卻能有效誘發不知情者降低投入量。此種以弱示弱所產生的策略優勢 (誘使對手撤防)，在特定條件下可能超過誠實揭露型別的報酬。因此，低型別的誘因相容條件自動成立，真正具約束力者僅為高型別，其行為受限於臨界值 $R$。

#proposition(title: [分離均衡存在條件])[
  $I U$ 子賽局的純策略分離均衡存在若且唯若
  $
    hat(V)_U(1) / hat(V)_U(0) <= R equiv v_H^2 / (v_L (2 v_H - v_L)).
  $
] <prop-main-separation>

（見附錄。）

由於有效獎酬比值是相關參數 $rho$ 的單調函數，分離條件 @eq-main-sep-condition 可進一步化為對 $rho$ 的單一線性方程，並解出唯一的臨界相關度。

#proposition(title: [分離臨界相關度])[
  唯一的分離臨界相關度為

  #[
    #set math.equation(numbering: "(1)")
    $
      rho^*
      =
      ((R - 1) hat(V)_U(q)) / (Delta V (1 - q + R q)),
      quad
      hat(V)_U(q) = v_L + q Delta V.
    $ <eq-main-boundary>
  ]

  分離均衡存在若且唯若 $rho <= rho^*$。
] <prop-main-boundary>

（見附錄。）

在未扭曲分離失效（$rho > rho^*$）後，分離結構並非全面崩潰。本節說明：低型別向下扭曲投入仍可使高型別喪失模仿誘因，從而在更寬廣的相關度範圍支持分離均衡——代價是低型別承受訊號成本。

在訊號賽局文獻中，低型別的最低成本分離行動——亦即使高型別誘因相容條件恰好綁住的最小訊號量——被稱為 Riley 結果。D1 準則在一般單調訊號賽局中唯一選出此結果（見命題「D1 準則唯一選出 Riley 結果」）；相關討論可參見 #c("riley1979") 與 #c("cho1987")。

#proposition(title: [最低成本扭曲分離])[
  考慮高型別打未扭曲最佳反應 $x_H = v_H^2 \/ (4 hat(V)_U(1))$，低型別打一個被壓低的投入 $x_L' <= x_L^*$（其中 $x_L^* = v_L^2 \/ (4 hat(V)_U(0))$ 為未扭曲最佳），並以分離信念 $m(x_H) = 1$、$m(x_L') = 0$ 支撐的候選分離配置。

  （i）*高型別 IC*：高型別不模仿低型別的條件等價於

  $
    sqrt(x_L') <= z_H^- equiv v_H / (2 sqrt(hat(V)_U(0))) (1 - sqrt(alpha_"sep")),
    quad
    alpha_"sep" equiv 1 - hat(V)_U(0) / hat(V)_U(1).
  $

  （ii）*低型別 IC*：在 $v_H >= 2 v_L$ 之條件下，低型別向上模仿的偏離報酬

  $
    pi_L^"dev" = v_H (2 v_L - v_H) / (4 hat(V)_U(1)) <= 0,
  $

  低型別 IC 對所有 $rho$ 自動成立。

  （iii）*Riley 結果*：D1 精煉（見#headingref(<subsec-main-refinement>)）在扭曲分離族中唯一選出最低成本均衡

  $
    x_L^"Riley" = (z_H^-)^2 = v_H^2 / (4 hat(V)_U(0)) (1 - sqrt(alpha_"sep"))^2.
  $

  （iv）*存活範圍*：在基準參數 $v_H = 2 v_L$ 下，$pi_L^"dev" = 0$，低型別 IC 在等號成立，扭曲分離對所有 $rho in (0, 1]$ 存活，故 $rho^(**) = 1$。
] <prop-main-distorted-sep>

（見附錄。）

#example(title: [臨界相關度處的 Riley 結果])[
  在基準參數下，$alpha_"sep" bar_(rho = rho^*) = 1/4$，從而

  $
    x_L^"Riley" bar_(rho = rho^*) = v_H^2 / (4 hat(V)_U(0)) (1 - 1/2)^2 = 4 / (4 dot 9/7) dot 1/4 = 7/36 approx 0.194.
  $

  注意 $x_L^* bar_(rho = rho^*) = v_L^2 \/ (4 hat(V)_U(0)) = 7/36$，Riley 結果與未扭曲最佳在 $rho^*$ 處精確重合：臨界 $rho^*$ 上扭曲恰好為零，兩段分離結構平滑銜接。由於扭曲分離對所有 $rho in (0,1]$ 存活，純混同的「區域 II」在基準參數 $v_H = 2 v_L$ 下退化為空集，完整的均衡形態劃分見#headingref(<subsec-main-timing>)。
]

由@fig-main-spectrum 可見，有效獎酬比值 $hat(V)_U(1) \/ hat(V)_U(0)$ 沿 $rho in [0, 1]$ 單調上升，並在 $rho^*$ 處唯一穿越臨界 $R$，說明資訊相關性如何改變賽局性質：

1. 在獨立端點 $rho = 0$，有 $hat(V)_U(1) = hat(V)_U(0) = q v_H + (1-q) v_L$，故比值恰為 $1 < R$；該點落在區域 I，分離均衡嚴格成立。
2. 在完全相關端點 $rho = 1$，有 $hat(V)_U(1) = v_H$、$hat(V)_U(0) = v_L$，故比值為 $v_H \/ v_L > R$；未扭曲分離失敗（此為 $rho > rho^*$ 的情形；Riley 扭曲分離的完整刻畫及區域 C' 的定義見#headingref(<subsec-main-timing>)，在基準參數 $v_H = 2 v_L$ 下 $rho^(**) = 1$，$rho = 1$ 對應區域 C' 的右端點）。
3. 在部分相關 ($0 < rho < 1$) 情形下，比值介於 $1$ 與 $v_H \/ v_L$ 之間，究竟落在區域 I 或 II，端視 $rho$ 是否超過臨界相關度 $rho^*$ 而定。

#figure(
  image("../../figures/fig6_spectrum.pdf", width: 80%),
  caption: [有效獎酬比值 $hat(V)_U(1) \/ hat(V)_U(0)$ 沿相關參數 $rho$ 單調上升，於 $rho^*$ 處唯一穿越分離臨界 $R$。],
  supplement: [圖],
) <fig-main-spectrum>

== 混同均衡與模仿誘因 <subsec-main-pooling>

由#headingref(<subsec-main-boundary>)的分離條件可知，資訊相關性越強，分離均衡越難維持。對有效獎酬比值 $hat(V)_U(1) \/ hat(V)_U(0)$ 進行對 $rho$ 的比較靜態分析，可得

$
  (d (hat(V)_U(1) \/ hat(V)_U(0))) / (d rho)
  =
  (Delta V dot hat(V)_U(q)) / hat(V)_U(0)^2
  > 0.
$

導數嚴格為正，說明 $rho$ 的上升會將有效獎酬比值推向閾值 $R$，壓縮分離均衡的存在空間。其機制在於：$rho$ 上升同時抬高了高型別如實揭露時不知情者的有效獎酬 (分子 $hat(V)_U(1)$)、並壓低了低型別投入被觀察到時對手預期的有效獎酬 (分母 $hat(V)_U(0)$)，分子分母的反向變動共同放大了高型別偽裝所換取的競爭鬆弛效果。沿 $rho$ 由 $0$ 增至 $1$，比值從 $1$ (遠低於 $R$，分離嚴格成立) 單調上升至 $v_H \/ v_L$ (高於 $R$，分離失敗)，並於 $rho^*$ 唯一穿越閾值。本文基準模型與 #c("fu2006") 的設定之間，因此存在一條以相關性強度 $rho$ 為軸的連續光譜。

當相關性跨越 $rho^*$、有效獎酬比值超過 $R$，分離均衡失效。但失效並不意味著賽局陷入無均衡困境——本節將論證：此時由高型別主動模仿低型別的純策略混同均衡接替，而在 $rho = 1$ 的完全相關端點，資訊結構對應於 #c("fu2006") 的設定。

考慮一個候選混同配置，其中知情者無論型別為何皆選擇相同之均衡投入量 $x_P > 0$。由於兩類型在均衡路徑上之行動完全一致，不知情者無從藉由觀察 $x_P$ 區分對手之真實型別；根據貝氏更新法則，其後驗信念維持於先驗水準，亦即

$
  m(x_P) = q.
$

依#headingref(<subsec-main-br>)中之有效獎酬與最佳反應公式，此時不知情者之有效獎酬為 $hat(V)_U(q)$，其最佳反應為

$
  x_U^*(x_P, q) = sqrt(x_P hat(V)_U(q)) - x_P.
$

進一步可得型別 $v in {v_L, v_H}$ 之知情者於均衡路徑上所獲得之預期報酬為

$
  pi_P (v) = v sqrt(x_P / hat(V)_U(q)) - x_P.
$ <eq-main-pool-payoff>

混同均衡之維繫，仰賴於對偏離行為施加足夠強之懲罰機制。為此，本文採取最悲觀之脫離常軌信念 (off-path belief)：若不知情者觀察到任何 $x != x_P$ 之投入水平，則一律認定對手必為高型別，即

$
  m(x) = 1, quad forall x != x_P.
$

這是最強的懲罰性假設：任何脫離均衡路徑的投入都會觸發不知情者認定對手為高型別，並給出最激烈的競爭反應。在此信念下，不知情者之有效獎酬將提升至上界 $hat(V)_U(1)$，相應之最佳反應為

$
  x_U^*(x, 1) = sqrt(x hat(V)_U(1)) - x.
$

給定此強力反擊，若型別 $v$ 之知情者考慮偏離至任意 $x$，其報酬極大化問題為

$
  max_x quad v sqrt(x / hat(V)_U(1)) - x.
$

對 $x$ 取一階條件可解得最適偏離投入

$
  x_d (v) = v^2 / (4 hat(V)_U(1)),
$

並對應之最大偏離報酬為

$
  widetilde(pi)_d (v) = v^2 / (4 hat(V)_U(1)).
$ <eq-main-pool-dev>

混同均衡得以成立的關鍵，在於兩類型參賽者於均衡路徑上之報酬皆不低於其最大偏離報酬。由前述均衡路徑預期報酬與最大偏離報酬之表達式，可分別列出兩類型之誘因相容條件。高型別誘因相容條件為

#[
  #set math.equation(numbering: "(1)")
  $
    v_H sqrt(x_P / hat(V)_U(q)) - x_P
    >=
    v_H^2 / (4 hat(V)_U(1));
  $ <eq-main-pool-ich>
]

低型別誘因相容條件為

$
  v_L sqrt(x_P / hat(V)_U(q)) - x_P
  >=
  v_L^2 / (4 hat(V)_U(1)).
$ <eq-main-pool-icl>

#proposition(title: [混同均衡之存在條件])[
  在具正相關的資訊結構下，$I U$ 子賽局存在純策略混同均衡若且唯若

  $
    sqrt(alpha) >= (v_H - v_L) / (v_H + v_L),
    quad
    alpha equiv 1 - hat(V)_U(q) / hat(V)_U(1).
  $

  均衡要件為策略 $x_I = x_P$、不知情者最佳反應 $x_U^*(x_P, q)$、脫軌信念 $m(x != x_P) = 1$。
] <prop-main-pooling>

（見附錄。）

上述非空條件清楚反映了混同均衡的存在性如何隨相關性連續變化。將 @eq-vhat-u 與 @eq-vhat-q 代入 $alpha$ 的定義，可得其單參數表達式

$
  alpha
  =
  1 - hat(V)_U(q) / hat(V)_U(1)
  =
  (rho (1-q) Delta V) / (v_L + [q + rho (1-q)] Delta V),
$ <eq-main-alpha-rho>

由此可見 $alpha$ 為 $rho$ 之嚴格遞增函數，且 $alpha(0) = 0$。在統計獨立端點 $rho = 0$ 上，$hat(V)_U(1) = hat(V)_U(q)$，故 $alpha = 0$，非空條件無法滿足，混同均衡自然不存在；這與#headingref(<subsec-main-boundary>)的結論一致：統計獨立端點必然落於區域 I。

另一方面，當 $rho$ 趨近 $1$ 時，$hat(V)_U(1)$ 趨近 $v_H$，而 $hat(V)_U(q) = q v_H + (1-q) v_L$ 保持不變，使 $alpha$ 從零單調遞增。相關性越強，不知情者在最悲觀脫軌信念下的反擊力道越大，高型別的最大偏離報酬 $widetilde(pi)_d (v) = v^2 \/ (4 hat(V)_U(1))$ 因此遞減，高低型別的誘因相容條件隨之放寬。令非空條件取等號，即得混同均衡開始存在的臨界相關度

$
  rho_P
  =
  (beta^2 hat(V)_U(q)) / ((1-q) Delta V (1 - beta^2)),
  quad
  beta equiv (v_H - v_L) / (v_H + v_L);
$ <eq-main-pool-threshold>

#example(title: [混同臨界相關度])[
  當 $rho >= rho_P$ 時混同均衡存在。在 $v_H = 2$、$v_L = 1$、$q = 0.5$ 的基準下，$beta = 1 \/ 3$ 而 $rho_P = 3 \/ 8 = 0.375$。
]

為使上述比較靜態結論於相關參數軸上獲得直觀呈現，圖 @fig-main-pooling-regions[]將#headingref(<subsec-main-boundary>)推導之分離臨界相關度 $rho^*$ 與本節得出之混同臨界相關度 $rho_P$ 並陳於同一條 $rho in [0, 1]$ 數軸上（取基準 $v_H = 2$、$v_L = 1$、$q = 0.5$，故 $rho_P = 0.375 < rho^* approx 0.43$）。由於混同臨界 $rho_P$ 恆低於分離臨界 $rho^*$，整段相關性光譜可細分為四個經濟意涵相異之子區間（完整刻畫見#headingref(<subsec-main-timing>)命題「$I U$ 子賽局的全均衡刻畫」）：

+ 純分離區（區域 I，$rho in [0, rho_P)$）：高型別誘因相容條件嚴格滿足而混同投入無解，唯一純策略均衡為未扭曲分離。

+ 並存區（區域 C，$rho in [rho_P, rho^*]$）：未扭曲分離與混同均衡同時成立，雙重均衡並陳，二者均通過直覺準則。

+ Riley 並存區（區域 C'，$rho in (rho^*, rho^(**))$）：未扭曲分離失效，D1 精煉選出 Riley 扭曲分離，與混同均衡並存；在基準參數 $v_H = 2 v_L$ 下 $rho^(**) = 1$，此區間覆蓋 $rho in (rho^*, 1]$ 的完整範圍。

+ 純混同區（區域 II，$rho in (rho^(**), 1]$）：Riley 扭曲分離亦不可行，唯一均衡為混同；在基準參數 $v_H = 2 v_L$ 下退化為空集。

獨立端點 $rho = 0$ 落於區域 I 內部，與#headingref(<subsec-main-boundary>)的結論一致；隨著 $rho$ 由 $0$ 增至 $1$，參數穿越區域 C 並抵達區域 II，視覺化了分離崩潰時混同接替的過程。

#figure(
  image("../../figures/fig6_pooling_regions.pdf", width: 90%),
  caption: [$I U$ 子賽局之均衡形態隨相關參數 $rho$ 的變化。],
  supplement: [圖],
) <fig-main-pooling-regions>

上述命題背後的邏輯如下。相關性越高，高型別如實揭露型別所面對的競爭反擊越猛烈，公開自身強勢的代價越大；因此高型別被迫選擇與低型別相同的投入 $x_P$ 來隱匿實力。低型別方面，其真實價值 $v_L$ 較小，就算偏離也難以從最悲觀信念下的對手那裡取得利潤，誘因相容條件自然滿足。雙方由此匯聚於 $x_P$，混同均衡成立。

== 混同均衡的信念精煉 <subsec-main-refinement>

#headingref(<subsec-main-pooling>)所建構之混同均衡，其存在性仰賴一條極強且相當任意的脫軌信念假設：$m(x != x_P) = 1$。由於本章招牌結論之並存區 (Region C) 整個建立在混同均衡存在之上，若混同無法通過標準的信念精煉，則區域 C 恐僅是寬鬆脫軌信念的產物，而非穩健的賽局現象。本節據此對混同均衡施以直覺準則（Intuitive Criterion），檢驗其是否存活；相關文獻背景見 #c("cho1987")。

直覺準則的核心，在於剔除那些倚賴對均衡劣勢型別賦予正信念的脫軌信念。具體而言，若存在某脫軌投入 $x'$，對某一型別而言無論不知情者如何反應，其偏離所得皆嚴格低於均衡報酬 (即該偏離對此型別為均衡劣勢)，而對另一型別則存在某種反應使偏離有利可圖，則理性的不知情者在觀察到 $x'$ 時，應將後驗信念集中於後者。

#proposition(title: [混同均衡通過直覺準則])[
  每一個純策略混同均衡均通過直覺準則，亦通過更強之 D1 準則。
] <prop-main-refinement>

（見附錄。）

承上，精煉檢驗的結論顯示：混同均衡並非寬鬆脫軌信念下的脆弱產物，而是對標準信念精煉穩健的賽局現象——其所倚賴的最悲觀信念，正是精煉所無法動搖的最不利信念。據此，並存區 (區域 C) 中分離與混同雙重均衡同時通過直覺準則，二者皆為合理預測。本文因而誠實保留 Region C 內的均衡多重性：標準信念精煉 (直覺準則、D1) 不足以在並存區作出唯一選擇；欲進一步挑選，須訴諸信念精煉以外之選擇準則 (如報酬占優或聚點論證)，此非本文所欲逕行斷言。值得強調的是，此一多重性並不動搖本章的光譜主張：低相關度 ($rho < rho_P$) 唯有未扭曲分離；相關度跨越 $rho_P$ 後開始出現混同並存；唯有相關度進一步超過 $rho^(**)$ 時，才進入純混同區。於基準參數 $v_H = 2 v_L$ 下 $rho^(**) = 1$，純混同區退化為空集，整個 $rho in (rho^*, 1]$ 區間均屬 Riley 扭曲分離與混同並存的 C' 帶。

就分離側而言，D1 準則同樣可用以從扭曲分離族中選出唯一均衡。

#proposition(title: [D1 準則唯一選出 Riley 結果])[
  在 $rho in (rho^*, 1]$ 的扭曲分離區，D1 準則唯一選出最低成本分離均衡 $x_L^"Riley" = (z_H^-)^2$。
] <prop-main-d1-riley>

（見附錄。）

此與 #c("riley1979") 在連續型別訊號賽局中的原始結論在精神上一致：D1 精煉在本文的兩型別架構下，同樣唯一選出最低成本分離均衡。

綜合兩端的精煉結論：在並存區（區域 C 與 C'），混同側通過直覺準則（命題「混同均衡通過直覺準則」），分離側 D1 選出 Riley 結果（命題「D1 準則唯一選出 Riley 結果」）；兩均衡皆為精煉後的穩健均衡，多重性誠實保留，無法僅憑信念精煉作出唯一選擇。

== 全均衡刻畫與相關性對內生時序的牽引 <subsec-main-timing>

綜合#headingref(<subsec-main-boundary>)至#headingref(<subsec-main-refinement>)的分析，可以對 $I U$ 子賽局的純策略均衡給出完整刻畫。#c("fu2006") 的設定（$rho = 1$）與本文基準（$rho = 0$）分別是此光譜的兩端，下述命題刻畫了中間所有可能的均衡型態。

#proposition(title: [$I U$ 子賽局的全均衡刻畫])[
  $I U$ 子賽局的純策略完美貝氏均衡由相關參數 $rho$ 完全決定：

  - $rho in [0, rho_P)$（區域 I）：唯一均衡為未扭曲分離；
  - $rho in [rho_P, rho^*]$（區域 C）：未扭曲分離與混同均衡並存，均通過直覺準則；
  - $rho in (rho^*, rho^(**))$（區域 C'）：D1 選出之 Riley 扭曲分離與混同均衡並存；
  - $rho in (rho^(**), 1]$（區域 II）：唯一均衡為混同。

  在基準參數 $v_H = 2 v_L$ 下，$rho^(**) = 1$，區域 II 退化為空集；對 $rho > rho^*$ 的完整區間，Riley 扭曲分離與混同持續並存。
] <prop-main-full-characterization>

在揭露型態之外，相關性更透過子賽局報酬牽動第 0 階段的時序選擇。#c("fu2006") 與本文基準模型對「知情者是否願意先動」給出截然不同的答案：在 #c("fu2006") 的完全相關資訊結構下，知情者先動會經由訊號通道洩露評價、侵蝕資訊租金，因此知情者嚴格偏好後動；而在本文 $rho = 0$ 的獨立基準下，訊號—信念—反應通道關閉，知情者的時序偏好回歸純粹的事前期望報酬比較，$I U$ 在部分參數下反而可被支持。本章的單參數架構把這兩種結論連成一條連續光譜。

為嚴格論證時序偏好的翻轉，需先釐清相關版三個子賽局的事前報酬。

*相關版 $S S$ 子賽局*：同時行動下不知情者從未更新信念，有效獎酬維持先驗加權 $hat(V)_U(q)$（由 @eq-vhat-q，與 $rho$ 無關）。故相關版 $S S$ 均衡報酬與基準完全相同，只需以 $hat(V)_U(q)$ 取代常數 $V$：

$
  widetilde(pi)_I^(S S, rho) = widetilde(pi)_I^(S S) |_(V = hat(V)_U(q)),
  quad
  pi_U^(S S, rho) = pi_U^(S S) |_(V = hat(V)_U(q)).
$

因此 $hat(V)_U(q)$ 與 $rho$ 無關，$S S$ 報酬對 $rho$ 的偏導數為零。

*相關版 $I U$ 子賽局（分離區，$rho <= rho^*$）*：均衡為未扭曲分離，知情者事前報酬為

$
  widetilde(pi)_I^(I U, rho) = EE[V_I^2] / (4 hat(V)_U(1)(rho)),
$

其中 $hat(V)_U(1)(rho) = v_L + [q + rho(1-q)] Delta V$ 隨 $rho$ 嚴格遞增。故

$
  (partial widetilde(pi)_I^(I U, rho)) / (partial rho)
  =
  - EE[V_I^2] (1-q) Delta V / (4 hat(V)_U(1)^2)
  < 0.
$

先動報酬隨 $rho$ 嚴格遞減，而 $S S$ 報酬不變，因此偏離差額 $Delta_I^(I U)(rho) equiv widetilde(pi)_I^(I U, rho) - widetilde(pi)_I^(S S, rho)$ 隨 $rho$ 嚴格遞減，確保時序翻轉臨界的存在唯一性。

#proposition(title: [相關性對知情者時序偏好的牽引])[
  在相關版 $I U$ 子賽局為未扭曲分離的區間 $rho in [0, rho^*]$ 內，知情者先動相對於 $S S$ 的事前偏離差額 $Delta_I^(I U)(rho)$ 為 $rho$ 的嚴格遞減函數。因此：

  - 若 $Delta_I^(I U)(0) > 0$ 且 $Delta_I^(I U)(rho^*) <= 0$，則存在唯一的時序翻轉臨界 $rho^dagger in (0, rho^*]$，使得 $rho < rho^dagger$ 時知情者偏好先動，$rho > rho^dagger$ 時偏好後動；
  - $rho = 0$：訊號通道關閉，先動誘因由 $Delta_I^(I U)|_(rho=0)$ 決定，在部分參數條件下為正；
  - $rho = 1$：資訊結構上對應於 #c("fu2006") 所處理的完全相關端點，知情者嚴格偏好後動（見附錄備註）。
] <prop-main-timing>

（見附錄。）

*備註（命題 8 的補充：$rho in (rho^*, 1]$ 區間的時序偏好）。*

命題 8 的嚴格單調遞減論證覆蓋 $rho in [0, rho^*]$ 的未扭曲分離區間；在此之外（$rho in (rho^*, 1]$，對應區域 C' 與區域 II），$I U$ 子賽局的均衡型態轉為 Riley 扭曲分離與混同並存，知情者事前報酬公式隨之改變，命題 8 的解析差額表達式不能直接延用。然而 $Delta_I^(I U)(rho) <= 0$ 在 $rho in (rho^*, 1]$ 仍可由以下三段論述支撐。

*（i）混同均衡下的比較。*
在 $I U$ 混同均衡中，知情者被迫對所有型別選取同一投入 $x_P$，其事前報酬上界為 $mu^2 \/ (4 hat(V)_U (q))$（對 $x_P$ 取最大值後所得）。反觀 $S S$ 制度，知情者可依型別各自選擇最適投入，在相同的不知情者有效獎酬 $hat(V)_U (q)$ 下取得嚴格高於混同上界的事前期望報酬：
$
  tilde(pi)_I^(S S) |_(V = hat(V)_U (q))
  >= mu^2 / (4 hat(V)_U (q))
  = max_(x_P) tilde(pi)_I^(I U, "pool").
$
不等式成立的根源在於 $S S$ 允許型別特定的投入調整，而混同制度強制投入同質化，抹去知情者依私有訊息微調的空間。

#example(title: [混同路徑下之時序比較])[
  在基準參數 $v_H = 2$、$v_L = 1$、$q = 0.5$ 下可數值確認：$tilde(pi)_I^(S S) approx 0.408 > 0.375 = mu^2 \/ (4 hat(V)_U (q))$，故混同路徑上 $Delta_I^(I U)(1) < 0$ 成立。
]

*（ii）Riley 扭曲分離下的比較。*
在 Riley 均衡中，低型別承受正的訊號成本（$x_L^"Riley" < x_L^*$），高型別維持未扭曲最佳投入；扭曲成本使低型別報酬較無扭曲情形嚴格下降，壓低知情者整體的事前期望報酬。此外，高型別的有效獎酬分母 $hat(V)_U (1)(rho)$ 隨 $rho$ 嚴格遞增，使高型別報酬 $v_H^2 \/ (4 hat(V)_U (1))$ 同步遞減。故在 $rho in (rho^*, 1]$ 的 Riley 均衡路徑上，知情者的事前報酬弱低於 $S S$，即 $Delta_I^(I U)(rho) <= 0$。

*（iii）$rho = 1$ 端點（#c("fu2006")）。*
在完全相關端點，$hat(V)_U (1) = v_H$，$I U$ 子賽局精確對應 #c("fu2006") 的原始設定：訊號通道全開，資訊租金遭侵蝕，#c("fu2006") 已嚴格證明此時知情者偏好後動。

#example(title: [完全相關端點的數值確認])[
  在基準參數下可數值確認，取 $I U$ 子賽局對知情者最有利的均衡（Riley 或混同，各自算出後取較大值），均有 $tilde(pi)_I^(I U)|_(rho=1) < tilde(pi)_I^(S S)|_(rho=1)$，即 $Delta_I^(I U)(1) < 0$，與 #c("fu2006") 之結論吻合。
]

*綜合小結。*
命題 8 確立了在 $rho in [0, rho^*]$ 內翻轉點的存在唯一性；本備註進一步說明在 $rho in (rho^*, 1]$，知情者偏好後動（$Delta_I^(I U) <= 0$）的結論同樣成立。兩段合看，完整描述了時序偏好沿相關性光譜從偏好先動到偏好後動的過渡，而 #c("fu2006") 的後動結論是 $rho = 1$ 端點的特殊情形。

上述時序分析補上了本章光譜論証的最後一塊：前幾節說明 $rho$ 如何決定 $I U$ 子賽局的揭露型態，本節則把相關性接回第 0 階段的時序選擇，說明 $rho$ 如何決定知情者是否願意先動。

至此，本章之核心模型已完整描繪出資訊相關性對均衡型態與內生時序的連續牽引作用：在統計獨立端點 $rho = 0$ 上，賽局呈現唯一的純策略分離均衡，且知情者於部分參數下可被支持先動；隨著正相關性 $rho$ 逐步深化並越過臨界相關度 $rho^*$，未扭曲分離失效，均衡型態轉為 Riley 扭曲分離與混同並存，知情者亦轉為偏好後動；在資訊結構層次，$rho = 1$ 對應於 #c("fu2006") 所處理的完全相關端點，均衡特性在適當精煉概念下與其結論相吻合。本章藉由建構此一以單一相關參數 $rho$ 為軸的分離至混同連續光譜，統整了異質資訊結構下的揭露型態與時序誘因，並說明傳統文獻所強調之混同均衡與知情者後動的結論，可視為此一般化資訊結構在 $rho = 1$ 端點的特例。
