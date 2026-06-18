#import "../thesis.typ": (
  SS, bern, c, ca, corollary, corr, cp, definition, example, headingref, impt, lemma, payoff-matrix-2x2, proof,
  proposition, stmtref, term, theorem, widetilde,
)

#headingref(<sec-model>)已在 $rho = 0$ 的 benchmark 下固定比較基準。本章直接轉入 $0 < rho < 1$ 的部分相關情形，並以 $rho = 1$ 對應 #c("fu2006") 的完全相關端點。當 $V_I$ 與 $V_U$ 呈現正相關時，知情者型別會同時影響不知情者對自身獎酬的判斷，後驗信念遂進入其後驗期望獎酬與最佳反應。以下依序建構部分相關型別結構、推導後驗期望獎酬，並分析各子賽局與第 0 階段的內生時序均衡。

== 部分相關型別結構 <subsec-main-setup>

本節建構本章所採用之部分相關型別結構。延續 #headingref(<sec-model>) 之設定，本文維持相同邊際分配，僅放寬統計獨立之要求；一旦 $V_I$ 與 $V_U$ 呈現正相關，知情者型別便會同時攜帶關於不知情者自身獎酬的資訊。

=== 邊際分配與相關參數 <subsubsec-main-marginal-rho>

本節沿用 #headingref(<sec-model>) 之符號設定，並維持邊際機率為 $q in (0,1)$ 之假設；獎酬間的關聯程度則由相關參數 $rho$ 刻畫。

#definition(title: [部分相關型別結構])[
  定義高型別指示變數
  $
    H_I equiv bb(1){V_I = v_H}, quad H_U equiv bb(1){V_U = v_H},
  $
  並以其#term("皮爾森相關係數", english: "Pearson correlation coefficient")定義相關參數
  $
    rho equiv corr(H_I, H_U).
  $
  本文限制 $rho in [0,1]$ 以聚焦於正相關情形。#footnote[皮爾森相關係數之一般值域為 $[-1,1]$；本文僅討論 $rho >= 0$。正相關獎酬可理解為雙方 valuation 受同一外部狀態影響之情形。] 若知情者與不知情者之獎酬具有相同邊際分配，則稱 $(V_I, V_U)$ 服從參數為 $(q, rho) in (0,1) times [0,1]$ 之部分相關型別結構。
] <def-main-correlated-types>

就經濟意涵觀之，$rho$ 衡量兩位參與者獎酬價值之間的共同變動程度：$rho$ 越高，知情者的獎酬高低便越能揭示不知情者的獎酬狀態，訊號的資訊含量亦隨之增加；$rho = 0$ 時兩者獎酬完全獨立，$rho = 1$ 時則必然同步。

=== 聯合分配

在邊際分配固定為 $(q,1-q)$ 的情況下，型別結構的差異完全來自聯合分配所反映的依存關係。由於兩個邊際機率已事先給定，$(V_I,V_U)$ 的聯合分配僅剩一個自由度，而該自由度恰可由相關參數 $rho$ 唯一決定。因此，一旦指定 $(q,rho)$，整個型別結構便被完全刻畫，各狀態出現機率如@tbl-main-joint-corr 所示。相較於@tbl-benchmark-joint 之獨立基準，本章以引入 $rho$ 的方式放寬獎酬間的統計獨立假設；令 $rho = 0$ 即退化回基準情形。

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

由@tbl-main-joint-corr 可見，$rho$ 決定機率質量在同向型別組合與異向型別組合之間的分布比重。$rho$ 越高，$(v_H,v_H)$ 與 $(v_L,v_L)$ 兩種同向組合的機率越大，$(v_H,v_L)$ 與 $(v_L,v_H)$ 兩種異向組合的機率則相應縮減。據此，$rho=0$ 對應第 3 章之獨立基準，$0 < rho < 1$ 為本文核心分析之部分相關情形，而 $rho=1$ 則對應完全相關端點。下一節據此推導不知情者的後驗期望獎酬。

== 後驗期望獎酬與最佳反應 <subsec-main-belief-payoff>

本節推導部分相關結構下不知情者的後驗期望獎酬。當 $0 < rho < 1$ 時，知情者的投入若揭示 $V_I$，亦會改變不知情者對自身 valuation 的條件判斷；因此，其 payoff-relevant valuation 不再是固定的 $overline(v)$，而是隨後驗信念 $mu$ 變動的 $widetilde(V)_U (mu)$。

=== 後驗信念 <subsubsec-main-posterior>

考慮 IU 子賽局。知情者先行選擇投入 $x_I$，不知情者觀察後形成對知情者型別之後驗信念 $mu : RR_+ -> [0,1]$，定義為

$
  mu(x_I) equiv Pr(V_I = v_H | x_I).
$

其中 $mu(x_I)$ 表示由觀察投入 $x_I$ 所誘導之後驗信念函數；在討論給定觀察下的最佳反應或報酬時，為簡化記號，以下逕以 $mu$ 表示其對應之信念值。其中，$mu=1$ 表示不知情者確信知情者為高型別，$mu=0$ 表示其確信知情者為低型別，而 $mu=q$ 則表示其信念仍停留於#term("先驗水準", english: "prior level")。

由@tbl-main-joint-corr 可得兩個關鍵的條件機率。

#lemma(
  title: [相關型別下之條件高型別機率],
)[
  在#stmtref(<def-main-correlated-types>, "定義", "definition-counter") 所給定之部分相關型別結構下，若知情者為高型別，則不知情者為高型別的條件機率為
  $
    theta_H equiv Pr(V_U = v_H|V_I = v_H) = q + rho(1-q).
  $

  若知情者為低型別，則不知情者為高型別的條件機率為

  $
    theta_L equiv Pr(V_U = v_H|V_I = v_L) = q(1-rho).
  $
] <lem-main-conditional-high-prob>

#proof[
  由@tbl-main-joint-corr 與邊際分配 $Pr(V_I=v_H)=q$ 可知
  $
    Pr(V_U = v_H|V_I = v_H) & = frac(Pr(V_I = v_H, V_U = v_H), Pr(V_I = v_H)) \
                            & = frac(q^2 + rho q(1-q), q) \
                            & = q + rho(1-q).
  $

  同理，由 $Pr(V_I=v_L)=1-q$ 可得
  $
    Pr(V_U = v_H|V_I = v_L) & = frac(Pr(V_I = v_L, V_U = v_H), Pr(V_I = v_L)) \
                            & = frac(q(1-q)(1-rho), 1-q) \
                            & = q(1-rho).
  $
]

其中，$theta_H$ 與 $theta_L$ 並非報酬或型別本身，而是以知情者型別為條件時，不知情者處於高獎酬狀態的條件機率。上述條件機率刻畫了獎酬相關所造成的資訊外溢效果。當 $rho=0$ 時，$theta_H$ 與 $theta_L$ 皆等於先驗機率 $q$，表示知情者型別資訊不會外溢至不知情者對自身獎酬狀態的判斷；此時，即使不知情者辨識出知情者之型別，其對自身為高型別的評估仍維持不變。當 $rho>0$ 時，則有 $theta_L < q < theta_H$：知情者為高型別會使不知情者上修自身處於高獎酬狀態的機率，知情者為低型別則會使其下修此一機率。

=== 後驗期望獎酬 <subsubsec-main-effective-payoff>

給定後驗信念 $mu$，不知情者對自身獎酬的評估必須同時考量兩種可能情況：知情者為高型別的機率為 $mu$，而為低型別的機率則為 $1-mu$。由於知情者型別會透過獎酬相關外溢至不知情者對自身狀態的判斷，不知情者的後驗期望獎酬不再只是先驗期望，而是由後驗信念加權後的條件期望。

#definition(title: [後驗期望獎酬])[
  不知情者觀察知情者投入 $x_I$ 並形成後驗信念 $mu=Pr(V_I=v_H|x_I)$ 後，其後驗期望獎酬定義為
  $
    widetilde(V)_U (mu) equiv EE[V_U|x_I].
  $
] <def-main-posterior-expected-valuation>

#stmtref(<def-main-posterior-expected-valuation>, "定義", "definition-counter") 之區別實益在於區分真實獎酬與決策時所依據的獎酬評估。$V_U$ 為不知情者尚未觀察的實現值；$widetilde(V)_U (mu)$ 則是其觀察 $x_I$ 後，根據後驗信念形成的條件期望。由於不知情者無法直接依據 $V_U$ 選擇投入，後續目標函數與最佳反應所採用的獎酬項，均為後驗期望獎酬 $widetilde(V)_U (mu)$，而非尚未觀察的實現值 $V_U$。

#lemma(
  title: [後驗期望獎酬之閉式表示],
)[
  令 $Delta V equiv v_H - v_L$。根據#stmtref(<lem-main-conditional-high-prob>, "引理", "lemma-counter")，若不知情者觀察 $x_I$ 後形成後驗信念 $mu=Pr(V_I=v_H|x_I)$，則其對自身為高型別之條件機率為
  $
    Pr(V_U=v_H|x_I) = q + rho(mu-q).
  $

  因此，根據#stmtref(<def-main-posterior-expected-valuation>, "定義", "definition-counter")，不知情者的後驗期望獎酬可寫為
  $
    widetilde(V)_U (mu)
    = v_L + [q + rho(mu-q)] Delta V.
  $ <eq-main-effective-payoff>
] <lem-main-posterior-expected-valuation>

#proof[
  由後驗信念定義，知情者為高型別與低型別的條件機率分別為 $mu$ 與 $1-mu$。依全機率律與#stmtref(<lem-main-conditional-high-prob>, "引理", "lemma-counter")，
  $
    Pr(V_U=v_H|x_I) & = mu theta_H + (1-mu) theta_L \
                    & = mu [q + rho(1-q)] + (1-mu) q(1-rho) \
                    & = q + rho(mu-q).
  $

  令 $p(mu) equiv Pr(V_U=v_H|x_I)$，則
  $
    EE[V_U|x_I] & = p(mu) v_H + (1-p(mu)) v_L \
                & = v_L + p(mu) (v_H-v_L) \
                & = v_L + [q + rho(mu-q)] Delta V.
  $
]

#stmtref(<lem-main-posterior-expected-valuation>, "引理", "lemma-counter") 將資訊外溢轉化為不知情者報酬中的獎酬。其意義在於，知情者投入所引發的後驗信念，只有在獎酬相關存在時，才會改變不知情者對自身獎酬的評估。若 $rho=0$，則

#[
  #set math.equation(numbering: none)
  $
    widetilde(V)_U (mu) = v_L + q Delta V,
  $
]

與後驗信念 $mu$ 無關。此時，知情者投入至多揭示知情者自身型別，卻不提供任何關於不知情者獎酬狀態的額外資訊。因此，即使不知情者能辨識知情者為高型別或低型別，其對自身獎酬的條件期望仍停留在先驗水準。訊號在此只具有辨識對手型別的作用，尚未轉化為影響自身投入決策的獎酬訊息。

相對地，若 $rho>0$，則

#[
  #set math.equation(numbering: none)
  $
    (d widetilde(V)_U (mu)) / (d mu) = rho Delta V > 0.
  $
]

此時，知情者型別不再只是對手的私人資訊，而同時是關於不知情者自身獎酬狀態的間接訊號。當 $mu$ 上升時，不知情者認為知情者較可能為高型別；在正相關結構下，這也意味著自身較可能處於高獎酬狀態，故後驗期望獎酬隨之上升。換言之，後驗信念之所以進入不知情者的決策問題，並非因為其在乎知情者型別本身，而是因為該型別透過獎酬相關提供了關於自身獎酬狀態的資訊，凸顯本章與獨立基準模型之間的核心差異。

三個特殊後驗信念可進一步說明上述關係。$mu=1$ 與 $mu=0$ 分別表示不知情者確信知情者為高型別與低型別；$mu=q$ 則表示觀察投入後的信念仍停留在先驗水準，亦即投入未提供足以修正信念的新資訊。三種情形下的後驗期望獎酬整理如@tbl-main-posterior-expected-values 所示。

#figure(
  table(
    columns: (2.2cm, 4cm, 7cm),
    inset: 8pt,
    align: (col, row) => if col == 1 { left + horizon } else { center + horizon },
    stroke: none,
    table.hline(y: 0, stroke: 0.6pt),
    table.hline(y: 1, stroke: 0.4pt),
    table.hline(y: 4, stroke: 0.6pt),
    [後驗信念], [資訊意涵], [後驗期望獎酬],
    [$mu=1$], [確信知情者為高型別], [$widetilde(V)_U (1)=v_L+[q+rho(1-q)]Delta V$],
    [$mu=q$], [信念維持於先驗水準], [$widetilde(V)_U (q)=v_L+q Delta V=EE[V_U]$],
    [$mu=0$], [確信知情者為低型別], [$widetilde(V)_U (0)=v_L+q(1-rho)Delta V$],
  ),
  caption: [特殊後驗信念下之後驗期望獎酬],
  supplement: [表],
) <tbl-main-posterior-expected-values>

當 $rho>0$ 時，高型別訊號使不知情者上修自身獎酬評估，低型別訊號則使其下修；若信念維持於先驗水準，後驗期望獎酬即等於無條件期望獎酬。特別地，$widetilde(V)_U (q)$ 對應於 #headingref(<sec-model>) 基準模型中的 $overline(v)=EE[V_U]$，差別僅在於此處將其置於 $widetilde(V)_U (mu)$ 的統一函數記號之下。因此，

#[
  #set math.equation(numbering: none)
  $
    widetilde(V)_U (1) > widetilde(V)_U (q) > widetilde(V)_U (0).
  $
]

=== 最佳反應與延續報酬 <subsubsec-main-br-ic>

本節將前述後驗期望獎酬帶入 IU 子賽局的行為方程。由於 IU 時序下知情者先動、不知情者後動，分析須使用#term("反向演繹法", english: "backward induction")：首先刻畫不知情者在觀察 $x_I$ 並形成後驗信念後的最佳反應；其次，將此反應代回知情者的報酬函數，以描述不同型別在先動時面對的延續報酬。如此處理的目的，是將#impt[投入作為競賽行動]與#impt[投入作為型別訊號]兩種角色放在同一架構中。前者透過 Tullock 成功函數影響勝率，後者則透過後驗信念改變不知情者的後驗期望獎酬，進而影響其後續投入。

在 IU 子賽局中，知情者先行投入後，不知情者觀察 $x_I$ 並形成後驗信念 $mu$，再選擇自身投入 $x_U >= 0$。給定 $x_I>0$ 與 $mu$，根據#stmtref(<def-main-posterior-expected-valuation>, "定義", "definition-counter")，不知情者的條件期望報酬為

$
  pi_U (x_I,x_U;mu)
  = x_U / (x_I+x_U) widetilde(V)_U (mu) - x_U.
$ <eq-main-u-payoff>

此一目標函數沿用 Tullock 比例型競賽成功函數 #cp("tullock1980")，第一項為不知情者的勝率乘以其獎酬評估，第二項為投入成本。與完全資訊或獨立基準相比，本節的差異在於獎酬項不再是固定評價，而是由後驗信念決定的 $widetilde(V)_U (mu)$。因此，一階條件仍具有標準 Tullock 形式，但最佳反應的強度會隨後驗信念調整。

#lemma(
  title: [部分相關下不知情者之最佳反應],
)[
  給定知情者投入 $x_I>0$ 與後驗信念 $mu in [0,1]$。若最適解位於內點，則不知情者之最佳反應為
  $
    x_U^*(x_I,mu)
    = sqrt(x_I widetilde(V)_U (mu)) - x_I,
  $
  其中 $widetilde(V)_U (mu)$ 由#stmtref(<lem-main-posterior-expected-valuation>, "引理", "lemma-counter") 給定。因此內點解成立之條件為 $widetilde(V)_U (mu)>x_I$。
] <lem-main-br>

#proof[
  將不知情者之報酬函數對 $x_U$ 取一階條件。若最適解位於內點，則
  $
    x_I widetilde(V)_U (mu) / (x_I+x_U)^2 = 1.
  $
  解此方程可得
  $
    x_U=sqrt(x_I widetilde(V)_U (mu))-x_I.
  $
  此解為正若且唯若 $widetilde(V)_U (mu)>x_I$。若此條件不成立，則非負限制綁住，最適投入位於邊界 $x_U=0$。
]

為了刻畫後驗信念如何影響不知情者的反應，以下比較靜態限於內點解存在的區域，亦即 $widetilde(V)_U (mu)>x_I$，使得最佳反應可由前述一階條件表示。

#stmtref(<lem-main-br>, "引理", "lemma-counter") 顯示，不知情者之最佳反應具有兩層依賴關係。第一，在後驗期望獎酬既定時，$x_I$ 作為對手投入進入競賽成功函數，直接影響不知情者的邊際收益。第二，當 $rho>0$ 時，$x_I$ 亦具有訊號功能；其誘發的後驗信念 $mu$ 會改變 $widetilde(V)_U (mu)$，再透過獎酬項影響不知情者的最適投入。前者是 Tullock 競賽的一般反應效果；後者則源自本文的獎酬相關設定，形成#headingref(<sec-model>)所不存在的信念反應機制。

在內點解存在時，根據#stmtref(<lem-main-posterior-expected-valuation>, "引理", "lemma-counter")，將最佳反應對後驗信念微分，可得

$
  (d x_U^*(x_I,mu)) / (d mu)
  = (rho (Delta V) / 2) sqrt(x_I / widetilde(V)_U (mu)).
$
// #par(h(0pt, weak: true))

當 $rho>0$ 時，上式嚴格為正。換言之，不知情者對知情者屬於高型別的後驗機率越高，其自身的後驗期望獎酬也越高，因而選擇較高的最適投入。
值得注意的是，此一比較靜態係在知情者投入 $x_I$ 維持不變下所得到，反映的並非不知情者因對手投入增加而產生的策略反應，而是後驗信念經由獎酬相關性而形成的資訊效果——知情者的型別同時提供不知情者自身獎酬狀態的資訊，使高型別訊號提高競爭標的對不知情者的後驗價值。此一信念反應機制進而改變知情者各型別所面對的誘因限制，並成為後續判定分離均衡能否成立的關鍵。

另一方面，知情者的先動決策則以前述最佳反應為約束。令 $v in {v_H, v_L}$ 表示知情者的真實型別。代入不知情者最佳反應後，型別 $v$ 知情者的延續報酬 (continuation payoff) 可寫為

$
  pi_I (x_I; v, mu(x_I))
  equiv x_I / (x_I + x_U^*(x_I, mu(x_I))) v - x_I.
$

在內點區域內，代入#stmtref(<lem-main-br>, "引理", "lemma-counter") 可得較簡潔的表示：

$
  pi_I (x_I; v, mu)
  = v sqrt(x_I / widetilde(V)_U (mu)) - x_I.
$ <eq-main-i-reduced-payoff>

由前述延續報酬可見，知情者選擇 $x_I$ 時，並非僅考慮投入本身對勝率的直接效果，還必須預期該投入所誘發之後驗信念將如何改變不知情者的反應。換言之，$x_I$ 同時是競賽投入與資訊訊號；前者影響勝率，後者影響對手的後驗期望獎酬與後續投入。

== 子賽局均衡 <subsec-main-subgame-equilibria>

#headingref(<subsec-main-belief-payoff>)已建立部分相關型別結構下的後驗期望獎酬、最佳反應與延續報酬。本節承此分析基礎，進一步分析三個子賽局之均衡行為與報酬。相較於#headingref(<subsec-bench-subgame-equilibria>)所建立之基準均衡，部分相關設定下 $widetilde(V)_U (mu)$ 不再固定為 $overline(v)$，SS 與 UI 子賽局之均衡結構由 $tilde(A)$、$tilde(B)$ 替換 $hat(A)$、$hat(B)$ 即得；唯有 IU 時序使訊號—信念—反應鏈條完全啟動，均衡型態因而隨 $rho$ 而變化。

=== SS 子賽局 <subsubsec-main-ss>

仿照#headingref(<subsec-bench-subgame-equilibria>)中的型別加權邊際係數定義，於部分相關設定下定義對應的參數：

$
  tilde(A)
  equiv q widetilde(V)_U (1) / sqrt(v_H) + (1-q) widetilde(V)_U (0) / sqrt(v_L),
  quad
  tilde(B)
  equiv q widetilde(V)_U (1) / v_H + (1-q) widetilde(V)_U (0) / v_L,
$ <eq-main-ss-ab>

其中 $widetilde(V)_U (1)$ 與 $widetilde(V)_U (0)$ 由#stmtref(<lem-main-posterior-expected-valuation>, "引理", "lemma-counter")給定。當 $rho=0$ 時，$widetilde(V)_U (mu) equiv overline(v)$ 對所有 $mu$ 成立，故 $tilde(A) = hat(A)$、$tilde(B) = hat(B)$，二式退化為基準模型之對應量。

#proposition(
  title: [SS 子賽局之內點均衡: 部分相關],
)[
  在 SS 子賽局中，若均衡位於內點，則不知情者之均衡投入為
  $
    x_U^(SS)
    = tilde(A)^2 / (1+tilde(B))^2.
  $
  型別 $v in {v_H,v_L}$ 之知情者均衡投入為
  $
    x_I^(SS)(v)
    = sqrt(v) tilde(A) / (1+tilde(B))
    - tilde(A)^2 / (1+tilde(B))^2.
  $
  對應之知情者各型別報酬與不知情者#impt[事前期望報酬 (ex ante payoff)] 分別如下：
  $
    pi_I^(SS)(v)
    = (sqrt(v) - tilde(A) / (1+tilde(B)))^2, quad
  $
  以及
  $
    widetilde(pi)_U^(SS)
    = tilde(A)^2 tilde(B) / (1+tilde(B))^2.
  $
] <prop-main-ss-equilibrium>

#proof[
  推導與#stmtref(<prop-bench-ss-equilibrium>, "命題", "proposition-counter")完全類同。在部分相關設定下，不知情者的事前問題以 $widetilde(V)_U (1)$ 與 $widetilde(V)_U (0)$ 取代基準模型中的 $overline(v)$，型別加權邊際係數因而從 $hat(A)$、$hat(B)$ 替換為 $tilde(A)$、$tilde(B)$；一階條件 $tilde(A) \/ sqrt(x_U) - tilde(B) = 1$ 給出 $x_U^(SS)$，其餘結果由代入得到。
]

#stmtref(<prop-main-ss-equilibrium>, "命題", "proposition-counter") 的經濟直覺如下。SS 時序下雙方同時投入，不知情者無法在行動前從知情者的投入中汲取額外資訊；然而，這並不表示相關性在 SS 子賽局中全然消失。知情者的投入仍依其型別而異，而在部分相關結構下，知情者為高型別或低型別也分別對應到不知情者不同的條件期望獎酬。因此，不知情者雖然不能進行路徑上的後驗更新，仍必須在事前同時考量兩種型別狀態下的競爭強度與自身獎酬評估。$tilde(A)$ 與 $tilde(B)$ 正是將這兩項效果彙整為一階條件中的型別加權邊際效果。

值得注意的是，#stmtref(<prop-main-ss-equilibrium>, "命題", "proposition-counter")顯示本文與 #c("fu2006") 之 SS 子賽局的差異。在 #c("fu2006") 中，競爭標的的價值為共同價值；一旦狀態為高或低，知情者與不知情者面對的是同一個獎酬值。因此，SS 子賽局雖無訊號傳遞，不知情者的事前問題仍是以先驗機率加權高、低兩種共同價值狀態。本文則將兩方獎酬拆分為 $(V_I,V_U)$，並允許其僅部分相關，故不知情者在 SS 中加權的並非同一共同價值，而是條件期望獎酬 $widetilde(V)_U (1)$ 與 $widetilde(V)_U (0)$。換言之，#c("fu2006") 的 SS 可視為完全相關端點下的共同價值基準；本文的 SS 則保留同時行動下#impt[無訊號更新]的特徵，同時允許獎酬相關透過事前條件期望進入均衡投入。

=== UI 子賽局 <subsubsec-main-ui>

給定 $x_U > 0$，型別 $v$ 知情者面對以下極大化問題：

$
  max_(x_I >= 0) x_I / (x_I + x_U) v - x_I.
$

若內點解存在，一階條件給出

$
  x_I (v) = sqrt(v x_U) - x_U,
$ <eq-main-ui-br>

其中內點解成立之條件為 $v > x_U$。此形式與#stmtref(<lem-main-br>, "引理", "lemma-counter") 一致，差別僅在於此處知情者已確知自身型別 $v$，其面對的獎酬為確定值而非後驗期望。

不知情者在先行選擇 $x_U$ 時，知道知情者將依型別作出最佳反應，故其事前期望報酬為

$
  widetilde(pi)_U^(U I)(x_U)
  = q widetilde(V)_U (1) x_U / (x_I (v_H) + x_U)
  + (1-q) widetilde(V)_U (0) x_U / (x_I (v_L) + x_U)
  - x_U.
$

代入前述最佳反應所蘊含之 $x_I (v) + x_U = sqrt(v x_U)$，上式化簡為

$
  widetilde(pi)_U^(U I)(x_U) = tilde(A) sqrt(x_U) - x_U,
$ <eq-main-ui-objective>

其中 $tilde(A)$ 沿用前述 SS 子賽局之定義。UI 子賽局下不知情者的目標函數因而僅含 $tilde(A)$ 而不含 $tilde(B)$：由於知情者的最佳反應已被代入，不知情者面對的是一個在 $sqrt(x_U)$ 上呈線性的利潤函數，不存在 SS 中因雙方同時最佳化所形成的相互依賴效果。

#proposition(
  title: [UI 子賽局之內點均衡: 部分相關],
)[
  在 UI 子賽局中，若均衡位於內點 (即兩種型別知情者均選擇正投入)，則不知情者之均衡投入為
  $
    x_U^(U I) = tilde(A)^2 / 4.
  $
  型別 $v in {v_H, v_L}$ 之知情者均衡投入為
  $
    x_I^(U I)(v) = sqrt(v) tilde(A) / 2 - tilde(A)^2 / 4.
  $
  對應之知情者各型別報酬與不知情者事前期望報酬分別如下：
  $
    pi_I^(U I)(v) = (sqrt(v) - tilde(A) / 2)^2, quad widetilde(pi)_U^(U I) = tilde(A)^2 / 4.
  $
] <prop-main-ui-equilibrium>

#proof[
  由前述目標函數之一階條件 $tilde(A) \/ (2 sqrt(x_U)) = 1$ 可得 $x_U^(U I) = tilde(A)^2 \/ 4$。推導與#stmtref(<prop-bench-ui-equilibrium>, "命題", "proposition-counter")類同，以 $tilde(A)$ 取代 $hat(A)$ 即得其餘結果。
]

比較#stmtref(<prop-main-ui-equilibrium>, "命題", "proposition-counter") 與#stmtref(<prop-main-ss-equilibrium>, "命題", "proposition-counter")，兩個子賽局在均衡結構上具有相同的參數骨架，差異僅在分母：SS 的一階條件為 $tilde(A) \/ sqrt(x_U) = 1 + tilde(B)$，UI 的對應條件為 $tilde(A) \/ (2 sqrt(x_U)) = 1$。此一差異直接反映決策架構之不同。在 SS 中，不知情者在均衡中與知情者同時最佳化，$tilde(B)$ 項衡量在當前均衡投入組合下型別加權的贏率成本——是雙方互相為對手之約束時才浮現的邊際效應。在 UI 中，不知情者先行鎖定 $x_U$，知情者的最佳反應 $x_I (v) = sqrt(v x_U) - x_U$ 已被代入目標函數，雙方相互依賴之迴圈不再存在，邊際均等條件因而只含 $sqrt(x_U)$ 微分所帶來的係數 $2$。

#proposition(
  title: [UI 相對於 SS 之先行者優勢],
)[
  在內點均衡下，不知情者在 UI 時序下的事前期望報酬不低於 SS 時序：
  $
    widetilde(pi)_U^(U I) >= widetilde(pi)_U^(SS),
  $
  等號成立若且唯若 $tilde(B) = 1$。
] <prop-main-ui-first-mover>

#proof[
  論證與#headingref(<subsubsec-bench-ui>)中 UI 與 SS 的比較完全類同，以 $tilde(A)$、$tilde(B)$ 取代 $hat(A)$、$hat(B)$ 即得
  $
    widetilde(pi)_U^(U I) - widetilde(pi)_U^(SS)
    = tilde(A)^2 (1 - tilde(B))^2 / (4(1+tilde(B))^2)
    >= 0.
  $
]

#stmtref(<prop-main-ui-first-mover>, "命題", "proposition-counter") 揭示不知情者在先行承諾的 UI 時序下具有先行者優勢。其直覺在於：在 SS 均衡中，不知情者與知情者之投入相互制約，雙方同時反應形成競爭壓力；UI 時序下不知情者先行鎖定投入，迫使知情者就此承諾水準作出反應，從而消除了 SS 中雙向制約的邊際效應，使不知情者得以選擇對自身最有利的承諾投入。

=== IU 子賽局 <subsubsec-main-iu>

本節以#term("完美貝氏均衡", english: "perfect Bayesian equilibrium")為均衡概念並進行分析。一個完美貝氏均衡由策略組合 $x_I (v)$、$x_U^*(x_I, mu)$ 與信念函數 $mu : RR_+ -> [0,1]$ 構成，其中 $x_I (v)$ 為型別 $v in {v_H, v_L}$ 知情者的投入策略，$x_U^*(x_I, mu)$ 為不知情者觀察 $x_I$、形成後驗信念 $mu(x_I)$ 後的最佳反應。均衡須同時滿足：

#block[
  #set par(first-line-indent: 0em)
  #set enum(
    indent: 0em,
    body-indent: 0.6em,
    numbering: n => box(width: 2.2em)[#numbering("(1)", n)],
  )
  + 給定信念 $mu$，知情者各型別與不知情者之策略均為各自的最佳反應；
  + 均衡路徑上，信念 $mu(x_I)$ 須與貝氏法則一致；
  + 均衡路徑外之投入所對應的信念須為合理賦予。
]

以下首先建構#term("未扭曲分離均衡", english: "undistorted separating equilibrium")之候選配置，繼而驗證其誘因相容條件。

在未扭曲分離配置下，高型別與低型別分別選擇 $x_H$ 與 $x_L$，並誘發路徑上信念#footnote[所謂誘發路徑上，係指在候選均衡策略下，賽局以正機率實際到達之歷史與資訊集合。]：

#set math.equation(numbering: none)

$
  mu(x_H) = 1,
  quad
  mu(x_L) = 0.
$

由前述延續報酬，若型別 $v$ 誠實選擇投入且不知情者形成對應信念 $mu$，則內點最適解為

$
  x_I^*(v, mu) = v^2 / (4 widetilde(V)_U (mu)).
$

代入後，型別 $v$ 的均衡報酬為

$
  pi_I^*(v, mu) = v^2 / (4 widetilde(V)_U (mu)).
$

因此，未扭曲分離的路徑上投入與報酬分別為

$
  x_H = v_H^2 / (4 widetilde(V)_U (1)),
  quad
  pi_H = v_H^2 / (4 widetilde(V)_U (1)),
$

以及

$
  x_L = v_L^2 / (4 widetilde(V)_U (0)),
  quad
  pi_L = v_L^2 / (4 widetilde(V)_U (0)).
$

不知情者沿分離路徑的最佳反應由#stmtref(<lem-main-br>, "引理", "lemma-counter") 給定。觀察 $x_H$ 時，

$
  x_U^*(x_H, 1) = v_H / 2 - v_H^2 / (4 widetilde(V)_U (1));
$

觀察 $x_L$ 時，

$
  x_U^*(x_L, 0) = v_L / 2 - v_L^2 / (4 widetilde(V)_U (0)).
$

當 $rho = 0$ 時，$widetilde(V)_U (mu) = v_L + q Delta V$ 與 $mu$ 無關，前述 $x_I^*(v,mu)$ 退化為#headingref(<subsubsec-bench-iu>)所建立之唯一分離均衡。此時高、低型別之雙向模仿差額皆為

$
  (v_H - v_L)^2 / (4 widetilde(V)_U (q)) > 0,
$

混同均衡無法成立——此即本文以 $rho = 0$ 作為訊號機制關閉之基準的理由。隨 $rho$ 上升，$widetilde(V)_U (1)$ 與 $widetilde(V)_U (0)$ 的差距擴大，高型別偽裝成低型別所換取的競爭鬆弛效果增強，分離均衡的存續條件因而需要重新檢驗。

#set math.equation(numbering: "(1)", supplement: [式])

#proposition(
  title: [IU 子賽局之未扭曲分離配置: 部分相關],
)[
  在本文分析之內點區域內，定義
  $
    R equiv v_H^2 / (v_L (2v_H-v_L)).
  $
  其中 $R$ 表示高型別不向下模仿低型別之臨界比值。前述未扭曲分離配置構成 IU 子賽局之純策略完美貝氏均衡，若且唯若
  $
    widetilde(V)_U (1) / widetilde(V)_U (0) <= R.
  $ <eq-main-iu-undistorted-ic>
  若在均衡路徑上令 $mu(x_H)=1$、$mu(x_L)=0$，並對所有 $x in.not {x_H,x_L}$ 的投入指定為均衡路徑外信念 $mu(x)=1$，則此一均衡成立；且不知情者於各資訊集合皆依#stmtref(<lem-main-br>, "引理", "lemma-counter") 作出最佳反應。
] <prop-main-iu-separating-candidate>

#proof[
  在分離配置下，高型別與低型別分別以機率一選擇 $x_H$ 與 $x_L$；亦即，觀察到 $x_H$ 時僅可能來自高型別，觀察到 $x_L$ 時僅可能來自低型別。由於兩者皆為均衡路徑上以正機率到達之投入，貝氏法則必然要求相應後驗信念滿足 $mu(x_H)=1$ 與 $mu(x_L)=0$。在此信念下，前述延續報酬關於 $x_I$ 為嚴格凹函數，其一階條件分別唯一決定前述 $x_H$ 與 $x_L$。因此，命題所列投入即為未扭曲分離配置在均衡路徑上唯一可能的投入水準。

  #set enum(numbering: "(1)")

  1. #impt("高型別模仿低型別之誘因")：若高型別改以 $x_L$ 行動，不知情者將依路徑上信念視其為低型別，故其模仿報酬為
    $
      pi_H (x_L;mu=0)
      = v_H sqrt(x_L / widetilde(V)_U (0)) - x_L
      = v_L (2v_H-v_L) / (4 widetilde(V)_U (0)).
    $
    因而，高型別選擇誠實揭露型別之必要且充分條件為
    $
      v_H^2 / (4 widetilde(V)_U (1))
      >= v_L (2v_H-v_L) / (4 widetilde(V)_U (0)),
    $
    而此不等式恰與前述分離條件等價。

  2. #impt("低型別模仿高型別之誘因")：若低型別選擇 $x_H$，其所得報酬為
    $
      pi_L (x_H;mu=1)
      = v_H (2v_L-v_H) / (4 widetilde(V)_U (1)).
    $
    由於
    $
      v_L^2 - v_H (2v_L-v_H) = (v_H-v_L)^2 > 0
    $
    且 $widetilde(V)_U (1) >= widetilde(V)_U (0)$，因此
    $
      pi_L = v_L^2 / (4 widetilde(V)_U (0))
      > pi_L (x_H;mu=1).
    $
    故低型別之誘因相容條件自動成立；可能成為約束條件者僅有高型別向下模仿低型別之誘因限制。

  最後，對任意均衡路徑外投入指定 $mu(x)=1$。在此信念下，高型別之延續報酬由嚴格凹函數
  $
    v_H sqrt(x / widetilde(V)_U (1)) - x
  $
  所決定，且於 $x_H$ 處取得唯一最大值，故高型別不會偏離均衡路徑。另一方面，低型別在相同信念下任意偏離所能取得的最高報酬為 $v_L^2\/(4 widetilde(V)_U (1))$，而此值不高於其分離路徑報酬$v_L^2\/(4 widetilde(V)_U (0))$。
  綜上，只要前述分離條件成立，前述策略與信念即構成完美貝氏均衡；反之，若該條件不成立，高型別將直接模仿路徑上的 $x_L$，而任何均衡路徑外信念均不足以排除此一偏離，故未扭曲分離配置不可能成為均衡。
]

#stmtref(<prop-main-iu-separating-candidate>, "命題", "proposition-counter") 與 #c("fu2006") 之差異，在完全相關之設定下昭然若揭。當 $rho=1$ 時，$widetilde(V)_U (1)=v_H$、$widetilde(V)_U (0)=v_L$，故前述分離條件化為

$
  v_H/v_L <= v_H^2 / (v_L (2v_H-v_L)),
$

此式在 $v_H>v_L$ 下不成立。因此，#c("fu2006") 的完全相關模型無法成立兩型別皆採各自完整資訊最適投入的未扭曲分離配置。相對地，#c("fu2006") 之命題 3 所得到的為扭曲分離均衡：高型別維持其完整資訊投入，低型別則必須向下扭曲投入，以防止高型別模仿，並由低型別單獨負擔分離所需的成本。

本文結果顯示，此一扭曲並非僅由資訊不對稱本身所造成；當 $rho$ 較低且前述分離條件成立時，信念所引致的競爭反應仍然有限，兩型別無須扭曲投入即可達成分離。隨著 $rho$ 上升，$widetilde(V)_U (1) \/ widetilde(V)_U (0)$ 之比率擴大，高型別藉由模仿低型別所能取得的競爭鬆弛效果亦隨之提高，最終使未扭曲分離失去可維持性，並逐步趨近於 #c("fu2006") 所呈現的低型別向下扭曲結果。

相較於 SS 與 UI 可由 $tilde(A)$、$tilde(B)$ 對基準模型中 $hat(A)$、$hat(B)$ 的替換加以表達，IU 子賽局無法僅透過此種係數替換概括其均衡結構。其原因在於，知情者的投入同時具有競賽行動與型別訊號的雙重性質，而不知情者的最佳反應強度又會隨後驗信念而調整。據此，SS 與 UI 可視為不存在訊號更新時的對照基準；IU 則承載了獎酬相關性所帶出的信念反應機制，從而使均衡型態隨 $rho$ 的變化而連續調整。

前述分離條件係以後驗期望獎酬比值 $widetilde(V)_U (1) \/ widetilde(V)_U (0)$ 表達。由於此比值為 $rho$ 之嚴格遞增函數，分離均衡的存在性等價於 $rho$ 不超過某一唯一臨界值，其封閉式可由比值的單調性直接解出。

#theorem(
  title: [分離臨界相關度],
)[
  令 $R$ 如#stmtref(<prop-main-iu-separating-candidate>, "命題", "proposition-counter")所定義，不知情者之無條件期望獎酬定義為

  $
    widetilde(V)_U (q) = v_L + q Delta V
  $

  則 IU 子賽局之未扭曲分離均衡存在若且唯若 $rho <= rho^*$，其中唯一臨界相關度為
  $
    rho^* = frac((R-1) widetilde(V)_U (q), (1 - q + R q)Delta V).
  $ <eq-main-rho-star>
  在獨立端點 $rho = 0$ 時分離嚴格成立；在完全相關端點 $rho = 1$ 時未扭曲分離失效。
] <prop-main-iu-rho-star>

#proof[
  由後驗期望獎酬的定義可得

  $
    widetilde(V)_U (1) & = v_L + [q + rho(1-q)] Delta V \
    widetilde(V)_U (0) & = v_L + q(1-rho) Delta V
  $
  故
  $
    frac(d(widetilde(V)_U (1) \/ widetilde(V)_U (0)), d rho)
    = frac(Delta V dot widetilde(V)_U (q), widetilde(V)_U (0)^2) > 0.
  $
  隱含比值 $rho$ 嚴格遞增，將等號 $widetilde(V)_U (1) = R widetilde(V)_U (0)$ 展開整理含 $rho$ 項，得
  $
    rho [(1-q) + R q] Delta V = (R-1) widetilde(V)_U (q)
  $
  兩邊除以 $[(1-q) + R q] Delta V$ 即得前述臨界值公式。最後進行端點驗證：

  - $rho = 0$ 時比值為 $1 < R$；
  - $rho = 1$ 時比值為 $v_H \/ v_L > R$ (因 $v_H > v_L$)，此時未扭曲分離失效。
]

#stmtref(<prop-main-iu-rho-star>, "定理", "theorem-counter") 將分離均衡的存在條件從後驗期望獎酬的比值不等式，化約為相關參數 $rho$ 的單一臨界值，其封閉式完全由型別分布 $(v_H, v_L, q)$ 決定。$rho^*$ 愈高，意味著獎酬差距 $Delta V$ 相對於平均獎酬 $widetilde(V)_U (q)$ 愈小，分離均衡在更寬廣的相關度範圍內成立。

當 $rho$ 超過 $rho^*$ 後，未扭曲分離配置不再成立，但分離結構並非全面崩潰。#c("riley1979") 指出，訊號賽局中存在最低成本的分離均衡——低型別向下壓低投入，使高型別喪失模仿誘因；高型別無須偏離其完整資訊最適投入。此一結果即 Riley 均衡，構成 $rho > rho^*$ 時 IU 子賽局的分離均衡候選。

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
  + 低型別選 Riley 投入 $x_L^"R" = (z_H^-)^2$；
  + 路徑上信念分別為 $mu(x_H) = 1$ 以及 $mu(x_L^"R") = 0$，路徑外任意偏離之信念設為 $mu = 1$。
] <prop-main-iu-riley>

#proof[
  首先考慮高型別模仿低型別路徑投入的誘因。若高型別選擇將被解讀為低型別之訊號投入 $x' <= x_L^* equiv v_L^2 \/ (4 widetilde(V)_U (0))$，則該投入在分離路徑上被解讀為低型別，不知情者形成信念 $mu = 0$，故高型別之模仿報酬為

  $
    pi' equiv v_H sqrt(x' / widetilde(V)_U (0)) - x'.
  $

  由於高型別在均衡路徑上之報酬為
  $
    pi_H = v_H^2 / (4 widetilde(V)_U (1)),
  $
  令 $z = sqrt(x')$，高型別不模仿之條件 $pi_H >= pi'$ 可化為

  $
    z^2 - frac(v_H, sqrt(widetilde(V)_U (0))) z + frac(v_H^2, 4 widetilde(V)_U (1)) >= 0.
  $

  在 $rho > rho^*$ 下，$widetilde(V)_U (1) > widetilde(V)_U (0)$，故上式有兩實根；搭配前述 Riley 定義，其較小根即為
  $
    z_H^- = frac(v_H, 2 sqrt(widetilde(V)_U (0))) (1 - sqrt(alpha)).
  $
  由於二次式開口向上，且此處只考慮向下扭曲分支 $x' <= x_L^*$，高型別不模仿的可行集合為 $z <= z_H^-$。是故，為了以最小扭曲維持分離，低型別取使高型別誘因相容條件恰為等號之最大可行投入，即 $x_L^"R" = (z_H^-)^2$。

  至於不屬於低型別路徑投入之其他偏離，本文指定路徑外信念為 $mu = 1$。在此信念下，高型別之延續報酬 $v_H sqrt(x \/ widetilde(V)_U (1)) - x$ 於其自身路徑投入 $x_H$ 處取得唯一最大值，故高型別不會另行偏離。

  最後，低型別若改為模仿高型別，其偏離報酬為

  $
    pi_L (x_H;mu=1)
    = (v_H (2v_L - v_H)) / (4 widetilde(V)_U (1)).
  $

  由#stmtref(<prop-main-iu-separating-candidate>, "命題", "proposition-counter")之證明第 (2) 點可知，$pi_L > pi_L (x_H;mu=1)$，故低型別不會向上模仿；高型別之誘因相容條件則由 $x_L^"R"$ 的構造保證成立，從而上述策略與信念構成 Riley 扭曲分離均衡。
]

#stmtref(<prop-main-iu-riley>, "命題", "proposition-counter") 顯示，當相關程度超過臨界值後，分離失效的原因並非高型別無法維持其完整資訊投入，而是低型別原先的投入已不足以阻止高型別向下模仿。Riley 均衡的經濟意涵，在於將分離成本完全配置給低型別：其必須進一步壓低投入，以降低高型別模仿後所能獲得的競爭鬆弛利益；高型別則維持未扭曲投入，不承擔額外訊號成本。故隨 $rho$ 上升，均衡扭曲將首先表現在低型別行為，而非高型別行為。

#corollary(title: [IU 子賽局分離均衡之區域結構])[
  IU 子賽局之分離均衡區域依相關程度 $rho$ 刻畫如下：

  #set enum(numbering: "(1)")

  + 若 $0 <= rho <= rho^*$，則未扭曲分離配置由#stmtref(<prop-main-iu-separating-candidate>, "命題", "proposition-counter") 與#stmtref(<prop-main-iu-rho-star>, "定理", "theorem-counter") 所刻畫，且至少存在一組未扭曲分離均衡；
  + 若 $rho > rho^*$，則未扭曲分離配置失效，而 Riley 扭曲分離配置由#stmtref(<prop-main-iu-riley>, "命題", "proposition-counter") 提供一組新的分離均衡候選；
  + 故在 $rho > rho^*$ 的區域內，未扭曲分離已不再可支持；本文後續時序比較即以#stmtref(<prop-main-iu-riley>, "命題", "proposition-counter")所刻畫之 Riley 扭曲分離作為 IU 子賽局的分離均衡配置。
] <cor-main-iu-region-summary>

#stmtref(<cor-main-iu-region-summary>, "推論", "corollary-counter")將 IU 子賽局之分離結構整理為一條清楚的區域圖像：低相關區間由未扭曲分離主導；當相關程度超過臨界值後，分離若仍存在，其形式便不再可能維持兩型別各自的完整資訊最適投入，而必須轉為由低型別承擔額外訊號成本的 Riley 扭曲分離。故相較於 SS 與 UI，IU 子賽局的特殊性不僅在於投入兼具競賽行動與訊號功能，更在於其均衡型態隨相關程度由未扭曲分離轉為 Riley 扭曲分離。

有鑑於後續第 0 階段的內生時序比較，必須為每一時序指派明確的事前報酬，故進入時序比較前尚須就 IU 子賽局之均衡配置作進一步整理。換言之，SS 與 UI 的時序報酬可直接由其唯一均衡決定；而 IU 的時序報酬則必須以本節所刻畫之均衡型態為基礎，於後續分析中明確指明所採用之均衡配置。

== 內生時序均衡 <subsec-main-endogenous-timing>

以上已分別求得 SS、UI 與 IU 三個投入子賽局在部分相關結構下的均衡配置，並說明相關性如何透過後驗信念改變 IU 子賽局之揭露型態。據此，下一步即是回到第 0 階段的時序選擇問題：當參與者可自行決定先動或後動時，最終均衡將支持何種行動順序？

本節的分析重點，已不再是個別子賽局中的投入選擇，而是不同時序之間的事前比較。具體而言，第 0 階段的時序選擇須以三個時序所誘導之事前期望報酬為基礎，判斷參與者在給定對手時點選擇下是否具有#term("單邊偏離", english: "unilateral deviation")誘因。由於 SS 與 UI 的時序報酬可直接由唯一均衡決定，而 IU 則可能因均衡型態隨 $rho$ 改變而呈現不同報酬結構，故內生時序均衡的關鍵，正在於相關性如何透過 IU 時序報酬牽動第 0 階段的時序排序。

=== 第 0 階段之時序選擇與時序報酬

本節將第 0 階段的時序選擇刻畫為一個 $2 times 2$ 策略式賽局。沿用內生時序文獻的標準記號，令 $F$ 表示先動，$S$ 表示後動。知情者與不知情者同時選擇其行動時點，時序決定後再進入對應的投入子賽局：若兩者皆選擇 $F$，則形成立即同時行動的 SS 時序；若知情者選擇 $F$ 而不知情者選擇 $S$，則形成 IU 時序；若知情者選擇 $S$ 而不知情者選擇 $F$，則形成 UI 時序；若兩者皆選擇 $S$，則形成延後同時行動。由於本文不考慮跨期折現，且延後同時行動不產生額外訊號或承諾效果，其均衡報酬與立即同時行動的 SS 時序相同。

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
  caption: [第 0 階段之時序報酬矩陣],
  supplement: [表],
) <tbl-main-timing-payoff-matrix>

@tbl-main-timing-payoff-matrix 中，每一格所列者皆為對應時序下的事前期望報酬。以下沿用#stmtref(<def-bench-ex-ante-payoff>, "定義", "definition-counter")之記號：知情者以各型別報酬的先驗加權平均比較時序，不知情者則以均衡報酬直接比較。表中之 SS 與 UI 由#stmtref(<prop-main-ss-equilibrium>, "命題", "proposition-counter")與#stmtref(<prop-main-ui-equilibrium>, "命題", "proposition-counter")給定；IU 則依給定參數下所對應之分離或扭曲分離均衡計算。

=== 三種時序下的事前期望報酬

為進行第 0 階段的時序比較，將三種時序的事前報酬整理如下。對 SS 而言，
$
  widetilde(pi)_U^(SS)
  = tilde(A)^2 tilde(B) / (1+tilde(B))^2.
$
知情者對應的事前報酬為
$
  widetilde(pi)_I^(SS)
  = q pi_I^(SS)(v_H) + (1-q) pi_I^(SS)(v_L).
$
對 UI 而言，
$
  widetilde(pi)_U^(U I) = tilde(A)^2 / 4,
$
且
$
  widetilde(pi)_I^(U I)
  = q pi_I^(U I)(v_H) + (1-q) pi_I^(U I)(v_L).
$
若 IU 子賽局為未扭曲分離，則
$
  pi_H = v_H^2 / (4 widetilde(V)_U (1)),
  quad
  pi_L = v_L^2 / (4 widetilde(V)_U (0)),
$
故知情者之事前期望報酬為
$
  widetilde(pi)_I^(I U)
  = q frac(v_H^2, 4 widetilde(V)_U (1))
  + (1-q) frac(v_L^2, 4 widetilde(V)_U (0)).
$
不知情者之事前期望報酬則由兩條分離路徑上的報酬加權而得：
$
  widetilde(pi)_U^(I U) & = q pi_U (x_H, x_U^*(x_H,1);mu=1) \
                        & + (1-q) pi_U (x_L, x_U^*(x_L,0);mu=0).
$
若 IU 子賽局落於 Riley 扭曲分離區間，則僅低型別路徑以扭曲投入 $x_L^"R"$ 取代 $x_L$。後續時序比較據此使用各參數區間所對應的 IU 事前報酬。

=== 純策略內生時序均衡

沿用第 3 章之單邊偏離差額記號，令
$
  Delta_I^(U I) & equiv widetilde(pi)_I^(U I) - widetilde(pi)_I^(SS), & quad
  Delta_I^(I U) & equiv widetilde(pi)_I^(I U) - widetilde(pi)_I^(SS), \
  Delta_U^(U I) & equiv widetilde(pi)_U^(U I) - widetilde(pi)_U^(SS), & quad
  Delta_U^(SS) & equiv widetilde(pi)_U^(SS) - widetilde(pi)_U^(I U).
$
其正負即對應 @tbl-main-timing-payoff-matrix 中的單邊偏離誘因。

#theorem(
  title: [第 0 階段之純策略內生時序均衡: 部分相關],
)[
  第 0 階段的純策略 Nash 均衡可由四個單邊偏離差額完全刻畫：

  #set enum(numbering: "(1)")

  + UI 構成純策略均衡若且唯若 $Delta_I^(U I) >= 0$ 且 $Delta_U^(U I) >= 0$；
  + SS 構成純策略均衡若且唯若 $Delta_I^(U I) <= 0$ 且 $Delta_U^(SS) >= 0$；
  + IU 構成純策略均衡若且唯若 $Delta_I^(I U) >= 0$ 且 $Delta_U^(SS) <= 0$。
] <prop-main-endogenous-timing-pure>

#proof[
  由@tbl-main-timing-payoff-matrix 直接檢查各格之單邊偏離誘因可得。若策略組合為 (知情者後動、不知情者先動)，則所誘導時序為 UI，兩方分別不偏離之條件為 $Delta_I^(U I) >= 0$ 與 $Delta_U^(U I) >= 0$。若策略組合為 (知情者先動、不知情者先動)，則所誘導時序為 SS，對應條件為 $Delta_I^(U I) <= 0$ 與 $Delta_U^(SS) >= 0$。若策略組合為 (知情者先動、不知情者後動)，則所誘導時序為 IU，對應條件為 $Delta_I^(I U) >= 0$ 與 $Delta_U^(SS) <= 0$。
]

#stmtref(<prop-main-endogenous-timing-pure>, "定理", "theorem-counter") 顯示，第 0 階段的純策略時序選擇可完全化約為四個單邊偏離差額的正負比較。內生時序均衡並非直接由先動或後動本身決定，而是取決於某一方在固定對手時點選擇下，是否能藉由改變自身行動時序提升該時序下的事前報酬。故時序均衡的核心，不在於個別時序的絕對報酬高低，而在於不同時序之間的局部偏離誘因如何排序；此亦構成後續分析相關性如何牽動時序翻轉的出發點。

=== 相關性與時序偏好之翻轉

前小節已將第 0 階段的純策略內生時序均衡，化約為四個單邊偏離差額的正負比較。據此，若欲分析相關性如何改變時序選擇，核心問題即在於：$rho$ 上升時，前述定義之單邊偏離差額將如何變動，進而使原本成立的純策略時序均衡失去可維持性，或使原本不可維持的時序重新成為均衡。

在本文架構下，相關性對時序偏好的影響，並非透過單一機制發生。對 SS 與 UI 而言，$rho$ 並不引發路徑上的信念更新，惟其仍會改變不知情者對自身獎酬的條件期望，從而影響兩個時序下的事前報酬。相較之下，IU 時序除同樣受到條件期望獎酬變動的影響外，尚額外承受投入作為訊號所引致的揭露效果；因此，相關性對 IU 時序報酬的牽動最為直接，也最可能成為第 0 階段時序翻轉的來源。

準此，後續比較靜態的邏輯可概分為兩步。首先，檢視 $rho$ 如何透過 $widetilde(V)_U (1)$、$widetilde(V)_U (0)$ 與 $widetilde(V)_U (q)$ 進入三種時序的事前報酬；其次，再將此一報酬變動映射為四個單邊偏離差額的符號變化。若某一偏離差額隨 $rho$ 單調上升或下降，則對應的時序穩定性亦將隨之改變；而當差額跨越零點時，即代表參賽者於第 0 階段的最佳反應發生翻轉，內生時序均衡也因而改變。

#lemma(
  title: [不知情者對後動知情者之先動偏好],
)[
  在本文分析的內點區域內，對任意給定之 $rho$，皆有
  $
    Delta_U^(U I) = widetilde(pi)_U^(U I) - widetilde(pi)_U^(SS) >= 0.
  $
  等號成立若且唯若 $tilde(B)=1$。
] <prop-main-timing-u-prefers-ui>

#proof[
  此即#stmtref(<prop-main-ui-first-mover>, "命題", "proposition-counter") 的直接推論。由
  $
    widetilde(pi)_U^(U I) >= widetilde(pi)_U^(SS)
  $
  可知，當知情者選擇後動時，不知情者由後動改為先動、使時序由 SS 轉為 UI，永不致使其報酬下降。故 $Delta_U^(U I) >= 0$；等號成立若且唯若#stmtref(<prop-main-ui-first-mover>, "命題", "proposition-counter") 之等號條件 $tilde(B)=1$ 成立。
]

#stmtref(<prop-main-timing-u-prefers-ui>, "引理", "lemma-counter") 的意義在於，不知情者面對後動的知情者時，始終弱偏好以先動承諾將時序推向 UI。換言之，相關性雖會改變三種時序下的事前報酬水準，但不會推翻 UI 相對於 SS 的這一方向性比較。故第 0 階段時序翻轉的主要來源，並不在於不知情者是否放棄先動，而在於知情者對先動揭露效果的評價如何隨 $rho$ 改變。

在此基礎上，真正關鍵的比較靜態問題，轉而落在知情者自身的先動誘因。特別是，當 IU 子賽局仍位於未扭曲分離區間時，知情者在 IU 時序下的事前報酬可寫為兩條分離路徑報酬的加權平均，故可直接檢視其對 $rho$ 的變動方向。

#proposition(
  title: [未扭曲分離區間下知情者的先動報酬],
)[
  在 $rho <= rho^*$ 的未扭曲分離區間內，知情者於 IU 時序下的事前期望報酬
  $
    widetilde(pi)_I^(I U)
    = q frac(v_H^2, 4 widetilde(V)_U (1))
    + (1-q) frac(v_L^2, 4 widetilde(V)_U (0))
  $
  為 $rho$ 的嚴格遞減函數。
] <prop-main-timing-iu-rho>

#proof[
  由後驗期望獎酬公式分別代入 $mu=1$ 與 $mu=0$，可得
  $
    widetilde(V)_U (1) & = v_L + [q + rho(1-q)] Delta V, \
    widetilde(V)_U (0) & = v_L + q(1-rho) Delta V
  $
  將上述兩式分別對 $rho$ 微分，得到
  $
    frac(d widetilde(V)_U (1), d rho) = (1-q) Delta V > 0,
    quad
    frac(d widetilde(V)_U (0), d rho) = -q Delta V < 0.
  $
  故
  $
    frac(d widetilde(pi)_I^(I U), d rho)
    = frac(q(1-q) Delta V, 4)
    [
      frac(v_L^2, widetilde(V)_U (0)^2)
      - frac(v_H^2, widetilde(V)_U (1)^2)
    ].
  $

  接著比較括號內兩項。由 $v_H = v_L + Delta V$，
  $
    v_H widetilde(V)_U (0) - v_L widetilde(V)_U (1)
    = (1-rho) Delta V [v_L + q Delta V]
    > 0
  $
  對任意 $rho < 1$ 成立，故
  $
    frac(v_H, widetilde(V)_U (1))
    > frac(v_L, widetilde(V)_U (0)).
  $
  進而得到
  $
    frac(v_H^2, widetilde(V)_U (1)^2)
    > frac(v_L^2, widetilde(V)_U (0)^2),
  $
  故上式中中括號為負。由於 $q(1-q) Delta V / 4 > 0$，遂得
  $
    frac(d widetilde(pi)_I^(I U), d rho) < 0.
  $
]

#stmtref(<prop-main-timing-iu-rho>, "命題", "proposition-counter") 顯示，在未扭曲分離仍可維持的區間內，相關性愈高，知情者在 IU 時序下的先動報酬愈低。其原因在於，$rho$ 上升一方面提高高型別路徑下不知情者的後驗期望獎酬，使高型別先動後面臨更強的競爭反應；另一方面，雖然低型別路徑下的不知情者後驗期望獎酬下降，低型別可藉此獲得較寬鬆的競爭環境，但此一效果不足以抵銷高型別路徑上的揭露成本。故在知情者的先動時序中，相關性所強化的訊號效果，整體上將侵蝕其事前資訊租金。

在此基礎上，可將「時序偏好翻轉」正式表述為單邊偏離差額的過零現象。由於第 0 階段知情者在面對後動之不知情者時，係比較 IU 與 SS 兩個時序的事前報酬，故其先動誘因完全由
$
  Delta_I^(I U) = widetilde(pi)_I^(I U) - widetilde(pi)_I^(SS)
$
之符號決定。只要此差額隨 $rho$ 上升由正轉負，便代表知情者在某一臨界相關度處由偏好先動轉為偏好後動。

#theorem(
  title: [翻轉臨界值的存在性],
)[
  於區間 $[0, rho^*]$ 內，令
  $
    Delta_I^(I U)(rho)
    equiv widetilde(pi)_I^(I U)(rho) - widetilde(pi)_I^(SS)(rho).
  $
  則 $Delta_I^(I U)(rho)$ 為 $rho$ 的連續函數。若
  $
    Delta_I^(I U)(0) > 0,
    quad
    Delta_I^(I U)(rho^*) < 0,
  $
  則存在至少一個臨界相關度 $rho^dagger in (0, rho^*)$，使得 $Delta_I^(I U)(rho^dagger) = 0$。換言之，在未扭曲分離區間內，知情者對 IU 時序之先動偏好必須至少發生一次翻轉。
] <prop-main-timing-rho-dagger-existence>

#proof[
  在區間 $[0,rho^*]$ 內，IU 子賽局採用未扭曲分離報酬，故由#stmtref(<prop-main-timing-iu-rho>, "命題", "proposition-counter") 可知 $widetilde(pi)_I^(I U)(rho)$ 為 $rho$ 的連續函數；另一方面，SS 時序下的事前報酬由#stmtref(<prop-main-ss-equilibrium>, "命題", "proposition-counter") 所給之閉式表示構成，亦為 $rho$ 的連續函數。故 $Delta_I^(I U)(rho)$ 作為兩個連續函數之差，必為連續函數。

  若進一步滿足
  $
    Delta_I^(I U)(0) > 0,
    quad
    Delta_I^(I U)(rho^*) < 0,
  $
  則由介值定理，存在至少一個 $rho^dagger in (0,rho^*)$ 使 $Delta_I^(I U)(rho^dagger)=0$。由第 0 階段時序矩陣可知，$Delta_I^(I U)$ 的符號即決定在給定不知情者後動時，知情者是否偏好先動；故一旦該差額由正轉負，即表示知情者對 IU 時序的先動偏好至少發生一次翻轉。
]

綜合#stmtref(<prop-main-timing-u-prefers-ui>, "引理", "lemma-counter")、#stmtref(<prop-main-timing-iu-rho>, "命題", "proposition-counter") 與#stmtref(<prop-main-timing-rho-dagger-existence>, "定理", "theorem-counter")，可據此歸納出一個更具體的比較靜態結論：當相關性上升時，不知情者在面對後動知情者時對先動的偏好不會消失，而知情者在 IU 時序下的先動報酬則系統性下降。故只要 IU 與 SS 的相對報酬在未扭曲分離區間兩端發生符號逆轉，便必然存在至少一個翻轉臨界值，使知情者由偏好先動轉為偏好後動。換言之，相關性愈高，由 IU 轉向其他時序配置的壓力愈強；前述結果並揭示翻轉的根本機制：相關性使先動所伴隨的揭露成本逐步上升，從而削弱知情者對先動時序的偏好。

為了補充前述命題的經濟直覺，@fig-main-timing-preference 以 $v_H = 2$、$v_L = 1$ 為例，呈現相關性參數 $rho$ 與高型別機率 $q$ 變動時的數值結果。圖中實線表示未扭曲分離均衡存在之臨界值 $rho^*(q)$；其上方為未扭曲分離失效區域。虛線則表示由 $Delta_I^(I U)(rho, q) = 0$ 數值求得之報酬翻轉臨界值 $rho^dagger(q)$。虛線下方表示知情者偏好 IU，虛線與實線之間表示知情者偏好 SS，惟未扭曲分離仍可維持。

由@fig-main-timing-preference 可見，在低相關區域，知情者先動所造成的資訊揭露成本有限，故 IU 時序下之事前報酬高於 SS；然而，隨著 $rho$ 上升，知情者型別對不知情者自身獎酬的推論價值逐漸提高，先動揭露所引發的競爭反應因而加劇，使知情者的時序偏好由 IU 轉向 SS。當 $rho$ 進一步超過 $rho^*(q)$ 後，高型別模仿低型別的誘因已無法由未扭曲分離配置排除，故未扭曲分離均衡失效。

#figure(
  image("../../figures/fig_timing_region.pdf", width: 78%),
  caption: [知情者時序偏好與分離可維持性 ($v_H = 2$, $v_L = 1$)],
  supplement: [圖],
) <fig-main-timing-preference>

綜上，本節已完成第 0 階段內生時序均衡的基本刻畫。首先，時序選擇可化約為四個單邊偏離差額的正負比較；其次，在時序報酬層次上，不知情者對 UI 的先動偏好具有穩健性，而知情者於 IU 時序下的先動報酬則隨相關性上升而下降。故部分相關結構不僅改變投入子賽局中的揭露型態，亦會透過時序報酬的重新排序，牽動第 0 階段的時序選擇。此一結果說明，#c("fu2006") 所揭示的後動傾向，並非僅是行動順序的產物，而與資訊相關性所強化之揭露成本密切相關。

== 本章小結 <sec-main-summary>

本章在第三章獨立同分配基準之上，引入獎酬的部分相關結構，系統性地分析相關性對均衡投入、分離型態與時序選擇的影響。

就均衡投入而言，相關性透過後驗期望獎酬 $widetilde(V)_U (1)$ 與 $widetilde(V)_U (0)$ 的對立移動，改變 SS 與 UI 子賽局的複合係數 $tilde(A)$、$tilde(B)$，並在 $rho=1$ 時收斂至完全相關的極限值。IU 子賽局的均衡結構則呈現出不連續的兩段式特徵：在低相關區間 ($rho <= rho^*$)，未扭曲分離均衡存在，兩型別各選完整資訊最適投入；一旦 $rho$ 超過臨界值 $rho^*$，高型別的模仿誘因使未扭曲分離失效，均衡轉為 Riley 扭曲型態，分離代價由低型別單獨承擔。

就時序選擇而言，本章的核心發現是兩位參與者對相關性的反應存在結構性不對稱。不知情者對 UI 時序的先動偏好對相關性穩健，在 $rho < 1$ 的全部區間均嚴格為正。知情者對 IU 時序的先動偏好則隨 $rho$ 上升而單調下降——相關性提高訊號的資訊含量，同時加重知情者先動所需付出的揭露代價，使 IU 時序的吸引力持續縮減。當此偏好在某個中間值 $rho^dagger in (0, rho^*)$ 由正轉負，時序排序便發生翻轉，均衡時序從 IU 轉向 SS 或 UI。

上述結果說明，部分相關性並非對獨立同分配基準的局部修正，而是從均衡結構到時序誘因全面重塑競賽的運作方式。然而，均衡能否被支持是一回事，均衡的福利後果是另一回事。相關性提高一方面使資訊更充分揭露，可能改善配置效率；另一方面也強化競爭反應，可能加劇投入耗散，此一權衡構成下一章的分析主軸。
