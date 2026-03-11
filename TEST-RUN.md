# 🚀 AI Daily Digest (Kimi K2.5) - 快速測試

## 步驟 1: 設置環境變量

```bash
export BAILIAN_API_KEY="sk-sp-6da4..."  # 你的完整 API Key
export PATH="$HOME/.bun/bin:$PATH"
```

## 步驟 2: 測試運行

```bash
cd ~/.openclaw/danny_mind/Projects/ai-daily-digest

# 測試模式：僅抓取 24 小時內的文章，精選 3 篇
bun scripts/digest.ts --hours 24 --top-n 3 --lang zh --output ./test-digest.md
```

## 步驟 3: 查看結果

```bash
cat ./test-digest.md
```

---

## 預期輸出

```
[digest] === AI Daily Digest (Kimi K2.5) ===
[digest] Time range: 24 hours
[digest] Top N: 3
[digest] Language: zh
[digest] Output: ./test-digest.md
[digest] AI provider: Kimi K2.5 via Bailian

[digest] Step 1/5: Fetching 90 RSS feeds...
[digest] Progress: 10/90 feeds processed (8 ok, 2 failed)
[digest] Progress: 20/90 feeds processed (16 ok, 4 failed)
...
[digest] Fetched 150 articles from 75 feeds (15 failed)

[digest] Step 2/5: Filtering by time range (24 hours)...
[digest] Found 45 articles within last 24 hours

[digest] Step 3/5: AI scoring 45 articles...
[digest] AI scoring complete

[digest] Step 4/5: Generating summaries for top 3 articles...
[digest] Summaries complete

[digest] Step 5/5: Generating report...
[digest] Report saved to ./test-digest.md

✅ Complete! Digest generated successfully.
```

---

## 成本估算（測試）

| 項目 | Token | 成本 |
|------|-------|------|
| **評分 (45 篇)** | 22,500 | ~$0.01 |
| **摘要 (3 篇)** | 3,000 | ~$0.002 |
| **分類 (45 篇)** | 13,500 | ~$0.007 |
| **趨勢 (1 次)** | 2,000 | ~$0.001 |
| **總計** | **41,000** | **~$0.02** |

**測試成本僅約 $0.02！**

---

## 下一步

測試成功後，可以：

1. **正式運行** - `--hours 48 --top-n 15`
2. **設置 Cron** - 每日 07:00 自動運行
3. **集成 BlogWatcher** - 將結果導入 Obsidian
