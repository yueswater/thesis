#import "../thesis.typ": SS, c, corollary, headingref, impt, lemma, proof, proposition, stmtref, term, widetilde

== 衡量架構 <subsec-welfare-framework>

給定投入組合 $(x_I, x_U)$，總投入耗散與均衡 $e$ 下的事前期望總投入分別為
$
  T(x_I, x_U) = x_I + x_U, quad widetilde(T)^e = EE[x_I^e + x_U^e].
$

在標準 Tullock 競賽下，給定投入組合 $(x_I, x_U)$，知情者與不知情者之勝率分別為
$
  p_I = frac(x_I, x_I + x_U),
  quad
  p_U = frac(x_U, x_I + x_U).
$
則社會福利定義與均衡 $e$ 下的事前期望社會福利分別為
$
  W(x_I, x_U; V_I, V_U) & = p_I V_I + p_U V_U - x_I - x_U, \
         widetilde(W)^e & = EE[p_I^e V_I + p_U^e V_U - x_I^e - x_U^e].
$ <eq-welfare-expected-welfare>

將事前期望社會福利改寫，可得

$
  widetilde(W)^e = widetilde(G)^e - widetilde(T)^e,
$ <eq-welfare-decomposition>

其中

$
  widetilde(G)^e = EE[p_I^e V_I + p_U^e V_U]
$

係資源配置所產生的期望總價值。後續比較即以 $widetilde(G)^e$ 衡量配置效果，以 $widetilde(T)^e$ 衡量競爭過程的資源耗散。

== 各子賽局福利 <subsec-welfare-subgames>

=== SS 子賽局 <subsubsec-welfare-ss>

由#stmtref(<prop-main-ss-equilibrium>, "命題", "proposition-counter")可得，SS 子賽局之總投入為

$
  x_I^(SS)(v) + x_U^(SS) = frac(tilde(A) sqrt(v), 1+tilde(B)).
$

再依高、低型別的先驗機率加權，可得

$
  widetilde(T)^(SS)
  = EE[x_I^(SS)(V) + x_U^(SS)] & = frac(tilde(A), 1 + tilde(B))
                                 EE[sqrt(V)] \
                               & = frac(tilde(A), 1 + tilde(B))
                                 (q sqrt(v_H) + (1-q) sqrt(v_L)).
$ <eq-welfare-ss-dissipation>

由於 SS 子賽局不存在訊號傳遞，其社會福利可直接由兩位參與者之均衡期望報酬相加而得：

$
  widetilde(W)^(SS)
  = widetilde(pi)_I^(SS) + widetilde(pi)_U^(SS),
$

代入#stmtref(<prop-main-ss-equilibrium>, "命題", "proposition-counter")之均衡報酬，得

$
  widetilde(W)^(SS) = q (sqrt(v_H) - frac(tilde(A), 1+tilde(B)))^2
  + (1-q) (sqrt(v_L) - frac(tilde(A), 1+tilde(B)))^2 + frac(tilde(A)^2 tilde(B), (1+tilde(B))^2).
$ <eq-welfare-ss-welfare>

=== UI 子賽局 <subsubsec-welfare-ui>

由#stmtref(<prop-main-ui-equilibrium>, "命題", "proposition-counter")可得，UI 子賽局之總投入為

$
  x_I^(U I)(v) + x_U^(U I) = frac(tilde(A) sqrt(v), 2).
$

將知情者依高、低型別之先驗機率加權，得

$
  widetilde(T)^(U I)
  = frac(tilde(A), 2) (q sqrt(v_H) + (1-q) sqrt(v_L)).
$

同 SS 子賽局，UI 時序下亦不存在由均衡投入引發的信念更新，故

$
  widetilde(W)^(U I)
  = widetilde(pi)_I^(U I) + widetilde(pi)_U^(U I).
$

代入#stmtref(<prop-main-ui-equilibrium>, "命題", "proposition-counter")之均衡報酬，得

$
  widetilde(W)^(U I)
  = q (sqrt(v_H) - frac(tilde(A), 2))^2
  + (1-q) (sqrt(v_L) - frac(tilde(A), 2))^2
  + frac(tilde(A)^2, 4).
$ <eq-welfare-ui-welfare>

=== IU 子賽局 <subsubsec-welfare-iu>

IU 子賽局中，知情者的投入同時影響勝率與不知情者的後驗判斷，故福利比較須區分未扭曲分離與 Riley 扭曲分離兩種情形。

==== 未扭曲分離均衡 <subsubsec-welfare-iu-sep>

在未扭曲分離均衡下，根據#stmtref(<prop-main-iu-rho-star>, "命題", "proposition-counter")，代入兩條路徑上的最佳反應，可得各型別下的總投入為
$
  x_I^*(v, mu) + x_U^*(x_I^*, mu)
  = sqrt(x_I^*(v,mu) widetilde(V)_U (mu))
  = v / 2.
$

取型別期望，得

$
  widetilde(T)^("sep") = frac(q v_H + (1-q) v_L, 2) = frac(EE[V_I], 2).
$ <eq-welfare-iu-sep-dissipation>

故 IU 未扭曲分離之期望耗散與 $rho$ 完全脫鉤。其社會福利則為

$
  widetilde(W)^("sep")
  = q lr((frac(v_H^2, 2 widetilde(V)_U (1)) + widetilde(V)_U (1) - v_H))
  + (1-q) lr((frac(v_L^2, 2 widetilde(V)_U (0)) + widetilde(V)_U (0) - v_L)).
$ <eq-welfare-iu-sep-welfare>

將 $widetilde(W)^("sep")$ 對 $rho$ 微分，可得

$
  (d widetilde(W)^("sep")) / (d rho)
  = frac(q(1-q)(v_H-v_L), 2)
  [
    (frac(v_L, widetilde(V)_U (0)))^2
    -
    (frac(v_H, widetilde(V)_U (1)))^2
  ].
$

由#stmtref(<prop-main-timing-iu-rho>, "命題", "proposition-counter")之證明，$rho < 1$ 時 $v_H \/ widetilde(V)_U (1) > v_L \/ widetilde(V)_U (0)$，故中括號內之值為負，推得 $d widetilde(W)^("sep") \/ d rho < 0$。因此未扭曲分離區間內 $widetilde(W)^("sep")$ 隨相關性上升而遞減：耗散固定並不保證福利上升。

==== Riley 扭曲均衡 <subsubsec-welfare-iu-riley>

承#stmtref(<prop-main-iu-riley>, "命題", "proposition-counter")，當 $rho > rho^*$ 時 IU 子賽局轉入 Riley 扭曲分離，低型別改採 Riley 投入，即 $x_L^"Riley"$，高型別則與未扭曲分離相同，仍為 $v_H/2$。低型別路徑的總投入為

$
  x_L^"Riley" + x_U^*(x_L^"Riley", 0)
  = sqrt(x_L^"Riley" widetilde(V)_U (0))
  = z_H^- sqrt(widetilde(V)_U (0))
  = frac(v_H, 2) (1 - sqrt(alpha)).
$

期望總投入耗散因而為

$
  widetilde(T)^"Riley" & = q dot frac(v_H, 2) + (1-q) dot frac(v_H, 2) (1 - sqrt(alpha)) \
                       & = widetilde(T)^("sep") + frac(1-q, 2)[v_H (1 - sqrt(alpha)) - v_L]
$

上式將 Riley 耗散分解為未扭曲基準與一個僅源於低型別扭曲的調整項，可知：

- 當 $rho = rho^*$ 時，$v_H (1 - sqrt(alpha)) = v_L$，調整項歸零，Riley 耗散與未扭曲基準連續銜接。
- 當 $rho > rho^*$ 時，$alpha$ 上升使 $v_H (1 - sqrt(alpha)) < v_L$，調整項轉負，即低型別向下扭曲反而使期望耗散低於未扭曲基準。

社會福利方面，高、低型別之路徑福利等於勝方期望獎酬減去該路徑耗散，即：

$
  W^"Riley" (v_H) & = [p_H v_H + (1 - p_H) widetilde(V)_U (1)] - frac(v_H, 2) \
  W^"Riley" (v_L) & = [p_L v_L + (1 - p_L) widetilde(V)_U (0)] - frac(v_H, 2) (1 - sqrt(alpha)).
$

故全體期望社會福利遂為兩路徑之先驗加權：

$
  widetilde(W)^"Riley"
  = q W^"Riley" (v_H) + (1-q) W^"Riley" (v_L).
$

將 $widetilde(W)^"Riley"$ 對 $rho$ 微分可知：相關性愈高，低型別扭曲愈深，期望耗散 $widetilde(T)^"Riley"$ 隨之下降；$widetilde(G)^"Riley"$ 雖亦隨 $rho$ 下降，惟降幅小於耗散，故 $widetilde(W)^"Riley"$ 隨 $rho$ 遞增。此與未扭曲分離恰成對比：未扭曲區間相關性侵蝕福利（$widetilde(W)^("sep")$ 遞減），進入 Riley 後，低型別向下扭曲所節省的耗散主導，福利轉為隨相關性上升。

#figure(
  table(
    columns: (3.7cm, 4cm, 6.5cm),
    inset: 8pt,
    align: (col, row) => if col == 0 or col == 2 { left + horizon } else { center + horizon },
    stroke: none,
    table.hline(y: 0, stroke: 0.6pt),
    table.hline(y: 1, stroke: 0.4pt),
    table.hline(y: 5, stroke: 0.6pt),
    [均衡型態],
    [期望耗散 $widetilde(T)$],
    [競爭結構與 $rho$ 依賴性],
    [SS],
    [$frac(tilde(A), 1+tilde(B)) EE[sqrt(V_I)]$],
    [事前加權，不區分型別 \ 透過 $tilde(A)$、$tilde(B)$ 隨 $rho$ 改變],
    [UI],
    [$frac(tilde(A), 2) EE[sqrt(V_I)]$],
    [事前加權，不區分型別 \ 透過 $tilde(A)$ 隨 $rho$ 改變],
    [IU 未扭曲分離],
    [$EE[V_I] \/ 2$],
    [各型別競爭，確定後驗 \ 耗散與 $rho$ 無關，僅獎酬歸屬受 $rho$ 影響],
    [IU Riley 扭曲分離],
    [$frac(v_H, 2)[1-(1-q)sqrt(alpha)]$],
    [各型別，低型別投入扭曲 \ 透過 $alpha$ 隨 $rho$ 改變],
  ),
  caption: [各均衡型態之福利結構摘要],
  supplement: [表],
) <tab-welfare-summary>

福利比較由此可直接展開。先看 SS 與 UI，整理其差額可得

$
  widetilde(W)^(U I) - widetilde(W)^(SS)
  = frac(tilde(A)(1-tilde(B)), 1+tilde(B)) lr((EE[sqrt(V_I)] - frac(tilde(A), 2))).
$ <eq-welfare-ui-ss-diff>

故 SS 與 UI 之福利排序取決於 $(1 - tilde(B))$ 與 $(EE[sqrt(V_I)] - tilde(A)\/2)$ 的乘積，一般而言不具單一方向；特別是，當 $tilde(B) = 1$ 時，兩個時序之社會福利相等。

再看 IU。如前所示，未扭曲分離與 Riley 兩區間的福利對 $rho$ 反應相反——前者遞減、後者遞增，故相關性對福利並無單一方向的效果，資訊揭露與福利改善之間亦無必然同向關係。尤其 Riley 區間中低型別的向下扭曲，雖為知情者維持分離所付的私人訊號成本，於社會層面卻因壓低耗散而未必有損福利。

#headingref(<sec-analysis>)所刻畫的內生時序均衡僅由個別報酬誘因決定，社會福利則同時取決於獎酬歸屬與投入耗散；兩者準則不同，故均衡時序未必即為社會最適，各時序之優劣仍須回到完整福利公式判斷。
