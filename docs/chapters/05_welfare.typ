#import "../thesis.typ": (
  SS, c, corollary, definition, headingref, impt, lemma, proof, proposition, stmtref, term, widetilde,
)

#headingref(<sec-analysis>)處理的是均衡存在與均衡時序形成；本章則轉向福利排序。某一時序配置能由個別理性支持，並不意味著其同時具有社會最適性，因此仍須分別比較各時序所導致的配置價值與投入#term("耗散", english: "dissipation")。

== 衡量架構 <subsec-welfare-framework>

#definition(title: [總投入耗散])[
  給定投入組合 $(x_I, x_U)$，總投入耗散定義為
  $
    T(x_I, x_U) = x_I + x_U.
  $
  在均衡 $e$ 下，事前期望總投入為
  $
    widetilde(T)^e = EE[x_I^e + x_U^e].
  $
] <def-welfare-effort>

#definition(title: [社會福利])[
  給定型別實現 $(V_I, V_U)$ 與投入組合 $(x_I, x_U)$，令勝率為
  $
    p_I = frac(x_I, x_I + x_U),
    quad
    p_U = frac(x_U, x_I + x_U).
  $
  社會福利定義為
  $
    W(x_I, x_U; V_I, V_U) = p_I V_I + p_U V_U - x_I - x_U.
  $
  均衡 $e$ 下的事前期望社會福利為
  $
    widetilde(W)^e = EE[p_I^e V_I + p_U^e V_U - x_I^e - x_U^e].
  $ <eq-welfare-expected-welfare>
] <def-welfare-social>

將前述期望福利定義改寫，可得下列福利分解式：

$
  widetilde(W)^e = widetilde(G)^e - widetilde(T)^e,
$ <eq-welfare-decomposition>

其中

$
  widetilde(G)^e = EE[p_I^e V_I + p_U^e V_U]
$

係資源配置所產生的期望總價值。後續比較即以下列福利分解式為準：$widetilde(G)^e$ 衡量配置效果，$widetilde(T)^e$ 衡量競爭過程的資源耗散。

== 各子賽局福利 <subsec-welfare-subgames>

以下依序整理 SS、UI 與 IU 各均衡型態下的期望總投入與社會福利。

=== SS 子賽局 <subsubsec-welfare-ss>

在 SS 子賽局中，均衡由#stmtref(<prop-main-ss-equilibrium>, "命題", "proposition-counter")給定。令 $tilde(A)$、$tilde(B)$ 如前述 SS 子賽局所定義，則知情者型別 $v$ 之均衡投入為 $x_I^(SS)(v)$，不知情者均衡投入為 $x_U^(SS)$。而由均衡投入公式直接相加可得：

$
  x_I^(SS)(v) + x_U^(SS) = frac(tilde(A) sqrt(v), 1+tilde(B)).
$

取型別期望，得 SS 子賽局之期望總投入耗散：

$
  widetilde(T)^(SS)
  = EE[x_I^(SS)(V) + x_U^(SS)] & = frac(tilde(A), 1 + tilde(B))
                                 EE[sqrt(V)] \
                               & = frac(tilde(A), 1 + tilde(B))
                                 (q sqrt(v_H) + (1-q) sqrt(v_L)).
$ <eq-welfare-ss-dissipation>

由於 SS 子賽局不存在訊號傳遞，社會福利可由兩位參與者之均衡期望報酬相加而得：

$
  widetilde(W)^(SS)
  = widetilde(pi)_I^(SS) + widetilde(pi)_U^(SS),
$

代入#stmtref(<prop-main-ss-equilibrium>, "命題", "proposition-counter")之均衡報酬，得

$
  widetilde(W)^(SS) & = q (sqrt(v_H) - frac(tilde(A), 1+tilde(B)))^2
                      + (1-q) (sqrt(v_L) - frac(tilde(A), 1+tilde(B)))^2 \
                    & + frac(tilde(A)^2 tilde(B), (1+tilde(B))^2).
$ <eq-welfare-ss-welfare>

SS 的福利因此由 $tilde(A)$ 與 $tilde(B)$ 所吸收的事前加權效果共同決定。

=== UI 子賽局 <subsubsec-welfare-ui>

UI 子賽局中不知情者先行，知情者後動並最佳反應。均衡由#stmtref(<prop-main-ui-equilibrium>, "命題", "proposition-counter")給定：

$
  x_U^(U I) = tilde(A)^2\/4
$

而各型別知情者之均衡投入為

$
  x_I^(U I)(v) = sqrt(v) tilde(A)/2 - tilde(A)^2/4
$

總投入同樣化簡為整潔形式：

$
  x_I^(U I)(v) + x_U^(U I) = frac(tilde(A) sqrt(v), 2).
$

取型別期望，得期望總投入耗散：

$
  widetilde(T)^(U I)
  = frac(tilde(A), 2) (q sqrt(v_H) + (1-q) sqrt(v_L)).
$

對社會福利而言，UI 子賽局同樣不存在由均衡投入引發的信念更新，故

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

UI 與 SS 的差異主要反映在競爭強度的分母由 $1+tilde(B)$ 變為 $2$，其福利排序仍須回到完整公式判斷。

=== IU 子賽局 <subsubsec-welfare-iu>

IU 子賽局中，知情者的投入同時影響勝率與不知情者的後驗判斷，故其福利結構須區分未扭曲分離與 Riley 扭曲分離兩種情形。

==== 分離均衡 <subsubsec-welfare-iu-sep>

在未扭曲分離均衡 ($rho <= rho^*$) 中，高型別選擇

$
  x_H = v_H^2 / (4 widetilde(V)_U (1))
$

低型別選擇

$
  x_L = v_L^2 / (4 widetilde(V)_U (0))
$

不知情者在兩條路徑上分別形成確定信念。代入不知情者之最佳反應，可得各型別下的總投入：

$
  x_I^*(v, mu) + x_U^*(x_I^*, mu)
  = sqrt(x_I^*(v,mu) widetilde(V)_U (mu))
  = v / 2.
$

因此，未扭曲分離均衡中，各型別路徑之總投入恰為 $v/2$，與後驗信念及相關程度 $rho$ 皆無關。

取型別期望，期望總投入耗散為

$
  widetilde(T)^("sep") = frac(q v_H + (1-q) v_L, 2) = frac(EE[V_I], 2).
$ <eq-welfare-iu-sep-dissipation>

前述耗散式顯示，IU 未扭曲分離之期望耗散與 $rho$ 完全脫鉤；相關性僅改變兩方在各型別路徑上的投入分配與勝率配置，不改變總投入規模。

對社會福利而言，配置效率取決於哪一方更可能獲勝。令 $a_1 = widetilde(V)_U (1)$、$a_0 = widetilde(V)_U (0)$，則

$
  widetilde(W)^("sep")
  = q lr((frac(v_H^2, 2 a_1) + a_1 - v_H))
  + (1-q) lr((frac(v_L^2, 2 a_0) + a_0 - v_L)).
$ <eq-welfare-iu-sep-welfare>

直接對前述福利式微分，可得

$
  frac(q(1-q)(v_H-v_L), 2)
  [
    (frac(v_L, a_0))^2
    -
    (frac(v_H, a_1))^2
  ].
$

由部分相關結構可知，在 $rho < 1$ 時有 $v_H \/ a_1 > v_L \/ a_0$。故 $d widetilde(W)^("sep") \/ d rho < 0$。

因此，在未扭曲分離區間內，$widetilde(W)^("sep")$ 隨相關性上升而遞減；耗散固定並不保證福利上升。

==== Riley 均衡 <subsubsec-welfare-iu-riley>

當 $rho > rho^*$ 時，未扭曲分離不再可由原投入配置支持。其原因在於，隨著相關性提高，兩條訊號路徑所誘發的不知情者後驗期望獎酬差距擴大，原先的低型別投入水準已不足以排除跨型別偏離誘因。為維持分離，低型別必須將投入向下調整至 Riley 水準，使偏離不再有利。此時 IU 子賽局進入 Riley 扭曲分離。高型別維持完整資訊最適投入：

$
  x_H = v_H^2 / (4 a_1)
$

低型別則向下壓低投入至 Riley 水準

$
  x_L^R = (z_H^-)^2
$

其中

$
  z_H^- = frac(v_H, 2 sqrt(a_0)) (1 - sqrt(alpha)),
  quad
  alpha = 1 - frac(a_0, a_1).
$

高型別路徑的總投入與未扭曲分離相同，仍為 $v_H\/2$。低型別路徑的總投入為

$
  x_L^R + x_U^*(x_L^R, 0)
  = sqrt(x_L^R a_0)
  = z_H^- sqrt(a_0)
  = frac(v_H (1 - sqrt(alpha)), 2).
$

期望總投入耗散因而為

$
  widetilde(T)^R
  = frac(v_H, 2) (q + (1-q)(1 - sqrt(alpha)))
  = frac(v_H, 2) (1 - (1-q) sqrt(alpha)).
$

相較於未扭曲分離，Riley 均衡僅改變低型別路徑之耗散；其福利效果仍須由完整公式判斷。

社會福利中，高型別路徑貢獻與未扭曲分離相同；低型別路徑則以 $x_L^R$ 決定勝率，其福利為

$
  W^R (v_L)
  = a_0 + frac(v_H (1-sqrt(alpha)), 2 a_0)(v_L - 2 a_0).
$

故全體期望社會福利為

$
  widetilde(W)^R
  = q lr((frac(v_H^2, 2 a_1) + a_1 - v_H))
  + (1-q) W^R (v_L).
$

在臨界點 $rho = rho^*$ 處，Riley 投入與未扭曲低型別投入銜接，故福利不發生不連續跳降。

== 時序福利比較

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
    [配置特徵與 $rho$ 依賴性],
    [SS],
    [$frac(tilde(A), 1+tilde(B)) EE[sqrt(V_I)]$],
    [事前加權，不區分型別 \ 透過 $tilde(A)$、$tilde(B)$ 隨 $rho$ 改變],
    [UI],
    [$frac(tilde(A), 2) EE[sqrt(V_I)]$],
    [事前加權，不區分型別 \ 透過 $tilde(A)$ 隨 $rho$ 改變],
    [IU 未扭曲分離],
    [$EE[V_I] \/ 2$],
    [各型別競爭，確定後驗 \ 耗散與 $rho$ 無關，僅配置端受 $rho$ 影響],
    [IU Riley 扭曲分離],
    [$frac(v_H, 2)[1-(1-q)sqrt(alpha)]$],
    [各型別，低型別投入扭曲 \ 透過 $alpha$ 隨 $rho$ 改變],
  ),
  caption: [各均衡型態之福利結構摘要],
  supplement: [表],
) <tab-welfare-summary>

SS 與 UI 的耗散結構相近，差別主要在於分母分別為 $1 + tilde(B)$ 與 $2$。整理兩個時序之福利差，可得

$
  widetilde(W)^(U I) - widetilde(W)^(SS)
  = frac(tilde(A)(1-tilde(B)), 1+tilde(B)) lr((EE[sqrt(V_I)] - frac(tilde(A), 2))).
$ <eq-welfare-ui-ss-diff>

前述差額式顯示，SS 與 UI 之福利排序取決於 $(1 - tilde(B))$ 與 $(EE[sqrt(V_I)] - tilde(A)\/2)$ 的乘積，一般而言不具單一方向。特別是，當 $tilde(B) = 1$ 時，兩個時序之社會福利相等；此時若個別報酬排序仍有差異，該差異僅反映福利在兩位參與者之間的重新分配，而非社會福利總量的改變。

IU 分離均衡與 SS、UI 之間的關鍵差異，在於耗散對相關性的反應方式。IU 未扭曲分離下，$widetilde(T)^("sep") = EE[V_I] \/ 2$，與 $rho$ 完全無關；SS 與 UI 則分別透過 $tilde(A)$、$tilde(B)$ 以及 $tilde(A)$ 將相關性的變化反映於投入耗散之中。因此，當 $rho$ 上升時，SS 與 UI 的耗散會隨事前加權係數變動，而 IU 未扭曲分離的耗散則維持不變。惟耗散固定並不代表福利必然改善；IU 分離均衡中，相關性提高會擴大 $a_1 = widetilde(V)_U (1)$ 與 $a_0 = widetilde(V)_U (0)$ 的差距，進而改變各型別路徑下的勝率歸屬。前節已示，在未扭曲分離區間內，$widetilde(W)^("sep")$ 反而隨 $rho$ 上升而遞減。由此可知，資訊揭露與福利改善之間並無必然同向關係。

Riley 扭曲分離進一步凸顯私人誘因與社會福利之間的落差。低型別向下壓低投入，對低型別自身而言係為維持分離所承擔的訊號成本；然而，就社會福利而言，此一扭曲同時改變低型別路徑上的投入耗散與獎酬歸屬，不能直接視為福利損失。尤其在低型別路徑上，$a_0 = widetilde(V)_U (0) >= v_L$，降低低型別知情者之勝率，可能使獎酬更偏向條件期望較高的不知情者。因此，Riley 扭曲同時影響耗散與配置項，其福利效果不宜僅由投入扭曲本身判斷。


在此基礎上，時序福利比較可從兩個層次理解。第一，#headingref(<sec-analysis>) 所刻畫的內生時序均衡由個別報酬誘因決定；社會福利則由配置價值與投入耗散共同決定，故均衡時序未必即為社會最適時序。第二，相關性對福利的影響也不能由單一方向概括，因為它同時改變條件獎酬分化、投入耗散與 IU 子賽局可支持的均衡型態。

就 SS 與 UI 而言，相關性主要透過 $tilde(A)$、$tilde(B)$ 改變耗散與福利。就 IU 而言，未扭曲分離具有耗散中立性，但其福利仍可能隨 $rho$ 上升而下降；進入 Riley 扭曲分離後，耗散與獎酬歸屬則同時改變。

因此，資訊揭露與福利改善之間不存在必然的正向關係；同樣地，Riley 扭曲也不能直接等同於社會福利損失。各時序的優劣仍須回到完整福利公式判斷。

== 政策意涵 <subsec-welfare-policy>

時序管制是否值得作為政策工具，在傳統競賽理論中並非不證自明；但本文顯示，一旦引入單邊私人資訊與獎酬相關性，時序配置便會同時改變資訊揭露、競爭反應與投入耗散。

因此，本文不支持任何一刀切的時序規範。若完整福利比較顯示 IU 的社會福利高於 SS 與 UI，管制者可能有理由採取分階段程序，使資訊較早進入競爭過程；反之，若序列行動導致過高耗散或較低的配置價值，則統一時點、密封提交或同步揭露等安排可能較為合宜（例如，密封投標與統一截止期限可降低行動先後所造成的資訊揭露；分階段審查、公開遊說登記或即時揭露安排，則可能使先行投入者之行動成為後續參與者的觀察對象）。

較合理的程序設計，仍須依獎酬相關程度、型別差距、事前機率與可支持均衡型態加以判斷。

== 本章小結 <subsec-welfare-summary>

本章以福利分解式 $widetilde(W)^e = widetilde(G)^e - widetilde(T)^e$ 比較各時序。SS 與 UI 的耗散隨 $tilde(A)$、$tilde(B)$ 而動；IU 未扭曲分離則具有耗散中立性，但其福利仍可能隨 $rho$ 上升而下降。

因此，資訊揭露與福利改善之間不存在必然的正向關係。IU 的分離均衡與 Riley 扭曲分別透過不同機制改變配置價值與投入耗散，時序福利排序仍須回到完整公式判斷。

最後，內生時序選擇未必與社會最適時序一致。私人誘因決定的是個別報酬比較，社會福利則同時考量配置與耗散；兩者不必同向，故時序優劣仍須置於具體參數與資訊結構下評估。
