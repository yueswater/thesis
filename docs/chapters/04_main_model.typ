#import "../thesis.typ": (
  SS, bern, c, ca, corr, cp, definition, example, headingref, impt, lemma, payoff-matrix-2x2, proof, proposition,
  stmtref, term, theorem, widetilde,
)

== 部分相關型別結構 <subsec-main-setup>

#definition(title: [部分相關型別結構])[
  給定知情者與不知情者獎酬分別為 $V_I$ 與 $V_U$，定義獎酬之相關係數為 $rho equiv corr(V_I, V_U)$，且 $rho in [0,1]$。
] <def-main-correlated-types>

$rho$ 衡量兩位參與者獎酬之共同變動程度，$rho = 0$ 對應完全獨立 (基準模型)；$rho = 1$ 對應完全相關 #cp("fu2006")；當 $0<rho<1$ 時，隨著 $rho$ 越上升，雙方獎酬同高或同低機率越高，一高一低的機率相對下降；知情者型別因而越能揭示不知情者自身的獎酬狀態，訊號的資訊含量亦愈大。下一節據此推導不知情者的後驗期望獎酬。此外，高、低型別之獎酬差距為 $Delta V equiv v_H - v_L > 0$，為後續推導所共用。

邊際分配固定下，$(V_I,V_U)$ 之聯合分配僅剩一個自由度，恰由 $rho$ 唯一決定；故指定 $(q,rho)$ 即完全刻畫型別結構，各狀態機率如@tbl-main-joint-corr 所示。

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
      box(width: 72pt, height: 36pt)[
        #place(top + right, dx: -6pt, dy: 4pt)[$V_U$]
        #place(bottom + left, dx: 6pt, dy: -4pt)[$V_I$]
        #place(top + left, line(start: (0pt, 0pt), end: (72pt, 36pt), stroke: 0.4pt))
      ],
    ),
    $v_H$, $v_L$,
    $v_H$, $q^2 + rho q(1-q)$, $q(1-q)(1-rho)$,
    $v_L$, $q(1-q)(1-rho)$, $(1-q)^2 + rho q(1-q)$,
  ),
  caption: [$(V_I, V_U)$ 之聯合機率分配列聯表 (部分相關情形)],
  supplement: [表],
) <tbl-main-joint-corr>

== 條件期望獎酬與最佳反應 <subsec-main-belief-payoff>

本節推導部分相關結構下不知情者的條件期望獎酬與最佳反應。與基準模型以及 #c("fu2006") 之差別在於，當 $0 < rho < 1$ 時，不知情者據以決策的獎酬評價不再是固定的 $overline(v)$，而是隨信念權重 $mu$ 變動的 $widetilde(V)_U (mu)$。

=== 條件期望獎酬 <subsubsec-main-posterior>

部分相關下，不知情者對自身獎酬的評價取決於其對知情者型別的信念。沿用#headingref(<subsubsec-bench-iu>)之記號，$mu in [0,1]$ 為不知情者賦予對手高型別之後驗權重，條件期望獎酬記為 $widetilde(V)_U (mu) equiv EE[V_U | mu]$；基準模型中獎酬獨立使其恆為 $overline(v)$，本章則須求出其在部分相關下的封閉解，其中 $mu = q$ 對應僅憑先驗的事前評價，$mu = 1$ 與 $mu = 0$ 則分別對應不知情者確信對手為高、低型別時的#term("型別條件期望", english: "type-contingent expectation")。此一封閉解為三個子賽局所共用，僅取決於純量信念 $mu$，差別只在 $mu$ 如何由觀察決定。

#lemma(
  title: [條件期望獎酬之封閉解表示],
)[
  在部分相關型別結構下，給定不知情者賦予高型別之權重 $mu in [0,1]$，其條件期望獎酬可寫為
  $
    widetilde(V)_U (mu)
    = v_L + [q + rho(mu-q)] Delta V.
  $ <eq-main-effective-payoff>

  其中 $Delta V = v_H - v_L$。
] <lem-main-posterior-expected-valuation>

#stmtref(<lem-main-posterior-expected-valuation>, "引理", "lemma-counter") 顯示，只有在 $rho>0$ 時，對手型別才同時是關於不知情者自身獎酬的訊號。若 $rho = 0$，則 $widetilde(V)_U (mu) = v_L + q Delta V$ 與 $mu$ 無關；若 $rho > 0$，則 $d widetilde(V)_U (mu) \/ d mu = rho Delta V > 0$，故信念權重愈高，不知情者對自身獎酬的後驗期望亦愈高。又因 $mu = q$ 時 $widetilde(V)_U (q) = EE[V_U]$，故可得

#set math.equation(numbering: "(1)")
$
  widetilde(V)_U (1) > widetilde(V)_U (q) > widetilde(V)_U (0).
$ <eq-main-posterior-ordering>
#set math.equation(numbering: none)

=== 最佳反應與延續報酬 <subsubsec-main-br-ic>

以下將前述條件期望獎酬帶入 IU 子賽局。給定 $x_I > 0$ 與 $mu$，不知情者的條件期望報酬為

$
  pi_U (x_I,x_U;mu)
  = x_U / (x_I+x_U) widetilde(V)_U (mu) - x_U.
$ <eq-main-u-payoff>

不知情者對 $x_U$ 取一階條件，其最佳反應與基準模型@eq-bench-br-U 具相同形式，僅需將固定獎酬 $overline(v)$ 替換為後驗期望即得：
#set math.equation(numbering: "(1)")
$
  x_U^*(x_I,mu)
  = sqrt(x_I widetilde(V)_U (mu)) - x_I,
$ <eq-main-br>
#set math.equation(numbering: none)
其中內點解成立之條件為 $widetilde(V)_U (mu)>x_I$。

當 $rho > 0$ 時，$x_I$ 除直接進入競賽成功函數外，亦透過信念 $mu$ 影響不知情者的後驗期望獎酬與最適投入。為孤立此一訊號效果，於內點區域將最佳反應對 $mu$ 微分，由#stmtref(<lem-main-posterior-expected-valuation>, "引理", "lemma-counter") 得

$
  (d x_U^*(x_I,mu)) / (d mu)
  = (rho (Delta V) / 2) sqrt(x_I / (widetilde(V)_U (mu))).
$
// #par(h(0pt, weak: true))

上式在 $rho > 0$ 時嚴格為正。換言之，不知情者愈相信對手為高型別，其對自身獎酬的後驗期望愈高，投入亦隨之提高。

另一方面，知情者的先動決策則以前述最佳反應為限制，代入不知情者最佳反應至知情者的報酬後，型別 $v$ 知情者的#term("延續報酬", english: "continuation payoff")可表達為

$
  pi_I (x_I; v, mu(x_I))
  equiv x_I / (x_I + x_U^*(x_I, mu(x_I))) v - x_I.
$

在內點區域內，代入最佳反應@eq-main-br 可得較簡潔的表示：

$
  pi_I (x_I; v, mu)
  = v sqrt(x_I / (widetilde(V)_U (mu))) - x_I.
$ <eq-main-i-reduced-payoff>

與基準模型之差異取決於分母 $widetilde(V)_U (mu)$：基準下 $rho = 0$ 使其恆為 $overline(v)$，延續報酬僅隨 $x_I$ 直接變動，知情者投入不具訊號作用；而當 $rho > 0$ 時，$x_I$ 經由信念 $mu$ 改變 $widetilde(V)_U (mu)$，同時透過勝率與後驗評價兩條管道影響報酬，基準模型中被切斷的訊號—信念—反應傳遞機制因而重現。

== 子賽局均衡 <subsec-main-subgame-equilibria>

=== SS 子賽局 <subsubsec-main-ss>

仿照#headingref(<subsec-bench-subgame-equilibria>)中的型別加權邊際係數定義，於部分相關設定下定義對應的參數：

$
  tilde(A)
  equiv q (widetilde(V)_U (1)) / sqrt(v_H) + (1-q) (widetilde(V)_U (0)) / sqrt(v_L),
  quad
  tilde(B)
  equiv q (widetilde(V)_U (1)) / v_H + (1-q) (widetilde(V)_U (0)) / v_L,
$ <eq-main-ss-ab>

其中 $widetilde(V)_U (1)$ 與 $widetilde(V)_U (0)$ 由#stmtref(<lem-main-posterior-expected-valuation>, "引理", "lemma-counter")給定。當 $rho=0$ 時，$widetilde(V)_U (mu) equiv overline(v)$ 對所有 $mu$ 成立，此時 $tilde(A) = hat(A)$、$tilde(B) = hat(B)$。

#proposition(
  title: [SS 子賽局之內點均衡: 部分相關],
)[
  在 SS 子賽局中，若均衡位於內點，則不知情者之均衡投入為
  $
    x_U^(SS)
    = tilde(A)^2 / (1+tilde(B))^2.
  $
  型別 $v$ 之知情者均衡投入為
  $
    x_I^(SS)(v)
    = sqrt(v) tilde(A) / (1+tilde(B))
    - tilde(A)^2 / (1+tilde(B))^2.
  $
  對應之知情者各型別報酬與不知情者#impt[事前期望報酬 (ex ante payoff)] 分別為
  $
    pi_I^(SS)(v)
    = (sqrt(v) - tilde(A) / (1+tilde(B)))^2, quad
    widetilde(pi)_U^(SS)
    = tilde(A)^2 tilde(B) / (1+tilde(B))^2.
  $
] <prop-main-ss-equilibrium>

在部分相關結構下，SS 時序下雙方同時投入，不知情者雖無法在行動前從知情者的投入中進行後驗更新，知情者的投入仍依其型別而異，且知情者為高、低型別分別對應到不知情者不同的條件期望獎酬，因此不知情者仍須在事前同時考量知情者兩種型別狀態下的競爭強度與自身獎酬評估。

=== UI 子賽局 <subsubsec-main-ui>

同#headingref(<subsubsec-bench-ui>)，在部分相關結構下，同@eq-bench-ui-leader 之形式，不知情者之事前報酬可表達為

#set math.equation(numbering: "(1)")
$
  widetilde(pi)_U^(U I)(x_U) = tilde(A) sqrt(x_U) - x_U
$ <eq-main-ui-objective>
#set math.equation(numbering: none)

#proposition(
  title: [UI 子賽局之內點均衡: 部分相關],
)[
  在 UI 子賽局中，若均衡位於內點 (即兩種型別知情者均選擇正投入)，則不知情者之均衡投入為
  $
    x_U^(U I) = tilde(A)^2 / 4.
  $
  型別 $v$ 之知情者均衡投入為
  $
    x_I^(U I)(v) = sqrt(v) tilde(A) / 2 - tilde(A)^2 / 4.
  $
  對應之知情者各型別報酬與不知情者事前期望報酬分別如下：
  $
    pi_I^(U I)(v) = (sqrt(v) - tilde(A) / 2)^2, quad widetilde(pi)_U^(U I) = tilde(A)^2 / 4.
  $
] <prop-main-ui-equilibrium>

不知情者於 UI 與 SS 兩時序之比較與#headingref(<subsubsec-bench-ui>)之結果如出一轍。同基準模型之比較方法，將不知情者於 SS、UI 時序之報酬相減，可得
#set math.equation(numbering: "(1)")
$
  widetilde(pi)_U^(U I) - widetilde(pi)_U^(SS)
  = tilde(A)^2 (1 - tilde(B))^2 / (4(1+tilde(B))^2)
  >= 0.
$ <eq-main-ui-first-mover>
#set math.equation(numbering: none)

此式與基準之@eq-bench-ui-vs-ss 形式基本無異且恆非負：不知情者弱偏好先動，等號成立若且唯若 $tilde(B)=1$。先行承諾使不知情者免受 SS 中雙方同時最佳化所生之相互制約，得以鎖定對己最有利之投入；差別僅在於 $tilde(B)$ 不再純由 $V_I$ 之不確定性決定，而隨獎酬相關程度 $rho$ 而變化。

=== IU 子賽局 <subsubsec-main-iu>

回顧#stmtref(<prop-bench-iu-equilibrium>, "命題", "proposition-counter")，基準模型中因後驗期望獎酬與信念無關，知情者投入不具訊號作用，各型別皆在完整資訊下選擇各自之最適投入。誠如前述所言，在部分相關結構下，$x_I$ 因信念會影響 $widetilde(V)_U$ 而兼具型別訊號功能，故該未扭曲分離均衡未必仍能成立。故以下先檢驗此一#term("未扭曲分離均衡", english: "undistorted separating equilibrium")；若否，再轉入由低型別承擔成本的扭曲分離。

在未扭曲分離均衡下，高型別與低型別分別選擇 $x_H$ 與 $x_L$，並在均衡路徑上形成信念。由前述延續報酬，若型別 $v$ 誠實選擇投入且不知情者形成對應信念 $mu$，則其內點最適投入為
$
  x_I^*(v, mu) = v^2 / (4 widetilde(V)_U (mu)),
$
且均衡報酬恰等於該投入。故在未扭曲分離均衡下，
$
  x_H = pi_H = v_H^2 / (4 widetilde(V)_U (1)),
  quad
  x_L = pi_L = v_L^2 / (4 widetilde(V)_U (0)).
$
不知情者沿兩條分離路徑的最佳反應則分別為
$
  x_U^*(x_H, 1) = v_H / 2 - v_H^2 / (4 widetilde(V)_U (1)),
  quad
  x_U^*(x_L, 0) = v_L / 2 - v_L^2 / (4 widetilde(V)_U (0)).
$

由@eq-main-posterior-ordering 可知，當 $rho > 0$ 時，$widetilde(V)_U (1) > widetilde(V)_U (0)$，又因不知情者之最佳反應@eq-main-br 隨 $widetilde(V)_U$ 遞增，高型別偽裝為低型別將信念由 $mu = 1$ 拉低至 $mu = 0$，可誘使不知情者降低其後續投入。因此，未扭曲分離均衡成立與否，取決於高型別向下模仿低型別的誘因能否被排除。

#set math.equation(numbering: "(1)", supplement: [式])

#proposition(
  title: [IU 子賽局未扭曲分離均衡條件],
)[
  定義高型別不向下模仿低型別之臨界比值為
  $
    R equiv v_H^2 / (v_L (2v_H-v_L)).
  $
  搭配均衡路徑外信念 $mu(x) = 1$ (即 $x in.not {x_H, x_L}$)，未扭曲分離構成 IU 子賽局之純策略完美貝氏均衡，若且唯若
  $
    (widetilde(V)_U (1)) / (widetilde(V)_U (0)) <= R.
  $ <eq-main-iu-undistorted-ic>
] <prop-main-iu-separating-candidate>

前述分離條件以比值 $widetilde(V)_U (1) \/ widetilde(V)_U (0)$ 表達。由於該比值為 $rho$ 之嚴格遞增函數，故分離均衡存在性等價於 $rho$ 不超過單一臨界值。

#proposition(
  title: [分離臨界相關度],
)[
  IU 子賽局之未扭曲分離均衡存在若且唯若 $rho <= rho^*$，其中唯一臨界相關度為#footnote[此一臨界相關度可分解為兩項：第一項表示模仿誘因的容忍度，即高型別不向下模仿低型別的容忍空間；第二項表示不知情者在先驗信念下之評價，相對於型別差距的大小，用以衡量訊號衝擊的相對強度。]
  $
    rho^* = frac((R-1), 1 + q(R-1)) dot frac(widetilde(V)_U (q), Delta V)
  $ <eq-main-rho-star>
  在獨立端點 $rho = 0$ 時分離嚴格成立；在完全相關端點 $rho = 1$ 時未扭曲分離失效。
] <prop-main-iu-rho-star>

當 $rho$ 超過 $rho^*$ 後，未扭曲分離均衡不再成立，但並不表示分離均衡全面崩潰。#c("riley1979") 指出，訊號賽局中存在最低成本的分離均衡——低型別向下壓低投入，使高型別喪失模仿誘因，此時高型別無須偏離其完整資訊最適投入。此一結果即 Riley 均衡，構成 $rho > rho^*$ 時 IU 子賽局的分離均衡候選。

#proposition(
  title: [Riley 扭曲分離均衡],
)[
  當 $rho > rho^*$ 時，定義

  $
    alpha equiv 1 - frac(widetilde(V)_U (0), widetilde(V)_U (1)) in (0,1),
    quad
    z_H^- equiv frac(v_H, 2 sqrt(widetilde(V)_U (0))) (1 - sqrt(alpha)).
  $ <eq-main-riley-def>

  純策略扭曲分離均衡由下列策略與信念構成：

  #set enum(numbering: "(1)")

  + 高型別選未扭曲最佳投入 $x_H = v_H^2 \/ (4 widetilde(V)_U (1))$；
  + 低型別選 Riley 投入 $x_L^"Riley" = (z_H^-)^2$；
  + 路徑上信念分別為 $mu(x_H) = 1$ 以及 $mu(x_L^"Riley") = 0$，路徑外任意偏離之信念設為 $mu = 1$。
] <prop-main-iu-riley>

綜上，IU 子賽局的分離型態依相關程度而定：$0 <= rho <= rho^*$ 時為未扭曲分離，$rho > rho^*$ 時則轉為由低型別承擔訊號成本的 Riley 扭曲分離。
== 內生時序均衡 <subsec-main-endogenous-timing>
#set math.equation(numbering: none)

在部份相關結構下，第 0 階段的 $2 times 2$ 賽局形式如@tbl-main-timing-payoff-matrix 所示：

#figure(
  payoff-matrix-2x2(
    [知情者],
    [不知情者],
    row_actions: ([先動], [後動]),
    col_actions: ([先動], [後動]),
    payoffs: (
      (
        [$(widetilde(pi)_I^(SS), widetilde(pi)_U^(SS))$],
        [$(widetilde(pi)_I^(I U), widetilde(pi)_U^(I U))$#footnote[此格報酬依 $rho$ 取值：$rho <= rho^*$ 時為未扭曲分離、$rho > rho^*$ 時為 Riley 扭曲分離。]],
      ),
      (
        [$(widetilde(pi)_I^(U I), widetilde(pi)_U^(U I))$],
        [$(widetilde(pi)_I^(SS), widetilde(pi)_U^(SS))$],
      ),
    ),
  ),
  caption: [第 0 階段時序報酬矩陣：部分相關結構],
  supplement: [表],
) <tbl-main-timing-payoff-matrix>

SS 與 UI 之事前報酬已分別由#stmtref(<prop-main-ss-equilibrium>, "命題", "proposition-counter")與#stmtref(<prop-main-ui-equilibrium>, "命題", "proposition-counter")給出。知情者於第 0 階段尚未實現型別，其事前報酬為各型別報酬之先驗加權平均 $widetilde(pi)_I^J = q pi_I^J (v_H) + (1-q) pi_I^J (v_L)$，其中 $J in {text("SS"), text("UI"), text("IU")}$，不知情者則直接以其均衡報酬計。

IU 時序須將兩條分離路徑加權。未扭曲分離下，知情者之事前報酬為
$
  widetilde(pi)_I^(I U)
  = q frac(v_H^2, 4 widetilde(V)_U (1))
  + (1-q) frac(v_L^2, 4 widetilde(V)_U (0)),
$
不知情者則為
$
  widetilde(pi)_U^(I U)
  = q (sqrt(widetilde(V)_U (1)) - sqrt(x_H))^2
  + (1-q) (sqrt(widetilde(V)_U (0)) - sqrt(x_L))^2.
$
若 $rho > rho^*$、IU 時序落於 Riley 扭曲分離區間，高型別路徑維持不變，僅低型別改投扭曲水準 $x_L^"Riley"$，並據此重算低型別路徑上兩位參與者之報酬：不知情者部分即將上式中的 $x_L$ 代換為 $x_L^"Riley"$；知情者低型別則因偏離自身最適，報酬為 $v_L sqrt(x_L^"Riley" \/ widetilde(V)_U (0)) - x_L^"Riley"$，不再等於其投入額。

在部份相關結構下之第 0 階段中，沿用#headingref(<sec-model>)之單邊偏離差額記號，令
$
  D_I^(U I) & equiv widetilde(pi)_I^(U I) - widetilde(pi)_I^(SS), & quad
  D_I^(I U) & equiv widetilde(pi)_I^(I U) - widetilde(pi)_I^(SS), \
  D_U^(U I) & equiv widetilde(pi)_U^(U I) - widetilde(pi)_U^(SS), & quad
  D_U^(I U) & equiv widetilde(pi)_U^(I U) - widetilde(pi)_U^(SS).
$

#theorem(
  title: [第 0 階段之純策略內生時序均衡: 部分相關],
)[
  第 0 階段的純策略 Nash 均衡可由四個單邊偏離差額完全刻畫：

  #set enum(numbering: "(1)")

  + UI 構成純策略均衡若且唯若 $D_I^(U I) >= 0$ 且 $D_U^(U I) >= 0$；
  + SS 構成純策略均衡若且唯若 $D_I^(U I) <= 0$ 且 $D_U^(I U) <= 0$；
  + IU 構成純策略均衡若且唯若 $D_I^(I U) >= 0$ 且 $D_U^(I U) >= 0$。
] <prop-main-endogenous-timing-pure>

由@eq-main-ui-first-mover 可知，對任意給定之 $rho$，皆有
$
  D_U^(U I) = widetilde(pi)_U^(U I) - widetilde(pi)_U^(SS) >= 0.
$
換言之，不知情者面對後動的知情者時，始終弱偏好以先動承諾將時序推向 UI。故第 0 階段時序翻轉的主要來源，不在於不知情者是否放棄先動，而在於知情者對先動揭露效果的評價如何隨 $rho$ 改變。

#proposition(
  title: [],
)[
  在未扭曲分離區間 $rho in [0, rho^*]$ 內，知情者 IU 時序之事前報酬對相關性嚴格遞減。
] <prop-main-timing-iu-rho>

此一遞減源於兩股相反力量：$rho$ 上升，一方面推高高型別路徑上不知情者的後驗期望獎酬，使高型別先動後遭遇更強的競爭；另一方面壓低低型別路徑上的後驗期望獎酬，使低型別面對較寬鬆的競爭。由於前者的揭露成本主導後者的紓解，知情者先動所得之事前資訊租金遂隨相關性上升而遭侵蝕。

給定不知情者後動，知情者於 IU 與 SS 間的取捨取決於連續函數 $D_I^(I U)(rho)$ 之符號。在獎酬差距較小的參數下，獨立端點 $D_I^(I U)(0) > 0$ (偏好先動)、未扭曲邊界 $D_I^(I U)(rho^*) < 0$ (偏好後動)，由介值定理必存在 $rho^dagger in (0, rho^*)$ 使 $D_I^(I U)(rho^dagger) = 0$，知情者於此由偏好先動翻為偏好後動。又因 $D_U^(U I) >= 0$，不知情者恆偏好先動，故相關性一旦跨過 $rho^dagger$，第 0 階段均衡時序即由 IU 翻向 SS。
