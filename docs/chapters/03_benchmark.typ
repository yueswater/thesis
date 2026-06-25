#import "../thesis.typ": (
  IU, SS, UI, c, headingref, impt, payoff-matrix-2x2, proof, proposition, stmtref, term, widetilde,
)

== 基準模型：獎酬型別之獨立同分配 <subsec-iid-benchmark>

本文以 $I$ 表示知情者、$U$ 表示不知情者。令 $V_I, V_U in {v_H, v_L}$，其中 $v_H > v_L > 0$。高型別機率為 $q in (0,1)$。記
$
  overline(v) = q v_H + (1-q) v_L.
$
在基準模型中，$V_I$ 與 $V_U$ 假設為#term("獨立同分配", english: "independent and identically distributed")；因此，任一對於 $V_I$ 的訊號皆不改變不知情者對自身獎酬的條件期望，即 $EE[V_U | V_I] = overline(v)$。

兩位參與者投入 $x_I, x_U >= 0$，依#term("Tullock 比例型競賽成功函數", english: "Tullock Contest Success Function, CSF") 決定勝率。知情者於投入前已觀察自身獎酬之實現值 $v equiv v_I in {v_H, v_L}$，其報酬為
#set math.equation(numbering: "(1)")
$
  pi_I = x_I / (x_I + x_U) v - x_I,
$ <eq-bench-payoff-i>
不知情者之報酬則為
$
  pi_U = x_U / (x_I + x_U) V_U - x_U.
$ <eq-bench-payoff-u>
#set math.equation(numbering: none)
不知情者於行動前極大化 $EE[pi_U]$；因 $V_I$ 與 $V_U$ 獨立，對自身獎酬之期望評價恆為 $overline(v)$，不隨任何對知情者投入之觀察而改變。

第 0 階段，兩位參與者同時選擇行動時點；此時尚未觀察型別。待時序確定後，知情者在投入前觀察自身獎酬 $v_I$；不知情者僅知 $V_U$ 之分配。本文沿用標準的兩期承諾架構：若雙方選擇於同一期投入，則形成 SS 時序；若不知情者先動、知情者後動，則形成 UI 時序；若知情者先動、不知情者後動，則形成 IU 時序。

== 子賽局均衡 <subsec-bench-subgame-equilibria>

由於時序選擇發生在型別實現之前，以下所有時序比較均以#term("事前期望報酬", english: "ex ante payoff")為準；對知情者而言，
$
  widetilde(pi)_I^(J) equiv q pi_I^(J)(v_H) + (1-q) pi_I^(J)(v_L),
$
而不知情者的均衡報酬則直接記為 $widetilde(pi)_U^(J)$。以下分別刻畫 SS、UI 與 IU 三個子賽局之均衡。

=== SS 子賽局 <subsubsec-bench-ss>

首先考慮雙方同時投入的 SS 時序。知情者已觀察自身型別並可依型別選擇投入，不知情者則無任何來自對手的投入訊號，其決策建立在事前資訊之上。

將@eq-bench-payoff-i 之知情者報酬對 $x_I$ 取一階條件，解得知情者面對不知情者投入 $x_U$ 之最佳反應為

#set math.equation(numbering: "(1)")
$
  x_I^*(v; x_U) = sqrt(v x_U) - x_U.
$ <eq-bench-br-I>

同理，不知情者就@eq-bench-payoff-u 對 $x_U$ 取一階條件；因獎酬獨立、其評價恆為 $overline(v)$，面對單一可觀察之 $x_I$ 之最佳反應同具相同形式
$
  x_U^*(x_I) = sqrt(overline(v) x_I) - x_I.
$ <eq-bench-br-U>
#set math.equation(numbering: none)
惟在 SS 時序中，不知情者無法觀察型別，須以@eq-bench-br-I 之各型別最佳反應作事前加權，同時決定 $x_U$。為後續分析方便，定義複合係數 $hat(A), hat(B)$ 如下：
$
  hat(A)
  equiv overline(v) (q / sqrt(v_H) + (1-q) / sqrt(v_L)),
  quad
  hat(B)
  equiv overline(v) (q / v_H + (1-q) / v_L).
$ <eq-bench-a0b0>

#proposition()[
  在獨立同分配基準模型的 SS 子賽局中，若均衡位於內點，則不知情者之均衡投入為
  $
    x_U^(SS) = hat(A)^2 / (1 + hat(B))^2.
  $
  型別 $v$ 之知情者均衡投入為
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

=== UI 子賽局 <subsubsec-bench-ui>

接著考慮不知情者先行投入的 UI 時序。此為標準 Stackelberg 賽局：不知情者先承諾投入 $x_U$，知情者觀察後依其型別最佳反應；UI 時序不涉及訊號傳遞，先行者優勢純粹反映行動次序。

作為領導者，不知情者將知情者的最佳反應@eq-bench-br-I 視為給定並代入，其事前報酬為
#set math.equation(numbering: "(1)")
$
  widetilde(pi)_U^UI (x_U) = hat(A) sqrt(x_U) - x_U.
$ <eq-bench-ui-leader>
#set math.equation(numbering: none)

#proposition()[
  在獨立同分配基準模型的 UI 子賽局中，若均衡位於內點，則不知情者之均衡投入為
  $
    x_U^UI = hat(A)^2 / 4.
  $
  型別 $v$ 之知情者均衡投入為
  $
    x_I^UI (v) = sqrt(v) hat(A) / 2 - hat(A)^2 / 4.
  $
  對應之知情者各型別報酬與不知情者事前期望報酬分別為
  $
    pi_I^UI (v) = (sqrt(v) - hat(A) / 2)^2,
    quad
    widetilde(pi)_U^UI = hat(A)^2 / 4.
  $
] <prop-bench-ui-equilibrium>

UI 與 SS 的差異可直接由報酬比較看出。對不知情者而言，
#set math.equation(numbering: "(1)")
$
  widetilde(pi)_U^UI - widetilde(pi)_U^(SS)
  = hat(A)^2 / 4 - (hat(A)^2 hat(B)) / (1 + hat(B))^2
  = (hat(A)^2 (1 - hat(B))^2) / (4(1 + hat(B))^2)
  >= 0.
$ <eq-bench-ui-vs-ss>
#set math.equation(numbering: none)

由@eq-bench-ui-vs-ss 非負可知不知情者弱偏好 UI，且等號成立若且唯若 $hat(B)=1$。由 Jensen 不等式可知，在 $V_I$ 無不確定性下有 $hat(B) = 1$，此時 $x_U^SS = x_U^UI$，不知情者於兩時序無異。反之，只要 $V_I$ 帶有不確定性，$hat(B) > 1$，則 $x_U^SS < x_U^UI$。即便知情者與不知情者獎酬間呈現獨立且同分配，不知情者之先動利得仍純由不確定性而生，與 #c("fu2006") 恰成對照——在完全相關之設定下，不知情者之獎酬即知情者所握之不確定價值，先動係為調低承諾、避免在低值狀態過度投入；而本文獎酬獨立，不知情者對自身獎酬之期望評價恆為 $overline(v)$，先動反而承諾較高投入。

然而在 $hat(B) > 1$ 下，知情者卻偏好 SS：不知情者承諾較高投入，排擠後動的知情者，故 $widetilde(pi)_I^(SS) > widetilde(pi)_I^(U I)$。是以 U 欲先、I 不願後，UI 無法構成純策略均衡，第 0 階段的實質比較則落在 IU 與 SS 兩時序。

=== IU 子賽局 <subsubsec-bench-iu>

最後考慮知情者先行投入的 IU 時序。與 UI 同為 Stackelberg 賽局，惟領導者改為知情者；其關鍵特徵在於知情者的投入 $x_I$ 先於不知情者行動而成為可觀察訊號。不知情者觀察 $x_I$ 後形成信念 $mu(x_I): RR_+ -> [0,1]$ (賦予高型別 $V_I = v_H$ 之機率)，據以更新對自身獎酬的條件期望 $widetilde(V)_U (mu) equiv EE[V_U | x_I]$，再選擇投入。

先動是否付出訊號成本，端視揭露型別能否改變對手行為。在 #c("fu2006") 獎酬完全相關的設定下，知情者揭露自身獎酬高，同時讓不知情者推斷自身獎酬亦高，後者因而更積極投入、壓低知情者的勝率與報酬，此即 #c("fu2006") 下知情者偏好後動之因；在本文獨立同分配之框架下，$widetilde(V)_U (mu) = overline(v)$ 對所有後驗信念 $mu$ 恆成立，不知情者之最佳反應@eq-bench-br-U 不受 $mu$ 影響，致使訊號—信念—反應之傳遞機制就此被切斷，先動的訊號成本歸零，IU 遂在獎酬獨立下，退化為以知情者為領導者的基本 Stackelberg 賽局，分離嚴格成立且未受訊號扭曲。

#proposition()[
  在獨立同分配基準模型的 IU 子賽局中，存在唯一之完美貝氏均衡，即以下分離均衡：型別 $v$ 之知情者均衡投入為

  $
    x_I^(I U)(v) = v^2 / (4 overline(v)).
  $

  不知情者之最佳反應為

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

與 UI 之於 SS 相同，IU 對 SS 的取捨亦可由先動者的事前報酬比較看出，惟此時先動者為知情者。將知情者於 IU 時序與 SS 時序下各型別報酬依事前期望加權，並將二者相減，可得知情者之先動利得為：

#set math.equation(numbering: "(1)")
$
  widetilde(pi)_I^(I U) - widetilde(pi)_I^(SS)
  = & (q v_H^2 + (1-q) v_L^2) / (4 overline(v)) \
    & - [ q (sqrt(v_H) - hat(A) / (1 + hat(B)))^2 + (1-q) (sqrt(v_L) - hat(A) / (1 + hat(B)))^2 ]
$ <eq-bench-iu-vs-ss>
#set math.equation(numbering: none)
與不知情者先動利得@eq-bench-ui-vs-ss 恆為完全平方、其號恆非負不同，@eq-bench-iu-vs-ss 並無定號：知情者先動既不負訊號成本，亦不保證有利可圖，端視領導承諾之報酬能否勝過 SS 時序之報酬。

== 內生時序均衡 <subsec-bench-endogenous-timing>

第 0 階段的時序選擇構成一 $2 times 2$ 賽局，四種先後組合對應之子賽局及其事前期望報酬如@tbl-bench-timing。

#figure(
  payoff-matrix-2x2(
    [知情者],
    [不知情者],
    row_actions: ([先動], [後動]),
    col_actions: ([先動], [後動]),
    payoffs: (
      (
        [$(widetilde(pi)_I^(SS), widetilde(pi)_U^(SS))$],
        [$(widetilde(pi)_I^(I U), widetilde(pi)_U^(I U))$],
      ),
      (
        [$(widetilde(pi)_I^(U I), widetilde(pi)_U^(U I))$],
        [$(widetilde(pi)_I^(SS), widetilde(pi)_U^(SS))$],
      ),
    ),
  ),
  caption: [第 0 階段時序賽報酬矩陣：基準模型],
  supplement: [表],
) <tbl-bench-timing>

綜合#headingref(<subsec-bench-subgame-equilibria>)之討論，UI 恆非純策略均衡。再者，SS 時序分為兩種情況，即兩位參賽者同時選擇先動，以及同時選擇後動。若同時選擇後動時，任一方改為先動即成為領導者，而不知情者恆不吃虧，此情況必不為均衡；故 SS 時序僅能維取決於雙方皆選擇先動之情況。故穩定者僅有兩位參與者均選擇先動與 IU 時序。定義兩參與者之單邊偏離差額分別為：
$
  D_I equiv widetilde(pi)_I^(I U) - widetilde(pi)_I^(SS),
  quad
  D_U equiv widetilde(pi)_U^(I U) - widetilde(pi)_U^(SS).
$ <eq-bench-DI-DU>
根據#stmtref(<prop-bench-iu-equilibrium>, "命題", "proposition-counter") 可得先動者與其後動對手所得相同 ($widetilde(pi)_I^(I U) = widetilde(pi)_U^(I U)$)，又因知情者能依型別條件投入，存在資訊優勢，故事前報酬不低於不知情者，即 $widetilde(pi)_I^(SS) >= widetilde(pi)_U^(SS)$。兩者合得 $D_U >= D_I$。

#proposition()[
  在非退化的獨立同分配基準模型中：

  #set enum(numbering: "(1)")

  + UI 非純策略均衡；
  + IU 為純策略均衡若且唯若 $D_I >= 0$；
  + SS 為純策略均衡若且唯若 $D_U <= 0$；
  + 若 $D_I < 0 < D_U$，則第 0 階段不存在純策略均衡。
] <prop-bench-timing>

由 $D_U >= D_I$ 可知，純策略均衡之型態取決於 $D_I$ 之符號，且其消長可由獎酬之差距 $v_H - v_L$ 刻畫。知情者先動之事前報酬可分解為
#set math.equation(numbering: "(1)")
$
  widetilde(pi)_I^(I U) = overline(v) / 4 + ("var"(V_I)) / (4 overline(v))
$ <eq-bench-iu-variance>
#set math.equation(numbering: none)

其中 $"var"(V_I) = q (1-q) (v_H - v_L)^2$。

@eq-bench-iu-variance 將知情者領先之報酬拆為兩部份：前項為型別在無不確定性 (即 $v_H = v_L$) 時之基準報酬，後項則為隨獎酬型別變異數遞增之先動溢酬；獎酬差距越大，先動承諾愈值錢。惟此溢酬能否勝出，尚須與 SS 時序下之 $widetilde(pi)_I^(SS)$ 相比，其分界即臨界條件 $D_I (q) = 0$。

結合 $D_U >= D_I$ 之條件，當獎酬差距足夠小時 ($D_I >= 0$)，IU 為唯一純策略均衡；差距足夠大時 $D_U <= 0$，SS 時序為唯一純策略均衡；區間 $D_I < 0 < D_U$ 則無純策略均衡——不知情者雖欲偏離 SS 時序以謀時序之利，知情者卻寧願選擇 SS 時序，雙方時序預期無法相容。因獨立之設定，致使 $V_I$ 之揭露不改變不知情者對自身獎酬的條件期望，最終時序並非由資訊揭露之懲罰決定，而取決於先動承諾之溢酬能否勝過 SS 時序下之報酬。
