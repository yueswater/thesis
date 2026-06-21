#import "../thesis.typ": SS, UI, c, headingref, proof, stmtref, theorem-font, widetilde

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

