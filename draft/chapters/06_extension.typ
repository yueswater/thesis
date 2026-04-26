#import "../thesis.typ": c, definition, lemma, proof, theorem

本章在前文基準模型上加入部分相關型別結構，目的是回答一個更精確的問題：在什麼條件下，前文 $I U$ 子賽局的唯一分離結果會被破壞，退化為 #c("fu2006") 的混合結果。

第五章的關鍵是，不知情者的續局最佳反應不依賴對知情者類型的後驗信念，因此訊號雖可被觀察，卻不會改變對手反應。本章將此處打開：令 $U$ 的獎酬與 $I$ 的類型部分相關，則 $U$ 的最佳反應會透過後驗信念改變，分離均衡便不再自動成立。

== 部分相關結構 <subsec-ext-setup>

考慮二點型別 $v_I in {V_H, V_L}$，其中 $V_H > V_L > 0$，且先驗機率為 $1/2$ 與 $1/2$。與前文不同的是，$U$ 的獎酬不再是公開常數，而是隨 $v_I$ 以條件分配抽樣：

#definition(title: [部分相關型別])[
  給定參數 $q, s in [0, 1]$，

  $
    Pr(v_U = V_H | v_I = V_H) & = q,
                                quad
                                Pr(v_U = V_L | v_I = V_H) & = 1 - q, \
    Pr(v_U = V_L | v_I = V_L) & = s,
                                quad
                                Pr(v_U = V_H | v_I = V_L) & = 1 - s.
  $

  兩個基準點為：
  1. $(q, s) = (1/2, 1/2)$：型別獨立，回到前文基準模型；
  2. $(q, s) = (1, 1)$：型別完全相關，對應 #c("fu2006") 的極限環境。
] <def-partial-corr>

把先驗 $Pr(v_I=V_H)=Pr(v_I=V_L)=1/2$ 併入後，可得聯合分配：

$
  Pr(v_I=V_H, v_U=V_H) = q/2,
  quad
  Pr(v_I=V_H, v_U=V_L) = (1-q)/2,
$

$
  Pr(v_I=V_L, v_U=V_H) = (1-s)/2,
  quad
  Pr(v_I=V_L, v_U=V_L) = s/2.
$

令 $mu(x_I)$ 表示 $U$ 在觀察 $x_I$ 後對「高型別」事件的後驗機率。定義

$
  overline(V)_H = q V_H + (1-q) V_L,
  quad
  overline(V)_L = (1-s) V_H + s V_L,
$

以及信念加權獎酬

$
  hat(V)_U(mu) = mu overline(V)_H + (1-mu) overline(V)_L.
$ <eq-vhat-u>

由定義可得
$
  overline(V)_H = EE[v_U|v_I=V_H], quad overline(V)_L = EE[v_U|v_I=V_L],
$
且由全期望法則
$
  hat(V)_U(mu) = EE[v_U|x_I] = mu overline(V)_H + (1-mu) overline(V)_L.
$
因此，$q,s$ 透過條件機率進入條件期望，並進一步進入賽局中的有效賭注。又因
$
  overline(V)_H - overline(V)_L = (q+s-1)(V_H-V_L),
$
故 $hat(V)_U(mu)$ 對 $mu$ 的單調性由 $q+s-1$ 決定：當 $q+s>=1$ 時弱遞增；當 $q+s<1$ 時嚴格遞減。

== 信念依賴最佳反應 <subsec-ext-br>

在 $I U$ 子賽局中，$U$ 面對觀察到的 $x_I$ 與後驗 $mu$，其面對的問題為：

$
  max_(x_U >= 0) U_U(x_I, x_U | mu)
  =
  max_(x_U >= 0)
  [
    x_U/(x_I+x_U) hat(V)_U(mu) - x_U
  ].
$

#lemma(title: [部分相關下 $U$ 的最佳反應])[
  給定 $x_I > 0$ 與 $mu in [0,1]$，$U$ 的內點最佳反應為

  $
    x_U^*(x_I, mu) = sqrt(x_I hat(V)_U(mu)) - x_I.
  $ <eq-ext-br>

  若 $q+s>1$，則在內點區域有 $(d x_U^*)/(d mu) > 0$。
] <lem-ext-br>

#proof[
  一階條件為
  $
    x_I hat(V)_U(mu) / (x_I + x_U)^2 = 1.
  $
  解正根得 $x_I + x_U = sqrt(x_I hat(V)_U(mu))$，因此得到上式最佳反應。
  又
  $
    (d x_U^*)/(d mu)
    =
    (overline(V)_H - overline(V)_L) / (2 sqrt(hat(V)_U(mu)/x_I)),
  $
  當 $q+s>1$ 時，$overline(V)_H - overline(V)_L > 0$，故導數為正。
]

在基準模型中，最佳反應僅依賴觀察投入，不依賴信念；而在本章中，最佳反應依賴信念，此差異正是分離可否持續的來源。

== 分離條件與臨界邊界 <subsec-ext-boundary>

本節先聚焦在 $q+s>=1$（獨立到正相關）區間。考慮候選分離均衡：高型別與低型別各自選不同投入，且路徑上的信念為

$
  mu(x_H)=1, quad mu(x_L)=0.
$

在這個配置下，兩型別面對的對手有效獎酬分別是 $overline(V)_H$ 與 $overline(V)_L$，因此可得

$
   x_H & = V_H^2/(4 overline(V)_H),
         quad
         x_L  & = V_L^2/(4 overline(V)_L), \
  pi_H & = V_H^2/(4 overline(V)_H),
         quad
         pi_L & = V_L^2/(4 overline(V)_L).
$

若高型別改為模仿低型別，其偏離報酬為

$
  U_H^d = V_L(2V_H-V_L)/(4 overline(V)_L).
$

所以，高型別的誘因相容條件為

$
  V_H^2 / overline(V)_H
  >=
  V_L(2V_H - V_L) / overline(V)_L.
$ <eq-ext-ich>

把 $overline(V)_H = q V_H + (1-q) V_L$ 與 $overline(V)_L = (1-s) V_H + s V_L$ 代回後，條件可直接寫成

$
  V_H^2 / [q V_H + (1-q) V_L]
  >=
  V_L(2V_H-V_L) / [(1-s) V_H + s V_L].
$ <eq-ext-ich-qs>

左側由 $q$ 影響，即高型別路徑下對手反應強度，而右側由 $s$ 影響，即偽裝路徑下對手反應強度。

#proof[
  在候選分離路徑上，高型別誠實選擇 $x_H = V_H^2/(4 overline(V)_H)$，其報酬為
  $
    pi_H = V_H^2/(4 overline(V)_H).
  $

  若高型別改為模仿低型別並選擇 $x_L = V_L^2/(4 overline(V)_L)$，則 $U$ 以低型別信念回應，故高型別偏離報酬為
  $
    U_H^d = V_L(2V_H-V_L)/(4 overline(V)_L).
  $

  誘因相容要求 $pi_H >= U_H^d$，即
  $
    V_H^2/(4 overline(V)_H) >= V_L(2V_H-V_L)/(4 overline(V)_L).
  $
  整理後即得所求。
]

在 $q+s>=1$ 區間下，低型別偏離去模仿高型別不會優於留在均衡路徑，因此這裡真正有約束力的條件只來自高型別。

#theorem(title: [正相關區間的分離均衡存在與臨界邊界])[
  在 $q+s>=1$ 區間下，$I U$ 子賽局存在上述純策略分離完美貝氏均衡，若且唯若高型別誘因相容條件成立；等價地，也就是滿足前述展開後的 $q,s$ 版本不等式。

  將該誘因相容條件取等號可得臨界邊界

  $
    s^*(q)
    =
    (
    V_H^3
    - V_L(2V_H-V_L)[q V_H + (1-q) V_L]
    ) / (V_H^2(V_H - V_L)).
  $ <eq-ext-boundary>

  因此：
  1. $s <= s^*(q)$ 時，分離可維持。
  2. $s > s^*(q)$ 時，高型別偽裝有利，分離崩潰並進入混合區域。
] <thm-ext-boundary>

#proof[
  分離存在的充要性來自高型別是否有模仿誘因，即高型別誘因相容條件的成立與否，證明詳見
  #context if query(<proof-ext-boundary>).len() > 0 [
    #ref(<proof-ext-boundary>)
  ] else [
    附錄「第六章：臨界邊界推導」
  ]。
]

#figure(
  image("../figures/fig6_qs_regions.pdf", width: 100%),
  caption: [$(q,s)$ 參數空間中的均衡分區],
  supplement: [圖],
) <fig-ch6-qs-regions>

#ref(<fig-ch6-qs-regions>) 在 $q+s>=1$ 視窗下顯示兩個區域：區域 I 對應分離均衡，區域 II 對應高型別偽裝低型別的混合均衡。邊界 $s^*(q)$ 是高型別誘因相容恰好綁定的位置。

由臨界邊界公式的斜率可得
$
  d s^*(q)/d q = -V_L(2V_H-V_L)/V_H^2 < 0.
$
故 $q$ 越高，可維持分離的 $s$ 上限越低；給定 $q$ 時，只要 $s$ 超過該上限，該組 $(q,s)$ 即落入混合區域。

== 小結 <subsec-ext-summary>

本章的核心貢獻是將第五章模型推導出必然分離的結果，與 #c("fu2006") 的可混合架構放在同一個可連續變動的資訊結構內進行比較、參照，並加以統一。參數 $q$ 與 $s$ 控制了不知情者的條件期望獎酬：$q$ 影響高型別路徑下不知情者的有效賭注，$s$ 影響低型別下不知情者的有效賭注。當這兩個參數使得不知情者的續局反應對後驗信念更敏感時，高型別誠實揭露的相對報酬會下降，而模仿低型別的偏離報酬會上升，最終改變 $I U$ 子賽局的均衡型態。

臨界邊界 $s^*(q)$ 界定了分離均衡的存續範圍。給定 $q$ 下，當 $s$ 超過此邊界時，高型別將透過偏離策略達到獲利，導致分離均衡崩潰為混合均衡。值得注意的是，$s^{*}(q)$ 的斜率隱含了核心直覺：當雙方利益呈現高度相關時 (即 $q$ 上升)，對手的預期抵抗力道增強，此時將會抬升高型別誠實披露資訊的成本，迫使其更有誘因隱藏實力，從而使分離均衡可行區域縮小。

參數空間的兩個極端點界定了模型的理論光譜。當 $(q,s)=(1/2,1/2)$ 時，雙方估值完全獨立，信念對資方的預期獎酬無實質影響，模型退化為前文的基準情形，維持唯一分離均衡。而當 $(q, s) = (1, 1)$ 時，估值完全正相關，模型退化為 #c("fu2006") 的特例，此時高型別因面臨強烈的抵抗預期而選擇偽裝，導致分離均衡崩潰。在制度意涵上，本章闡明了先動優勢的存續條件，取決於雙方利益的相關程度是否高到足以迫使高型別隱藏實力，此由分離轉向混合的絕對門檻，正是由臨界邊界 $s^*(q)$ 所界定。
