# PaperQuire Render Action — Sample Document

## Overview

This sample document verifies that the PaperQuire render action can convert Markdown to a branded PDF. It exercises common Markdown features to ensure correct rendering.

## Formatting

Here is **bold text**, *italic text*, and `inline code`. You can also use ~~strikethrough~~ and [hyperlinks](https://paperquire.com).

## Lists

### Unordered

- First item
- Second item with a longer description that wraps across lines
- Third item
  - Nested item A
  - Nested item B

### Ordered

1. Step one
2. Step two
3. Step three

## Code Block

```javascript
function greet(name) {
  return `Hello, ${name}! Your PDF was rendered by PaperQuire.`;
}
```

## Table

| Feature         | Status |
|-----------------|--------|
| Headings        | Pass   |
| Lists           | Pass   |
| Code blocks     | Pass   |
| Tables          | Pass   |
| Blockquotes     | Pass   |

## Blockquote

> PaperQuire turns Markdown into print-ready, branded PDFs — no design tools required.

## Conclusion

If you can read this as a PDF, the render action is working correctly.
