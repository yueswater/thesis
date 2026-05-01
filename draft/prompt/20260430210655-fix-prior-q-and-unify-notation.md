# 修正先驗機率 q 與符號統一（Ch3–Ch6 中文版）

> 日期：2026-04-30 21:06
> 觸發來源：Meeting 後教授指正 + NotebookLM 三點摘要
> 範圍：本次先動 `draft/i18n/zh/` 與 `draft/scripts/`；英文版於中文版定稿後再對應更新

## 1. 背景與問題定義

教授與 NotebookLM 共同指出 Ch6 v9 草稿三項致命盲點：

1. **強制 prior = 1/2**：在 6.1 節將 $\Pr(v_I = V_H) = \Pr(v_I = V_L) = 1/2$ 直接寫死，使本文無法與 #c("fu2006") 在一般化先驗 $Q$ 上做對齊比較。
2. **「獨立性」的數學定義錯誤**：v9 將 $(q, s) = (1/2, 1/2)$ 等同於型別獨立，但統計學中**獨立**的定義是「條件機率等於先驗機率」（$\Pr(A \mid B) = \Pr(A)$）。當先驗不為 $1/2$ 時，條件機率為 $1/2$ 並非獨立。
3. **符號混用與邏輯衝突**：v9 在 Ch5 隱含使用一般化先驗，但 Ch6 又把 $q, s$ 重新定義為條件機率，造成 Ch5 → Ch6 的銜接斷層；教授閱讀時無法看出基準模型與 #c("fu2006") 之間的連續變動關係。

## 2. 設計原則

- **保留 Ch3 既有架構**：勞方型別 $V_L$ 為私人資訊、資方獎酬 $V$ 為**已知常數**。這是本論文相對於 #c("fu2006") 的核心差異點（雙重不對稱：訊息不對稱 + 獎酬不對稱），不修改。
- **Ch6 是 Ch3 模型的自然延伸**：在 Ch6 讓資方獎酬從常數 $V$ 升級為隨機變數 $V_M$，並透過聯合分配連結到 $V_L$。
- **符號全程統一**：Ch3、Ch4、Ch5、Ch6 共用同一套符號，從先驗 $q$、型別值 $V_\ell, V_H$、到動差 $\kappa, \nu, \lambda$ 都連續對應，後續分析才能對齊。
- **只動中文版**：本計畫僅修改 `ideas/zh/`；英文版與圖檔英文 caption 留待中文定稿後再同步。

## 3. 符號統一方案

| 符號 | 意義 | Ch3–5 用法 | Ch6 用法 |
|---|---|---|---|
| $V_L$ | 勞方獎酬（隨機變數） | 同 | 同 |
| $V_M$ | 資方獎酬 | $V_M \equiv V$（已知常數） | 隨機變數，$V_M \in \{V_\ell, V_H\}$ |
| $V_\ell, V_H$ | 兩點分配的型別值 | 同（$V_H > V_\ell > 0$） | 同（兩方共用同一砥柱集合） |
| $q$ | 勞方型別為高的先驗 | $\Pr(V_L = V_H) = q \in (0,1)$ | 同；同時也是 $V_M$ 的邊際 |
| $p_H, p_\ell$ | 條件機率 | 不出現 | $p_H = \Pr(V_M = V_H \mid V_L = V_H)$；$p_\ell = \Pr(V_M = V_\ell \mid V_L = V_\ell)$ |
| $\hat V_M(\mu)$ | 資方信念加權期望獎酬 | 不出現 | $\hat V_M(\mu) = \mu[p_H V_H + (1-p_H)V_\ell] + (1-\mu)[(1-p_\ell)V_H + p_\ell V_\ell]$ |

**統計獨立的正確定義**：$p_H = q$ 且 $p_\ell = 1 - q$。此時觀察 $V_L$ 不會更新對 $V_M$ 的信念。

**完全正相關**：$p_H = p_\ell = 1$，對應 #c("fu2006")。

**部分正相關（本文核心）**：$q < p_H < 1$ 且 $1 - q < p_\ell < 1$。

**邊際一致性限制**：$(1-q)(1-p_\ell) = q(1-p_H)$（保證 $V_M$ 的邊際與 $V_L$ 一致）。

## 4. Ch3 (`03_setup.qmd`) 修改要點

**核心改動：把兩點分配的等機率 $1/2$ 一般化為先驗 $q$。**

1. 「環境」節後新增段落，正式引入先驗：
   $$\Pr(V_L = V_H) = q,\quad \Pr(V_L = V_\ell) = 1-q,\quad q \in (0,1).$$

2. **兩點分配定義 `def-binary`** 改寫：
   - 從「兩型別機率皆為 $1/2$」改為「機率為 $(q, 1-q)$」。
   - 基本參數從 $(\mu, \delta)$ 改為 $(V_\ell, V_H, q)$。
   - 派生量：$\mu = q V_H + (1-q) V_\ell$；$\sigma^2 = q(1-q)(V_H - V_\ell)^2$。
   - 不再強迫 $V_\ell = \mu - \delta, V_H = \mu + \delta$（這是 $q = 1/2$ 的特例）。

3. **均勻分配定義** 維持原樣：以 $(\mu, \delta)$ 為基本參數，先驗概念不適用。

4. **動差表 `tbl-moments`** 更新兩點分配欄位：
   - $\kappa = q/u_H + (1-q)/u_\ell$（原為 $1/(2u_\ell) + 1/(2u_H)$）
   - $\nu = q u_H + (1-q) u_\ell$
   - $\lambda = q/u_H^2 + (1-q)/u_\ell^2$
   - 均勻分配欄位不動。

5. **動差比較命題 `prp-moments`** 與其證明（在 Ch8 附錄 `08_appendix.qmd`）同步更新。

## 5. Ch4 (`04_equilibria.qmd`) 修改要點

均衡解推導本身**不依賴** $q$，只依賴動差 $\kappa, \nu, \lambda$。核心改動有限：

1. **兩點型別 IC 檢驗**（line 210–242）：原本不依賴機率（只看 $V_\ell, V_H, V$），所以結論 $(V_H - V_\ell)^2 / (4V) > 0$ 在一般 $q$ 下不變；但表述須更新為「兩型別在先驗 $(q, 1-q)$ 下都嚴格滿足 IC」。
2. **期望報酬公式**（`eq-eul-ss`、`eq-eul-ml`、`eq-eul-lm` 等）：透過 $\kappa, \nu, \lambda, \mu, \sigma^2$ 表達，公式不需改寫，但須提醒讀者這些動差現在是 $q$ 的函數。
3. **附錄證明** 同步檢查是否有隱含 $q = 1/2$ 的步驟。

## 6. Ch5 (`05_analysis.qmd`) 修改要點

1. **兩點分配下的時序結構**（line 228–235）：
   - $\Delta_L^{LM} = -\E[R(V_L)]$ 在 $q \ne 1/2$ 時要寫成
     $$\Delta_L^{LM} = -[(1-q) R(V_\ell) + q R(V_H)],$$
     原本的 $-\frac{1}{2}(R(V_\ell)+R(V_H))$ 是 $q = 1/2$ 的特例。
2. **資方時序偏好**（`prp-mgmt`、`eq-mgmt-cond`）：以動差表達的條件不變，但「**兩點分配**」的函數化範例（line 287–291）須帶入新的 $\kappa^B(q), \lambda^B(q), \sigma^2(q)$。
3. **福利公式**（`eq-ew-ss` 至 `eq-ew-lm`）：抽象式不變，兩點分配的代入式更新。
4. **結果表 `tbl-summary-distributions`**：兩點分配欄位的動差更新。

## 7. Ch6 (`06_extension.qmd`) 全面重寫

依 Task 1–4 重寫，但符號改用 $V_L, V_M, V_\ell, V_H, q, p_H, p_\ell$（不沿用 v9 的 $v_i, v_u, v_h, v_l, s$）。

### §6.1 環境與聯合機率分配（原 §6.1 改寫；對應 Task 1 + Task 2）

- 雙方型別 $V_L, V_M \in \{V_\ell, V_H\}$，$V_H > V_\ell > 0$。
- 先驗：$\Pr(V_L = V_H) = q$；邊際 $\Pr(V_M = V_H) = q$。
- 條件機率 $p_H = \Pr(V_M = V_H \mid V_L = V_H)$、$p_\ell = \Pr(V_M = V_\ell \mid V_L = V_\ell)$。
- 完整聯合機率表：

  |  | $V_M = V_H$ | $V_M = V_\ell$ | 邊際 |
  |---|---|---|---|
  | $V_L = V_H$ | $q\, p_H$ | $q\,(1 - p_H)$ | $q$ |
  | $V_L = V_\ell$ | $(1-q)(1 - p_\ell)$ | $(1-q)\, p_\ell$ | $1 - q$ |

- 邊際一致性：$(1-q)(1 - p_\ell) = q(1 - p_H)$。
- 三個基準狀態（**完全獨立**：$p_H = q,\; p_\ell = 1-q$；**完全正相關**：$p_H = p_\ell = 1$；**部分正相關**：$q < p_H < 1,\; 1-q < p_\ell < 1$）。

### §6.2 後驗信念與資方期望獎酬（原 §6.1+§6.2 改寫；對應 Task 3）

- 資方觀察 $x_L$ 後形成 $\mu = \Pr(V_L = V_H \mid x_L)$。
- $$\hat{V}_M(\mu) = \mu\bigl[p_H V_H + (1 - p_H) V_\ell\bigr] + (1 - \mu)\bigl[(1 - p_\ell) V_H + p_\ell V_\ell\bigr].$$
- 一階微分：$d \hat{V}_M / d \mu = (p_H + p_\ell - 1)(V_H - V_\ell)$。
- 在部分／完全正相關下嚴格遞增，獨立時為零（資方信念不隨 $\mu$ 動）。

### §6.3 IC$_H$、臨界邊界與 pooling 的浮現（原 §6.3+§6.4 改寫；對應 Task 4，採內生 Tullock 路線）

- **直覺層**：高型別偽裝低型別會招致對手以 $\hat V_M(0)$ 為基準的較弱回應，但同時把自身真實型別揭露為 $V_\ell$ 的代價是自己的賭注變小。IC$_H$ 要求分離均衡下的 Tullock 報酬不低於偽裝後的 Tullock 報酬。
- **正式層（沿用 v9 `prp-sep-exists`，符號替換為新框架）**：
  - 高型別均衡報酬：$\Pi_H = V_H^2 / (4\hat V_M(1))$。
  - 高型別偽裝報酬：$\widetilde\Pi_H = V_\ell(2V_H - V_\ell) / (4\hat V_M(0))$。
  - IC$_H$：
    $$\frac{V_H^2}{\hat V_M(1)} \;\ge\; \frac{V_\ell(2V_H - V_\ell)}{\hat V_M(0)},\qquad \text{即}\quad \frac{\hat V_M(1)}{\hat V_M(0)} \;\le\; R \equiv \frac{V_H^2}{V_\ell(2V_H - V_\ell)}.$$
  - 門檻 $R > 1$ 由獎酬值決定，與 $(p_H, p_\ell, q)$ 無關。
- **臨界邊界**：將 $\hat V_M(1)/\hat V_M(0) = R$ 解出 $p_\ell$ 對 $p_H$ 的關係（一條依 $R$ 與 $V_H, V_\ell$ 決定的曲線，**非直線**），對應 v9 的 `prp-boundary`。
- **三個基準帶入驗證**：
  - **獨立** $(p_H, p_\ell) = (q, 1-q)$：$\hat V_M(1) = \hat V_M(0) = q V_H + (1-q) V_\ell$（與 $\mu$ 無關），故 $\hat V_M(1)/\hat V_M(0) = 1 < R$，IC$_H$ 嚴格成立 → 分離均衡穩定。
  - **完全相關** $(p_H, p_\ell) = (1, 1)$：$\hat V_M(1) = V_H, \hat V_M(0) = V_\ell$，故比值為 $V_H/V_\ell$；當 $V_H/V_\ell > R$ 時 IC$_H$ 崩潰，進入 #c("fu2006") 的 pooling。
  - **部分相關**：比值介於 $1$ 與 $V_H/V_\ell$ 之間，依 $(p_H, p_\ell)$ 在臨界邊界兩側決定均衡型態。
- §6.4 的比較靜態（v9 line 133–141）保留：固定 $q$、看 $(p_H, p_\ell)$ 平面上的邊界與分離／pooling 區域，討論 $p_H$ 與 $p_\ell$ 對分離區的相對破壞力。
- §6.5 小結（v9 line 143–158）更新成「從獨立 $(p_H,p_\ell)=(q,1-q)$ → 部分相關 → 完全相關 $(1,1)$」的連續光譜論述。

### §6 中需要與既有 v9 對接的關鍵節點

- v9 已有 `prp-sep-exists`（line 86–96）給出基於 $\bar{V}_H/\bar{V}_L \le R$ 的分離條件；新框架的 IC$_H$ 須驗證與其等價（或顯示 v9 是 $q = 1/2$ 的特例）。
- v9 已有 `prp-boundary`（line 108–121）給出邊界 $s^*(q) = (5-3q)/4$（$V_H = 2, V_\ell = 1$ 時）；新框架的邊界 $p_\ell = 1 - p_H + T/(V_H - V_\ell)$ 須能還原此式。
- v9 圖 `partial_correlation_regions.png` 的座標需從 $(q, s)$ 改為 $(p_H, p_\ell)$。

## 8. 圖檔與 Python script 連動（對應 `draft/scripts/`）

1. **圖檔 script**：
   - `scripts/render_chapter5_figures.py`（Ch5）：把 $q$ 加為參數，重畫 `fig5_regions` 與 `fig5_payoffs`。
   - `scripts/render_chapter6_qs_regions.py`（Ch6）：座標從 $(q, s)$ 改為 $(p_H, p_\ell)$，固定 $q$ 為若干代表值；標示「獨立點」、「#c("fu2006") 角點」、邊界線。

2. **驗證 script**：
   - `scripts/verify_binary_model.py`：把先驗 $q$ 設為可調參數，重新驗證 Ch3–5 的兩點分配公式。
   - `scripts/verify_model_results.py`：同上。

3. **`refs.bib`**：不影響。

## 9. 拍板決議

以下三項均已於 2026-04-30 與作者確認：

- **Q1 → 拍板：$T$ 為內生／從 Tullock 推導，沿用 v9 既有 IC 路線。**

  **執行細節：**
  1. **不**引入外生 $T$；IC$_H$ 直接由 Tullock 報酬推出，沿用 v9 `prp-sep-exists` 的形式：
     $$\frac{V_H^2}{\hat V_M(1)} \;\ge\; \frac{V_\ell(2V_H - V_\ell)}{\hat V_M(0)}.$$
  2. v9 的 $\bar V_H, \bar V_L$ 改名對應為 $\hat V_M(1) = p_H V_H + (1 - p_H) V_\ell$ 與 $\hat V_M(0) = (1 - p_\ell) V_H + p_\ell V_\ell$，並以 $(p_H, p_\ell, q)$ 重新表達。
  3. Task 4 的差值 IC 寫法 $\hat V_M(1) - \hat V_M(0) \le T$ 與直線邊界 $p_\ell = 1 - p_H + T/(V_H - V_\ell)$ **不採用**；NotebookLM 提供的這版只作為 §6.3 段首的經濟直覺鋪陳（口語層），不進入正式命題。

  **§6.3 呈現結構（兩階段）：**
  - **直覺層（口語）**：「IC$_H$ 要求高型別偽裝後的相對成本不超過分離下的均衡淨值；隨著 $(p_H, p_\ell)$ 朝 $(1,1)$ 移動，$\hat V_M(1)$ 上升、$\hat V_M(0)$ 下降，偽裝誘因隨之強化。」
  - **正式層（命題）**：直接寫出 Tullock IC$_H$，得出非線性邊界曲線；驗證三個基準狀態（獨立、完全相關、部分相關）落在區域中的位置。
  - **比較靜態**：$d(\bar V_H/\bar V_L)/d p_H > 0$、$d(\bar V_H/\bar V_L)/d p_\ell > 0$，即 $p_H$ 與 $p_\ell$ 都把分離區壓縮，但相對破壞力不同（保留 v9 §6.4 的對應論述）。

- **Q2 → 拍板**：v9 §6.4「比較靜態」與 §6.5「小結」**結構保留、符號全部替換**為新框架（$p_H, p_\ell, q$）。

- **Q3 → 拍板**：Ch3–6 **全部一般化為 $q$**，Ch3 兩點分配先驗從 $1/2$ 改為 $q$，動差與所有下游公式同步調整。

## 10. 執行進度（即時更新）

### Phase 1：Ch3 (`draft/i18n/zh/chapters/03_model.typ`) ✅
- [x] 「環境」節後加入先驗 $q$ 段落（`def-prior`）
- [x] `def-binary` 改為以 $(V_\ell, V_H, q)$ 為基本參數
- [x] $\mu = q V_H + (1-q) V_\ell$、$\sigma^2 = q(1-q)(V_H - V_\ell)^2$ 派生量寫入
- [x] `tbl-moments` 兩點分配欄位更新為含 $q$
- [x] `prp-moments` 命題與內文敘述同步
- [x] 「資訊結構」段落的支持集敘述改為一般化

### Phase 2：Ch4 (`draft/i18n/zh/chapters/04_equilibria.typ`) ✅
- [x] 兩點型別 IC 檢驗段落（line 210–242）改為「先驗 $(q, 1-q)$ 下嚴格滿足」
- [x] 確認均衡公式只透過 $\kappa, \nu, \lambda$ 表達，不需修改
- [x] LM 的兩點分配函數化範例改為以 $\sigma_B^2(q)$ 表達

### Phase 3：Ch5 (`draft/i18n/zh/chapters/05_analysis.typ`) ✅
- [x] 兩點分配時序符號組合（line 228–235）改為 $(1-q, q)$ 加權
- [x] 資方時序偏好（`prp-mgmt`）兩點分配函數化範例更新動差
- [x] 福利公式兩點分配版本更新
- [x] `tbl-summary-distributions` 兩點分配欄位更新

### Phase 4：Ch6 (`draft/i18n/zh/chapters/06_extension.typ`) 全面重寫 ✅
- [x] §6.1 環境與聯合機率分配（含聯合機率表、邊際一致性、三個基準狀態）
- [x] §6.2 $\hat V_M(\mu)$、後驗信念、$d \hat V_M / d \mu = (p_H + p_\ell - 1)(V_H - V_\ell)$
- [x] §6.3 Tullock IC$_H$（內生路線）、$R = V_H^2/[V_\ell(2V_H - V_\ell)]$、非線性邊界
- [x] §6.4 比較靜態（$p_H$ vs $p_\ell$ 的相對破壞力）
- [x] §6.5 連續光譜論述（獨立 → 部分相關 → 完全相關）
- [x] 邊際一致性 $(1-q)(1-p_\ell) = q(1-p_H)$ 在每個座標寫法下都被尊重
- [x] 三個基準狀態精確落在各自區域（獨立點 IC 嚴格內、#c("fu2006") 點視 $V_H/V_\ell$ vs $R$ 大小）

### Phase 5：圖檔（`draft/scripts/render_chapter5_figures.py`, `draft/scripts/render_chapter6_qs_regions.py`) ✅
- [x] 兩點動差函數加入 $q$ 參數，向後相容預設 $q = 1/2$
- [x] `fig5_regions`：保留主圖並加入 $q$ 敏感度分欄
- [x] `fig5_payoffs`：依 $q$ 重算
- [x] `fig6_qs_regions`：座標改為 $(p_H, p_\ell)$、IC 由比值 $\hat V_M(1)/\hat V_M(0) \le R$ 決定（非線性邊界）

### Phase 6：驗證 script ✅
- [x] `draft/scripts/verify_binary_model.py` 加入 $q$，重新驗證兩點分配公式
- [x] `draft/scripts/verify_model_results.py` 同上

### Phase 7：附錄（`draft/i18n/zh/chapters/08_appendix.typ`) ✅
- [x] 動差比較證明改為 $q$ 一般化版
- [x] IC 推導補上 $\hat V_M(\mu)$ 框架下的證明

### Phase 8：編譯驗證
- [x] `make figures` 跑通
- [x] `make pdf`（中文版）跑通
- [ ] PDF 視覺校對：公式排版、圖標題、引用無誤

### Phase 9（後續）
- [ ] 中文版定稿後，`ideas/en/` 對應更新

## 11. 執行順序（建議）

1. **Day 1**：定稿 §3 符號表 → 改寫 Ch3 → `generate_figures.py` 加入 $q$ 參數。
2. **Day 2**：Ch4 表述微調 → Ch5 連動修改（兩點分配時序、福利、結果表）→ 跑 `verify_binary_model.py`。
3. **Day 3**：Ch6 全面重寫（Tullock 內生 IC 路線、$\hat V_M(\mu)$ 信念加權報酬、非線性邊界）。
4. **Day 4**：Ch8 附錄同步 → 跑全套圖 → 編譯 PDF → 視覺校對。
5. **Day 5**：自我校對 + 與教授對齊。
6. **後續**：英文版 `ideas/en/` 對應更新。
