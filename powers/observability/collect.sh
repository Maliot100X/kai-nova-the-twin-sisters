#!/bin/bash
set -euo pipefail

WORKSPACE="${JORK_WORKSPACE:-./workspace}"
LOGFILE="${WORKSPACE}/.jork/jork.log"
OUTPUT="workspace/powers/observability/output.txt"

mkdir -p "$(dirname "$OUTPUT")"

if [ -f "$LOGFILE" ]; then
  tail -n 200 "$LOGFILE" > "$OUTPUT"
  echo "Collected tail of jork.log to $OUTPUT" >&2
else
  echo "No log file found at $LOGFILE" >&2
fi

if command -v pm2 &> /dev/null; then
  pm2 status | tail -n 20 >> "$OUTPUT"
  echo "Appended pm2 status" >&2
fi
