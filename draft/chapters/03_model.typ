#import "../thesis.typ": c, ca, cp, cy, headingref, widetilde

本文考慮一個兩人 Tullock 競賽，兩位風險中立的參與者分別為知情者 ($I$) 與不知情者 ($U$)。知情者指的是在投入階段前會私下觀察自身獎酬實現值的一方；不知情者則只知道該數值的事前分配 $G$，但不直接觀察其實現值。兩者競爭一項政策是否實施；勝方取得自身獎酬，敗方所得為零。若知情者勝出，其獎酬為 $V_I > 0$；若不知情者勝出，其獎酬為 $V_U equiv V > 0$。競賽成功函數沿用 #c("tullock1980") 的比例投入形式，內生時序則依循 #c("hamilton1990") 與 #c("fu2006") 的行動承諾架構，使兩位參與者在選擇投入之前先決定行動時點。

模型的不對稱有兩個層次。第一，資訊在兩位參與者之間不對稱：不知情者知道 $V_I$ 的事前分配 $G$，但無法在行動時點前觀察 $V_I$ 的實現值；知情者在第 0 階段選擇行動時點時也尚未觀察自身型別，待行動時點決定後才私下觀察 $V_I$。第二，獎酬本身也不對稱：知情者勝出時取得 $V_I$，不知情者勝出時取得 $V$，兩者不必相等。因此，第 0 階段的時序選擇建立在事前期望報酬上；進入投入子賽局後，知情者的策略可依實現的 $V_I$ 調整，而不知情者只能根據可觀察行動作出反應。

== 資訊結構 <subsec-model-info>

第 0 階段，知情者與不知情者同時選擇行動時點，此時知情者尚未觀察自身型別。時序確定後，自然依事前分配 $G$ 決定 $V_I$；知情者隨即私下觀察其實現值，不知情者則不直接觀察。此後，兩位參與者依第 0 階段所承諾的時點進入投入子賽局。

後續若聚焦兩點型別，本文統一記知情者之獎酬為 $V_I in {V_L, V_H}$，事前機率為：

$
  Pr(V_I = V_H) = q,
  quad
  Pr(V_I = V_L) = 1-q,
  quad
  q in (0,1),
$
其中 $V_H > V_L > 0$。當 $q=1/2$ 時，便回到對稱兩點分配的特例；但本文後續比較靜態與#headingref(<sec-extension>)的延伸分析均以一般化的 $q$ 為準。

== 競賽時序 <subsec-model-timeline>

依 #c("fu2006") 的寫法，第 0 階段的行動時點選擇會產生三種支配後續競賽的制度。若知情者與不知情者選擇同一期，兩者在該期同時決定投入，記為 $S S$ 制度。若不知情者選擇第 1 期而知情者選擇第 2 期，則不知情者先承諾投入，知情者觀察後再選擇投入，記為 $U I$ 制度。若知情者選擇第 1 期而不知情者選擇第 2 期，則知情者先承諾投入，不知情者觀察後再選擇投入，記為 $I U$ 制度。

第 0 階段，知情者與不知情者同時決定要在第 1 期或第 2 期投入，且此一選擇具有承諾效果。時序決定後，自然依 $G$ 決定 $V_I$；知情者在 $V_I$ 實現後立即私下觀察其數值，不知情者則仍不直接觀察。接著，兩位參與者依第 0 階段所選擇的行動時點進入投入子賽局。若任一方已於第 1 期投入，該投入在第 2 期公開可觀察，因此第 2 期行動者可在觀察先動者投入後再選擇自身投入。

在 $S S$ 與 $U I$ 制度下，不知情者的行動不會接收到來自知情者的投入訊號：前者同時行動，後者由不知情者先動。在 $I U$ 制度下，知情者的投入雖然會被不知情者觀察，形式上可引發關於 $V_I$ 的後驗信念；但本文的關鍵設定是，不知情者的獎酬固定為 $V$，其最佳反應只依賴已觀察到的投入與自身獎酬，而不依賴對 $V_I$ 的後驗信念。因此，相較於 #c("fu2006")，本文保留相同的時序制度，卻關閉了訊號—信念—反應通道。

== 競賽報酬與最佳反應 <subsec-model-payoffs>

給定投入 $x_I >= 0$ 與 $x_U >= 0$，Tullock 成功函數為

#set math.equation(numbering: "(1)")
$
  p_I(x_I, x_U) = x_I / (x_I + x_U), quad
  p_U(x_I, x_U) = x_U / (x_I + x_U).
$ <eq-success-functions>
#set math.equation(numbering: none)

扣除投入成本後，型別為 $v$ 的知情者之報酬為

$
  pi_I(x_I, x_U; v)
  = x_I / (x_I + x_U) v - x_I,
$ <eq-payoff-i>

而不知情者的報酬為

$
  pi_U(x_I, x_U; V)
  = x_U / (x_I + x_U) V - x_U.
$ <eq-payoff-u>

當對手投入為正且內點解存在時，一階條件給出兩位參與者的最佳反應：

#set math.equation(numbering: "(1)")
$
  x_I^*(x_U; v) = sqrt(v x_U) - x_U,
$ <eq-br-i>

$
  x_U^*(x_I; V) = sqrt(V x_I) - x_I.
$ <eq-br-u>
#set math.equation(numbering: none)

若要求非負投入，上式可理解為內點最佳反應；邊界情形則取其與零的較大值。上述不知情者的最佳反應只依賴 $x_I$ 與 $V$，不含任何關於 $V_I$ 的後驗信念。這一點是本文與 #c("fu2006") 的主要差異，也是後續 $I U$ 子賽局唯一分離均衡的核心原因。

== 第 0 階段的制度報酬 <subsec-model-stage0>

令 $pi_I^J(v)$ 表示制度 $J in {S S, U I, I U}$ 下，型別 $V_I = v$ 的知情者在投入子賽局均衡中的報酬。由於第 0 階段尚未實現 $V_I$，知情者比較的是各制度下的事前期望報酬：

#set math.equation(numbering: "(1)")
$
  widetilde(pi)_I^J equiv EE[pi_I^J(V_I)].
$ <eq-ex-ante-i>

不知情者沒有私人型別，但其均衡報酬可能隨 $V_I$ 透過知情者的均衡投入而改變。因此令

$
  pi_U^J equiv EE[pi_U^J(V_I)]
$ <eq-ex-ante-u>
#set math.equation(numbering: none)

為不知情者在制度 $J$ 下的期望報酬。第 0 階段的時序選擇可寫成下列策略式賽局，其中橫列為知情者的策略，直欄為不知情者的策略：

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
      box(width: 64pt, height: 32pt)[
        #place(top + right, dx: -6pt, dy: 4pt)[$U$]
        #place(bottom + left, dx: 6pt, dy: -4pt)[$I$]
        #place(top + left, line(start: (0pt, 0pt), end: (64pt, 32pt), stroke: 0.4pt))
      ],
    ),
    [第 1 期], [第 2 期],
    [第 1 期], $(widetilde(pi)_I^(S S), pi_U^(S S))$, $(widetilde(pi)_I^(I U), pi_U^(I U))$,
    [第 2 期], $(widetilde(pi)_I^(U I), pi_U^(U I))$, $(widetilde(pi)_I^(S S), pi_U^(S S))$,
  ),
  caption: [第 0 階段時序選擇的制度報酬],
  supplement: [表],
) <tbl-stage0-payoffs>

後續分析即先求解 $S S$、$U I$ 與 $I U$ 三個投入子賽局的均衡報酬，再將其代回上述報酬矩陣，以比較第 0 階段的時序誘因。因為知情者在第 0 階段尚未知道自身型別，任何型別層級的先動或後動收益都只能作為事後分解；真正決定時序選擇的是上述兩個事前期望報酬定義。
