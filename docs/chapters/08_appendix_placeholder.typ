#import "../thesis.typ": c, cite-blue, headingref, proof, theorem-font, widetilde

#let stmtref(lbl, kind, key) = context {
  let loc = query(lbl).first().location()
  let no = counter(key).at(loc).at(0)
  link(loc)[#text(fill: cite-blue)[#kind #no]]
}

== #stmtref(<lem-main-br>, "引理", "lemma-counter") 之證明 <proof-lem-br>

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
                      (sqrt(x_I) / (2 sqrt(hat(V)_U(m)))) dot rho Delta V.
  $
  在 $rho > 0$ 且獎酬價值具異質性 ($v_H > v_L$) 的假設下，上述導數項嚴格為正 #footnote("其直覺在於：當獎酬價值具備型別正相關性時，不知情者對於「對手實力」與「自身利益」的判斷會產生連動。當不知情者觀察到知情者的投入並上修對對手為高型別的後驗信念時，由於雙方型別呈正相關，隱含不知情者自身的獎酬價值更可能處於高水準。此種「獎品價值更高」的預期心理，抵銷了對手變強帶來的威懾效應，誘發其投入更多資源進行競爭。")。
]

== #stmtref(<prop-main-separation>, "命題", "proposition-counter") 之證明 <proof-prop-sep>

#proof[
  考慮#headingref(<subsec-main-boundary>)前述的候選分離配置。若高型別誠實揭露，則其均衡報酬為

  $
    pi_H = v_H^2 / (4 hat(V)_U(1)).
  $

  若高型別改為模仿低型別，則不知情者會沿低型別路徑反應，因此其偏離報酬為

  $
    widetilde(pi)_H^d
    =
    (v_L (2 v_H - v_L)) / (4 hat(V)_U(0)).
  $

  因而，高型別的誘因相容條件為 $pi_H >= widetilde(pi)_H^d$，亦即：

  $
    v_H^2 / (4 hat(V)_U(1))
    >=
    (v_L (2 v_H - v_L)) / (4 hat(V)_U(0)).
  $

  兩邊同乘 $4 hat(V)_U(1) hat(V)_U(0)$ 後，可改寫為

  $
    hat(V)_U(1) / hat(V)_U(0)
    <=
    v_H^2 / (v_L (2 v_H - v_L))
    =
    R.
  $

  再看低型別。其誠實報酬為 $pi_L = v_L^2 / (4 hat(V)_U(0))$；若模仿高型別，偏離報酬為

  $
    widetilde(pi)_L^d
    =
    (v_H (2 v_L - v_H)) / (4 hat(V)_U(1)).
  $

  因此，低型別的誘因相容條件等價於

  $
    hat(V)_U(1) / hat(V)_U(0)
    >=
    (v_H (2 v_L - v_H)) / v_L^2.
  $

  在本文關心的正相關區域，$hat(V)_U(1) \/ hat(V)_U(0) > 1$。另一方面，令 $k equiv v_H \/ v_L > 1$，則右式為

  $
    2 k - k^2 = 1 - (k - 1)^2 < 1.
  $

  故低型別的誘因相容條件必然成立，不會成為約束。於是，候選分離配置能否構成純策略分離均衡，若且唯若高型別的誘因相容條件成立；等價地，若且唯若

  $
    hat(V)_U(1) / hat(V)_U(0) <= R.
  $
]

== #stmtref(<prop-main-boundary>, "命題", "proposition-counter") 之證明 <proof-prop-boundary>

#proof[
  令 $Delta V equiv v_H - v_L$。由 @eq-vhat-u 知 $hat(V)_U(1) = v_L + [q + rho(1-q)] Delta V$ 與 $hat(V)_U(0) = v_L + q(1-rho) Delta V$。將分離條件取等號 $hat(V)_U(1) = R hat(V)_U(0)$ 並展開：

  $
    v_L + [q + rho(1-q)] Delta V
    =
    R (v_L + q(1-rho) Delta V).
  $

  把含 $rho$ 之項整理至一側：

  $
    rho [(1-q) + R q] Delta V
    =
    (R - 1) v_L + (R - 1) q Delta V
    =
    (R - 1)(v_L + q Delta V).
  $

  由於 $v_L + q Delta V = hat(V)_U(q)$，兩邊同除 $[(1-q) + R q] Delta V$ 即得 @eq-main-boundary。又因 $hat(V)_U(1) \/ hat(V)_U(0)$ 對 $rho$ 嚴格遞增（見#headingref(<subsec-main-pooling>)），臨界值 $rho^*$ 為唯一解。
]

== #stmtref(<prop-main-distorted-sep>, "命題", "proposition-counter") 之證明 <proof-prop-distorted-sep>

#proof[
  高型別偏離至 $x_L'$ 時，信念跳至 $m = 0$，偏離報酬為

  $
    pi_H^"dev"(x_L') = v_H sqrt(x_L' \/ hat(V)_U(0)) - x_L'.
  $

  令 $z equiv sqrt(x_L')$，高型別 IC $pi_H^"sep" >= pi_H^"dev"$ 化為二次不等式

  $
    f(z) equiv z^2 - v_H / sqrt(hat(V)_U(0)) z + v_H^2 / (4 hat(V)_U(1)) >= 0. quad (*)
  $

  此二次式開口向上，判別式 $Delta_H = v_H^2 alpha_"sep" \/ hat(V)_U(0) > 0$（$rho > 0$ 時），兩根為

  $
    z_H^(plus.minus) = v_H / (2 sqrt(hat(V)_U(0))) (1 plus.minus sqrt(alpha_"sep")).
  $

  $(*)$ 成立（IC 滿足）的區域為 $z <= z_H^-$ 或 $z >= z_H^+$；在區間 $(z_H^-, z_H^+)$ 內二次式為負，IC 失敗。選取向下扭曲分支（$x_L' <= x_L^*$，即 $z <= sqrt(x_L^*)$），可行域為 $z <= z_H^-$，即（i）。

  對低型別，若模仿 $x_H$ 則信念跳至 $m = 1$，偏離報酬為

  $
    pi_L^"dev" = v_L dot v_H / (2 hat(V)_U(1)) - v_H^2 / (4 hat(V)_U(1)) = v_H (2 v_L - v_H) / (4 hat(V)_U(1)).
  $

  當 $v_H >= 2 v_L$ 時，$2 v_L - v_H <= 0$，故 $pi_L^"dev" <= 0 <= pi_L^"sep"(x_L')$，IC 自動成立，即（ii）。Riley 結果取向下分支中高型別 IC 恰好綁住的最高 $x_L'$，即 $z = z_H^-$，故（iii）。（iv）由 $v_H = 2 v_L$ 代入直接得出。
]

== #stmtref(<prop-main-pooling>, "命題", "proposition-counter") 之證明 <proof-prop-pooling>

#proof[
  令 $alpha equiv 1 - hat(V)_U(q) / hat(V)_U(1)$。在正相關之資訊結構下，由 @eq-main-vhat-derivative 知 $hat(V)_U(1) > hat(V)_U(q)$ 恆成立，故 $alpha in (0, 1)$。我們可將任意型別 $v in {v_L, v_H}$ 的誘因相容條件變形為關於 $sqrt(x_P)$ 的一元二次不等式：

  $
    (sqrt(x_P))^2 - v / sqrt(hat(V)_U(q)) sqrt(x_P) + v^2 / (4 hat(V)_U(1)) <= 0.
  $

  上開不等式之判別式為 $v^2 alpha \/ hat(V)_U(q) > 0$，確保存在實數解。因此，滿足個別型別誘因相容條件 $I C_v$ 之解區間可表示為：

  $
    sqrt(x_P) in [y_v^-, y_v^+],
    quad
    y_v^(plus.minus) = v / (2 sqrt(hat(V)_U(q))) (1 plus.minus sqrt(alpha)).
  $

  觀察上述解之結構可知，區間的上下界皆與真實型別 $v$ 呈嚴格正比。由於 $v_H > v_L$，為了使高低兩型別的誘因相容條件同時滿足，其解集之交集必由高型別的下界與低型別的上界所構成，亦即：

  $
    sqrt(x_P) in [y_(v_H)^-, y_(v_L)^+]
    =
    [v_H (1 - sqrt(alpha)) / (2 sqrt(hat(V)_U(q))), v_L (1 + sqrt(alpha)) / (2 sqrt(hat(V)_U(q)))].
  $

  要使此共同解集為非空區間，必須滿足：

  $
    v_H (1 - sqrt(alpha)) <= v_L (1 + sqrt(alpha)).
  $

  經移項整理可得：

  $
    sqrt(alpha) >= (v_H - v_L) / (v_H + v_L).
  $ <eq-main-pool-alpha>

  只要前述之非空條件成立，參數空間中便必然存在嚴格為正的投入量 $x_P > 0$，使得高低兩型別的誘因相容條件同時成立。該均衡投入量 $x_P$，結合不知情者的最佳反應行為，以及最悲觀的脫軌信念，即可完整建構出一個自我實現 (self-enforcing) 的純策略混同均衡。命題得證。
]

== #stmtref(<prop-main-refinement>, "命題", "proposition-counter") 之證明 <proof-prop-refinement>

#proof[
  直覺準則的運作方式，是將脫軌投入 $x'$ 的後驗信念，自對該偏離為均衡劣勢的型別移開，集中於無均衡劣勢的型別。在本模型中，偏離者的報酬 $v sqrt(x' \/ hat(V)_U(m)) - x'$ 對 $hat(V)_U(m)$ 嚴格遞減，因此偏離者最偏好的信念是 $m = 0$ (最弱反擊)，而最不利的信念是 $m = 1$ (最強反擊)。

  關鍵觀察在於：若某脫軌投入 $x'$ 對低型別為均衡劣勢、對高型別則否，直覺準則會將其信念集中於高型別，即 $m(x') = 1$。然而在 $m = 1$ 之下，高型別偏離至 $x'$ 的報酬為 $v_H sqrt(x' \/ hat(V)_U(1)) - x'$，其對 $x'$ 取極大值恰為 $v_H^2 \/ (4 hat(V)_U(1))$。由混同均衡之高型別誘因相容條件 @eq-main-pool-ich，

  $
    pi_P(v_H) >= v_H^2 / (4 hat(V)_U(1)),
  $

  可知高型別在均衡路徑上的報酬，本就不低於其在最悲觀信念 $m = 1$ 下任何偏離所能取得之報酬上界。故無論直覺準則如何重新配置脫軌信念，高型別皆無嚴格獲利之偏離，混同配置不被剔除。又因 $m = 1$ 已是對偏離者最不利之信念，任何以重新配置信念為手段之精煉 (含 D1) 皆無從給予偏離者更多，混同均衡因而通過精煉。
]

== #stmtref(<prop-main-d1-riley>, "命題", "proposition-counter") 之證明 <proof-prop-d1-riley>

#proof[
  分兩步：先說明所有 $x_L'' < x_L^"Riley"$ 的候選分離均衡被 D1 剔除，再確認 Riley 結果本身存活。

  #enum(
    numbering: n => text(font: theorem-font)[步驟#numbering("一", n)],
    body-indent: 1.5em,
    indent: 0pt,
    [
      剔除 $x_L'' < x_L^"Riley"$ 的均衡。考慮任意以 $x_L'' < x_L^"Riley"$ 為低型別均衡投入的候選分離均衡，取脫離路徑投入 $tilde(x) in (x_L'', x_L^"Riley")$（即 $tilde(z) in (sqrt(x_L''), z_H^-)$）。由於 $tilde(z) < z_H^-$，二次式 $(*)$ 在 $tilde(z)$ 處嚴格為正：

      $
        f(tilde(z)) > 0 quad arrow.double quad v_H sqrt(tilde(x) \/ hat(V)_U(0)) - tilde(x) < pi_H^"sep".
      $

      高型別在任意信念 $m$ 下偏離至 $tilde(x)$ 的最大報酬（於 $m=0$ 時取得）嚴格低於均衡報酬，故高型別對 $tilde(x)$ 為*均衡劣勢*，D1 要求 $m(tilde(x)) = 0$（歸因於低型別）。

      然而在 $m(tilde(x)) = 0$ 下，低型別偏離至 $tilde(x)$ 的報酬為 $v_L sqrt(tilde(x) \/ hat(V)_U(0)) - tilde(x)$。由於 $x_L'' < tilde(x) < x_L^"Riley" <= x_L^*$ 且 $v_L sqrt(x \/ hat(V)_U(0)) - x$ 在 $(0, x_L^*)$ 上嚴格遞增，低型別從 $tilde(x)$ 所得*嚴格高於*其均衡報酬 $pi_L^"sep"(x_L'')$，故低型別有誘因偏離；均衡 $x_L''$ 因此被 D1 剔除。
    ],
    [
      Riley 結果存活。對任意脫離路徑投入 $x' != x_L^"Riley"$，分三個區間討論：

      - $z' < z_H^-$（即 $x' < x_L^"Riley"$）：$f(z') > 0$，高型別均衡劣勢，D1 令 $m(x') = 0$；低型別的報酬 $v_L sqrt(x' \/ hat(V)_U(0)) - x' < pi_L^"sep"(x_L^"Riley")$（因函數在此區間遞增且 $x' < x_L^"Riley"$），低型別不偏離。

      - $z' in (z_H^-, z_H^+)$（即 $x_L^"Riley" < x' < (z_H^+)^2$）：$f(z') < 0$，高型別在 $m = 0$ 下可從 $x'$ 獲利，D1 不強制 $m(x') = 0$；取 $m(x') = 1$，則高型別偏離報酬為 $v_H sqrt(x' \/ hat(V)_U(1)) - x'$，其最大值在 $x_H$ 取得，故偏離至 $x' != x_H$ 為次佳；低型別在 $m = 1$ 下的最大偏離報酬為 $v_L^2 \/ (4 hat(V)_U(1)) < pi_L^"sep"(x_L^"Riley")$，亦不偏離。

      - $z' >= z_H^+$（即 $x' >= (z_H^+)^2$）：$f(z') > 0$，高型別再度均衡劣勢，D1 令 $m(x') = 0$；此時 $x' > x_L^* > x_L^"Riley"$，低型別報酬 $v_L sqrt(x' \/ hat(V)_U(0)) - x'$ 在 $x' > x_L^*$ 嚴格遞減，低型別不偏離。

      三種情形皆不構成有效偏離，Riley 結果存活。
    ],
  )

  綜上，D1 唯一選出 $x_L^"Riley" = (z_H^-)^2$。
]

== #stmtref(<prop-main-timing>, "命題", "proposition-counter") 之證明 <proof-prop-timing>

#proof[
  由前段推導，$partial widetilde(pi)_I^(I U, rho) \/ partial rho < 0$ 且 $partial widetilde(pi)_I^(S S, rho) \/ partial rho = 0$，故 $partial Delta_I^(I U) \/ partial rho < 0$，差額嚴格遞減。

  端點 $rho = 0$：訊號通道關閉，$hat(V)_U(m) = hat(V)_U(q)$ 與信念無關，$I U$ 子賽局退化為基準模型，$Delta_I^(I U)(0) = Delta_I^(I U)|_(rho=0)$。

  端點 $rho = 1$：$hat(V)_U(1) = v_H$，先動者完全揭露型別。在完全相關端點，$I U$ 子賽局落於均衡刻畫的並存帶（區域 C'），知情者先動伴隨租值耗散，嚴格偏好後動，即 #c("fu2006") 之結論。

  兩端點差額的變號（$Delta_I^(I U)(0)$ 可為正、$Delta_I^(I U)(1) <= 0$）配合嚴格單調性，保證唯一零點 $rho^dagger$ 的存在。
]
