# 論文專案說明

## 專案概況

碩士論文，主題為競賽模型（contest model）中的資訊不對稱與型別相關結構。使用 **Typst** 排版（非 LaTeX）。

- 論文主檔：`docs/main.typ`（非 `docs/thesis.typ`）
- 章節：`docs/chapters/`
- 樣式定義（環境、字型、巨集）全部集中在 `docs/thesis.typ`
- 編譯指令：`typst compile --root . --font-path docs/fonts --ignore-system-fonts docs/main.typ docs/main.pdf`
- 快速編譯：`make draft`（會先跑 Python figures）；只編譯 Typst：直接用上面指令

## Typst 注意事項

- 數學算子用 `math.op("name")` 定義，例如 `corr`、`bern`
- 相關係數符號：`rho`（非 `\rho`）
- 波浪號：`~`（非 `sim`）
- 自訂巨集：`corr`、`bern`、`widetilde`、`headingref`、`stmtref` 等，定義在 `thesis.typ`，各章節需 import
- 函數型別宣告用 `->` (→)，逐點映射用 `|->` (↦)，兩者語義不同勿混用

## 方程式編號規則

- **全局開啟編號**：`set math.equation(numbering: "(1)", supplement: [式])` 在 `thesis.typ` 的 `thesis()` 函數裡
- **僅有 label 的式子才顯示編號**：`definition`、`lemma`、`proposition`、`theorem`、`example`、`proof` 的 body block 裡均已加 `set math.equation(numbering: none)`，確保環境內的式子不顯示編號
- **章節 reset**：`show heading.where(level: 1)` 裡呼叫 `counter(math.equation).update(0)`，每章從 (1) 重新計數
- **手動 reset**：若章節開頭有無編號的 display math（如 definition 內部），導致第一個重要式子編號不是 (1)，在該式子前加 `#counter(math.equation).update(0)` 手動歸零。目前 ch4 的 `<eq-main-posterior>` 前有此設定
- **`show ref`**：已客製化，讀取 `counter(math.equation)` 並顯示「式 (#n)」格式

## 交叉引用規則

- 圖表、方程式：用 `@label`
- 章節：用 `#headingref(<label>)`
- 定義、引理、命題等自訂環境：用 `#stmtref(<label>, "引理", "lemma-counter")`，**不能用 `@label`**（會報 "cannot reference context" 錯誤）

## 術語規範

- 「獎酬相關」優先於「型別相關」（描述 ρ 結構時）
- 「高型別／低型別／型別分配」為標準賽局理論術語，保留不改
- 避免工程或管理類用語（如「規格」、「標的環境」、「共同成分」）
- 後驗信念符號：`mu`（μ），非 `m`——賽局理論文獻標準（Cho & Kreps 1987 以降）
- $\mathbb{E}[V_U \mid x_I]$ 稱為「後驗期望獎酬」(posterior expected valuation)，首次出現時附半形括號英文；不使用「有效獎酬」
- 條件機率：`theta_H`、`theta_L`（$\theta_H, \theta_L$）表示在知情者高／低型別條件下不知情者為高型別的機率

## 符號系統（ch4 核心模型）

| 符號 | 意義 |
|------|------|
| $q$ | 高型別先驗機率 |
| $\rho \in [0,1]$ | 皮爾森相關係數，衡量 $V_I, V_U$ 之獎酬相關程度 |
| $H_I, H_U$ | 高型別指示變數，$H_k = \mathbf{1}\{V_k = v_H\}$ |
| $\mu(x_I) : \mathbb{R}_+ \to [0,1]$ | 不知情者的後驗信念，$\Pr(V_I = v_H \mid x_I)$ |
| $\theta_H$ | $\Pr(V_U = v_H \mid V_I = v_H) = q + \rho(1-q)$ |
| $\theta_L$ | $\Pr(V_U = v_H \mid V_I = v_L) = q(1-\rho)$ |

## 文字風格

- 中文學術寫作，簡潔直接，避免冗言
- 採臺灣學術用語，避免使用「考察」等中國用語；依語境改用「分析」、「檢視」或「說明」
- backward induction 譯為「反向演繹」
- 避免與其他章節重複定義或公式
- 腳注用於補充說明，需有實質內容（例如真實案例）
- **改動前務必先解釋，未經明確授權不得修改檔案**

## 排版偏好

- 定義、引理、命題、定理、範例後若接證明，間距由 proof 的 `above` 控制（weak spacing）
- 各環境結束後，下一段需縮排 2em（透過 `par(h(0pt, weak: true))` 實現）
- 圖片後也需縮排：`show figure` rule 裡已加 `par(h(0pt, weak: true))`
- 腳注行距：`leading: 12pt`
- 圖表標籤（表 x、圖 x）使用 heading font（Roboto + TaiwanPearl Light），caption 正文維持一般字體，分隔為 1em 間距（無冒號）
- 三線表：`table.hline(y:0, stroke:0.6pt)`、`table.hline(y:1, stroke:0.4pt)`、`table.hline(y:n, stroke:0.6pt)`

## 第四章目前規劃

- 目前 `docs/chapters/04_main_model.typ` 的主體先完成部分相關結構、後驗期望獎酬、最佳反應，以及 `SS`、`UI`、`IU` 三個子賽局
- 下一步進入 `4.4`，主題為**內生時序選擇**
- `4.4.1` 應先建立**第 0 階段的制度報酬矩陣**：將 `SS`、`UI`、`IU` 三個子賽局的**事前期望報酬**代回第 0 階段的 `2 x 2` 時序賽局
- `4.4.1` 必須明確說明：知情者在第 0 階段尚未觀察型別，因此比較的是**事前期望報酬**，不是型別 realization 後的報酬
- `4.4.2` 講**單邊偏離差額與最佳反應**：將第 0 階段的時序選擇整理成幾個報酬差額的符號判斷問題
- `4.4.3` 講**純策略時序均衡**：利用前一小節的偏離差額，刻畫第 0 階段有哪些純策略 Nash 均衡
- 結構上可參考 `/Users/anthonysung/Downloads/Thesis-idea-v13.pdf` 的舊第 5 章材料；但在目前本文中，這些內容預計吸收到第 4 章的 `4.4`

<!-- rtk-instructions v2 -->
# RTK (Rust Token Killer) - Token-Optimized Commands

## Golden Rule

**Always prefix commands with `rtk`**. If RTK has a dedicated filter, it uses it. If not, it passes through unchanged. This means RTK is always safe to use.

**Important**: Even in command chains with `&&`, use `rtk`:
```bash
# ❌ Wrong
git add . && git commit -m "msg" && git push

# ✅ Correct
rtk git add . && rtk git commit -m "msg" && rtk git push
```

## RTK Commands by Workflow

### Build & Compile (80-90% savings)
```bash
rtk cargo build         # Cargo build output
rtk cargo check         # Cargo check output
rtk cargo clippy        # Clippy warnings grouped by file (80%)
rtk tsc                 # TypeScript errors grouped by file/code (83%)
rtk lint                # ESLint/Biome violations grouped (84%)
rtk prettier --check    # Files needing format only (70%)
rtk next build          # Next.js build with route metrics (87%)
```

### Test (60-99% savings)
```bash
rtk cargo test          # Cargo test failures only (90%)
rtk go test             # Go test failures only (90%)
rtk jest                # Jest failures only (99.5%)
rtk vitest              # Vitest failures only (99.5%)
rtk playwright test     # Playwright failures only (94%)
rtk pytest              # Python test failures only (90%)
rtk rake test           # Ruby test failures only (90%)
rtk rspec               # RSpec test failures only (60%)
rtk test <cmd>          # Generic test wrapper - failures only
```

### Git (59-80% savings)
```bash
rtk git status          # Compact status
rtk git log             # Compact log (works with all git flags)
rtk git diff            # Compact diff (80%)
rtk git show            # Compact show (80%)
rtk git add             # Ultra-compact confirmations (59%)
rtk git commit          # Ultra-compact confirmations (59%)
rtk git push            # Ultra-compact confirmations
rtk git pull            # Ultra-compact confirmations
rtk git branch          # Compact branch list
rtk git fetch           # Compact fetch
rtk git stash           # Compact stash
rtk git worktree        # Compact worktree
```

Note: Git passthrough works for ALL subcommands, even those not explicitly listed.

### GitHub (26-87% savings)
```bash
rtk gh pr view <num>    # Compact PR view (87%)
rtk gh pr checks        # Compact PR checks (79%)
rtk gh run list         # Compact workflow runs (82%)
rtk gh issue list       # Compact issue list (80%)
rtk gh api              # Compact API responses (26%)
```

### JavaScript/TypeScript Tooling (70-90% savings)
```bash
rtk pnpm list           # Compact dependency tree (70%)
rtk pnpm outdated       # Compact outdated packages (80%)
rtk pnpm install        # Compact install output (90%)
rtk npm run <script>    # Compact npm script output
rtk npx <cmd>           # Compact npx command output
rtk prisma              # Prisma without ASCII art (88%)
```

### Files & Search (60-75% savings)
```bash
rtk ls <path>           # Tree format, compact (65%)
rtk read <file>         # Code reading with filtering (60%)
rtk grep <pattern>      # Search grouped by file (75%). Format flags (-c, -l, -L, -o, -Z) run raw.
rtk find <pattern>      # Find grouped by directory (70%)
```

### Analysis & Debug (70-90% savings)
```bash
rtk err <cmd>           # Filter errors only from any command
rtk log <file>          # Deduplicated logs with counts
rtk json <file>         # JSON structure without values
rtk deps                # Dependency overview
rtk env                 # Environment variables compact
rtk summary <cmd>       # Smart summary of command output
rtk diff                # Ultra-compact diffs
```

### Infrastructure (85% savings)
```bash
rtk docker ps           # Compact container list
rtk docker images       # Compact image list
rtk docker logs <c>     # Deduplicated logs
rtk kubectl get         # Compact resource list
rtk kubectl logs        # Deduplicated pod logs
```

### Network (65-70% savings)
```bash
rtk curl <url>          # Compact HTTP responses (70%)
rtk wget <url>          # Compact download output (65%)
```

### Meta Commands
```bash
rtk gain                # View token savings statistics
rtk gain --history      # View command history with savings
rtk discover            # Analyze Codex sessions for missed RTK usage
rtk proxy <cmd>         # Run command without filtering (for debugging)
rtk init                # Add RTK instructions to AGENTS.md
rtk init --global       # Add RTK to ~/.Codex/AGENTS.md
```

## Token Savings Overview

| Category | Commands | Typical Savings |
|----------|----------|-----------------|
| Tests | vitest, playwright, cargo test | 90-99% |
| Build | next, tsc, lint, prettier | 70-87% |
| Git | status, log, diff, add, commit | 59-80% |
| GitHub | gh pr, gh run, gh issue | 26-87% |
| Package Managers | pnpm, npm, npx | 70-90% |
| Files | ls, read, grep, find | 60-75% |
| Infrastructure | docker, kubectl | 85% |
| Network | curl, wget | 65-70% |

Overall average: **60-90% token reduction** on common development operations.
<!-- /rtk-instructions -->