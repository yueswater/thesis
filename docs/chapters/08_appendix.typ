#import "../thesis.typ": SS, UI, c, headingref, impt, proof, stmtref, theorem-font, widetilde

==== #stmtref(<prop-bench-ss-equilibrium>, "命題", "proposition-counter") 之證明 <app-proof-ss>

#proof[
  將各型別之@eq-bench-br-I 代入不知情者之事前一階條件並整理，得 $hat(A) \/ sqrt(x_U) - hat(B) = 1$，故 $sqrt(x_U^(SS)) = hat(A) \/ (1 + hat(B))$。代回@eq-bench-br-I 與報酬函數，即得命題所列投入與報酬。
]

==== #stmtref(<prop-bench-ui-equilibrium>, "命題", "proposition-counter") 之證明 <app-proof-ui>

#proof[
  對@eq-bench-ui-leader 取一階條件 $hat(A) \/ (2 sqrt(x_U)) = 1$，得 $x_U^UI = hat(A)^2 \/ 4$；代回@eq-bench-br-I 與報酬函數，即得其餘投入與報酬。
]

==== #stmtref(<prop-bench-iu-equilibrium>, "命題", "proposition-counter") 之證明 <app-proof-iu>

#proof[
  由於 $widetilde(V)_U (mu) = overline(v)$ 與 $mu$ 無關，不知情者觀察單一 $x_I$ 之最佳反應即@eq-bench-br-U。知情者面對的延續報酬因而化為
  $
    pi_I (x_I; v) = v sqrt(x_I / overline(v)) - x_I,
  $
  其對 $x_I$ 嚴格凹，一階條件給出 $x_I^(I U)(v) = v^2 \/ (4 overline(v))$，從而得 $x_U^(I U)(v)$ 與各型別報酬。

  取信念 $mu(x_H) = 1$、$mu(x_L) = 0$、均衡路徑外 $mu(x) = 1$。兩條誘因相容條件（高、低型別互相模仿）之誘因差額均化為 $(v_H - v_L)^2 \/ (4 overline(v)) > 0$，故皆嚴格成立且與 $q$ 無關。又因延續報酬嚴格凹、各型別唯一最適投入互異（$v_H eq.not v_L$），無共同投入能同時使兩型別最適，混同與半分離均衡因而排除。
]

==== #stmtref(<lem-main-posterior-expected-valuation>, "引理", "lemma-counter") 之證明 <app-proof-main-posterior>

#proof[
  由@tbl-main-joint-corr 可得
  $
    Pr(V_U=v_H|V_I=v_H) & = q + rho(1-q) \
    Pr(V_U=v_H|V_I=v_L) & = q(1-rho).
  $
  在權重 $mu$ 下，由全機率律，
  $
    Pr(V_U=v_H|mu) & = mu [q + rho(1-q)] + (1-mu) q(1-rho) \
                   & = q + rho(mu-q).
  $
  因而
  $
    widetilde(V)_U (mu) & = Pr(V_U=v_H|mu) v_H + Pr(V_U=v_L|mu) v_L \
                        & = v_L + Pr(V_U=v_H|mu) (v_H-v_L) \
                        & = v_L + [q + rho(mu-q)] Delta V.
  $
]

==== #stmtref(<prop-main-ss-equilibrium>, "命題", "proposition-counter") 之證明 <app-proof-main-ss>

#proof[
  推導與#stmtref(<prop-bench-ss-equilibrium>, "命題", "proposition-counter")完全類同。在部分相關設定下，不知情者的事前問題以 $widetilde(V)_U (1)$ 與 $widetilde(V)_U (0)$ 取代基準模型中的 $overline(v)$，型別加權邊際係數因而從 $hat(A)$、$hat(B)$ 替換為 $tilde(A)$、$tilde(B)$；一階條件 $tilde(A) \/ sqrt(x_U) - tilde(B) = 1$ 給出 $x_U^(SS)$，其餘結果由代入得到。
]

==== #stmtref(<prop-main-ui-equilibrium>, "命題", "proposition-counter") 之證明 <app-proof-main-ui>

#proof[
  對不知情者之領導者報酬 $widetilde(pi)_U^(U I)(x_U) = tilde(A) sqrt(x_U) - x_U$ 取一階條件 $tilde(A) \/ (2 sqrt(x_U)) = 1$，得 $x_U^(U I) = tilde(A)^2 \/ 4$；代回知情者之最佳反應與報酬函數，即得其餘投入與報酬。
]

==== #stmtref(<prop-main-iu-separating-candidate>, "命題", "proposition-counter") 之證明 <app-proof-main-iu-separating>

#proof[
  路徑上信念 $mu(x_H) = 1$、$mu(x_L) = 0$ 由貝氏法則決定，對應投入即正文之 $x_H$、$x_L$；以下檢驗兩型別之模仿誘因。

  #set enum(numbering: "(1)")

  1. #impt("高型別模仿低型別")：高型別改取 $x_L$ 將被視為低型別，模仿報酬為
    $
      pi_H (x_L; mu = 0)
      = v_H sqrt(x_L / widetilde(V)_U (0)) - x_L
      = v_L (2 v_H - v_L) / (4 widetilde(V)_U (0)).
    $
    故其誠實揭露之充要條件 $v_H^2 \/ (4 widetilde(V)_U (1)) >= v_L (2 v_H - v_L) \/ (4 widetilde(V)_U (0))$，整理即得命題所列分離條件。

  2. #impt("低型別模仿高型別")：低型別改取 $x_H$ 之報酬為 $pi_L (x_H; mu = 1) = v_H (2 v_L - v_H) \/ (4 widetilde(V)_U (1))$。因 $v_L^2 - v_H (2 v_L - v_H) = (v_H - v_L)^2 > 0$ 且 $widetilde(V)_U (1) >= widetilde(V)_U (0)$，其分離報酬 $pi_L = v_L^2 \/ (4 widetilde(V)_U (0))$ 嚴格較高，向上模仿之誘因相容條件自動成立；可能形成約束者僅 (1)。

  在路徑外信念 $mu(x) = 1$ 下，高型別任意偏離至多取得 $v_H^2 \/ (4 widetilde(V)_U (1))$、低型別至多取得 $v_L^2 \/ (4 widetilde(V)_U (1)) <= pi_L$，皆不優於其分離報酬。故分離條件成立時，上述策略與信念構成完美貝氏均衡；反之高型別將逕行模仿 $x_L$，任何路徑外信念皆無從遏止，未扭曲分離均衡不存在。
]

==== #stmtref(<prop-main-iu-rho-star>, "命題", "proposition-counter") 之證明 <app-proof-main-iu-rho-star>

#proof[
  由#stmtref(<lem-main-posterior-expected-valuation>, "引理", "lemma-counter")，$widetilde(V)_U (1) = v_L + [q + rho(1-q)] Delta V$、$widetilde(V)_U (0) = v_L + q(1-rho) Delta V$，故比值對 $rho$ 之導數為
  $
    frac(d(widetilde(V)_U (1) \/ widetilde(V)_U (0)), d rho)
    = frac(Delta V dot widetilde(V)_U (q), widetilde(V)_U (0)^2) > 0,
  $
  比值嚴格遞增。將分離條件之等號 $widetilde(V)_U (1) = R widetilde(V)_U (0)$ 依 $rho$ 整理，得
  $
    rho [(1-q) + R q] Delta V = (R-1) widetilde(V)_U (q).
  $
  兩邊除以 $[(1-q) + R q] Delta V$，並以 $(1-q) + R q = 1 + q(R-1)$ 改寫分母，即得定理所列臨界值
  $
    rho^* = frac(R-1, 1 + q(R-1)) dot frac(widetilde(V)_U (q), Delta V).
  $
  端點處，$rho = 0$ 時比值為 $1 < R$、$rho = 1$ 時比值為 $v_H \/ v_L > R$ (因 $v_H > v_L$)，故未扭曲分離於前者嚴格成立、於後者失效。
]

==== #stmtref(<prop-main-iu-riley>, "命題", "proposition-counter") 之證明 <app-proof-main-iu-riley>

#proof[
  考慮高型別向下模仿低型別的誘因。若高型別選擇將被解讀為低型別之投入 $x' <= x_L^* equiv v_L^2 \/ (4 widetilde(V)_U (0))$ (信念 $mu = 0$)，其模仿報酬為 $v_H sqrt(x' \/ widetilde(V)_U (0)) - x'$。令 $z = sqrt(x')$，並以 $pi_H = v_H^2 \/ (4 widetilde(V)_U (1))$ 表其均衡報酬，則不模仿之條件 $pi_H >= v_H sqrt(x' \/ widetilde(V)_U (0)) - x'$ 化為
  $
    z^2 - frac(v_H, sqrt(widetilde(V)_U (0))) z + frac(v_H^2, 4 widetilde(V)_U (1)) >= 0.
  $
  在 $rho > rho^*$ 下 $widetilde(V)_U (1) > widetilde(V)_U (0)$，上式有兩實根，較小根即命題所定義之 $z_H^-$；二次式開口向上且僅考慮向下扭曲分支 $x' <= x_L^*$，故不模仿之可行集合為 $z <= z_H^-$。為以最小扭曲維持分離，低型別取使該條件恰為等號之最大可行投入，即 $x_L^"Riley" = (z_H^-)^2$。

  其餘偏離：在路徑外信念 $mu = 1$ 下，高型別延續報酬 $v_H sqrt(x \/ widetilde(V)_U (1)) - x$ 於 $x_H$ 處唯一最大，故不另行偏離。低型別之檢驗須留意其均衡投入 $x_L^"Riley"$ 已低於自身最適 $x_L^* equiv v_L^2 \/ (4 widetilde(V)_U (0))$，均衡報酬 $pi_L^"Riley" = v_L sqrt(x_L^"Riley" \/ widetilde(V)_U (0)) - x_L^"Riley"$ 因而低於未扭曲之 $pi_L$，故不能逕由#stmtref(<prop-main-iu-separating-candidate>, "命題", "proposition-counter")之證明第 (2) 點繼承。低型別任何被解讀為高型別之偏離 (含 $x_H$ 與一切路徑外投入) 至多取得 $v_L^2 \/ (4 widetilde(V)_U (1))$，故僅需驗證
  $
    pi_L^"Riley" >= v_L^2 \/ (4 widetilde(V)_U (1)).
  $
  將此不等式以 $z = sqrt(x)$ 表為二次式，其結構與高型別之不模仿條件全同、僅以 $v_L$ 代 $v_H$，較小根因而為 $w_L^- = (v_L \/ v_H) z_H^- < z_H^- = sqrt(x_L^"Riley")$。又因 $rho > rho^*$ 對應向下扭曲，$x_L^"Riley" < x_L^*$，故 $x_L^"Riley"$ 落於下方交點 $(w_L^-)^2$ 與峰值 $x_L^*$ 之間；於此區間凹函數 $v_L sqrt(x \/ widetilde(V)_U (0)) - x$ 恆不低於 $v_L^2 \/ (4 widetilde(V)_U (1))$，上述不等式成立，低型別亦不偏離。高型別之誘因相容由 $x_L^"Riley"$ 之構造保證，故上述策略與信念構成 Riley 扭曲分離均衡。
]

==== #stmtref(<prop-main-iu-pooling>, "命題", "proposition-counter") 之證明 <app-proof-main-iu-pooling>

#proof[
  令兩型皆選共同投入 $x_P$。路徑上信念 $mu(x_P) = q$，型別 $v$ 之延續報酬為 $v sqrt(x_P \/ widetilde(V)_U (q)) - x_P$；於路徑外信念 $mu = 1$ 下，任意偏離至多取得 $v^2 \/ (4 widetilde(V)_U (1))$。故型別 $v$ 不偏離之誘因相容條件為
  $
    v sqrt(x_P \/ widetilde(V)_U (q)) - x_P >= v^2 \/ (4 widetilde(V)_U (1)).
  $
  令 $z = sqrt(x_P)$，上式為開口向上之二次不等式 $z^2 - (v \/ sqrt(widetilde(V)_U (q))) z + v^2 \/ (4 widetilde(V)_U (1)) <= 0$，其解為
  $
    z in [ frac(v, 2 sqrt(widetilde(V)_U (q))) (1 - theta), frac(v, 2 sqrt(widetilde(V)_U (q))) (1 + theta) ],
    quad theta equiv sqrt(1 - widetilde(V)_U (q) \/ widetilde(V)_U (1)).
  $
  混同須兩型別同時滿足。因 $v_H > v_L$，高型別之可行區間整體偏右、低型別偏左，交集非空若且唯若高型別下界不超過低型別上界，即 $v_H (1 - theta) <= v_L (1 + theta)$，亦即
  $
    theta >= (v_H - v_L) \/ (v_H + v_L).
  $
  兩邊平方，代入 $theta^2 = 1 - widetilde(V)_U (q) \/ widetilde(V)_U (1)$ 與 $1 - ((v_H - v_L) \/ (v_H + v_L))^2 = 4 v_H v_L \/ (v_H + v_L)^2$，整理得 $widetilde(V)_U (1) - widetilde(V)_U (q) >= widetilde(V)_U (q) Delta V^2 \/ (4 v_H v_L)$。再由#stmtref(<lem-main-posterior-expected-valuation>, "引理", "lemma-counter")，$widetilde(V)_U (1) - widetilde(V)_U (q) = rho (1-q) Delta V$，兩邊除以 $(1-q) Delta V$ 即得 $rho >= rho_P$。
]

==== #stmtref(<lem-main-timing-DIUI>, "引理", "lemma-counter") 之證明 <app-proof-main-timing-DIUI>

#proof[
  在 SS 與 UI 子賽局中，知情者皆對固定之不知情者投入 $x_U$ 作最佳反應，型別 $v$ 之報酬為 $(sqrt(v) - sqrt(x_U))^2$。故兩時序之知情者事前報酬同具形式
  $
    widetilde(pi)_I^J = g(c_J), quad
    g(c) equiv q (sqrt(v_H) - c)^2 + (1-q)(sqrt(v_L) - c)^2
    = c^2 - 2 overline(s) c + (q v_H + (1-q) v_L),
  $
  其中 $c_J equiv sqrt(x_U^J)$、$overline(s) equiv q sqrt(v_H) + (1-q) sqrt(v_L)$。由#stmtref(<prop-main-ss-equilibrium>, "命題", "proposition-counter")與#stmtref(<prop-main-ui-equilibrium>, "命題", "proposition-counter")，$c_(SS) = tilde(A) \/ (1 + tilde(B))$、$c_(U I) = tilde(A) \/ 2$。$g$ 為開口向上之拋物線、頂點於 $c = overline(s)$，故
  $
    D_I^(U I) = g(c_(U I)) - g(c_(SS)) = (c_(U I) - c_(SS))(c_(U I) + c_(SS) - 2 overline(s)).
  $

  #impt[因子一] $c_(U I) - c_(SS) = tilde(A) (tilde(B) - 1) \/ (2(1 + tilde(B)))$，符號同 $tilde(B) - 1$。由#stmtref(<lem-main-posterior-expected-valuation>, "引理", "lemma-counter")之分解 $widetilde(V)_U (1) = widetilde(V)_U (q) + rho(1-q) Delta V$、$widetilde(V)_U (0) = widetilde(V)_U (q) - rho q Delta V$ 代入 $tilde(B)$ 定義，得
  $
    tilde(B)(rho) = hat(B) - rho frac(q(1-q) Delta V^2, v_H v_L),
  $
  對 $rho$ 線性遞減，且 $tilde(B)(1) = q^2 + (1-q)^2 + 2 q(1-q) = 1$。故 $tilde(B) >= 1$ 於 $[0,1]$，等號當且唯當 $rho = 1$，因子一非負。

  #impt[因子二] UI 內點要求低型別投入為正，$x_I^(U I)(v_L) = c_(U I) (sqrt(v_L) - c_(U I)) > 0$，即 $c_(U I) < sqrt(v_L)$；SS 同理得 $c_(SS) < sqrt(v_L)$。又 $overline(s) >= sqrt(v_L)$，故 $c_(U I) + c_(SS) < 2 sqrt(v_L) <= 2 overline(s)$，因子二為負。

  二因子相乘得 $D_I^(U I) <= 0$，等號當且唯當因子一為零，即 $rho = 1$。
]

==== 知情者 IU 時序事前報酬之相關性單調性之證明 <app-proof-main-timing-iu-rho>

#proof[
  由#stmtref(<lem-main-posterior-expected-valuation>, "引理", "lemma-counter")，$d widetilde(V)_U (1) \/ d rho = (1-q) Delta V > 0$、$d widetilde(V)_U (0) \/ d rho = -q Delta V < 0$。據此對 $widetilde(pi)_I^(I U)$ 微分，
  $
    frac(d widetilde(pi)_I^(I U), d rho)
    = frac(q(1-q) Delta V, 4)
    [ frac(v_L^2, widetilde(V)_U (0)^2) - frac(v_H^2, widetilde(V)_U (1)^2) ].
  $
  又 $v_H widetilde(V)_U (0) - v_L widetilde(V)_U (1) = (1-rho) Delta V [v_L + q Delta V] > 0$ 對 $rho < 1$ 成立，故 $v_H \/ widetilde(V)_U (1) > v_L \/ widetilde(V)_U (0)$，中括號為負；由 $q(1-q) Delta V \/ 4 > 0$ 遂得 $d widetilde(pi)_I^(I U) \/ d rho < 0$。
]

==== #stmtref(<thm-main-endogenous-timing>, "定理", "theorem-counter") 之證明 <app-proof-main-timing-theorem>

#proof[
  由#stmtref(<lem-main-timing-characterization>, "引理", "lemma-counter")逐格檢驗。UI 須 $D_I^(U I) >= 0$ 且 $D_U^(U I) >= 0$：後者由@eq-main-ui-first-mover 恆成立，前者由#stmtref(<lem-main-timing-DIUI>, "引理", "lemma-counter")僅於 $rho = 1$ 成立，故 UI 唯於 $rho = 1$ 構成均衡。IU 須 $D_I^(I U) >= 0$ 且 $D_U^(I U) >= 0$：由#stmtref(<lem-main-timing-rho-dagger>, "引理", "lemma-counter")，$D_I^(I U) >= 0$ 當 $rho <= rho^dagger$；該區間內 $D_U^(I U) > 0$，IU 遂構成唯一均衡。SS 須 $D_I^(U I) <= 0$ 且 $D_U^(I U) <= 0$：前者恆成立，故 SS 繫於 $D_U^(I U) <= 0$。當 $rho^dagger < rho < 1$ 且 $D_U^(I U) > 0$ 時三者皆不成立，故無純策略均衡。
]

