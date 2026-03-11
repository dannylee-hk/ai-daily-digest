#!/bin/bash
# AI Daily Digest - Kimi K2.5 Version
# 使用 Kimi K2.5 (阿里雲百煉) 運行 AI Daily Digest

set -e

# 環境變量檢查
if [ -z "$BAILIAN_API_KEY" ]; then
    echo "❌ 錯誤：BAILIAN_API_KEY 未設置"
    echo "請在 ~/.zshrc 或 ~/.bashrc 中添加："
    echo "  export BAILIAN_API_KEY='your-key-here'"
    exit 1
fi

# 切換到項目目錄
cd "$(dirname "$0")/ai-daily-digest"

# 默認參數
HOURS=${HOURS:-48}
TOP_N=${TOP_N:-15}
LANG=${LANG:-zh}
OUTPUT=${OUTPUT:-""}

# 解析命令行參數
while [[ $# -gt 0 ]]; do
    case $1 in
        --hours)
            HOURS="$2"
            shift 2
            ;;
        --top-n)
            TOP_N="$2"
            shift 2
            ;;
        --lang)
            LANG="$2"
            shift 2
            ;;
        --output)
            OUTPUT="$2"
            shift 2
            ;;
        --help)
            echo "用法：./run-digest.sh [選項]"
            echo ""
            echo "選項:"
            echo "  --hours <n>     時間範圍（小時），默認 48"
            echo "  --top-n <n>     精選文章數量，默認 15"
            echo "  --lang <lang>   語言 (zh/en)，默認 zh"
            echo "  --output <path> 輸出文件路徑"
            echo "  --help          顯示幫助"
            exit 0
            ;;
        *)
            echo "未知選項：$1"
            exit 1
            ;;
    esac
done

# 構建命令
CMD="bun scripts/digest.ts --hours $HOURS --top-n $TOP_N --lang $LANG"

if [ -n "$OUTPUT" ]; then
    CMD="$CMD --output $OUTPUT"
fi

echo "🚀 開始運行 AI Daily Digest (Kimi K2.5)"
echo "========================================"
echo "時間範圍：${HOURS}小時"
echo "精選數量：${TOP_N}篇"
echo "語言：${LANG}"
echo ""

# 執行
eval $CMD

echo ""
echo "✅ 完成！"
