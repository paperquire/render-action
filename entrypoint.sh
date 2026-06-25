#!/bin/bash
set -euo pipefail

FILES_PATTERN="$1"
TEMPLATE="${2:-minimal-clean}"
OUTPUT_DIR="${3:-output}"

mkdir -p "$OUTPUT_DIR"

GENERATED=""
COUNT=0

for f in $FILES_PATTERN; do
  [ -f "$f" ] || continue
  base=$(basename "$f" .md)
  out="$OUTPUT_DIR/${base}.pdf"
  echo "Rendering: $f → $out (template: $TEMPLATE)"
  paperquire render "$f" --template "$TEMPLATE" --output "$out"
  GENERATED="${GENERATED}${out}"$'\n'
  COUNT=$((COUNT + 1))
done

if [ "$COUNT" -eq 0 ]; then
  echo "::warning::No Markdown files matched the pattern: $FILES_PATTERN"
  exit 0
fi

echo "Successfully rendered $COUNT PDF(s)"

# Set action output
{
  echo "pdf-files<<EOF"
  echo -n "$GENERATED"
  echo "EOF"
} >> "$GITHUB_OUTPUT"
