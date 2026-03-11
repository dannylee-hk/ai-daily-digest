# AI Daily Digest - Kimi K2.5 配置指南

## 🚀 快速開始

### 1. 設置 API Key

**獲取 BAILIAN_API_KEY：**
1. 訪問 https://bailian.console.aliyun.com/
2. 登錄阿里雲賬號
3. 進入「API Key 管理」
4. 創建新 API Key

**設置環境變量：**

```bash
# 添加到 ~/.zshrc 或 ~/.bashrc
export BAILIAN_API_KEY="sk-xxxxx"

# 重新加載
source ~/.zshrc
```

### 2. 安裝依賴

```bash
cd ~/.openclaw/danny_mind/Projects/ai-daily-digest

# 安裝 Bun (如果未安裝)
curl -fsSL https://bun.sh/install | bash

# 驗證安裝
bun --version
```

### 3. 運行

```bash
# 使用腳本
./run-digest.sh --hours 48 --top-n 15

# 或直接使用 bun
bun scripts/digest.ts --hours 48 --top-n 15 --lang zh
```

---

## 📋 參數說明

| 參數 | 說明 | 默認值 | 示例 |
|------|------|--------|------|
| `--hours` | 時間範圍（小時） | 48 | `--hours 24` |
| `--top-n` | 精選文章數量 | 15 | `--top-n 10` |
| `--lang` | 輸出語言 | zh | `--lang en` |
| `--output` | 輸出文件路徑 | `./digest-YYYYMMDD.md` | `--output ./my-digest.md` |

---

## 💰 成本估算

| 功能 | Token/次 | 每日次數 | 每月 Token | 每月成本 |
|------|---------|---------|-----------|---------|
| **評分** | 500 | 100 篇 | 1,500,000 | ~$0.75 |
| **摘要** | 1000 | 15 篇 | 450,000 | ~$0.23 |
| **分類** | 300 | 100 篇 | 900,000 | ~$0.45 |
| **趨勢** | 2000 | 1 次 | 60,000 | ~$0.03 |
| **總計** | - | - | **2,910,000** | **~$1.46/月** |

**注意：** Kimi K2.5 定價約 $0.5-1/1M tokens，比 Gemini 便宜 60%+

---

## 📁 輸出示例

生成的 Markdown 文件包含：

```markdown
# AI Daily Digest - 2026-03-10

## 📝 今日看点
[2-3 句宏觀趨勢總結]

## 🏆 今日必读 (Top 3)
### [中文標題](原文連結)
**原文標題：** [English Title]
**摘要：** [4-6 句結構化摘要]
**推薦理由：** [為什麼值得讀]
**關鍵詞：** #AI #ML #LLM

## 📊 數據概覽
| 指標 | 數值 |
|------|------|
| 總文章數 | 100 |
| AI 評分平均 | 7.5 |
| 分類分布 | [Mermaid 餅圖] |
| 關鍵詞雲 | [Mermaid 柱狀圖] |

## 📚 分類文章

### 🤖 AI / ML
1. [中文標題](連結) - 來源 - ⭐ 8.5 - [摘要]

### 🔒 安全
...

### ⚙️ 工程
...
```

---

## 🔧 Cron 自動化

### 每日 07:00 自動運行

```bash
# 編輯 crontab
crontab -e

# 添加以下行
0 7 * * * cd ~/.openclaw/danny_mind/Projects/ai-daily-digest && ./run-digest.sh --hours 48 --top-n 15 --output ~/.openclaw/danny_mind/Inbox/_sources/digest-$(date +\%Y\%m\%d).md >> ~/.openclaw/logs/digest-$(date +\%Y\%m\%d).log 2>&1
```

---

## 📊 與 BlogWatcher 集成

### 方案 1：手動導入

1. 運行 AI Daily Digest 生成 digest.md
2. 手動移動到 `danny_mind/Inbox/_sources/`
3. 在 Obsidian 中查看和整理

### 方案 2：自動化集成 (待實施)

```bash
#!/bin/bash
# digest-to-obsidian.sh

# 1. 生成 digest
./run-digest.sh --output /tmp/digest.md

# 2. 移動到 Obsidian
mv /tmp/digest.md ~/.openclaw/danny_mind/Inbox/_sources/

# 3. 更新 BlogWatcher 數據庫
# (待實現：解析 digest.md 並寫入 SQLite)

# 4. 發送 Telegram 通知
# (待實現：調用 Telegram API)
```

---

## 🐛 故障排除

### 問題 1: API Key 錯誤

```
Error: Missing API key. Set BAILIAN_API_KEY or KIMI_API_KEY.
```

**解決：**
```bash
echo $BAILIAN_API_KEY
# 如果為空，設置：
export BAILIAN_API_KEY="sk-xxxxx"
```

### 問題 2: Bun 未安裝

```
zsh: command not found: bun
```

**解決：**
```bash
curl -fsSL https://bun.sh/install | bash
source ~/.zshrc
```

### 問題 3: 網絡超時

```
Error: Timeout fetching RSS feeds
```

**解決：**
- 檢查網絡連接
- 增加超時時間（修改 `FEED_FETCH_TIMEOUT_MS`）
- 減少並發數（修改 `FEED_CONCURRENCY`）

---

## 📚 相關資源

- **GitHub:** https://github.com/vigorX777/ai-daily-digest
- **Kimi API:** https://platform.moonshot.cn/docs
- **阿里雲百煉:** https://bailian.console.aliyun.com/
- **Hacker News 博客源:** https://refactoringenglish.com/tools/hn-popularity/

---

**最後更新：** 2026-03-10  
**版本：** Kimi K2.5
