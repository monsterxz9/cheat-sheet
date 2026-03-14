#!/bin/bash
# 小抄 PDF 生成器
# 用法: ./generate.sh <markdown文件> [css文件]
# 示例: ./generate.sh 期末复习.md
#       ./generate.sh notes.md custom.css

set -e

INPUT="${1:?用法: ./generate.sh <markdown文件> [css文件]}"
CSS="${2:-$(dirname "$0")/template.css}"
OUTPUT="${INPUT%.*}.pdf"

if ! command -v npx &>/dev/null; then
    echo "错误: 需要 Node.js 环境 (npx)" >&2
    exit 1
fi

echo "📄 输入: $INPUT"
echo "🎨 样式: $CSS"
echo "📤 输出: $OUTPUT"
echo ""

npx md-to-pdf "$INPUT" \
    --stylesheet "$CSS" \
    --pdf-options '{"format":"A4","margin":{"top":"1mm","right":"2mm","bottom":"1mm","left":"2mm"}}'

echo ""
echo "✅ 生成完成: $OUTPUT"

# macOS 自动打开预览
if [[ "$OSTYPE" == "darwin"* ]]; then
    open "$OUTPUT"
fi
