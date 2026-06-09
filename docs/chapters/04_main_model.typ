#import "../thesis.typ": (
  SS, bern, c, ca, corr, cp, definition, example, headingref, impt, lemma, payoff-matrix-2x2, proof, proposition,
  stmtref, widetilde,
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
  並以其皮爾森相關係數 (Pearson correlation coefficient) 定義相關參數
  $
    rho equiv corr(H_I, H_U).
  $
  本文限制 $rho in [0,1]$ 以聚焦於正相關情形。#footnote[皮爾森相關係數之一般值域為 $[-1,1]$。負相關情形（即 $rho < 0$）隱含兩者獎酬呈反向變動，在競賽文獻中較不具代表性，故本文不予討論。] 若知情者與不知情者之獎酬具有相同邊際分配，則稱 $(V_I, V_U)$ 服從參數為 $(q, rho) in (0,1) times [0,1]$ 之部分相關型別結構。
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

為簡化記號，以下在不致混淆時，將 $mu(x_I)$ 簡記為 $mu$。其中，$mu=1$ 表示不知情者確信知情者為高型別，$mu=0$ 表示其確信知情者為低型別，而 $mu=q$ 則表示其信念仍停留於先驗水準 (prior level)。

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

上述條件機率刻畫了獎酬相關所造成的資訊外溢效果。當 $rho=0$ 時，$theta_H$ 與 $theta_L$ 皆等於先驗機率 $q$，表示知情者型別資訊不會外溢至不知情者對自身獎酬狀態的判斷；此時，即使不知情者辨識出知情者之型別，其對自身為高型別的評估仍維持不變。當 $rho>0$ 時，則有 $theta_L < q < theta_H$：知情者為高型別會使不知情者上修自身處於高獎酬狀態的機率，知情者為低型別則會使其下修此一機率。

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

當 $rho>0$ 時，高型別訊號使不知情者上修自身獎酬評估，低型別訊號則使其下修；若信念維持於先驗水準，後驗期望獎酬即等於無條件期望獎酬。因此，

#[
  #set math.equation(numbering: none)
  $
    widetilde(V)_U(1) > widetilde(V)_U(q) > widetilde(V)_U(0).
  $
]

=== 最佳反應與延續報酬 <subsubsec-main-br-ic>

本節將前述後驗期望獎酬帶入 IU 子賽局的行為方程。由於 IU 制度下知情者先動、不知情者後動，分析須使用反向演繹法 (backward induction)：首先刻畫不知情者在觀察 $x_I$ 並形成後驗信念後的最佳反應；其次，將此反應代回知情者的報酬函數，以描述不同型別在先動時面對的延續報酬。如此處理的目的，是將#impt[投入作為競賽行動]與#impt[投入作為型別訊號]兩種角色放在同一架構中。前者透過 Tullock 成功函數影響勝率，後者則透過後驗信念改變不知情者的後驗期望獎酬，進而影響其後續投入。

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

#headingref(<subsec-main-belief-payoff>)已建立部分相關型別結構下的後驗期望獎酬、最佳反應與延續報酬。本節承此分析基礎，進一步分析第 0 階段後可能形成的三個子賽局，分別刻畫 SS、UI 與 IU 制度下的均衡行為與報酬。三者之中，唯有 IU 制度使知情者的投入先於不知情者行動而成為可觀察訊號；因此，後驗信念與獎酬相關所交織而成的信念反應機制，主要反映在該子賽局的均衡型態上。

=== SS 子賽局 <subsubsec-main-ss>

首先考慮雙方同時投入的 SS 制度。在此子賽局中，知情者雖已觀察自身型別，並可依型別選擇不同投入；不知情者則無法在行動前觀察任何來自知情者的投入訊號，故其決策必須建立在事前資訊之上。換言之，SS 制度排除了由先行投入所引發的後驗信念更新，因而提供一個用以對照 IU 訊號機制的同時行動基準。

為記錄不知情者在事前面對的型別加權邊際效果，定義

$
  A_(SS)
  equiv q widetilde(V)_U(1) / sqrt(v_H) + (1-q) widetilde(V)_U(0) / sqrt(v_L),
  quad
  B_(SS)
  equiv q widetilde(V)_U(1) / v_H + (1-q) widetilde(V)_U(0) / v_L.
$ <eq-main-ss-ab>

#proposition(
  title: [SS 子賽局之內點均衡],
)[
  在 SS 子賽局中，若均衡位於內點，則不知情者之均衡投入為
  $
    x_U^(SS)
    = A_(SS)^2 / (1+B_(SS))^2.
  $
  型別 $v in {v_H,v_L}$ 之知情者均衡投入為
  $
    x_I^(SS)(v)
    = sqrt(v) A_(SS) / (1+B_(SS))
    - A_(SS)^2 / (1+B_(SS))^2.
  $
  對應之知情者型別別報酬與不知情者事前期望報酬分別如下：
  $
    pi_I^(SS)(v)
    = (sqrt(v) - A_(SS) / (1+B_(SS)))^2, quad
  $
  以及
  $
    widetilde(pi)_U^(SS)
    = A_(SS)^2 B_(SS) / (1+B_(SS))^2.
  $
] <prop-main-ss-equilibrium>

#proof[
  給定不知情者投入 $x_U$，型別為 $v$ 的知情者解下列問題：
  $
    max_(x_I >= 0)
    x_I / (x_I+x_U) v - x_I.
  $
  若內點解存在，一階條件給出
  $
    x_I(v) = sqrt(v x_U) - x_U.
  $

  不知情者在同時行動時無法觀察知情者投入，因此必須在事前評估知情者將依型別採取的投入。其解下列事前極大化問題：
  $
    max_(x_U >= 0)
    (
      EE [
        x_U / (x_I(V_I)+x_U) V_U
      ] - x_U
    )
  $
  由全期望法則，等同於求解：
  $
    max_(x_U >= 0)
    (
      q widetilde(V)_U(1) x_U / (x_I(v_H)+x_U)
      + (1-q) widetilde(V)_U(0) x_U / (x_I(v_L)+x_U)
      - x_U
    )
  $
  對此目標函數就 $x_U$ 取一階條件，並由上式代入 $x_I(v)+x_U=sqrt(v x_U)$，可得
  $
    q widetilde(V)_U(1) (sqrt(v_H x_U)-x_U) / (v_H x_U)
    + (1-q) widetilde(V)_U(0) (sqrt(v_L x_U)-x_U) / (v_L x_U)
    = 1.
  $
  整理後即為
  $
    A_(SS) / sqrt(x_U) - B_(SS) = 1.
  $
  因此
  $
    sqrt(x_U^(SS)) = A_(SS) / (1+B_(SS)),
  $
  即可得 $x_U^(SS)$ 與 $x_I^(SS)(v)$。將均衡投入代回知情者報酬，可得
  $
    pi_I^(SS)(v)
    = (sqrt(v) - A_(SS) / (1+B_(SS)))^2.
  $
  再將均衡投入代回不知情者的事前期望報酬，得
  $
    widetilde(pi)_U^(SS)
    = A_(SS)^2 B_(SS) / (1+B_(SS))^2.
  $
]

#stmtref(<prop-main-ss-equilibrium>, "命題", "proposition-counter") 的經濟直覺如下。SS 制度下雙方同時投入，不知情者無法在行動前從知情者的投入中汲取額外資訊；然而，這並不表示相關性在 SS 子賽局中全然消失。知情者的投入仍依其型別而異，而在部分相關結構下，知情者為高型別或低型別也分別對應到不知情者不同的條件期望獎酬。因此，不知情者雖然不能進行路徑上的後驗更新，仍必須在事前同時考量兩種型別狀態下的競爭強度與自身獎酬評估。$A_(SS)$ 與 $B_(SS)$ 正是將這兩項效果彙整為一階條件中的型別加權邊際效果。

值得注意的是，#stmtref(<prop-main-ss-equilibrium>, "命題", "proposition-counter")顯示本文與 #c("fu2006") 之 SS 子賽局的差異。在 #c("fu2006") 中，競爭標的的價值為共同價值；一旦狀態為高或低，知情者與不知情者面對的是同一個獎酬值。因此，SS 子賽局雖無訊號傳遞，不知情者的事前問題仍是以先驗機率加權高、低兩種共同價值狀態。本文則將兩方獎酬拆分為 $(V_I,V_U)$，並允許其僅部分相關，故不知情者在 SS 中加權的並非同一共同價值，而是條件期望獎酬 $widetilde(V)_U(1)$ 與 $widetilde(V)_U(0)$。換言之，#c("fu2006") 的 SS 可視為完全相關端點下的共同價值基準；本文的 SS 則保留同時行動下#impt[無訊號更新]的特徵，同時允許獎酬相關透過事前條件期望進入均衡投入。

=== UI 子賽局 <subsubsec-main-ui>

接著考慮不知情者先行投入的 UI 制度。在此子賽局中，不知情者先選擇投入 $x_U$，此時尚無法觀察知情者型別；知情者在觀察到 $x_U$ 後，依其型別 $v in {v_H, v_L}$ 選擇最佳反應。UI 制度同樣不涉及訊號傳遞所引發的後驗信念更新——不知情者先動而無訊號可循，知情者後動而型別已知，無需推斷對手資訊。換言之，UI 子賽局提供另一種無訊號傳遞的基準，其中行動次序賦予不知情者先行承諾的角色。

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
  widetilde(pi)_U^(U I)(x_U) = A_(SS) sqrt(x_U) - x_U,
$ <eq-main-ui-objective>

其中 $A_(SS)$ 沿用@eq-main-ss-ab 之定義。UI 子賽局下不知情者的目標函數因而僅含 $A_(SS)$ 而不含 $B_(SS)$：由於知情者的最佳反應已被代入，不知情者面對的是一個在 $sqrt(x_U)$ 上呈線性的利潤函數，不存在 SS 中因雙方同時最佳化所形成的相互依賴效果。

#proposition(
  title: [UI 子賽局之內點均衡],
)[
  在 UI 子賽局中，若均衡位於內點（即兩種型別知情者均選擇正投入），則不知情者之均衡投入為
  $
    x_U^(U I) = A_(SS)^2 / 4.
  $
  型別 $v in {v_H, v_L}$ 之知情者均衡投入為
  $
    x_I^(U I)(v) = sqrt(v) A_(SS) / 2 - A_(SS)^2 / 4.
  $
  對應之知情者型別別報酬與不知情者事前期望報酬分別如下：
  $
    pi_I^(U I)(v) = (sqrt(v) - A_(SS) / 2)^2, quad widetilde(pi)_U^(U I) = A_(SS)^2 / 4.
  $
] <prop-main-ui-equilibrium>

#proof[
  由@eq-main-ui-objective，不知情者之目標函數為 $A_(SS) sqrt(x_U) - x_U$。取一階條件：
  $
    A_(SS) / (2 sqrt(x_U)) = 1.
  $
  解得 $sqrt(x_U^(U I)) = A_(SS) / 2$，從而
  $
    x_U^(U I) = A_(SS)^2 / 4.
  $

  代入@eq-main-ui-br，知情者均衡投入為
  $
    x_I^(U I)(v) = sqrt(v) dot A_(SS) / 2 - A_(SS)^2 / 4.
  $

  由於 $x_I^(U I)(v) + x_U^(U I) = sqrt(v) dot A_(SS) / 2$，型別 $v$ 知情者之均衡報酬為
  $
    pi_I^(U I)(v) & = x_I^(U I)(v) / (x_I^(U I)(v) + x_U^(U I)) dot v - x_I^(U I)(v) \
                  & = (1 - A_(SS) / (2 sqrt(v))) v
                    - (sqrt(v) dot A_(SS) / 2 - A_(SS)^2 / 4) \
                  & = v - sqrt(v) A_(SS) + A_(SS)^2 / 4 \
                  & = (sqrt(v) - A_(SS) / 2)^2.
  $

  不知情者之事前期望報酬為
  $
    widetilde(pi)_U^(U I)
    = A_(SS) dot A_(SS) / 2 - A_(SS)^2 / 4
    = A_(SS)^2 / 4.
  $
]

比較#stmtref(<prop-main-ui-equilibrium>, "命題", "proposition-counter") 與#stmtref(<prop-main-ss-equilibrium>, "命題", "proposition-counter")，兩個子賽局在均衡結構上具有相同的參數骨架，差異僅在分母：SS 的一階條件為 $A_(SS) \/ sqrt(x_U) = 1 + B_(SS)$，UI 的對應條件為 $A_(SS) \/ (2 sqrt(x_U)) = 1$。此一差異直接反映決策架構之不同。在 SS 中，不知情者在均衡中與知情者同時最佳化，$B_(SS)$ 項衡量在當前均衡投入組合下型別加權的贏率成本——是雙方互相為對手之約束時才浮現的邊際效應。在 UI 中，不知情者先行鎖定 $x_U$，知情者的最佳反應 $x_I(v) = sqrt(v x_U) - x_U$ 已被代入目標函數，雙方相互依賴之迴圈不再存在，邊際均等條件因而只含 $sqrt(x_U)$ 微分所帶來的係數 $2$。

#proposition(
  title: [UI 相對於 SS 之先行者優勢],
)[
  在內點均衡下，不知情者在 UI 制度的事前期望報酬不低於 SS 制度：
  $
    widetilde(pi)_U^(U I) >= widetilde(pi)_U^(SS),
  $ <eq-main-ui-vs-ss>
  等號成立若且唯若 $B_(SS) = 1$。
] <prop-main-ui-first-mover>

#proof[
  由#stmtref(<prop-main-ui-equilibrium>, "命題", "proposition-counter") 與#stmtref(<prop-main-ss-equilibrium>, "命題", "proposition-counter")，
  $
    widetilde(pi)_U^(U I) = A_(SS)^2 / 4, quad
    widetilde(pi)_U^(SS) = A_(SS)^2 B_(SS) / (1+B_(SS))^2.
  $
  由算術－幾何平均不等式，$1 + B_(SS) >= 2 sqrt(B_(SS))$，兩邊平方得 $(1+B_(SS))^2 >= 4 B_(SS)$，故
  $
    widetilde(pi)_U^(U I) - widetilde(pi)_U^(SS)
    = A_(SS)^2 / 4 - A_(SS)^2 B_(SS) / (1+B_(SS))^2
    = A_(SS)^2 (1 - B_(SS))^2 / (4(1+B_(SS))^2)
    >= 0,
  $
  等號成立若且唯若 $B_(SS) = 1$。
]

#stmtref(<prop-main-ui-first-mover>, "命題", "proposition-counter") 揭示不知情者在先行承諾的 UI 制度下具有先行者優勢。其直覺在於：在 SS 均衡中，不知情者與知情者之投入相互制約，雙方同時反應形成競爭壓力；UI 制度下不知情者先行鎖定投入，迫使知情者就此承諾水準作出反應，從而消除了 SS 中雙向制約的邊際效應，使不知情者得以選擇對自身最有利的承諾投入。

=== IU 子賽局 <subsubsec-main-iu>

最後考慮知情者先行投入的 IU 制度。與 SS、UI 不同，IU 子賽局中知情者的投入先於不知情者行動而成為可觀察訊號；不知情者觀察 $x_I$ 後更新後驗信念 $mu$，再依#stmtref(<lem-main-br>, "引理", "lemma-counter") 選擇投入。因此，IU 是唯一同時啟動#impt[投入—信念—後驗期望獎酬—最佳反應]鏈條的子賽局，也是本章分析分離均衡與混同均衡的焦點所在。

分析採完美貝氏均衡 (perfect Bayesian equilibrium) 架構。知情者依真實型別 $v in {v_H, v_L}$ 選擇 $x_I >= 0$；不知情者觀察 $x_I$ 後形成信念 $mu(x_I)$，並選擇 $x_U^*(x_I, mu(x_I))$。均衡須滿足：

#block[
  #set par(first-line-indent: 0em)
  #set enum(
    indent: 0em,
    body-indent: 0.6em,
    numbering: n => box(width: 2.2em)[#numbering("(1)", n)],
  )
  + 給定信念，雙方策略為最佳反應；
  + 路徑上信念 $mu(x_I)$ 與貝氏法則一致；
  + 均衡路徑外信念 (off-the-path beliefs) $mu(x)$（$x$ 非均衡路徑投入）合理。
]

下文首先刻畫未扭曲分離 (undistorted separating) 的候選均衡，再逐一檢驗其誘因相容條件。

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

當 $rho = 0$ 時，$widetilde(V)_U(mu) = v_L + q Delta V$ 與 $mu$ 無關，前述 $x_I^*(v,mu)$ 退化為#headingref(<sec-model>) 基準模型中的唯一分離均衡。此時高、低型別之雙向模仿差額皆為

$
  (v_H - v_L)^2 / (4 widetilde(V)_U(q)) > 0,
$

混同均衡無法成立——此即本文以 $rho = 0$ 作為訊號機制關閉之基準的理由。隨 $rho$ 上升，$widetilde(V)_U(1)$ 與 $widetilde(V)_U(0)$ 的差距擴大，高型別偽裝成低型別所換取的競爭鬆弛效果增強，分離均衡的存續條件因而需要重新檢驗。

#set math.equation(numbering: "(1)", supplement: [式])

#proposition(
  title: [IU 子賽局之未扭曲分離配置],
)[
  在本文分析之內點區域內，定義
  $
    R equiv v_H^2 / (v_{L}(2v_{H}-v_{L})).
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

相較於 SS 與 UI，IU 子賽局無法如@eq-main-ss-ab 那般由單一參數 $A_(SS)$ 概括其均衡結構。其原因在於，知情者的投入同時具有競賽行動與型別訊號的雙重性質，而不知情者的最佳反應強度又會隨後驗信念而調整。據此，SS 與 UI 可視為不存在訊號更新時的對照基準；IU 則承載了獎酬相關性所帶出的信念反應機制，從而使均衡型態隨 $rho$ 的變化而連續調整。

== 內生時序選擇

前文已分別求得 SS、UI 與 IU 三個投入子賽局之均衡結構，並說明獎酬相關性如何透過後驗信念改變不知情者的反應強度。就整體賽局而言，這些子賽局並非彼此孤立，而是第 0 階段行動時點選擇所導向之制度結果。是以，若欲進一步判斷知情者與不知情者在事前究竟偏好何種時序安排，便須將前述三種制度下的均衡報酬重新置回同一比較架構之中。

關鍵在於，第 0 階段的時序選擇發生於知情者觀察自身型別之前；因此，雙方比較的對象並非特定型別實現後的報酬，而是各制度所對應的#impt("事前期望報酬")。換言之，前述子賽局分析所提供者，乃是第 0 階段制度選擇問題的基礎材料；真正的時序均衡，則須由這些制度報酬之相對大小加以決定。

基於上述分析，下文安排如下：整理第 0 階段的制度報酬矩陣，明確界定三種時序安排在策略式賽局中的對應位置；繼而以單邊偏離差額刻畫雙方於第 0 階段的最佳反應；最後給出純策略內生時序均衡之成立條件。循此脈絡，本章可將前述子賽局結果進一步收斂為對整體時序選擇的完整刻畫。

=== 制度報酬矩陣 <subsubsubsec-main-timing-matrix>

為分析第 0 階段的時序選擇，先將前文所得之子賽局均衡報酬統一記為制度報酬。對任一制度 $J in {SS, U I, I U}$，定義知情者之事前期望報酬為
$
  widetilde(pi)_I^(J)
  equiv q pi_I^(J)(v_H) + (1-q) pi_I^(J)(v_L),
$
其中 $pi_I^(J)(v)$ 表示型別為 $v$ 的知情者在制度 $J$ 下之均衡報酬；不知情者之事前期望報酬則記為 $widetilde(pi)_U^(J)$。前文已分別求得 SS、UI 與 IU 三個投入子賽局的均衡結構，故第 0 階段所需比較者，正是三種制度下之報酬組合 $(widetilde(pi)_I^(J), widetilde(pi)_U^(J))$。

依第 0 階段的行動時點選擇，可將整體賽局寫成一個 $2 times 2$ 策略式賽局：知情者與不知情者各自選擇於第 1 期或第 2 期投入。若雙方選擇同一期，則進入 SS 制度；若不知情者選擇第 1 期、知情者選擇第 2 期，則進入 UI 制度；若知情者選擇第 1 期、不知情者選擇第 2 期，則進入 IU 制度。兩個對角格雖分別對應於同時在第 1 期與同時在第 2 期投入，其制度報酬皆同為 SS。整理後之制度報酬矩陣如@tbl-main-timing-payoff 所示。

#figure(
  payoff-matrix-2x2(
    [知情者],
    [不知情者],
    row_actions: ([第 1 期], [第 2 期]),
    col_actions: ([第 1 期], [第 2 期]),
    payoffs: (
      ([$(widetilde(pi)_I^(SS), widetilde(pi)_U^(SS))$], [$(widetilde(pi)_I^(I U), widetilde(pi)_U^(I U))$]),
      ([$(widetilde(pi)_I^(U I), widetilde(pi)_U^(U I))$], [$(widetilde(pi)_I^(SS), widetilde(pi)_U^(SS))$]),
    ),
    columns: (2.2cm, 1.8cm, 4.6cm, 4.6cm),
    inset: 8pt,
  ),
  caption: [第 0 階段之制度報酬矩陣],
  supplement: [表],
) <tbl-main-timing-payoff>

@tbl-main-timing-payoff 將前述三個投入子賽局收斂為同一個制度選擇問題。後續分析的任務，便是在該矩陣上判斷雙方於第 0 階段是否具有單邊偏離誘因，並據以刻畫純策略內生時序均衡。為使判斷條件更為緊湊，下一小節將進一步把四種可能的單邊偏離整理為若干報酬差額。
