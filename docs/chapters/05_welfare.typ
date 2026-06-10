#import "../thesis.typ": (
  SS, c, corollary, definition, headingref, impt, lemma, proof, proposition, stmtref, term, widetilde,
)

#headingref(<sec-analysis>) 的分析以均衡結構為中心：相關性如何改變不知情者的後驗期望獎酬、IU 子賽局的分離條件如何隨 $rho$ 演變，以及兩位參與者的時序偏好呈現何種不對稱反應。這些結果釐清了均衡能否被支持以及均衡時序如何隨相關性移動的問題。然而，均衡的存在性與其社會福利後果係屬兩個不同層次的問題。某一制度在個別理性條件下構成均衡，並不意味著它帶來最高的資源配置效率或最低的投入耗散。

本章從福利角度重新審視前述結果。在資訊不對稱競賽中，資訊揭露同時存在兩種方向相反的力量：充分揭露型別有助於參與者根據真實狀態調整行為，使較高獎酬的一方更可能勝出，從而改善配置效率；但訊號揭露也會強化不知情者的競爭反應，誘發更高的投入耗散。相關性的提高同時放大這兩種效果，使福利對制度選擇的反應不必然單調。

本章首先建立福利衡量架構，將社會福利分解為配置價值與投入耗散兩個部分。其次，依序分析 SS、UI 與 IU 子賽局各均衡型態下的總投入與福利公式。最後，比較三制度的福利排序，並討論均衡時序選擇與社會最優之間可能存在的落差。

== 衡量架構 <subsec-welfare-framework>

進行制度間的福利比較，須先建立共同的衡量基準。以下依序定義總投入耗散、社會福利，並導出福利分解式，作為後續各節的分析基礎。

#definition(title: [總投入耗散])[
  給定投入組合 $(x_I, x_U)$，總投入耗散定義為
  $
    T(x_I, x_U) = x_I + x_U.
  $ <eq-welfare-total-effort>
  在均衡 $e$ 下，事前期望總投入為
  $
    widetilde(T)^e = EE[x_I^e + x_U^e].
  $ <eq-welfare-expected-effort>
] <def-welfare-effort>

在 Tullock 競賽中，競爭投入不直接創造社會價值——獎酬無論由誰獲得，其總量不變，而投入卻是真實的資源消耗。因此 $widetilde(T)^e$ 愈高，制度所造成的無謂損失愈大。

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
  $ <eq-welfare-social-welfare>
  均衡 $e$ 下的事前期望社會福利為
  $
    widetilde(W)^e = EE[p_I^e V_I + p_U^e V_U - x_I^e - x_U^e].
  $ <eq-welfare-expected-welfare>
] <def-welfare-social>

此定義將獎酬配置與投入耗散同時納入考量：若較高獎酬者有更高機率獲勝，配置面有所改善；若競爭過於激烈，耗散面則惡化。兩者共同決定制度的淨社會價值。

將@eq-welfare-expected-welfare 改寫，得到以下分解：

$
  widetilde(W)^e = widetilde(G)^e - widetilde(T)^e,
$ <eq-welfare-decomposition>

其中 $widetilde(G)^e = EE[p_I^e V_I + p_U^e V_U]$ 為配置所產生的期望總價值。此分解將福利影響拆為兩條路徑：若某制度使較高獎酬的一方獲得更高勝率，$widetilde(G)^e$ 上升；若競爭強度上升，$widetilde(T)^e$ 增加。兩者方向不必然一致，因此制度的淨福利後果取決於配置改善與耗散加劇的相對大小。

== 各子賽局福利 <subsec-welfare-subgames>

三種子賽局的時序結構與資訊揭露機制各不相同，其福利性質因而來自不同的來源。SS 與 UI 的不知情者後驗信念不因均衡投入而更新，競爭強度主要由型別分布與參數決定，福利效果相對直接。IU 子賽局則不同——知情者的投入兼具競賽行動與型別訊號的雙重功能，不知情者的後驗信念與競爭反應皆隨訊號內容而調整，福利後果因此更為複雜。逐一分析各子賽局的福利公式，有助於在制度比較之前，先釐清每種時序結構分別帶來哪些配置效率與耗散的取捨。

基於#headingref(<subsec-welfare-framework>)所建立的衡量架構，依序計算 SS、UI 與 IU 三種子賽局的期望總投入與社會福利。SS 與 UI 各有唯一均衡，公式較為簡潔；IU 子賽局則依相關程度的不同，可能呈現未扭曲分離、Riley 扭曲分離或混同三種均衡型態，各有不同的福利含意，故分開處理之。

=== SS 子賽局 <subsubsec-welfare-ss>

在 SS 子賽局中，均衡由#stmtref(<prop-main-ss-equilibrium>, "命題", "proposition-counter")給定。令 $tilde(A)$、$tilde(B)$ 如@eq-main-ss-ab 所定義，則知情者型別 $v$ 之均衡投入為 $x_I^(SS)(v)$，不知情者均衡投入為 $x_U^(SS)$，且兩者滿足

$
  x_I^(SS)(v) + x_U^(SS) = frac(tilde(A) sqrt(v), 1+tilde(B)).
$ <eq-welfare-ss-total>

取型別期望，得 SS 子賽局之期望總投入耗散：

$
  widetilde(T)^(SS)
  = frac(tilde(A), 1+tilde(B)) (q sqrt(v_H) + (1-q) sqrt(v_L)).
$ <eq-welfare-ss-dissipation>

耗散量由均衡中的型別加權邊際競爭強度決定，即

$
  tilde(A)/(1+tilde(B))
$

各型別的貢獻與其 $sqrt(v)$ 成正比。

由於 SS 子賽局不存在訊號傳遞，社會福利中不知情者的 $V_U$ 期望值，須以知情者型別為條件計算，即分別為 $widetilde(V)_U(1)$ 與 $widetilde(V)_U(0)$。可以驗證，此條件期望的加權與不知情者私人目標函數中的加權恰好一致；故 SS 子賽局的社會福利等於個別均衡期望報酬之和：

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

SS 的福利結構可從分解式 $widetilde(W)^(SS) = widetilde(G)^(SS) - widetilde(T)^(SS)$ 進一步解讀。配置端 $widetilde(G)^(SS)$ 反映在既定均衡勝率下，獎酬流向哪一方的事前期望；耗散端 $widetilde(T)^(SS)$ 則衡量資源消耗。SS 制度下雙方同時行動，知情者的投入雖依型別而異，但不知情者無法在行動前從競爭對手的投入中汲取任何資訊，其競爭強度完全由 $tilde(A)$、$tilde(B)$ 這兩個事前條件期望所決定的型別加權邊際係數主導。因此，相關性 $rho$ 對 SS 福利的影響，係透過 $widetilde(V)_U(1)$、$widetilde(V)_U(0)$ 改變 $tilde(A)$ 與 $tilde(B)$，進而同時作用於@eq-welfare-ss-dissipation 中的耗散項與@eq-welfare-ss-welfare 中的各項。

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
$ <eq-welfare-ui-total>

取型別期望，得期望總投入耗散：

$
  widetilde(T)^(U I)
  = frac(tilde(A), 2) (q sqrt(v_H) + (1-q) sqrt(v_L)).
$ <eq-welfare-ui-dissipation>

對照@eq-welfare-ss-dissipation，兩式結構完全相同，差別僅在分母由 $1+tilde(B)$ 換為 $2$。因此耗散之大小取決於 $tilde(B)$ 與 $1$ 的相對關係：當 $tilde(B) > 1$ 時，$widetilde(T)^(U I) > widetilde(T)^(SS)$；當 $tilde(B) < 1$ 時則相反。

對於社會福利，UI 子賽局同樣無訊號傳遞，相同的論證說明社會福利等於個別均衡期望報酬之和：

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

比較@eq-welfare-ss-welfare 與@eq-welfare-ui-welfare，兩式結構完全對稱——前者以 $1\/(1+tilde(B))$ 衡量競爭強度，後者以 $1\/2$ 取代。此差異的來源在於決策架構：在 SS 中，不知情者與知情者互相最佳化，$tilde(B)$ 項衡量型別加權的贏率成本；在 UI 中，知情者的最佳反應已被代入不知情者的目標函數，此互依效應消失，邊際均等條件退化為純粹的 $sqrt(x_U)$ 邊際。由此可知，UI 使不知情者獲得先行承諾的好處（$widetilde(pi)_U^(U I) >= widetilde(pi)_U^(SS)$），但同時改變了知情者面對的競爭強度，其福利效果視 $tilde(B)$ 之大小而定。

=== IU 子賽局 <subsubsec-welfare-iu>

IU 子賽局的福利分析較 SS 與 UI 更為複雜。知情者先行，其投入同時作為競賽行動與型別訊號；不知情者觀察投入後更新後驗信念，再決定自身的競爭力道。這意味著知情者投入的高低，不只影響直接勝率，也透過後驗信念改變不知情者的後驗期望獎酬，進而影響其參與強度。由於不知情者的競爭反應依均衡型態而定，福利公式也因相關程度的不同而呈現三種截然不同的結構：未扭曲分離、Riley 扭曲分離與混同均衡，以下分別處理。

==== 分離均衡 <subsubsec-welfare-iu-sep>

在未扭曲分離均衡（$rho <= rho^*$）中，高型別選擇 $x_H = v_H^2 \/ (4 widetilde(V)_U (1))$，低型別選擇 $x_L = v_L^2 \/ (4 widetilde(V)_U (0))$，不知情者在兩條路徑上分別形成確定信念。代入不知情者之最佳反應，可得各型別下的總投入：

$
  x_I^*(v, mu) + x_U^*(x_I^*, mu)
  = sqrt(x_I^*(v,mu) widetilde(V)_U (mu))
  = v / 2.
$ <eq-welfare-iu-sep-total>

總投入恰好等於 $v\/2$，與後驗信念 $mu$ 及相關程度 $rho$ 均無關。此係由 Tullock 競賽的最佳反應結構所決定：知情者在完整資訊最適點 $x_I^*(v,mu) = v^2 \/ (4 widetilde(V)_U(mu))$ 的邊際收益等於 $1$，而對應的不知情者最佳反應使總投入化為 $sqrt(x_I \cdot widetilde(V)_U(mu)) = v\/2$，故相關性的改變只影響兩方投入的分配，不改變總量。

取型別期望，期望總投入耗散為

$
  widetilde(T)^"sep" = frac(q v_H + (1-q) v_L, 2) = frac(EE[V_I], 2).
$ <eq-welfare-iu-sep-dissipation>

$widetilde(T)^"sep"$ 不依賴 $rho$，是三種制度中唯一耗散與相關性完全脫鉤的均衡型態。

對社會福利而言，配置效率取決於哪一方更可能獲勝。令 $a_1 = widetilde(V)_U (1)$、$a_0 = widetilde(V)_U (0)$，則

$
  widetilde(W)^"sep"
  = q lr((frac(v_H^2, 2 a_1) + a_1 - v_H))
  + (1-q) lr((frac(v_L^2, 2 a_0) + a_0 - v_L)).
$ <eq-welfare-iu-sep-welfare>

每個括號內的量——$v^2\/(2a)+a-v$——是在後驗期望獎酬為 $a$ 時，知情者選擇其完整資訊最適投入所對應的淨社會價值。此量在 $a=v\/2$ 時最大，即配置效率最高。當 $rho$ 上升，$a_1 = widetilde(V)_U (1)$ 上升而 $a_0 = widetilde(V)_U (0)$ 下降：前者使高型別獲勝時的福利改善，後者使低型別路徑的福利惡化，故 $widetilde(W)^"sep"$ 對 $rho$ 的反應方向取決於兩者的相對大小，一般而言不具單調性。

==== Riley 均衡 <subsubsec-welfare-iu-riley>

當 $rho > rho^*$ 時，未扭曲分離不再成立，IU 子賽局進入 Riley 扭曲分離。高型別維持其完整資訊最適投入 $x_H = v_H^2 \/ (4 a_1)$，低型別則被迫向下壓低投入至 Riley 水準 $x_L^R = (z_H^-)^2$，其中

$
  z_H^- = frac(v_H, 2 sqrt(a_0)) (1 - sqrt(alpha)),
  quad
  alpha = 1 - frac(a_0, a_1).
$ <eq-welfare-iu-riley-z>

高型別路徑的總投入與未扭曲分離相同，仍為 $v_H\/2$。低型別路徑的總投入為

$
  x_L^R + x_U^*(x_L^R, 0)
  = sqrt(x_L^R a_0)
  = z_H^- sqrt(a_0)
  = frac(v_H (1 - sqrt(alpha)), 2).
$ <eq-welfare-iu-riley-low-total>

期望總投入耗散因而為

$
  widetilde(T)^R
  = frac(v_H, 2) lr([q + (1-q)(1 - sqrt(alpha))])
  = frac(v_H, 2) lr([1 - (1-q) sqrt(alpha)]).
$ <eq-welfare-iu-riley-dissipation>

相較於未扭曲分離，Riley 均衡對高型別路徑的耗散沒有影響，但低型別路徑的耗散由 $v_L\/2$ 改為 $v_H (1-sqrt(alpha))\/2$，兩者孰高取決於 $v_H (1-sqrt(alpha))$ 與 $v_L$ 的相對大小。

社會福利中，高型別路徑貢獻與未扭曲分離相同；低型別路徑則以 $x_L^R$ 決定勝率，其福利為

$
  W^R (v_L)
  = a_0 + frac(v_H (1-sqrt(alpha)), 2 a_0)(v_L - 2 a_0).
$ <eq-welfare-iu-riley-low-welfare>

故全體期望社會福利為

$
  widetilde(W)^R
  = q lr((frac(v_H^2, 2 a_1) + a_1 - v_H))
  + (1-q) W^R (v_L).
$ <eq-welfare-iu-riley-welfare>

比較 Riley 與未扭曲分離：高型別的福利貢獻不變，低型別的投入由 $x_L = v_L^2\/(4a_0)$ 改為 $x_L^R = (z_H^-)^2$。由 Riley 均衡的構造可知 $x_L^R < x_L$（低型別向下扭曲），此一扭曲降低了低型別的勝率，配置效率與耗散同時改變，其淨福利效果需視 $v_L$ 與 $a_0$ 的相對大小而定。

==== 混同均衡 <subsubsec-welfare-iu-pool>

在混同均衡中，兩種型別選擇相同投入 $x_P$，不知情者的後驗信念停留於先驗水準 $mu = q$，故其後驗期望獎酬為 $widetilde(V)_U (q) = overline(v)$。

不知情者最佳反應為 $x_U^*(x_P, q) = sqrt(x_P overline(v)) - x_P$，總投入為 $sqrt(x_P overline(v))$，故

$
  widetilde(T)^"P" = sqrt(x_P overline(v)).
$ <eq-welfare-iu-pool-dissipation>

對配置效率而言，由於兩種型別選擇相同投入，知情者的勝率 $p_I = sqrt(x_P \/ overline(v))$ 與型別無關，社會計畫者對每一型別實現所評估的期望配置價值均為

$
  q G^"P" (v_H) + (1-q) G^"P" (v_L)
  = overline(v).
$ <eq-welfare-iu-pool-allocation>

配置價值等於 $overline(v)$，反映混同均衡中訊號完全喪失：投入行為不再傳遞任何型別資訊，獎酬以先驗機率流向各方，期望配置價值退化為無條件期望。因此

$
  widetilde(W)^"P"
  = overline(v) - sqrt(x_P overline(v)).
$ <eq-welfare-iu-pool-welfare>

混同均衡的福利嚴格遞減於 $x_P$：混同投入愈高，耗散愈大，而配置價值固定為 $overline(v)$，故淨社會價值單調下降。混同均衡集合中，福利最大者為使 $x_P$ 最小的均衡配置。

=== 三制度福利比較 <subsubsec-welfare-comparison>

前三節分別推導了 SS、UI 與 IU 三種制度下各均衡型態的社會福利公式。三者雖共享相同的物理架構——獎酬、投入與勝率——但其耗散結構與配置機制存在本質差異：SS 與 UI 中，競爭強度由事前加權的 $tilde(A)$ 統一決定，不知情者不隨型別調整反應；IU 分離均衡中，後驗信念確定化後每條型別路徑自成一局，型別別競爭改善了配置效率，但同時引入訊號機制所伴生的扭曲。因此，跨制度的福利比較不能僅看公式形式，必須追蹤耗散與配置在不同相關性水準 $rho$ 下的動態消長。

@tab-welfare-summary 以統一格式整理五種均衡型態的期望耗散公式、配置特徵，及其對相關性參數 $rho$ 的依賴方式，作為後續比較的共同參照。值得特別注意者有兩點：其一，IU 未扭曲分離的耗散 $EE[V_I]\/2$ 對 $rho$ 完全不敏感，此係由型別別投入在均衡中恰好消去 $rho$ 依賴性所致；其二，SS 與 UI 的耗散均透過 $tilde(A)$ 隨 $rho$ 連續變動，而 IU Riley 扭曲分離的耗散則透過 $alpha = tilde(V)_U(0)\/tilde(V)_U(1)$ 受 $rho$ 牽動，三者對相關性的反應速率各異，正是制度福利排序隨 $rho$ 翻轉的根本來源。

#figure(
  table(
    columns: (3.7cm, 4cm, 6.5cm),
    inset: 8pt,
    align: (col, row) => if col == 0 or col == 2 { left + horizon } else { center + horizon },
    stroke: none,
    table.hline(y: 0, stroke: 0.6pt),
    table.hline(y: 1, stroke: 0.4pt),
    table.hline(y: 6, stroke: 0.6pt),
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
    [型別別競爭，確定後驗 \ 耗散與 $rho$ 無關，僅配置端受 $rho$ 影響],
    [IU Riley 扭曲分離],
    [$frac(v_H, 2)[1-(1-q)sqrt(alpha)]$],
    [型別別，低型別投入扭曲 \ 透過 $alpha$ 隨 $rho$ 改變],
    [IU 混同],
    [$sqrt(x_P overline(v))$],
    [無型別排序，配置值固定為 $overline(v)$ \ $rho$ 不影響配置或耗散],
  ),
  caption: [各均衡型態之福利結構摘要],
  supplement: [表],
) <tab-welfare-summary>

SS 與 UI 的耗散結構相同，差別僅在分母 $1+tilde(B)$ 與 $2$ 之別。整理兩式之差，得

$
  widetilde(W)^(U I) - widetilde(W)^(SS)
  = frac(tilde(A)(1-tilde(B)), 1+tilde(B)) lr((EE[sqrt(V_I)] - frac(tilde(A), 2))).
$ <eq-welfare-ui-ss-diff>

符號取決於 $(1-tilde(B))$ 與 $(EE[sqrt(V_I)] - tilde(A)\/2)$ 的乘積，一般而言不具確定方向。特別地，當 $tilde(B) = 1$ 時兩制度的社會福利相等，但不知情者個別報酬仍滿足 $widetilde(pi)_U^(U I) > widetilde(pi)_U^(SS)$——此差額恰好被知情者報酬之降低所抵銷。

IU 分離均衡與 SS、UI 之間的關鍵結構差異，在於耗散的相關性依賴度。$widetilde(T)^"sep" = EE[V_I]\/2$ 與 $rho$ 完全無關，而 $widetilde(T)^(SS)$ 與 $widetilde(T)^(U I)$ 均隨 $rho$ 改變（透過 $tilde(A)$）。因此，隨 $rho$ 上升，SS 與 UI 的耗散受 $tilde(A)$ 變動牽引，IU 的耗散則固定不動，使福利排序可能翻轉。配置端亦有結構差異：IU 分離均衡在兩條路徑上誘發確定後驗信念，不知情者依型別條件競爭；SS 與 UI 中不知情者的競爭強度由事前加權係數 $tilde(A)$、$tilde(B)$ 統一決定，不區分型別。型別別競爭改善高型別路徑的配置效率，但也可能在低型別路徑上造成配置失衡，需視 $a_1\/a_0$ 的相對大小而定。

混同均衡的配置價值固定為 $overline(v)$，低於分離均衡在高型別路徑上所獲得的配置改善。若混同投入 $x_P$ 極小，$widetilde(W)^"P" = overline(v) - sqrt(x_P overline(v))$ 可能接近 $overline(v)$；然而 $x_P$ 的可行下界由 IC 條件決定，未必可任意壓低，故混同均衡的福利一般處於劣勢。

== 制度福利比較 <subsec-welfare-comparison>

前兩節確立了各制度的福利公式，並歸納於@tab-welfare-summary。在此基礎上，本節從兩個層次推進比較分析：其一，檢視#headingref(<sec-analysis>)所刻畫的內生時序均衡，是否與最大化社會福利的制度安排一致；其二，追蹤相關性參數 $rho$ 如何透過耗散效果、配置效果與閾值跳躍三條管道，共同決定社會福利的非單調演變路徑。

=== 均衡時序與福利效率 <subsubsec-welfare-efficiency>

第四章的內生時序均衡由參賽者的私人報酬決定：$I$ 比較 $widetilde(pi)_I^(I U)$ 與 $widetilde(pi)_I^(SS)$，選擇對自身有利者；$U$ 則在給定 $I$ 的時點選擇下比較先動與後動的個人報酬。然而，社會福利 $widetilde(W) = widetilde(G) - widetilde(T)$ 要求最大化配置價值、最小化耗散的聯合目標，此一目標既不等同於 $I$ 的私人問題，也不等同於 $U$ 的私人問題。$I$ 不內化 $U$ 的報酬，$U$ 不內化 $I$ 的報酬；因此，二者私人誘因所誘導的均衡制度，未必是社會最優的制度選擇。

均衡時序偏離社會最優的情形可從兩個方向加以識別。

*偏離方向一：均衡為 SS，但 IU 的社會福利更高。*當相關性 $rho$ 超過翻轉臨界值 $rho^dagger$ 後，$I$ 的先動誘因 $Delta_I^(I U) < 0$，均衡時序轉為 SS 或 UI。然而，IU 未扭曲分離的期望耗散 $widetilde(T)^"sep" = EE[V_I] \/ 2$ 對 $rho$ 完全不敏感，而 SS 的期望耗散 $widetilde(T)^(SS) = frac(tilde(A), 1+tilde(B)) EE[sqrt(V_I)]$ 則透過 $tilde(A)$ 隨 $rho$ 上升而持續增加。因此，在高相關性區間，若 IU 分離均衡的配置效率足以彌補制度切換的代價，便可能出現 $widetilde(W)^"sep" > widetilde(W)^(SS)$ 而均衡卻已停留於 SS 的情形。此時，私人誘因所引導的制度選擇陷入一種特定的效率失靈：正是 $I$ 為規避揭露成本而放棄先動，使資源耗散更嚴重的制度在均衡中被維持。

*偏離方向二：均衡為 IU，但 SS 的社會福利更高。*當 $rho$ 偏低、$I$ 偏好先動時，IU 分離均衡要求低型別的均衡投入在 Riley 區間 ($rho > rho^*$) 發生向下扭曲，低型別路徑上 $U$ 的後驗期望獎酬不匹配其真實競爭強度，配置效率因而惡化。此外，高型別路徑上 $U$ 的後驗期望獎酬 $widetilde(V)_U (1)$ 被推高，$U$ 的競爭反應強化，高型別路徑的耗散相應上升。若此一雙重效果在總福利層次超過 IU 分離所帶來的配置改善，便可能出現 $widetilde(W)^(SS) > widetilde(W)^(I U)$ 而均衡為 IU 的情形。

兩種偏離方向雖來源不同，卻共享相同的機制根源：制度選擇由 $I$ 的局部誘因主導，既未考量 $U$ 的報酬，亦未兼顧 $widetilde(T)$ 與 $widetilde(G)$ 之間的全局替換關係。均衡時序選擇的效率性，因此不是一個可以一般性成立的結論，而是取決於 $rho$、$delta$、$V$ 的具體參數組合。

=== 相關性對福利的影響 <subsubsec-welfare-rho>

相關性參數 $rho$ 對社會福利的影響，透過三條相互拮抗的管道發生，使福利對 $rho$ 的反應一般呈現非單調特性。

*配置效果。*$rho$ 上升使後驗期望獎酬 $widetilde(V)_U (1)$ 與 $widetilde(V)_U (0)$ 的差距擴大：高信號路徑上 $U$ 的後驗估值上升，低信號路徑上則下降。在 IU 未扭曲分離均衡中，$a_1 = widetilde(V)_U (1)$ 與 $a_0 = widetilde(V)_U (0)$ 分別決定兩條型別路徑上的競爭強度，型別別競爭因此愈發貼近真實獎酬，配置效率隨 $rho$ 改善。此一效果在 IU 制度中最為顯著，SS 與 UI 中配置效果相對平滑——事前加權的 $tilde(A)$ 雖隨 $rho$ 上升，但不存在型別別的差異化調整。

*耗散效果。*$rho$ 上升亦使 $tilde(A) = EE[sqrt(widetilde(V)_U)]$ 提高，SS 與 UI 的均衡投入因而增加，總耗散 $widetilde(T)^(SS)$ 與 $widetilde(T)^(U I)$ 均隨 $rho$ 上升而擴大。IU 未扭曲分離的耗散 $EE[V_I]\/2$ 固定不受此效果影響，構成一道對相關性的隔絕；IU Riley 扭曲分離的耗散 $frac(v_H, 2)[1-(1-q)sqrt(alpha)]$ 則透過 $alpha = widetilde(V)_U (0) \/ widetilde(V)_U (1)$ 隨 $rho$ 改變，不再保有此種穩定性。

*閾值效果。*在 $rho = rho^*$ 處，IU 子賽局由未扭曲分離轉為 Riley 扭曲分離。低型別的均衡投入從最適水準 $x_L^*$ 向下跳至 $x_L^"R" < x_L^*$，低型別路徑的耗散雖有所降低，但配置效率亦同步惡化：$U$ 在低信號路徑上的有效競爭強度仍由 $a_0$ 決定，而低型別投入的向下扭曲使 $I$ 的實際勝率偏離最適水準。在 $rho^*$ 處，社會福利因此存在一個由扭曲成本所引致的非連續性衰減。

三效果疊加的淨結果依制度與參數區間而異。在均衡為 IU 未扭曲分離的區間（$rho <= min(rho^dagger, rho^*)$），耗散效果被隔絕，僅配置效果發生作用，故 $widetilde(W)^"sep"$ 對 $rho$ 單調遞增。一旦均衡跨越 $rho^dagger$ 轉入 SS，SS 的耗散隨 $rho$ 持續上升，單調遞增性不再成立。在 $rho > rho^*$ 的 Riley 區間，閾值效果疊加，低型別扭曲進一步壓低社會福利，使福利對 $rho$ 的反應更加複雜。

== 本章小結 <subsec-welfare-summary>

本章以第四章的均衡結構為基礎，從耗散、配置與制度效率三個層次分析各制度下的社會福利，主要結論如下。

就耗散結構而言，各均衡型態呈現截然不同的相關性依賴度：SS 與 UI 的耗散均隨 $rho$ 上升（透過 $tilde(A)$），IU 未扭曲分離的耗散 $EE[V_I]\/2$ 則對 $rho$ 完全不敏感。此一結構差異意味著，隨相關性提高，SS 與 UI 的耗散持續擴大，而 IU 未扭曲分離的耗散保持固定，兩類制度的相對福利因此隨 $rho$ 系統性演變。

就制度比較而言，SS 與 UI 的福利差取決於 $(1-tilde(B))$ 與 $(EE[sqrt(V_I)] - tilde(A)\/2)$ 的乘積，方向不確定。IU 分離均衡與 SS、UI 的比較則隨 $rho$ 翻轉：在低相關區間，IU 的型別別配置可能優於 SS 的事前加權競爭；在高相關區間，SS 耗散持續增長，IU 分離均衡的成本優勢（耗散固定）愈發顯著，但 $I$ 的私人誘因此時已轉向 SS，制度選擇與社會最優出現背離。

就均衡效率而言，內生時序由 $I$ 的私人誘因決定，系統性地偏離社會最優。偏離可沿兩個方向發生：其一，高相關性下 $I$ 放棄先動，但 IU 的低耗散使社會最優為 IU；其二，低相關性下 $I$ 選擇先動，Riley 扭曲使社會最優可能為 SS。此外，$rho$ 對社會福利的影響一般非單調：在 IU 未扭曲分離區間單調遞增（配置效果主導），均衡轉為 SS 後遞增性消失，越過 $rho^*$ 後 Riley 扭曲成本進一步拉低福利。
