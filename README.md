# Cheat Sheet Generator

Markdown → 一页 A4 小抄 PDF，极限排版。

## 快速使用

```bash
# 1. 用 markdown 写复习内容
vim 期末复习.md

# 2. 一键生成 PDF（macOS 自动打开预览）
./generate.sh 期末复习.md

# 3. 用自定义样式
./generate.sh 期末复习.md my-style.css
```

## Markdown 写法

```markdown
### 一、大章标题（蓝色色块）
#### （一）小节标题（蓝色边框）
1. **关键词** — 简要说明
2. **要点** — 用破折号连接
   - 子要点
```

- `###` = 大章标题（蓝色色块，跨全栏）
- `####` = 小节标题（蓝色左边框）
- `**加粗**` = 关键词（红色高亮）
- 优先用列表，避免长段落

## 排版调参

| 场景 | 字号 | 行距 | 栏数 |
|------|------|------|------|
| 默认 | 8px | 1.1 | 2 |
| 内容特别多 | 7px | 1.05 | 3 |
| 内容偏少 | 9-10px | 1.2 | 2 |

修改 `template.css` 中的 `font-size`、`line-height`、`columns` 即可。

## 依赖

- Node.js（npx）
- md-to-pdf（自动通过 npx 调用）
