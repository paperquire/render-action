# PaperQuire Render Action

A GitHub Action that renders Markdown files to branded, print-ready PDFs using [PaperQuire](https://paperquire.com).

## Usage

```yaml
name: Generate PDFs

on:
  push:
    paths:
      - 'docs/**/*.md'

jobs:
  render:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - uses: paperquire/render-action@v1
        id: render
        with:
          files: 'docs/*.md'
          template: minimal-clean
          output: build/pdfs

      - uses: actions/upload-artifact@v4
        with:
          name: pdfs
          path: build/pdfs/
```

## Inputs

| Input | Required | Default | Description |
|---|---|---|---|
| `files` | **yes** | — | Glob pattern for Markdown files (e.g. `docs/*.md`) |
| `template` | no | `minimal-clean` | PaperQuire template ID |
| `output` | no | `output/` | Output directory for generated PDFs |

## Outputs

| Output | Description |
|---|---|
| `pdf-files` | Newline-separated list of generated PDF file paths |

## Templates

PaperQuire ships with several built-in templates:

- `minimal-clean` — Clean, minimal layout (default)
- `executive-report` — Corporate report with cover page
- `technical-doc` — Technical documentation style

## Examples

### Render on push and upload as artifact

```yaml
- uses: paperquire/render-action@v1
  with:
    files: 'docs/*.md'
    output: build/pdfs

- uses: actions/upload-artifact@v4
  with:
    name: pdfs
    path: build/pdfs/
```

### Render with a specific template

```yaml
- uses: paperquire/render-action@v1
  with:
    files: 'reports/**/*.md'
    template: executive-report
    output: reports/pdf
```

### Use rendered PDFs in subsequent steps

```yaml
- uses: paperquire/render-action@v1
  id: render
  with:
    files: 'docs/*.md'

- name: List generated PDFs
  run: echo "${{ steps.render.outputs.pdf-files }}"
```

## How it works

1. Matches Markdown files using the `files` glob pattern
2. Renders each file to PDF using PaperQuire's built-in Chromium renderer
3. Outputs the list of generated PDF paths for use in subsequent steps

No external dependencies like Pandoc or WeasyPrint are needed — PaperQuire uses Electron's headless Chromium for rendering.

## License

MIT
