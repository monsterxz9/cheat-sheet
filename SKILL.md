---
name: cheat-sheet
description: Generate one-page A4 cheat sheet PDFs from markdown content. Use this skill whenever the user wants to create a cheat sheet, exam crib sheet, revision notes, study guide, or any compact reference document meant to be printed on paper. Also trigger when the user asks to "squeeze content onto one page", "make a printable summary", or mentions 小抄/复习资料/速查表.
---

# Cheat Sheet Generator

Turn markdown content into a densely-packed, color-coded, one-page A4 PDF optimized for printing.

## Project Location

- **Project root**: `~/code/cheat-sheet/`
- **CSS template**: `~/code/cheat-sheet/template.css`
- **Generate script**: `~/code/cheat-sheet/generate.sh`
- **GitHub**: `monsterxz9/cheat-sheet`

## Workflow

### Step 1: Prepare Content

Write content in markdown using these conventions for visual hierarchy:

| Markdown | Renders as | Purpose |
|----------|-----------|---------|
| `###` | Blue background bar, spans full width | Chapter / major section |
| `####` | Blue left border, light blue background | Subsection |
| `**bold**` | Red text | Key terms, definitions |
| `- item` | Compact bullet list | Details, sub-points |
| `1. item` | Numbered list | Sequential steps |

Writing tips for maximum density:
- Use `—` (em dash) to connect keyword and explanation instead of full sentences
- Use `→` for cause/effect or flow relationships
- Use `|` to separate parallel items on one line
- Use `↑ ↓` for increase/decrease
- Prefer lists over paragraphs — lists are more compact
- Delete filler phrases ("通过以上步骤", "例如", etc.)
- One sentence per point, no elaboration unless critical

### Step 2: Generate PDF

```bash
# Using the generate script (auto-opens Preview on macOS)
~/code/cheat-sheet/generate.sh content.md

# Or with custom CSS
~/code/cheat-sheet/generate.sh content.md custom.css

# Or manually via npx
npx md-to-pdf content.md \
  --stylesheet ~/code/cheat-sheet/template.css \
  --pdf-options '{"format":"A4","margin":{"top":"1mm","right":"2mm","bottom":"1mm","left":"2mm"}}'
```

### Step 3: Adjust Density

Open the generated PDF and evaluate page fill. Adjust CSS parameters:

| Scenario | font-size | line-height | columns | Notes |
|----------|-----------|-------------|---------|-------|
| Default | 8px | 1.1 | 2 | Works for most content |
| Content too much | 7px | 1.05 | 3 | Chinese minimum readable |
| Content too little | 9-10px | 1.2 | 2 | Fill the page |

Edit the CSS `body` block to adjust. Key properties:
```css
body {
    font-size: 8px;      /* adjust this */
    line-height: 1.1;    /* adjust this */
    columns: 2;          /* 2 or 3 */
}
```

## Default CSS Parameters

These are the battle-tested values in `template.css`:

- **Font**: `'Songti SC', 'STSong', 'PingFang SC'` — macOS native Chinese fonts. On Windows use `SimSun`
- **Body**: 8px, line-height 1.1, 2-column, column-gap 5px
- **Page**: A4, margin 1-2mm (near-zero)
- **h3** (chapter): `background: #1d4ed8`, white text, 8.5px, `column-span: all`
- **h4** (section): `border-left: 1.5px solid #2563eb`, `background: #eff6ff`, 8px
- **strong**: `color: #b91c1c` (red highlight)
- **h1, h2**: Hidden (height 0) — used for markdown structure only, don't waste space
- **All margins/paddings**: Near zero

## Important Notes

- Chinese text below 7px will not render in PDF (appears as dots)
- `column-span: all` on h3 makes chapter headers span across all columns
- `break-after: avoid` on headers prevents orphaned headers at column bottom
- Font must be `Songti SC` or `PingFang SC` on macOS — do NOT use Windows font paths
- The tool is `md-to-pdf` via npx — no global install needed
