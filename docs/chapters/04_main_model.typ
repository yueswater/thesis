#import "../thesis.typ": (
  SS, bern, c, ca, corollary, corr, cp, definition, example, headingref, impt, lemma, payoff-matrix-2x2, proof,
  proposition, stmtref, term, widetilde,
)

#headingref(<sec-model>)係建立於 $V_I$ 與 $V_U$ 相互獨立之假設。在此情形下，知情者之投入雖使不知情者得以推測對手型別，然此一推論並不影響其對自身獎酬價值之判斷，訊號亦因此僅具辨識作用而不致改變不知情者之最佳反應。本章進一步放寬此一獨立性假設，允許兩者呈現正相關，並以參數 $rho in [0,1]$ 描述其相關程度。當 $rho = 0$ 時回歸#headingref(<sec-model>)之獨立情形，$rho = 1$ 則對應 #c("fu2006") 之完全相關情形，$0 < rho < 1$ 為本章所關注之部分相關結構。據此，前述兩種資訊環境皆可視為同一相關性架構下之特殊案例。

當 $V_I$ 與 $V_U$ 呈現正相關時，知情者之投入除反映其自身型別外，亦隱含關於不知情者獎酬價值之資訊。不知情者觀察知情者行為後，除推測對手型別外，亦將同步修正對自身獎酬之信念，使後驗信念進入其後驗期望獎酬與最佳反應之中，#headingref(<sec-model>)之均衡性質因而不再必然成立。有鑑於此，本章首先建構部分相關型別之聯合分配，推導不知情者之後驗期望獎酬，繼而分析 IU 子賽局中之分離均衡、混同均衡及其並存區域，說明均衡型態如何隨相關程度演變。藉此，本文得以釐清 #c("fu2006") 所揭示之後動優勢，其根源究竟來自行動順序，抑或來自資訊相關性所引致之信念調整機制。

== 部分相關型別結構 <subsec-main-setup>

本節建構本章分析所採用之部分相關型別結構。延續 #headingref(<sec-model>) 之設定，本文仍假設 $V_I$ 與 $V_U$ 具有相同之邊際分配，惟放寬統計獨立之要求，允許兩者在維持相同邊際分配之前提下呈現正向相關。此一參數化架構以相關係數 $rho in [0,1]$ 統攝三種資訊結構：$rho = 0$ 對應 #headingref(<sec-model>) 之獨立情形，$0 < rho < 1$ 為本章所關注之部分相關情形，$rho = 1$ 則還原為 #c("fu2006") 之完全相關情形，三者得於統一框架下加以比較。

相關性之實質意涵在於：兩位參與者所面對之標的價值是否具有共同變動之特徵。當 $V_I$ 與 $V_U$ 相互獨立時，知情者之型別不提供任何關於不知情者獎酬價值的額外資訊；一旦兩者呈現正相關，知情者屬於高型別之事實便隱含不知情者處於高獎酬狀態之可能性亦有所提升。此一資訊傳遞機制的存在，使知情者之投入行為不再單純揭示其自身型別，而亦可能引發不知情者對自身獎酬價值之信念修正。

=== 邊際分配與相關參數 <subsubsec-main-marginal-rho>

型別分配的完整刻畫，有賴兩個互不依存的特徵：其一為邊際層次的先驗機率，反映每位參與者個別成為高型別的頻率；其二為聯合層次的統計依存程度，決定一方型別的實現對另一方所蘊含的資訊含量。以獨立參數分別刻畫此二特徵，一方面確保邊際對稱性不因相關程度而改變，使後續均衡性質的差異得以精確歸因於獎酬相關結構本身；另一方面亦使本章得以在固定邊際分配的前提下單獨調整相關程度，從而在統一框架內實現跨資訊環境的比較。本節依序引入此兩個參數，並於節末以正式定義整合。

本節沿用 #headingref(<sec-model>) 之符號設定，並維持邊際機率為 $q in (0,1)$ 之假設，惟放寬統計獨立之要求。獎酬間的關聯程度由另一個獨立參數加以刻畫。

#definition(title: [部分相關型別結構])[
  定義高型別指示變數
  $
    H_I equiv bb(1){V_I = v_H}, quad H_U equiv bb(1){V_U = v_H},
  $
  並以其#term("皮爾森相關係數", english: "Pearson correlation coefficient")定義相關參數
  $
    rho equiv corr(H_I, H_U).
  $
  本文限制 $rho in [0,1]$ 以聚焦於正相關情形。#footnote[皮爾森相關係數之一般值域為 $[-1,1]$。負相關情形 (即 $rho < 0$) 隱含兩者獎酬呈反向變動，在競賽文獻中較不具代表性，故本文不予討論。] 若知情者與不知情者之獎酬具有相同邊際分配，則稱 $(V_I, V_U)$ 服從參數為 $(q, rho) in (0,1) times [0,1]$ 之部分相關型別結構。
] <def-main-correlated-types>

就經濟意涵觀之，$rho$ 衡量兩位參與者獎酬價值之間的共同變動程度：$rho$ 越高，知情者的獎酬高低便越能揭示不知情者的獎酬狀態，訊號的資訊含量亦隨之增加；$rho = 0$ 時兩者獎酬完全獨立，$rho = 1$ 時則必然同步。本章後續分析聚焦於 $0 < rho < 1$ 之部分相關情形。#footnote[正相關獎酬結構在競賽的現實應用中相當普遍。以研發競賽為例，市場對創新產品的需求影響所有參賽廠商的潛在獲利：需求旺盛時，率先取得專利的廠商能享有較高的市場利潤，後進者的機會成本亦相應提升，使雙方獎酬趨向同步變動。在政府採購競標中，工程的實際規模、技術複雜度或未來使用年限，均屬各廠商共同面對的外生條件，進而影響各方的預期利潤，形成正相關的獎酬結構。此外，在職位競爭或晉升競賽中，職位本身的實質影響力與薪酬水準，對所有候選人而言同樣具有共同吸引力，使各方的報酬評估亦呈現正相關。在上述情境中，一方私有資訊的實現往往能為另一方的獎酬狀態提供間接訊號，正是本章所關注的資訊傳遞機制之來源。]

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

由@tbl-main-joint-corr 可見，$rho$ 決定機率質量在同向型別組合與異向型別組合之間的分布比重。$rho$ 越高，$(v_H,v_H)$ 與 $(v_L,v_L)$ 兩種同向組合的機率越大，$(v_H,v_L)$ 與 $(v_L,v_H)$ 兩種異向組合的機率則相應縮減；$rho=1$ 時異向組合機率降為零，兩者獎酬必然同步實現。

此一分布結構決定了型別資訊在參與者之間的橫向傳遞效力。當 $rho>0$ 時，知情者型別的實現蘊含關於不知情者獎酬狀態的統計資訊：知情者為高型別，不知情者亦為高型別的後驗機率便高於先驗 $q$，差距隨 $rho$ 的增大而擴大。$rho=0$ 時兩者獨立，型別資訊不具任何此類推斷效力。

此正是本章模型與#headingref(<sec-model>)之根本差異所在。基準模型的均衡性質根植於型別獨立：知情者型別的揭示不改變不知情者對自身獎酬的條件期望，訊號因而不影響其最佳反應。一旦 $rho>0$，此一性質便不再成立——知情者型別成為關於不知情者自身獎酬的有效訊號，後驗信念進入其最佳反應之中，資訊外溢效果因而得以產生，均衡結構亦隨之根本改變。

=== 三種資訊結構

三種資訊環境的核心差異在於知情者型別對不知情者獎酬狀態之揭示程度：$rho$ 從 $0$ 增至 $1$，資訊外溢效果從完全缺席過渡至完全揭示，各情形之性質整理如@tbl-main-info-structures。

#figure(
  table(
    columns: (2.5cm, 2.2cm, 8.5cm),
    inset: 8pt,
    align: (col, row) => if col == 2 { left + horizon } else { center + horizon },
    stroke: none,
    table.hline(y: 0, stroke: 0.6pt),
    table.hline(y: 1, stroke: 0.4pt),
    table.hline(y: 4, stroke: 0.6pt),
    [$rho$], [資訊結構], [統計性質與資訊意涵],
    [$rho=0$],
    [獨立基準],
    [$V_I perp V_U$；型別資訊無橫向傳遞效力，信念不受影響。],
    [$0 < rho < 1$],
    [部分相關],
    [型別同時攜帶自身與對方獎酬之資訊，後驗信念影響最佳反應。],
    [$rho=1$], [完全相關], [$V_I = V_U$ 幾乎必然，型別完全揭示對方獎酬。],
  ),
  caption: [三種資訊環境之比較],
  supplement: [表],
) <tbl-main-info-structures>

綜上所述，參數 $rho$ 提供了一個統一且具彈性的分析框架，使本文得以在同一模型下比較三種資訊環境：$rho=0$ 的獨立基準模型、$0<rho<1$ 的部分相關模型，以及 $rho=1$ 的完全相關端點。下一節將以此聯合分配為基礎，推導不知情者於觀察知情者投入後所形成之後驗期望獎酬，並進一步說明相關性如何透過後驗信念機制重新進入最佳反應函數之中。

== 後驗期望獎酬與最佳反應 <subsec-main-belief-payoff>

#headingref(<subsec-main-setup>)建立了 $(V_I,V_U)$ 的部分相關聯合分配。本節進一步說明，此一相關結構如何進入不知情者的決策問題。關鍵在於：當 $0 < rho < 1$ 時，知情者的投入不僅可能揭露其自身型別，也會改變不知情者對自身獎酬價值的條件判斷。因此，不知情者在選擇投入時，所面對的獎酬不再只是無條件期望，而是隨後驗信念調整後的後驗期望獎酬。

在#headingref(<sec-model>)所建構的獨立型別基準模型中，由於 $V_I$ 與 $V_U$ 相互獨立，知情者型別資訊的揭露不會影響不知情者對自身獎酬價值的評估。因此，即使不知情者會根據觀察到的投入更新對知情者型別的信念，其最佳反應函數仍不直接依賴該後驗信念。然而，在本章引入的部分相關結構下，此一性質不再成立——當 $V_I$ 與 $V_U$ 存在正相關時，知情者的投入行為不僅傳遞其自身型別資訊，同時也提供關於不知情者潛在獎酬狀態的訊息。故不知情者在觀察投入後，必須同步更新對對手型別與自身獎酬價值的條件判斷。此一由相關性所產生的信念傳遞機制，構成後續分析分離均衡與混同均衡的重要基礎。

=== 後驗信念 <subsubsec-main-posterior>

考慮 IU 子賽局。知情者先行選擇投入 $x_I$，不知情者觀察後形成對知情者型別之後驗信念 $mu : RR_+ -> [0,1]$，定義為

#counter(math.equation).update(0)
$
  mu(x_I) equiv Pr(V_I = v_H | x_I).
$ <eq-main-posterior>

其中 $mu(x_I)$ 表示由觀察投入 $x_I$ 所誘導之後驗信念函數；在討論給定觀察下的最佳反應或報酬時，為簡化記號，以下逕以 $mu$ 表示其對應之信念值。其中，$mu=1$ 表示不知情者確信知情者為高型別，$mu=0$ 表示其確信知情者為低型別，而 $mu=q$ 則表示其信念仍停留於#term("先驗水準", english: "prior level")。

由@tbl-main-joint-corr 可得兩個關鍵的條件機率。

#lemma(
  title: [相關型別下之條件高型別機率],
)[
  在#stmtref(<def-main-correlated-types>, "定義", "definition-counter") 所給定之部分相關型別結構下，若知情者為高型別，則不知情者為高型別的條件機率為
  $
    theta_H equiv Pr(V_U = v_H|V_I = v_H) = q + rho(1-q).
  $ <eq-main-theta-h>

  若知情者為低型別，則不知情者為高型別的條件機率為

  $
    theta_L equiv Pr(V_U = v_H|V_I = v_L) = q(1-rho).
  $ <eq-main-theta-l>
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
    widetilde(V)_U(mu) equiv EE[V_U|x_I].
  $
] <def-main-posterior-expected-valuation>

#stmtref(<def-main-posterior-expected-valuation>, "定義", "definition-counter") 之區別實益在於區分真實獎酬與決策時所依據的獎酬評估。$V_U$ 為不知情者尚未觀察的實現值；$widetilde(V)_U(mu)$ 則是其觀察 $x_I$ 後，根據後驗信念形成的條件期望。由於不知情者無法直接依據 $V_U$ 選擇投入，後續目標函數與最佳反應所採用的獎酬項，均為後驗期望獎酬 $widetilde(V)_U(mu)$，而非尚未觀察的實現值 $V_U$。

#lemma(
  title: [後驗期望獎酬之閉式表示],
)[
  令 $Delta V equiv v_H - v_L$。根據#stmtref(<lem-main-conditional-high-prob>, "引理", "lemma-counter")，若不知情者觀察 $x_I$ 後形成後驗信念 $mu=Pr(V_I=v_H|x_I)$，則其對自身為高型別之條件機率為
  $
    Pr(V_U=v_H|x_I) = q + rho(mu-q).
  $ <eq-main-belief-high-prob>

  因此，根據#stmtref(<def-main-posterior-expected-valuation>, "定義", "definition-counter")，不知情者的後驗期望獎酬可寫為
  $
    widetilde(V)_U(mu)
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
    widetilde(V)_U(mu) = v_L + q Delta V,
  $
]

與後驗信念 $mu$ 無關。此時，知情者投入至多揭示知情者自身型別，卻不提供任何關於不知情者獎酬狀態的額外資訊。因此，即使不知情者能辨識知情者為高型別或低型別，其對自身獎酬的條件期望仍停留在先驗水準。訊號在此只具有辨識對手型別的作用，尚未轉化為影響自身投入決策的獎酬訊息。

相對地，若 $rho>0$，則

#[
  #set math.equation(numbering: none)
  $
    (d widetilde(V)_U(mu)) / (d mu) = rho Delta V > 0.
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
    [$mu=1$], [確信知情者為高型別], [$widetilde(V)_U(1)=v_L+[q+rho(1-q)]Delta V$],
    [$mu=q$], [信念維持於先驗水準], [$widetilde(V)_U(q)=v_L+q Delta V=EE[V_U]$],
    [$mu=0$], [確信知情者為低型別], [$widetilde(V)_U(0)=v_L+q(1-rho)Delta V$],
  ),
  caption: [特殊後驗信念下之後驗期望獎酬],
  supplement: [表],
) <tbl-main-posterior-expected-values>

當 $rho>0$ 時，高型別訊號使不知情者上修自身獎酬評估，低型別訊號則使其下修；若信念維持於先驗水準，後驗期望獎酬即等於無條件期望獎酬。特別地，$widetilde(V)_U(q)$ 對應於 #headingref(<sec-model>) 基準模型中的 $overline(v)=EE[V_U]$，差別僅在於此處將其置於 $widetilde(V)_U(mu)$ 的統一函數記號之下。因此，

#[
  #set math.equation(numbering: none)
  $
    widetilde(V)_U(1) > widetilde(V)_U(q) > widetilde(V)_U(0).
  $
]

=== 最佳反應與延續報酬 <subsubsec-main-br-ic>

本節將前述後驗期望獎酬帶入 IU 子賽局的行為方程。由於 IU 制度下知情者先動、不知情者後動，分析須使用#term("反向演繹法", english: "backward induction")：首先刻畫不知情者在觀察 $x_I$ 並形成後驗信念後的最佳反應；其次，將此反應代回知情者的報酬函數，以描述不同型別在先動時面對的延續報酬。如此處理的目的，是將#impt[投入作為競賽行動]與#impt[投入作為型別訊號]兩種角色放在同一架構中。前者透過 Tullock 成功函數影響勝率，後者則透過後驗信念改變不知情者的後驗期望獎酬，進而影響其後續投入。

在 IU 子賽局中，知情者先行投入後，不知情者觀察 $x_I$ 並形成後驗信念 $mu$，再選擇自身投入 $x_U >= 0$。給定 $x_I>0$ 與 $mu$，根據#stmtref(<def-main-posterior-expected-valuation>, "定義", "definition-counter")，不知情者的條件期望報酬為

$
  pi_U(x_I,x_U;mu)
  = x_U / (x_I+x_U) widetilde(V)_U(mu) - x_U.
$ <eq-main-u-payoff>

此一目標函數沿用 Tullock 比例型競賽成功函數 #cp("tullock1980")，第一項為不知情者的勝率乘以其獎酬評估，第二項為投入成本。與完全資訊或獨立基準相比，本節的差異在於獎酬項不再是固定評價，而是由後驗信念決定的 $widetilde(V)_U(mu)$。因此，一階條件仍具有標準 Tullock 形式，但最佳反應的強度會隨後驗信念調整。

#lemma(
  title: [部分相關下不知情者之最佳反應],
)[
  給定知情者投入 $x_I>0$ 與後驗信念 $mu in [0,1]$。若最適解位於內點，則不知情者之最佳反應為
  $
    x_U^*(x_I,mu)
    = sqrt(x_I widetilde(V)_U(mu)) - x_I,
  $
  其中 $widetilde(V)_U(mu)$ 由#stmtref(<lem-main-posterior-expected-valuation>, "引理", "lemma-counter") 給定。因此內點解成立之條件為 $widetilde(V)_U(mu)>x_I$。
] <lem-main-br>

#proof[
  將@eq-main-u-payoff 對 $x_U$ 取一階條件。若最適解位於內點，則
  $
    x_I widetilde(V)_U(mu) / (x_I+x_U)^2 = 1.
  $
  解此方程可得
  $
    x_U=sqrt(x_I widetilde(V)_U(mu))-x_I.
  $
  此解為正若且唯若 $widetilde(V)_U(mu)>x_I$。若此條件不成立，則非負限制綁住，最適投入位於邊界 $x_U=0$。
]

為了刻畫後驗信念如何影響不知情者的反應，以下比較靜態限於內點解存在的區域，亦即 $widetilde(V)_U(mu)>x_I$，使得最佳反應可由前述一階條件表示。

#stmtref(<lem-main-br>, "引理", "lemma-counter") 顯示，不知情者之最佳反應具有兩層依賴關係。第一，在後驗期望獎酬既定時，$x_I$ 作為對手投入進入競賽成功函數，直接影響不知情者的邊際收益。第二，當 $rho>0$ 時，$x_I$ 亦具有訊號功能；其誘發的後驗信念 $mu$ 會改變 $widetilde(V)_U(mu)$，再透過獎酬項影響不知情者的最適投入。前者是 Tullock 競賽的一般反應效果；後者則源自本文的獎酬相關設定，形成#headingref(<sec-model>)所不存在的信念反應機制。

在內點解存在時，根據#stmtref(<lem-main-posterior-expected-valuation>, "引理", "lemma-counter")，將最佳反應對後驗信念微分，可得

$
  (d x_U^*(x_I,mu)) / (d mu)
  = (rho (Delta V) / 2) sqrt(x_I / widetilde(V)_U(mu)).
$ <eq-main-br-belief-effect>
// #par(h(0pt, weak: true))

當 $rho>0$ 時，上式嚴格為正。換言之，不知情者對知情者屬於高型別的後驗機率越高，其自身的後驗期望獎酬也越高，因而選擇較高的最適投入。
值得注意的是，此一比較靜態係在知情者投入 $x_I$ 維持不變下所得到，反映的並非不知情者因對手投入增加而產生的策略反應，而是後驗信念經由獎酬相關性而形成的資訊效果——知情者的型別同時提供不知情者自身獎酬狀態的資訊，使高型別訊號提高競爭標的對不知情者的後驗價值。此一信念反應機制進而改變知情者各型別所面對的誘因限制，並成為後續判定分離均衡能否成立的關鍵。

另一方面，知情者的先動決策則以前述最佳反應為約束。令 $v in {v_H, v_L}$ 表示知情者的真實型別。代入不知情者最佳反應後，型別 $v$ 知情者的延續報酬 (continuation payoff) 可寫為

$
  pi_I(x_I; v, mu(x_I))
  equiv x_I / (x_I + x_U^*(x_I, mu(x_I))) v - x_I.
$ <eq-main-i-payoff-after-br>

在內點區域內，代入#stmtref(<lem-main-br>, "引理", "lemma-counter") 可得較簡潔的表示：

$
  pi_I(x_I; v, mu)
  = v sqrt(x_I / widetilde(V)_U(mu)) - x_I.
$ <eq-main-i-reduced-payoff>

@eq-main-i-reduced-payoff 顯示，知情者選擇 $x_I$ 時，並非僅考慮投入本身對勝率的直接效果，還必須預期該投入所誘發之後驗信念將如何改變不知情者的反應。換言之，$x_I$ 同時是競賽投入與資訊訊號；前者影響勝率，後者影響對手的後驗期望獎酬與後續投入。

== 子賽局均衡 <subsec-main-subgame-equilibria>

#headingref(<subsec-main-belief-payoff>)已建立部分相關型別結構下的後驗期望獎酬、最佳反應與延續報酬。本節承此分析基礎，進一步分析三個子賽局之均衡行為與報酬。相較於#headingref(<subsec-bench-subgame-equilibria>)所建立之基準均衡，部分相關設定下 $widetilde(V)_U(mu)$ 不再固定為 $overline(v)$，SS 與 UI 子賽局之均衡結構由 $tilde(A)$、$tilde(B)$ 替換 $hat(A)$、$hat(B)$ 即得；唯有 IU 制度使訊號—信念—反應鏈條完全啟動，均衡型態因而隨 $rho$ 而變化。

=== SS 子賽局 <subsubsec-main-ss>

仿照#headingref(<subsec-bench-subgame-equilibria>)中@eq-bench-a0b0，於部分相關設定下定義對應的型別加權邊際係數：

$
  tilde(A)
  equiv q widetilde(V)_U(1) / sqrt(v_H) + (1-q) widetilde(V)_U(0) / sqrt(v_L),
  quad
  tilde(B)
  equiv q widetilde(V)_U(1) / v_H + (1-q) widetilde(V)_U(0) / v_L,
$ <eq-main-ss-ab>

其中 $widetilde(V)_U(1)$ 與 $widetilde(V)_U(0)$ 由#stmtref(<lem-main-posterior-expected-valuation>, "引理", "lemma-counter")給定。當 $rho=0$ 時，$widetilde(V)_U(mu) equiv overline(v)$ 對所有 $mu$ 成立，故 $tilde(A) = hat(A)$、$tilde(B) = hat(B)$，二式退化為基準模型之對應量。

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
  對應之知情者型別別報酬與不知情者#impt[事前期望報酬 (ex ante payoff)] 分別如下：
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
  推導與#stmtref(<prop-bench-ss-equilibrium>, "命題", "proposition-counter")完全類同。在部分相關設定下，不知情者的事前問題以 $widetilde(V)_U(1)$ 與 $widetilde(V)_U(0)$ 取代基準模型中的 $overline(v)$，型別加權邊際係數因而從 $hat(A)$、$hat(B)$ 替換為 $tilde(A)$、$tilde(B)$；一階條件 $tilde(A) \/ sqrt(x_U) - tilde(B) = 1$ 給出 $x_U^(SS)$，其餘結果由代入得到。
]

#stmtref(<prop-main-ss-equilibrium>, "命題", "proposition-counter") 的經濟直覺如下。SS 制度下雙方同時投入，不知情者無法在行動前從知情者的投入中汲取額外資訊；然而，這並不表示相關性在 SS 子賽局中全然消失。知情者的投入仍依其型別而異，而在部分相關結構下，知情者為高型別或低型別也分別對應到不知情者不同的條件期望獎酬。因此，不知情者雖然不能進行路徑上的後驗更新，仍必須在事前同時考量兩種型別狀態下的競爭強度與自身獎酬評估。$tilde(A)$ 與 $tilde(B)$ 正是將這兩項效果彙整為一階條件中的型別加權邊際效果。

值得注意的是，#stmtref(<prop-main-ss-equilibrium>, "命題", "proposition-counter")顯示本文與 #c("fu2006") 之 SS 子賽局的差異。在 #c("fu2006") 中，競爭標的的價值為共同價值；一旦狀態為高或低，知情者與不知情者面對的是同一個獎酬值。因此，SS 子賽局雖無訊號傳遞，不知情者的事前問題仍是以先驗機率加權高、低兩種共同價值狀態。本文則將兩方獎酬拆分為 $(V_I,V_U)$，並允許其僅部分相關，故不知情者在 SS 中加權的並非同一共同價值，而是條件期望獎酬 $widetilde(V)_U(1)$ 與 $widetilde(V)_U(0)$。換言之，#c("fu2006") 的 SS 可視為完全相關端點下的共同價值基準；本文的 SS 則保留同時行動下#impt[無訊號更新]的特徵，同時允許獎酬相關透過事前條件期望進入均衡投入。

=== UI 子賽局 <subsubsec-main-ui>

給定 $x_U > 0$，型別 $v$ 知情者面對以下極大化問題：

$
  max_(x_I >= 0) x_I / (x_I + x_U) v - x_I.
$

若內點解存在，一階條件給出

$
  x_I(v) = sqrt(v x_U) - x_U,
$ <eq-main-ui-br>

其中內點解成立之條件為 $v > x_U$。此形式與#stmtref(<lem-main-br>, "引理", "lemma-counter") 一致，差別僅在於此處知情者已確知自身型別 $v$，其面對的獎酬為確定值而非後驗期望。

不知情者在先行選擇 $x_U$ 時，知道知情者將依型別作出最佳反應，故其事前期望報酬為

$
  widetilde(pi)_U^(U I)(x_U)
  = q widetilde(V)_U(1) x_U / (x_I(v_H) + x_U)
  + (1-q) widetilde(V)_U(0) x_U / (x_I(v_L) + x_U)
  - x_U.
$

代入@eq-main-ui-br 所蘊含之 $x_I(v) + x_U = sqrt(v x_U)$，上式化簡為

$
  widetilde(pi)_U^(U I)(x_U) = tilde(A) sqrt(x_U) - x_U,
$ <eq-main-ui-objective>

其中 $tilde(A)$ 沿用@eq-main-ss-ab 之定義。UI 子賽局下不知情者的目標函數因而僅含 $tilde(A)$ 而不含 $tilde(B)$：由於知情者的最佳反應已被代入，不知情者面對的是一個在 $sqrt(x_U)$ 上呈線性的利潤函數，不存在 SS 中因雙方同時最佳化所形成的相互依賴效果。

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
  對應之知情者型別別報酬與不知情者事前期望報酬分別如下：
  $
    pi_I^(U I)(v) = (sqrt(v) - tilde(A) / 2)^2, quad widetilde(pi)_U^(U I) = tilde(A)^2 / 4.
  $
] <prop-main-ui-equilibrium>

#proof[
  由@eq-main-ui-objective，一階條件 $tilde(A) \/ (2 sqrt(x_U)) = 1$ 給出 $x_U^(U I) = tilde(A)^2 \/ 4$。推導與#stmtref(<prop-bench-ui-equilibrium>, "命題", "proposition-counter")類同，以 $tilde(A)$ 取代 $hat(A)$ 即得其餘結果。
]

比較#stmtref(<prop-main-ui-equilibrium>, "命題", "proposition-counter") 與#stmtref(<prop-main-ss-equilibrium>, "命題", "proposition-counter")，兩個子賽局在均衡結構上具有相同的參數骨架，差異僅在分母：SS 的一階條件為 $tilde(A) \/ sqrt(x_U) = 1 + tilde(B)$，UI 的對應條件為 $tilde(A) \/ (2 sqrt(x_U)) = 1$。此一差異直接反映決策架構之不同。在 SS 中，不知情者在均衡中與知情者同時最佳化，$tilde(B)$ 項衡量在當前均衡投入組合下型別加權的贏率成本——是雙方互相為對手之約束時才浮現的邊際效應。在 UI 中，不知情者先行鎖定 $x_U$，知情者的最佳反應 $x_I(v) = sqrt(v x_U) - x_U$ 已被代入目標函數，雙方相互依賴之迴圈不再存在，邊際均等條件因而只含 $sqrt(x_U)$ 微分所帶來的係數 $2$。

#proposition(
  title: [UI 相對於 SS 之先行者優勢],
)[
  在內點均衡下，不知情者在 UI 制度的事前期望報酬不低於 SS 制度：
  $
    widetilde(pi)_U^(U I) >= widetilde(pi)_U^(SS),
  $ <eq-main-ui-vs-ss>
  等號成立若且唯若 $tilde(B) = 1$。
] <prop-main-ui-first-mover>

#proof[
  論證與#headingref(<subsubsec-bench-ui>)中@eq-bench-ui-vs-ss 完全類同，以 $tilde(A)$、$tilde(B)$ 取代 $hat(A)$、$hat(B)$ 即得
  $
    widetilde(pi)_U^(U I) - widetilde(pi)_U^(SS)
    = tilde(A)^2 (1 - tilde(B))^2 / (4(1+tilde(B))^2)
    >= 0.
  $
]

#stmtref(<prop-main-ui-first-mover>, "命題", "proposition-counter") 揭示不知情者在先行承諾的 UI 制度下具有先行者優勢。其直覺在於：在 SS 均衡中，不知情者與知情者之投入相互制約，雙方同時反應形成競爭壓力；UI 制度下不知情者先行鎖定投入，迫使知情者就此承諾水準作出反應，從而消除了 SS 中雙向制約的邊際效應，使不知情者得以選擇對自身最有利的承諾投入。

=== IU 子賽局 <subsubsec-main-iu>

本節以#term("完美貝氏均衡", english: "perfect Bayesian equilibrium")為均衡概念並進行分析。一個完美貝氏均衡由策略組合 $x_I(v)$、$x_U^*(x_I, mu)$ 與信念函數 $mu : RR_+ -> [0,1]$ 構成，其中 $x_I(v)$ 為型別 $v in {v_H, v_L}$ 知情者的投入策略，$x_U^*(x_I, mu)$ 為不知情者觀察 $x_I$、形成後驗信念 $mu(x_I)$ 後的最佳反應。均衡須同時滿足：

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

由@eq-main-i-reduced-payoff，若型別 $v$ 誠實選擇投入且不知情者形成對應信念 $mu$，則內點最適解為

$
  x_I^*(v, mu) = v^2 / (4 widetilde(V)_U(mu)).
$

代入後，型別 $v$ 的均衡報酬為

$
  pi_I^*(v, mu) = v^2 / (4 widetilde(V)_U(mu)).
$

因此，未扭曲分離的路徑上投入與報酬分別為

$
  x_H = v_H^2 / (4 widetilde(V)_U(1)),
  quad
  pi_H = v_H^2 / (4 widetilde(V)_U(1)),
$

以及

$
  x_L = v_L^2 / (4 widetilde(V)_U(0)),
  quad
  pi_L = v_L^2 / (4 widetilde(V)_U(0)).
$

不知情者沿分離路徑的最佳反應由#stmtref(<lem-main-br>, "引理", "lemma-counter") 給定。觀察 $x_H$ 時，

$
  x_U^*(x_H, 1) = v_H / 2 - v_H^2 / (4 widetilde(V)_U(1));
$

觀察 $x_L$ 時，

$
  x_U^*(x_L, 0) = v_L / 2 - v_L^2 / (4 widetilde(V)_U(0)).
$

當 $rho = 0$ 時，$widetilde(V)_U(mu) = v_L + q Delta V$ 與 $mu$ 無關，前述 $x_I^*(v,mu)$ 退化為#headingref(<subsubsec-bench-iu>)所建立之唯一分離均衡。此時高、低型別之雙向模仿差額皆為

$
  (v_H - v_L)^2 / (4 widetilde(V)_U(q)) > 0,
$

混同均衡無法成立——此即本文以 $rho = 0$ 作為訊號機制關閉之基準的理由。隨 $rho$ 上升，$widetilde(V)_U(1)$ 與 $widetilde(V)_U(0)$ 的差距擴大，高型別偽裝成低型別所換取的競爭鬆弛效果增強，分離均衡的存續條件因而需要重新檢驗。

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
    widetilde(V)_U(1) / widetilde(V)_U(0) <= R.
  $ <eq-main-iu-undistorted-ic>
  若在均衡路徑上令 $mu(x_H)=1$、$mu(x_L)=0$，並對所有 $x in.not {x_H,x_L}$ 的投入指定為均衡路徑外信念 $mu(x)=1$，則此一均衡成立；且不知情者於各資訊集合皆依#stmtref(<lem-main-br>, "引理", "lemma-counter") 作出最佳反應。
] <prop-main-iu-separating-candidate>

#proof[
  在分離配置下，高型別與低型別分別以機率一選擇 $x_H$ 與 $x_L$；亦即，觀察到 $x_H$ 時僅可能來自高型別，觀察到 $x_L$ 時僅可能來自低型別。由於兩者皆為均衡路徑上以正機率到達之投入，貝氏法則必然要求相應後驗信念滿足 $mu(x_H)=1$ 與 $mu(x_L)=0$。在此信念下，@eq-main-i-reduced-payoff 關於 $x_I$ 為嚴格凹函數，其一階條件分別唯一決定前述 $x_H$ 與 $x_L$。因此，命題所列投入即為未扭曲分離配置在均衡路徑上唯一可能的投入水準。

  #set enum(numbering: "(1)")

  1. #impt("高型別模仿低型別之誘因")：若高型別改以 $x_L$ 行動，不知情者將依路徑上信念視其為低型別，故其模仿報酬為
    $
      pi_H (x_L;mu=0)
      = v_H sqrt(x_L / widetilde(V)_U(0)) - x_L
      = v_L (2v_H-v_L) / (4 widetilde(V)_U(0)).
    $
    因而，高型別選擇誠實揭露型別之必要且充分條件為
    $
      v_H^2 / (4 widetilde(V)_U(1))
      >= v_L (2v_H-v_L) / (4 widetilde(V)_U(0)),
    $
    而此不等式恰與@eq-main-iu-undistorted-ic 等價。

  2. #impt("低型別模仿高型別之誘因")：若低型別選擇 $x_H$，其所得報酬為
    $
      pi_L (x_H;mu=1)
      = v_H (2v_L-v_H) / (4 widetilde(V)_U(1)).
    $
    由於
    $
      v_L^2 - v_H (2v_L-v_H) = (v_H-v_L)^2 > 0
    $
    且 $widetilde(V)_U(1) >= widetilde(V)_U(0)$，因此
    $
      pi_L = v_L^2 / (4 widetilde(V)_U(0))
      > pi_L (x_H;mu=1).
    $
    故低型別之誘因相容條件自動成立；可能成為約束條件者僅有高型別向下模仿低型別之誘因限制。

  最後，對任意均衡路徑外投入指定 $mu(x)=1$。在此信念下，高型別之延續報酬由嚴格凹函數
  $
    v_H sqrt(x / widetilde(V)_U(1)) - x
  $
  所決定，且於 $x_H$ 處取得唯一最大值，故高型別不會偏離均衡路徑。另一方面，低型別在相同信念下任意偏離所能取得的最高報酬為 $v_L^2\/(4 widetilde(V)_U(1))$，而此值不高於其分離路徑報酬$v_L^2\/(4 widetilde(V)_U(0))$。
  綜上，只要@eq-main-iu-undistorted-ic 成立，前述策略與信念即構成完美貝氏均衡；反之，若該條件不成立，高型別將直接模仿路徑上的 $x_L$，而任何均衡路徑外信念均不足以排除此一偏離，故未扭曲分離配置不可能成為均衡。
]

#stmtref(<prop-main-iu-separating-candidate>, "命題", "proposition-counter") 與 #c("fu2006") 之差異，在完全相關之設定下昭然若揭。當 $rho=1$ 時，$widetilde(V)_U(1)=v_H$、$widetilde(V)_U(0)=v_L$，故@eq-main-iu-undistorted-ic 化為

$
  v_H/v_L <= v_H^2 / (v_L (2v_H-v_L)),
$

此式在 $v_H>v_L$ 下不成立。因此，#c("fu2006") 的完全相關模型無法成立兩型別皆採各自完整資訊最適投入的未扭曲分離配置。相對地，#c("fu2006") 之命題 3 所得到的為扭曲分離均衡：高型別維持其完整資訊投入，低型別則必須向下扭曲投入，以防止高型別模仿，並由低型別單獨負擔分離所需的成本。

本文結果顯示，此一扭曲並非僅由資訊不對稱本身所造成；當 $rho$ 較低且@eq-main-iu-undistorted-ic 成立時，信念所引致的競爭反應仍然有限，兩型別無須扭曲投入即可達成分離。隨著 $rho$ 上升，$widetilde(V)_U(1) \/ widetilde(V)_U(0)$ 之比率擴大，高型別藉由模仿低型別所能取得的競爭鬆弛效果亦隨之提高，最終使未扭曲分離失去可維持性，並逐步趨近於 #c("fu2006") 所呈現的低型別向下扭曲結果。

相較於 SS 與 UI，IU 子賽局無法如@eq-main-ss-ab 那般由單一參數 $tilde(A)$ 概括其均衡結構。其原因在於，知情者的投入同時具有競賽行動與型別訊號的雙重性質，而不知情者的最佳反應強度又會隨後驗信念而調整。據此，SS 與 UI 可視為不存在訊號更新時的對照基準；IU 則承載了獎酬相關性所帶出的信念反應機制，從而使均衡型態隨 $rho$ 的變化而連續調整。

@eq-main-iu-undistorted-ic 所刻畫的分離條件係以後驗期望獎酬比值 $widetilde(V)_U(1) \/ widetilde(V)_U(0)$ 表達。由於此比值為 $rho$ 之嚴格遞增函數，分離均衡的存在性等價於 $rho$ 不超過某一唯一臨界值，其封閉式可由比值的單調性直接解出。

#proposition(
  title: [分離臨界相關度],
)[
  令 $R$ 如#stmtref(<prop-main-iu-separating-candidate>, "命題", "proposition-counter")所定義，不知情者之無條件期望獎酬定義為

  $
    widetilde(V)_U(q) = v_L + q Delta V
  $

  則 IU 子賽局之未扭曲分離均衡存在若且唯若 $rho <= rho^*$，其中唯一臨界相關度為
  $
    rho^* = frac((R-1) widetilde(V)_U(q), (1 - q + R q)Delta V).
  $ <eq-main-rho-star>
  在獨立端點 $rho = 0$ 時分離嚴格成立；在完全相關端點 $rho = 1$ 時未扭曲分離失效。
] <prop-main-iu-rho-star>

#proof[
  由@eq-main-effective-payoff 可得

  $
    widetilde(V)_U(1) & = v_L + [q + rho(1-q)] Delta V \
    widetilde(V)_U(0) & = v_L + q(1-rho) Delta V
  $
  故
  $
    frac(d(widetilde(V)_U(1) \/ widetilde(V)_U(0)), d rho)
    = frac(Delta V dot widetilde(V)_U(q), widetilde(V)_U(0)^2) > 0.
  $
  隱含比值 $rho$ 嚴格遞增，將等號 $widetilde(V)_U(1) = R widetilde(V)_U(0)$ 展開整理含 $rho$ 項，得
  $
    rho [(1-q) + R q] Delta V = (R-1) widetilde(V)_U(q)
  $
  兩邊除以 $[(1-q) + R q] Delta V$ 即得@eq-main-rho-star。最後進行端點驗證：

  - $rho = 0$ 時比值為 $1 < R$；
  - $rho = 1$ 時比值為 $v_H \/ v_L > R$ (因 $v_H > v_L$)，此時未扭曲分離失效。
]

#stmtref(<prop-main-iu-rho-star>, "命題", "proposition-counter") 將分離均衡的存在條件從後驗期望獎酬的比值不等式，化約為相關參數 $rho$ 的單一臨界值，其封閉式完全由型別分布 $(v_H, v_L, q)$ 決定。$rho^*$ 愈高，意味著獎酬差距 $Delta V$ 相對於平均獎酬 $widetilde(V)_U(q)$ 愈小，分離均衡在更寬廣的相關度範圍內成立。

當 $rho$ 超過 $rho^*$ 後，未扭曲分離配置不再成立，但分離結構並非全面崩潰。#c("riley1979") 指出，訊號賽局中存在最低成本的分離均衡——低型別向下壓低投入，使高型別喪失模仿誘因；高型別無須偏離其完整資訊最適投入。此一結果即 Riley 均衡，構成 $rho > rho^*$ 時 IU 子賽局的分離均衡候選。

#proposition(
  title: [Riley 扭曲分離均衡],
)[
  當 $rho > rho^*$ 時，定義

  $
    alpha equiv 1 - frac(widetilde(V)_U(0), widetilde(V)_U(1)) in (0,1),
    quad
    z_H^- equiv frac(v_H, 2 sqrt(widetilde(V)_U(0))) (1 - sqrt(alpha)).
  $ <eq-main-riley-def>

  純策略扭曲分離均衡由下列策略與信念構成：

  #set enum(numbering: "(1)")

  + 高型別選未扭曲最佳投入 $x_H = v_H^2 \/ (4 widetilde(V)_U(1))$；
  + 低型別選 Riley 投入 $x_L^"R" = (z_H^-)^2$；
  + 路徑上信念分別為 $mu(x_H) = 1$ 以及 $mu(x_L^"R") = 0$，路徑外任意偏離之信念設為 $mu = 1$。
] <prop-main-iu-riley>

#proof[
  考慮高型別偏離至任意 $x' <= x_L^* equiv v_L^2 \/ (4 widetilde(V)_U(0))$。在路徑外信念 $mu = 1$ 下，偏離報酬為

  $
    pi' equiv v_H sqrt(x' / widetilde(V)_U(0)) - x'
  $

  由於高型別在均衡路徑上之報酬為
  $
    pi_H = v_H^2 / (4 widetilde(V)_U(1)),
  $
  令 $z = sqrt(x')$，條件 $pi_H >= pi'$ 可化為

  $
    z^2 - frac(v_H, sqrt(widetilde(V)_U(0))) z + frac(v_H^2, 4 widetilde(V)_U(1)) >= 0.
  $

  在 $rho > rho^*$ 下，$widetilde(V)_U(1) > widetilde(V)_U(0)$，故上式有兩實根；搭配@eq-main-riley-def，其較小根即為
  $
    z_H^- = frac(v_H, 2 sqrt(widetilde(V)_U(0))) (1 - sqrt(alpha)).
  $
  由於二次式開口向上，且此處只考慮向下扭曲分支 $x' <= x_L^*$，高型別不偏離的可行集合為 $z <= z_H^-$。是故，為了以最小扭曲維持分離，低型別取使高型別誘因相容條件恰為等號之最大可行投入，即 $x_L^"R" = (z_H^-)^2$。

  最後，低型別若改為模仿高型別，其偏離報酬為

  $
    pi_L (x_H;mu=1)
    = (v_H (2v_L - v_H)) / (4 widetilde(V)_U(1)).
  $

  由#stmtref(<prop-main-iu-separating-candidate>, "命題", "proposition-counter")之證明第 (2) 點可知，$pi_L > pi_L (x_H;mu=1)$，故低型別不會向上模仿；高型別之誘因相容條件則由 $x_L^"R"$ 的構造保證成立，從而上述策略與信念構成 Riley 扭曲分離均衡。
]

#stmtref(<prop-main-iu-riley>, "命題", "proposition-counter") 顯示，當相關程度超過臨界值後，分離失效的原因並非高型別無法維持其完整資訊投入，而是低型別原先的投入已不足以阻止高型別向下模仿。Riley 均衡的經濟意涵，在於將分離成本完全配置給低型別：其必須進一步壓低投入，以降低高型別模仿後所能獲得的競爭鬆弛利益；高型別則維持未扭曲投入，不承擔額外訊號成本。故隨 $rho$ 上升，均衡扭曲將首先表現在低型別行為，而非高型別行為。

#corollary[
  IU 子賽局之分離均衡區域依相關程度 $rho$ 刻畫如下：

  #set enum(numbering: "(1)")

  + 若 $0 <= rho <= rho^*$，則未扭曲分離配置由#stmtref(<prop-main-iu-separating-candidate>, "命題", "proposition-counter") 與#stmtref(<prop-main-iu-rho-star>, "命題", "proposition-counter") 所刻畫，且至少存在一組未扭曲分離均衡；
  + 若 $rho > rho^*$，則未扭曲分離配置失效，而 Riley 扭曲分離配置由#stmtref(<prop-main-iu-riley>, "命題", "proposition-counter") 提供一組新的分離均衡候選；
  + 故在 $rho > rho^*$ 的區域內，若尚有其他均衡存在，則必不可能是未扭曲分離，而須表現為混同均衡、半分離均衡，或與 Riley 扭曲分離並存之其他配置。
] <cor-main-iu-region-summary>

#stmtref(<cor-main-iu-region-summary>, "推論", "corollary-counter")將 IU 子賽局之分離結構整理為一條清楚的區域圖像：低相關區間由未扭曲分離主導；當相關程度超過臨界值後，分離若仍存在，其形式便不再可能維持兩型別各自的完整資訊最適投入，而必須轉為由低型別承擔額外訊號成本的 Riley 扭曲分離。故相較於 SS 與 UI，IU 子賽局的特殊性不僅在於投入兼具競賽行動與訊號功能，更在於其於部分參數區間可能存在多重均衡。

有鑑於後續第 0 階段的內生時序比較，必須為每一制度指派明確的事前報酬，故進入制度比較前尚須就 IU 子賽局之均衡配置作進一步整理。換言之，SS 與 UI 的制度報酬可直接由其唯一均衡決定；而 IU 的制度報酬則必須以本節所刻畫之均衡型態為基礎，於後續分析中明確指明所採用之均衡配置。

== 內生時序均衡 <subsec-main-endogenous-timing>

以上已分別求得 SS、UI 與 IU 三個投入子賽局在部分相關結構下的均衡配置，並說明相關性如何透過後驗信念改變 IU 子賽局之揭露型態。據此，下一步即是回到第 0 階段的時序選擇問題：當參與者可自行決定先動或後動時，最終均衡將支持何種行動順序？

本節的分析重點，已不再是個別子賽局中的投入選擇，而是制度之間的事前比較。具體而言，第 0 階段的時序選擇須以三個制度所誘導之事前期望報酬為基礎，判斷參與者在給定對手時點選擇下是否具有#term("單邊偏離", english: "unilateral deviation")誘因。由於 SS 與 UI 之制度報酬可直接由唯一均衡決定，而 IU 則可能因均衡型態隨 $rho$ 改變而呈現不同報酬結構，故內生時序均衡的關鍵，正在於相關性如何透過 IU 制度報酬牽動第 0 階段的制度排序。

=== 第 0 階段之時序選擇與制度報酬

本節將第 0 階段的時序選擇刻畫為一個 $2 times 2$ 策略式賽局。沿用內生時序文獻的標準記號，令 $F$ 表示先動，$S$ 表示後動。知情者與不知情者同時選擇其行動時點，時序決定後再進入對應的投入子賽局：若兩者皆選擇 $F$，則形成立即同時行動之 SS 制度；若知情者選擇 $F$ 而不知情者選擇 $S$，則形成 IU 制度；若知情者選擇 $S$ 而不知情者選擇 $F$，則形成 UI 制度；若兩者皆選擇 $S$，則形成延後同時行動。由於本文不考慮跨期折現，且延後同時行動不產生額外訊號或承諾效果，其均衡報酬與立即同時行動之 SS 制度相同。

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
  caption: [第 0 階段之制度報酬矩陣],
  supplement: [表],
) <tbl-main-timing-payoff-matrix>

@tbl-main-timing-payoff-matrix 中，每一格所列者皆為對應制度下的事前期望報酬。此點對知情者尤其重要：在第 0 階段，其尚未觀察自身型別之實現值，故無法依 $v_H$ 或 $v_L$ 分別比較制度優劣，而必須以型別實現前的期望報酬作為時序選擇之依據。換言之，型別別報酬僅能作為制度報酬的#term("事後報酬", english: "ex post payoff")分解，真正決定第 0 階段偏離誘因者，仍是制度所誘導之事前報酬。

#definition(title: [事前期望報酬])[
  沿用#stmtref(<def-bench-ex-ante-payoff>, "定義", "definition-counter")之邏輯，對 $J in {SS, U I, I U}$，令 $widetilde(pi)_i^(J)$ 表示參賽者 $i in {I,U}$ 於制度 $J$ 下之事前期望報酬。知情者之事前期望報酬為型別別報酬之先驗加權平均，即
  $
    widetilde(pi)_I^(J) equiv q pi_I^(J)(v_H) + (1-q) pi_I^(J)(v_L);
  $
  不知情者之事前期望報酬直接為其均衡報酬 $widetilde(pi)_U^(J)$。
] <def-main-ex-ante-payoff>

其中，不知情者在 SS 與 UI 制度下的事前報酬，已分別由#stmtref(<prop-main-ss-equilibrium>, "命題", "proposition-counter") 與#stmtref(<prop-main-ui-equilibrium>, "命題", "proposition-counter") 給出；知情者對應的事前報酬則由型別別報酬加權而得，即

$
  widetilde(pi)_I^(SS)
  equiv q pi_I^(SS)(v_H) + (1-q) pi_I^(SS)(v_L),
$

以及

$
  widetilde(pi)_I^(U I)
  equiv q pi_I^(U I)(v_H) + (1-q) pi_I^(U I)(v_L).
$

至於 $widetilde(pi)_i^(I U)$，則須依 IU 子賽局於給定參數下所對應之均衡配置而定；此亦是前節特別整理 IU 均衡型態的原因。據此，第 0 階段的內生時序問題，即可化約為：在@tbl-main-timing-payoff-matrix 所示之制度矩陣中，判斷雙方在給定對手時點選擇下是否具有單邊偏離誘因。

=== 三種制度下的事前期望報酬

為進行第 0 階段的制度比較，以下將 SS、UI 與 IU 三種制度所對應之事前期望報酬統一整理於同一框架下。此處比較的對象已不再是單一制度內的投入水準，而是不同制度之間的報酬排序。

對 SS 制度而言，不知情者之事前期望報酬已由#stmtref(<prop-main-ss-equilibrium>, "命題", "proposition-counter") 給出為
$
  widetilde(pi)_U^(SS)
  = tilde(A)^2 tilde(B) / (1+tilde(B))^2.
$
知情者之事前期望報酬則為型別別報酬的先驗加權平均：
$
  widetilde(pi)_I^(SS)
  = q pi_I^(SS)(v_H) + (1-q) pi_I^(SS)(v_L).
$

對 UI 制度而言，不知情者之事前期望報酬由#stmtref(<prop-main-ui-equilibrium>, "命題", "proposition-counter") 給出為
$
  widetilde(pi)_U^(U I) = tilde(A)^2 / 4,
$
而知情者之事前期望報酬同樣為型別別報酬的加權平均：
$
  widetilde(pi)_I^(U I)
  = q pi_I^(U I)(v_H) + (1-q) pi_I^(U I)(v_L).
$

至於 IU 制度，其事前報酬之整理須特別區分均衡型態。若給定參數下 IU 子賽局為未扭曲分離，則高、低型別知情者沿均衡路徑之報酬分別為
$
  pi_H = v_H^2 / (4 widetilde(V)_U(1)),
  quad
  pi_L = v_L^2 / (4 widetilde(V)_U(0)),
$
故知情者之事前期望報酬為
$
  widetilde(pi)_I^(I U)
  = q frac(v_H^2, 4 widetilde(V)_U(1))
  + (1-q) frac(v_L^2, 4 widetilde(V)_U(0)).
$
不知情者之事前期望報酬則由兩條分離路徑上的報酬加權而得：
$
  widetilde(pi)_U^(I U) & = q pi_U (x_H, x_U^*(x_H,1);mu=1) \
                        & + (1-q) pi_U (x_L, x_U^*(x_L,0);mu=0).
$

若 IU 子賽局落於 Riley 扭曲分離區間，則上述表達式中僅低型別路徑須以扭曲投入 $x_L^"R"$ 取代 $x_L$；高型別路徑仍維持未扭曲報酬。據此，後續第 0 階段之制度比較，將依給定參數下所對應之分離均衡配置定義 $widetilde(pi)_i^(I U)$：在未扭曲分離區間，採用未扭曲分離報酬；在 Riley 扭曲分離區間，採用 Riley 分離報酬。此一約定使 IU 制度報酬於各參數區間皆有明確對應，從而可與 SS 與 UI 之事前期望報酬進行一致比較。

=== 純策略內生時序均衡

在@tbl-main-timing-payoff-matrix 所示之第 0 階段制度矩陣中，純策略 Nash 均衡的判定可化約為檢查各策略組合下是否存在單邊偏離誘因。為此，先定義四個與制度移轉相對應的單邊偏離差額；其共同原則為：偏離差額一律定義為#impt[偏離後報酬減去偏離前報酬]。若差額為正，表示該參賽者有誘因進行對應偏離；若差額為負，則表示其不願偏離。

#definition(title: [第 0 階段的四個單邊偏離差額])[
  沿用#stmtref(<def-bench-deviation>, "定義", "definition-counter")之邏輯，令 $Delta_i^(J)$ 表示在給定對手時點選擇下，參賽者 $i in {I,U}$ 單邊偏離後，將結果轉為制度 $J in {SS, U I, I U}$ 時的報酬差額。於本文的 $2 times 2$ 時序賽局中，實際用到的四個差額為

  $
    Delta_I^(U I) & equiv widetilde(pi)_I^(U I) - widetilde(pi)_I^(SS), & quad
    Delta_I^(I U) & equiv widetilde(pi)_I^(I U) - widetilde(pi)_I^(SS), \
    Delta_U^(U I) & equiv widetilde(pi)_U^(U I) - widetilde(pi)_U^(SS), & quad
    Delta_U^(SS) & equiv widetilde(pi)_U^(SS) - widetilde(pi)_U^(I U).
  $
] <def-main-deviation>

本節的四個差額，各自對應到一種特定的單邊制度移轉。$Delta_I^(U I)$ 表示：當不知情者選擇先動時，知情者若由先動改為後動，是否有誘因將制度由 SS 轉為 UI；$Delta_I^(I U)$ 則表示：當不知情者選擇後動時，知情者若由後動改為先動，是否有誘因將制度由 SS 轉為 IU。對不知情者而言，$Delta_U^(U I)$ 衡量在知情者選擇後動時，不知情者由後動改為先動、使制度由 SS 轉為 UI 的偏離誘因；$Delta_U^(SS)$ 則衡量在知情者選擇先動時，不知情者由後動改為先動、使制度由 IU 轉為 SS 的偏離誘因。

#lemma(
  title: [第 0 階段之最佳反應],
)[
  第 0 階段的純策略最佳反應可由四個單邊偏離差額的正負完全刻畫：

  #set enum(numbering: "(1)")

  + 若不知情者選擇先動，則知情者選擇後動若且唯若 $Delta_I^(U I) >= 0$；
  + 若不知情者選擇後動，則知情者選擇先動若且唯若 $Delta_I^(I U) >= 0$；
  + 若知情者選擇後動，則不知情者選擇先動若且唯若 $Delta_U^(U I) >= 0$；
  + 若知情者選擇先動，則不知情者選擇先動若且唯若 $Delta_U^(SS) >= 0$。
] <lem-main-timing-br>

#proof[
  四個結論皆直接來自@tbl-main-timing-payoff-matrix 的制度報酬比較。若不知情者選擇先動，則知情者選擇先動時落於 SS，選擇後動時落於 UI，兩者之報酬差即為 $Delta_I^(U I)$，故其正負決定知情者是否偏好後動。若不知情者選擇後動，則知情者選擇先動與後動分別對應 IU 與 SS，兩者之報酬差即為 $Delta_I^(I U)$，故其正負決定知情者是否偏好先動。

  對不知情者而言，若知情者選擇後動，則不知情者選擇先動與後動分別對應 UI 與 SS，兩者之報酬差即為 $Delta_U^(U I)$；若知情者選擇先動，則不知情者選擇先動與後動分別對應 SS 與 IU，兩者之報酬差即為 $Delta_U^(SS)$。因此，上述四個差額的正負即完全決定第 0 階段的純策略最佳反應。
]

#proposition(
  title: [第 0 階段之純策略內生時序均衡: 部分相關],
)[
  第 0 階段的純策略 Nash 均衡可由四個單邊偏離差額完全刻畫：

  #set enum(numbering: "(1)")

  + UI 構成純策略均衡若且唯若 $Delta_I^(U I) >= 0$ 且 $Delta_U^(U I) >= 0$；
  + SS 構成純策略均衡若且唯若 $Delta_I^(U I) <= 0$ 且 $Delta_U^(SS) >= 0$；
  + IU 構成純策略均衡若且唯若 $Delta_I^(I U) >= 0$ 且 $Delta_U^(SS) <= 0$。
] <prop-main-endogenous-timing-pure>

#proof[
  由#stmtref(<lem-main-timing-br>, "引理", "lemma-counter") 可逐一檢驗各策略組合是否滿足互為最佳反應。

  若給定策略組合為 (知情者後動、不知情者先動)，則所誘導制度為 UI。知情者不偏離回先動之條件為 $Delta_I^(U I) >= 0$；不知情者不偏離至後動之條件為 $Delta_U^(U I) >= 0$。故 UI 構成純策略均衡若且唯若此二條件同時成立。

  若給定策略組合為 (知情者先動、不知情者先動)，則所誘導制度為 SS。知情者不偏離至後動之條件為 $Delta_I^(U I) <= 0$；不知情者不偏離至後動之條件為 $Delta_U^(SS) >= 0$。故 SS 構成純策略均衡若且唯若此二條件同時成立。

  若給定策略組合為 (知情者先動、不知情者後動)，則所誘導制度為 IU。知情者不偏離至後動之條件為 $Delta_I^(I U) >= 0$；不知情者不偏離至先動之條件為 $Delta_U^(SS) <= 0$。故 IU 構成純策略均衡若且唯若此二條件同時成立。
]

#stmtref(<prop-main-endogenous-timing-pure>, "命題", "proposition-counter") 顯示，第 0 階段的純策略制度選擇可完全化約為四個單邊偏離差額的正負比較。內生時序均衡並非直接由先動或後動本身決定，而是取決於某一方在固定對手時點選擇下，是否能藉由改變自身行動時序提升制度報酬。故時序均衡的核心，不在於個別制度的絕對報酬高低，而在於制度之間的局部偏離誘因如何排序；此亦構成後續分析相關性如何牽動時序翻轉的出發點。

=== 相關性與時序偏好之翻轉

前小節已將第 0 階段的純策略內生時序均衡，化約為四個單邊偏離差額的正負比較。據此，若欲分析相關性如何改變制度選擇，核心問題即在於：$rho$ 上升時，前述定義之單邊偏離差額將如何變動，進而使原本成立的純策略時序均衡失去可維持性，或使原本不可維持的制度重新成為均衡。

在本文架構下，相關性對時序偏好的影響，並非透過單一管道發生。對 SS 與 UI 而言，$rho$ 並不引發路徑上的信念更新，惟其仍會改變不知情者對自身獎酬的條件期望，從而影響兩制度下的事前報酬。相較之下，IU 制度除同樣受到條件期望獎酬變動的影響外，尚額外承受投入作為訊號所引致的揭露效果；因此，相關性對 IU 制度報酬的牽動最為直接，也最可能成為第 0 階段時序翻轉的來源。

準此，後續比較靜態的邏輯可概分為兩步。首先，檢視 $rho$ 如何透過 $widetilde(V)_U(1)$、$widetilde(V)_U(0)$ 與 $widetilde(V)_U(q)$ 進入三種制度的事前報酬；其次，再將此一報酬變動映射為四個單邊偏離差額的符號變化。若某一偏離差額隨 $rho$ 單調上升或下降，則對應的制度穩定性亦將隨之改變；而當差額跨越零點時，即代表參賽者於第 0 階段的最佳反應發生翻轉，內生時序均衡也因而改變。

#proposition(
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
  可知，當知情者選擇後動時，不知情者由後動改為先動、使制度由 SS 轉為 UI，永不致使其報酬下降。故 $Delta_U^(U I) >= 0$；等號成立若且唯若#stmtref(<prop-main-ui-first-mover>, "命題", "proposition-counter") 之等號條件 $tilde(B)=1$ 成立。
]

#stmtref(<prop-main-timing-u-prefers-ui>, "命題", "proposition-counter") 的意義在於，不知情者面對後動的知情者時，始終弱偏好以先動承諾將制度推向 UI。換言之，相關性雖會改變三種制度下的事前報酬水準，但不會推翻 UI 相對於 SS 的這一方向性比較。故第 0 階段時序翻轉的主要來源，並不在於不知情者是否放棄先動，而在於知情者對先動揭露效果的評價如何隨 $rho$ 改變。

在此基礎上，真正關鍵的比較靜態問題，轉而落在知情者自身的先動誘因。特別是，當 IU 子賽局仍位於未扭曲分離區間時，知情者之事前報酬可寫為兩條分離路徑報酬的加權平均，故可直接檢視其對 $rho$ 的變動方向。

#proposition(
  title: [未扭曲分離區間下知情者的先動報酬],
)[
  在 $rho <= rho^*$ 的未扭曲分離區間內，知情者於 IU 制度下的事前期望報酬
  $
    widetilde(pi)_I^(I U)
    = q frac(v_H^2, 4 widetilde(V)_U(1))
    + (1-q) frac(v_L^2, 4 widetilde(V)_U(0))
  $
  為 $rho$ 的嚴格遞減函數。
] <prop-main-timing-iu-rho>

#proof[
  由@eq-main-effective-payoff 分別代入 $mu=1$ 與 $mu=0$，可得
  $
    widetilde(V)_U(1) & = v_L + [q + rho(1-q)] Delta V, \
    widetilde(V)_U(0) & = v_L + q(1-rho) Delta V
  $
  將上述兩式分別對 $rho$ 微分，得到
  $
    frac(d widetilde(V)_U(1), d rho) = (1-q) Delta V > 0,
    quad
    frac(d widetilde(V)_U(0), d rho) = -q Delta V < 0.
  $
  故
  $
    frac(d widetilde(pi)_I^(I U), d rho)
    = frac(q(1-q) Delta V, 4)
    [
      frac(v_L^2, widetilde(V)_U(0)^2)
      - frac(v_H^2, widetilde(V)_U(1)^2)
    ].
  $

  接著比較括號內兩項。由 $v_H = v_L + Delta V$，
  $
    v_H widetilde(V)_U(0) - v_L widetilde(V)_U(1)
    = (1-rho) Delta V [v_L + q Delta V]
    > 0
  $
  對任意 $rho < 1$ 成立，故
  $
    frac(v_H, widetilde(V)_U(1))
    > frac(v_L, widetilde(V)_U(0)).
  $
  進而得到
  $
    frac(v_H^2, widetilde(V)_U(1)^2)
    > frac(v_L^2, widetilde(V)_U(0)^2),
  $
  故上式中中括號為負。由於 $q(1-q) Delta V / 4 > 0$，遂得
  $
    frac(d widetilde(pi)_I^(I U), d rho) < 0.
  $
]

#stmtref(<prop-main-timing-iu-rho>, "命題", "proposition-counter") 顯示，在未扭曲分離仍可維持的區間內，相關性愈高，知情者在 IU 制度下的先動報酬愈低。其原因在於，$rho$ 上升一方面提高高型別路徑下不知情者的後驗期望獎酬，使高型別先動後面臨更強的競爭反應；另一方面，雖然低型別路徑下的不知情者後驗期望獎酬下降，低型別可藉此獲得較寬鬆的競爭環境，但此一效果不足以抵銷高型別路徑上的揭露成本。故在知情者的先動制度中，相關性所強化的訊號效果，整體上將侵蝕其事前資訊租金。

在此基礎上，可將「時序偏好翻轉」正式表述為單邊偏離差額的過零現象。由於第 0 階段知情者在面對後動之不知情者時，係比較 IU 與 SS 兩制度的事前報酬，故其先動誘因完全由
$
  Delta_I^(I U) = widetilde(pi)_I^(I U) - widetilde(pi)_I^(SS)
$
之符號決定。只要此差額隨 $rho$ 上升由正轉負，便代表知情者在某一臨界相關度處由偏好先動轉為偏好後動。

#proposition(
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
  則存在至少一個臨界相關度 $rho^dagger in (0, rho^*)$，使得 $Delta_I^(I U)(rho^dagger) = 0$。換言之，在未扭曲分離區間內，知情者對 IU 制度之先動偏好必須至少發生一次翻轉。
] <prop-main-timing-rho-dagger-existence>

#proof[
  在區間 $[0,rho^*]$ 內，IU 子賽局採用未扭曲分離報酬，故由#stmtref(<prop-main-timing-iu-rho>, "命題", "proposition-counter") 可知 $widetilde(pi)_I^(I U)(rho)$ 為 $rho$ 的連續函數；另一方面，SS 制度下的事前報酬由#stmtref(<prop-main-ss-equilibrium>, "命題", "proposition-counter") 所給之閉式表示構成，亦為 $rho$ 的連續函數。故 $Delta_I^(I U)(rho)$ 作為兩個連續函數之差，必為連續函數。

  若進一步滿足
  $
    Delta_I^(I U)(0) > 0,
    quad
    Delta_I^(I U)(rho^*) < 0,
  $
  則由介值定理，存在至少一個 $rho^dagger in (0,rho^*)$ 使 $Delta_I^(I U)(rho^dagger)=0$。由#stmtref(<lem-main-timing-br>, "引理", "lemma-counter")可知，$Delta_I^(I U)$ 的符號即決定在給定不知情者後動時，知情者是否偏好先動；故一旦該差額由正轉負，即表示知情者對 IU 制度的先動偏好至少發生一次翻轉。
]

綜合#stmtref(<prop-main-timing-u-prefers-ui>, "命題", "proposition-counter")、#stmtref(<prop-main-timing-iu-rho>, "命題", "proposition-counter") 與#stmtref(<prop-main-timing-rho-dagger-existence>, "命題", "proposition-counter")，可據此歸納出一個更具體的比較靜態結論：當相關性上升時，不知情者在面對後動知情者時對先動的偏好不會消失，而知情者在 IU 制度下的先動報酬則系統性下降。故只要 IU 與 SS 的相對報酬在未扭曲分離區間兩端發生號號逆轉，便必然存在至少一個翻轉臨界值，使知情者由偏好先動轉為偏好後動。換言之，相關性愈高，制度由 IU 轉向其他時序配置的壓力愈強；前述結果並揭示翻轉的根本機制：相關性使先動所伴隨的揭露成本逐步上升，從而削弱知情者對先動制度的偏好。

綜上，本節已完成第 0 階段內生時序均衡的基本刻畫。首先，制度選擇可化約為四個單邊偏離差額的正負比較；其次，在制度報酬層次上，不知情者對 UI 的先動偏好具有穩健性，而知情者於 IU 制度下的先動報酬則隨相關性上升而下降。故部分相關結構不僅改變投入子賽局中的揭露型態，亦會透過制度報酬的重新排序，牽動第 0 階段的時序選擇。此一結果說明，#c("fu2006") 所揭示的後動傾向，並非僅是行動順序的產物，而與資訊相關性所強化之揭露成本密切相關。

== 基準模型與部分相關之比較 <subsec-main-comparison>

#headingref(<subsec-iid-implications>) 確立了一項零相關基準：當 $rho=0$ 時，訊號—信念—反應傳導機制完全失效，知情者的投入雖攜帶型別資訊，卻無法改變不知情者對自身獎酬的評估，亦無法影響其最佳反應函數。部分相關結構的引入，使此一傳導鏈路重新接通。本節從三個層次追蹤 $rho$ 上升所帶來的系統性改變：均衡投入的複合係數如何偏離獨立同分配基準值、IU 子賽局的分離型態如何在 $rho^*$ 處發生結構性轉變，以及時序偏好的不對稱性如何隨 $rho$ 上升而顯現。三者共同說明，部分相關性並非對獨立同分配結果的局部擾動，而是重塑競賽投入誘因與制度選擇格局的根本力量。

=== 複合係數隨相關性之偏移 <subsubsec-main-comparison-ab>

在 SS 與 UI 子賽局中，均衡投入的封閉式由複合係數 $tilde(A)$、$tilde(B)$ 完全決定。當 $rho=0$ 時，二式退化為基準係數 $hat(A)$、$hat(B)$；隨 $rho$ 上升，$widetilde(V)_U(1)$ 與 $widetilde(V)_U(0)$ 朝相反方向移動，使 $tilde(A)$、$tilde(B)$ 系統性偏離獨立同分配基準值。

#proposition(
  title: [複合係數之相關性單調性],
)[
  在 $rho in [0,1]$ 上，$tilde(A)$ 與 $tilde(B)$ 均為 $rho$ 的嚴格遞減函數，滿足
  $
    frac(partial tilde(A), partial rho) & = q(1-q) Delta V [frac(1, sqrt(v_H)) - frac(1, sqrt(v_L))] < 0, \
    frac(partial tilde(B), partial rho) & = q(1-q) Delta V [frac(1, v_H) - frac(1, v_L)] < 0.
  $
  特別地，$tilde(B)$ 從 $hat(B) >= 1$ ($rho=0$) 單調遞減至 $tilde(B)=1$ ($rho=1$)；$hat(B) > 1$ 源自 $1\/v$ 凸性在型別不確定性下產生的超額邊際負擔，完全相關時此超額負擔消失。
] <prop-main-comparison-ab-monotone>

#proof[
  由#stmtref(<lem-main-posterior-expected-valuation>, "引理", "lemma-counter")，
  $
    frac(partial widetilde(V)_U(1), partial rho) = (1-q) Delta V > 0,
    quad
    frac(partial widetilde(V)_U(0), partial rho) = -q Delta V < 0.
  $
  將@eq-main-ss-ab 對 $rho$ 微分，代入上述偏導後整理，得命題各式；不等號由 $v_H > v_L > 0$ 保證。在端點 $rho=1$：$widetilde(V)_U(1)=v_H$、$widetilde(V)_U(0)=v_L$，直接代入得
  $
    tilde(B)|_(rho=1)=q v_H/v_H+(1-q)v_L/v_L=1
  $
  搭配基準模型中 $hat(B)>=1$ 的 Jensen 不等式，即得單調性結論。
]

$hat(B) > 1$ 反映了不知情者在型別不確定性下、對 $1\/v$ 取期望所產生的超額邊際負擔：由於不知情者須對兩種型別路徑加總最佳反應，$1\/v$ 的凸性使加權邊際負擔高於以平均型別計算的水準。部分相關結構引入後，隨 $rho$ 上升，$widetilde(V)_U(1)$ 升高而 $widetilde(V)_U(0)$ 降低，使兩條路徑的後驗期望獎酬趨向分離。當 $rho=1$ 時，後驗信念完全揭示型別，不知情者在每條路徑上均以對應型別的確切獎酬值最佳化，凸性超額負擔消失，$tilde(B)$ 收斂至 $1$。換言之，相關性的上升逐步將訊號外溢效果注入係數，最終使此超額負擔在完全相關處歸零。

=== IU 子賽局均衡型態的演變 <subsubsec-main-comparison-iu>

在 SS 與 UI 子賽局中，相關性透過係數 $tilde(A)$、$tilde(B)$ 平滑影響均衡投入，不存在任何結構性斷點。IU 子賽局則不然——知情者的投入同時兼具競賽行動與型別訊號的雙重功能，分離均衡之可維持性受制於誘因相容條件，而誘因相容條件本身隨 $rho$ 上升發生質的改變。

在 $rho=0$ 的獨立同分配基準下，如#headingref(<subsubsec-bench-iu>)所示，IU 子賽局存在唯一未扭曲分離均衡，兩種型別各自選擇完整資訊最適投入，誘因相容條件鬆弛成立。原因在於 $widetilde(V)_U(mu) equiv overline(v)$：高型別即便偽裝成低型別，不知情者的後驗期望獎酬不變，無法藉此降低對手的競爭強度，模仿誘因因而消失。

當 $rho$ 進入 $(0, rho^*]$ 後，$widetilde(V)_U(1) > widetilde(V)_U(0)$ 成立，高型別的模仿誘因重新出現：若高型別偽裝成低型別，不知情者的後驗期望獎酬下降，競爭反應相應減弱，高型別得以在較低競爭壓力下獲得更高報酬。此一偏離的可行性，構成分離均衡能否維持的關鍵約束。由#stmtref(<prop-main-iu-rho-star>, "命題", "proposition-counter")，當且僅當 $rho <= rho^*$ 時，此約束仍可在未扭曲分離配置下滿足，均衡結構在形式上與獨立同分配基準相同，差異僅在係數 $hat(A)$、$hat(B)$ 替換為 $tilde(A)$、$tilde(B)$。

此一存在臨界的背後，存在誘因相容條件隨 $rho$ 演變的量化描述：高型別之下偏（模仿低型別）誘因從零開始單調增強，恰於 $rho^*$ 處首度使未扭曲分離喪失可維持性。

#corollary(
  title: [未扭曲分離 IC 之單調緊縮],
)[
  記高型別不向下模仿之誘因相容條件鬆弛量為
  $
    S(rho) equiv R - frac(widetilde(V)_U(1), widetilde(V)_U(0)).
  $
  在 $rho in [0, rho^*]$ 上，$S(rho)$ 為 $rho$ 的嚴格遞減函數，且滿足
  $
    S(0) = R - 1 > 0,
    quad
    S(rho^*) = 0.
  $
  即誘因相容條件由 $rho=0$ 處鬆弛成立，隨 $rho$ 上升單調收緊，恰於 $rho^*$ 處完全綁定。
] <cor-main-iu-ic-tightening>

#proof[
  由#stmtref(<prop-main-iu-rho-star>, "命題", "proposition-counter")之證明，$widetilde(V)_U(1)\/widetilde(V)_U(0)$ 為 $rho$ 之嚴格遞增函數，故 $S(rho)$ 嚴格遞減。在 $rho=0$：$widetilde(V)_U(1)=widetilde(V)_U(0)=widetilde(V)_U(q)$，故 $S(0)=R-1$；而 $R>1$ 由 $v_H>v_L>0$ 保證（見@eq-main-iu-undistorted-ic 之分析），故 $S(0)>0$。在 $rho=rho^*$：$rho^*$ 定義為使 $widetilde(V)_U(1)\/widetilde(V)_U(0)=R$ 的唯一解，故 $S(rho^*)=0$。
]

$S(rho)$ 收縮的背後有直觀的經濟邏輯：$rho$ 愈高，高型別成功偽裝成低型別後所能獲得的競爭鬆弛愈大——$widetilde(V)_U(0)$ 隨 $rho$ 下降，意味著不知情者在「以為對手是低型別」時投入更少，高型別因而獲得更有利的競爭環境。模仿的吸引力持續上升，直到 $rho^*$ 處剛好抵消原本持有的分離優勢，欺騙開始划算。

一旦 $rho$ 超過 $rho^*$，讓兩種型別各自選擇完整資訊最適投入的配置已不足以阻止高型別的模仿。為使高型別的偽裝無利可圖，低型別必須主動壓低投入至 $x_L^"R" = (z_H^-)^2$，使高型別模仿後所能換取的競爭鬆弛低於其原本的分離報酬。由#stmtref(<prop-main-iu-riley>, "命題", "proposition-counter")，這一壓低的代價由低型別單獨承擔：高型別仍選擇完整資訊最適投入並保有其租金，低型別的均衡報酬則低於完整資訊水準。這一扭曲在獨立同分配基準下根本不存在——訊號傳導關閉使模仿始終無利可圖，分離無需任何代價即可維持。

#stmtref(<cor-main-iu-region-summary>, "推論", "corollary-counter") 將上述分析整合為 IU 子賽局的#impt[兩段式結構]：在 $rho <= rho^*$ 的低相關區間，分離不需要任何扭曲；在 $rho > rho^*$ 的高相關區間，分離的代價由低型別單獨承擔。這一分段特性是 IU 制度在部分相關架構下最顯著的結構特徵，對後續制度比較與時序選擇具有決定性影響。

=== 相關性對時序偏好之不對稱影響 <subsubsec-main-comparison-timing>

前兩節分別刻畫了相關性如何平移均衡投入係數、以及如何在 $rho^*$ 處引發 IU 制度型態的結構性轉變。本節進一步將這些子賽局層次的效果映射至第 0 階段的時序選擇，說明相關性對兩位參賽者的時序偏好並非對稱作用：知情者與不知情者各自面對截然不同的誘因演變路徑。

就不知情者而言，由#stmtref(<prop-main-timing-u-prefers-ui>, "命題", "proposition-counter")，$Delta_U^(U I) >= 0$ 對任意 $rho$ 成立，等號條件為 $tilde(B)=1$。#stmtref(<prop-main-comparison-ab-monotone>, "命題", "proposition-counter") 指出 $tilde(B)$ 單調遞減且僅在 $rho=1$ 時降至 $1$，故在 $rho < 1$ 的全部區間，不知情者對 UI 制度的先動偏好嚴格為正。換言之，不論相關性如何改變，不知情者始終願意在知情者後動的制度承諾下搶先行動，此一偏好不因 $rho$ 上升而翻轉。

就知情者而言，情況截然不同。由#stmtref(<prop-main-timing-iu-rho>, "命題", "proposition-counter")，在未扭曲分離區間 $[0, rho^*]$ 內，$widetilde(pi)_I^(I U)$ 為 $rho$ 的嚴格遞減函數。其機制在於，$rho$ 上升同時推高 $widetilde(V)_U(1)$ (高型別路徑上競爭強度上升) 與壓低 $widetilde(V)_U(0)$ (低型別路徑上競爭強度下降)，但後者對事前期望報酬的改善不足以抵銷前者的惡化，淨效果是知情者在 IU 制度中的事前資訊租金系統性縮減。此即訊號—信念—反應機制在正相關設定下的揭露成本：相關性愈高，先動訊號愈清晰，不知情者的後驗競爭反應愈強，知情者為先動所付出的資訊洩漏代價愈大。

兩者對比揭示了時序選擇中的一項結構性不對稱：#impt[不知情者的先動偏好 (對 UI 而言) 對相關性穩健；知情者的先動偏好 (對 IU 而言) 隨相關性上升而系統性削弱。]換言之，相關性改變時序誘因的效果，主要落在知情者身上，而非不知情者。由#stmtref(<prop-main-timing-rho-dagger-existence>, "命題", "proposition-counter")，一旦 $Delta_I^(I U)$ 在 $rho=0$ 時為正、在 $rho=rho^*$ 時為負，便存在翻轉臨界值 $rho^dagger in (0, rho^*)$，使知情者對 IU 制度的先動偏好由正轉負。在獨立同分配基準下，這樣的翻轉不會出現——$rho=0$ 時訊號對不知情者的競爭行為毫無影響，知情者的先動誘因自然不受相關性干擾；部分相關結構引入後，訊號開始影響不知情者的均衡反應，翻轉才得以發生。均衡型態的改變是否也帶來福利上的對應後果，則是下一章的核心問題。

== 本章小結 <sec-main-summary>

本章在第三章獨立同分配基準之上，引入獎酬的部分相關結構，系統性地分析相關性對均衡投入、分離型態與時序選擇的影響。

就均衡投入而言，相關性透過後驗期望獎酬 $widetilde(V)_U(1)$ 與 $widetilde(V)_U(0)$ 的對立移動，使 SS 與 UI 子賽局的複合係數 $tilde(A)$、$tilde(B)$ 隨 $rho$ 嚴格遞減，並在 $rho=1$ 時收斂至完全相關的極限值。IU 子賽局的均衡結構則呈現出不連續的兩段式特徵：在低相關區間 ($rho <= rho^*$)，未扭曲分離均衡存在，兩型別各選完整資訊最適投入；一旦 $rho$ 超過臨界值 $rho^*$，高型別的模仿誘因使未扭曲分離失效，均衡轉為 Riley 扭曲型態，分離代價由低型別單獨承擔。

就時序選擇而言，本章的核心發現是兩位參與者對相關性的反應存在結構性不對稱。不知情者對 UI 制度的先動偏好對相關性穩健，在 $rho < 1$ 的全部區間均嚴格為正。知情者對 IU 制度的先動偏好則隨 $rho$ 上升而單調下降——相關性提高訊號的資訊含量，同時加重知情者先動所需付出的揭露代價，使 IU 制度的吸引力持續縮減。當此偏好在某個中間值 $rho^dagger in (0, rho^*)$ 由正轉負，制度排序便發生翻轉，均衡時序從 IU 轉向 SS 或 UI。

上述結果說明，部分相關性並非對獨立同分配基準的局部修正，而是從均衡結構到時序誘因全面重塑競賽的運作方式。然而，均衡能否被支持是一回事，均衡的福利後果是另一回事。相關性提高一方面使資訊更充分揭露，可能改善配置效率；另一方面也強化競爭反應，可能加劇投入耗散，此一權衡構成下一章的分析主軸。
