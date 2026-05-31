#import "../thesis.typ": headingref, proof, widetilde

== $S S$ 子賽局均衡的推導 <proof-ss>

#proof[
  在 $S S$ 中，兩位參與者同時選擇投入。給定不知情者的投入 $x_U$，型別為 $V_I = v$ 的知情者的最佳反應為

  $
    x_I(v) = sqrt(v x_U) - x_U.
  $

  不知情者在選擇 $x_U$ 時，預期知情者會依型別採取上述反應。因此，不知情者的一階條件為

  $
    V EE[
      x_I(V_I) / (x_I(V_I) + x_U)^2
    ] = 1.
  $

  代入 $x_I(v) + x_U = sqrt(v x_U)$，可得

  $
    V EE[
      (sqrt(V_I x_U) - x_U) / (V_I x_U)
    ] & = V (kappa / sqrt(x_U) - lambda) \
      & = 1.
  $

  解此式得

  $
    sqrt(x_U^(S S)) & = (V kappa) / (1 + V lambda),
                      quad
                      x_U^(S S) & = (V^2 kappa^2) / (1 + V lambda)^2.
  $

  再將 $x_U^(S S)$ 代回知情者的最佳反應，得到

  $
    x_I^(S S)(v) & =
                   (V kappa sqrt(v)) / (1 + V lambda) \
                 & - (V^2 kappa^2) / (1 + V lambda)^2.
  $

  由於 $x_I^(S S)(v) + x_U^(S S) = (V kappa sqrt(v)) / (1 + V lambda)$，知情者的均衡報酬為

  $
    pi_I^(S S)(v) & =
                    (1 - (V kappa) / ((1 + V lambda) sqrt(v))) v - x_I^(S S)(v) \
                  & =
                    (sqrt(v) - (V kappa) / (1 + V lambda))^2.
  $

  不知情者的均衡報酬則為

  $
    pi_U^(S S)(v) & =
                    (V kappa) / ((1 + V lambda) sqrt(v)) V - (V^2 kappa^2) / (1 + V lambda)^2 \
                  & =
                    (V^2 kappa) / ((1 + V lambda) sqrt(v)) - (V^2 kappa^2) / (1 + V lambda)^2.
  $

  最後對 $V_I$ 取期望，可得

  $
    widetilde(pi)_I^(S S)
    =
    mu - (2 V kappa nu) / (1 + V lambda) + (V^2 kappa^2) / (1 + V lambda)^2,
  $

  $
    pi_U^(S S) & =
                 (V^2 kappa) / (1 + V lambda) kappa - (V^2 kappa^2) / (1 + V lambda)^2 \
               & =
                 (V^3 kappa^2 lambda) / (1 + V lambda)^2.
  $
]

== 臨界邊界的推導 <proof-ext-boundary>

#proof[
  由#headingref(<subsec-ext-boundary>)的高型別誘因相容條件

  $
    V_H^2 / hat(V)_U(1)
    >=
    V_L (2 V_H - V_L) / hat(V)_U(0)
  $

  取等號，並令

  $
    R & equiv
        V_H^2 / (V_L (2 V_H - V_L)),
  $

  則臨界線滿足

  $
    hat(V)_U(1) = R hat(V)_U(0).
  $

  再代入有效獎酬的單參數表達式 (令 $Delta V equiv V_H - V_L$)

  $
    hat(V)_U(1) & = V_L + [q + rho (1-q)] Delta V,
                  quad
                  hat(V)_U(0) & = V_L + q (1 - rho) Delta V,
  $

  並把含 $rho$ 之項整理至一側，

  $
    rho [(1-q) + R q] Delta V
    =
    (R - 1)(V_L + q Delta V)
    =
    (R - 1) hat(V)_U(q),
  $

  即得分離臨界相關度

  $
    rho^*
    =
    ((R - 1) hat(V)_U(q)) / (Delta V (1 - q + R q)),
    quad
    hat(V)_U(q) = V_L + q Delta V.
  $

  即主文的臨界相關度公式。檢查兩個端點：

  1. 獨立端點 $rho = 0$ 時，
    $
      hat(V)_U(1) = hat(V)_U(0) = q V_H + (1-q) V_L,
    $
    故比值化為 $1 <= R$。由 $V_H > V_L > 0$ 可知 $R>1$，因此分離條件嚴格成立。

  2. 完全相關端點 $rho = 1$ 時，
    $
      hat(V)_U(1)=V_H,
      quad
      hat(V)_U(0)=V_L.
    $
    因此比值為 $V_H/V_L$。而
    $
      V_H / V_L > V_H^2 / (V_L (2 V_H - V_L))
    $
    等價於 $V_H > V_L$，故完全相關端點位於臨界相關度之上方，分離均衡失敗。
]

== $U I$ 子賽局均衡的推導 <proof-ui>

#proof[
  在 $U I$ 中，不知情者先承諾投入，知情者觀察 $x_U$ 後依型別回應。給定 $x_U$ 與型別 $v$，知情者的最佳反應為

  $
    x_I(v) = sqrt(v x_U) - x_U.
  $

  因此，不知情者在第一期的問題為

  $
    max_(x_U >= 0)
    EE[V sqrt(x_U / V_I) - x_U]
    =
    max_(x_U >= 0)
    (V sqrt(x_U) kappa - x_U).
  $

  一階條件為

  $
    (V kappa) / (2 sqrt(x_U)) - 1 = 0,
  $

  故唯一內點解為

  $
    x_U^(U I) = (V^2 kappa^2) / 4.
  $

  代回知情者的最佳反應，得到

  $
    x_I^(U I)(v)
    =
    (V kappa sqrt(v)) / 2 - (V^2 kappa^2) / 4.
  $

  由於 $x_I^(U I)(v) + x_U^(U I) = (V kappa sqrt(v)) / 2$，逐型別報酬為

  $
    pi_I^(U I)(v)
    =
    (sqrt(v) - (V kappa) / 2)^2,
  $

  $
    pi_U^(U I)(v)
    =
    (V^2 kappa) / (2 sqrt(v)) - (V^2 kappa^2) / 4.
  $

  取事前期望後，

  $
    widetilde(pi)_I^(U I)
    =
    mu - V kappa nu + (V^2 kappa^2) / 4,
  $

  $
    pi_U^(U I) & =
                 (V^2 kappa) / 2 kappa - (V^2 kappa^2) / 4 \
               & =
                 (V^2 kappa^2) / 4.
  $
]

== $I U$ 子賽局均衡與分離性的推導 <proof-iu>

#proof[
  在 $I U$ 中，知情者先投入，不知情者觀察後再回應。給定知情者的投入 $x_I$，不知情者的最佳反應為

  $
    x_U^*(x_I; V) = sqrt(V x_I) - x_I.
  $

  型別為 $v$ 的知情者預期到此一反應後，選擇 $x_I$ 以最大化

  $
    W(x_I; v) & equiv
                x_I / (x_I + x_U^*(x_I; V)) v - x_I \
              & =
                v / sqrt(V) sqrt(x_I) - x_I.
  $

  此目標函數對 $x_I$ 嚴格凹。一階條件為

  $
    v / (2 sqrt(V x_I)) - 1 = 0,
  $

  因此

  $
    x_I^(I U)(v) = v^2 / (4 V).
  $

  將此投入代入不知情者的最佳反應，得到

  $
    x_U^(I U)(v) & =
                   sqrt(V v^2 / (4 V)) - v^2 / (4 V) \
                 & =
                   v (2 V - v) / (4 V).
  $

  均衡報酬為

  $
    pi_I^(I U)(v) = v^2 / (4 V),
    quad
    pi_U^(I U)(v) = (2 V - v)^2 / (4 V).
  $

  因此，事前報酬為

  $
    widetilde(pi)_I^(I U)
    =
    EE[V_I^2] / (4 V),
  $

  $
    pi_U^(I U) & =
                 EE[(2 V - V_I)^2] / (4 V) \
               & =
                 (4 V^2 - 4 V mu + EE[V_I^2]) / (4 V).
  $

  接著檢查誘因相容。固定真實型別 $v$，並考慮任一替代型別 $s != v$。若型別 $v$ 模仿 $s$ 的均衡投入，其投入為 $s^2 / (4 V)$。在 不知情者依最佳反應回應後，偏離報酬為

  $
    widetilde(U)(v, s) & =
                         v / sqrt(V) sqrt(s^2 / (4 V)) - s^2 / (4 V) \
                       & =
                         (2 v s - s^2) / (4 V).
  $

  誠實行動的報酬為 $v^2 / (4 V)$。兩者相減可得

  $
    v^2 / (4 V) - widetilde(U)(v, s) & =
                                       (v - s)^2 / (4 V) > 0
                                       quad (s != v).
  $

  因此，每一型別都嚴格偏好自己的分離行動。混同均衡與半分離均衡皆無法成立，$I U$ 子賽局的完美貝氏均衡為唯一分離均衡。
]
