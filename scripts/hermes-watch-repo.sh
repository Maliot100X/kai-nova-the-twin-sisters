#!/bin/bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"

WATCH_DIRS=(README.md scripts src powers)
INOTIFY_CMD=$(command -v inotifywait || true)
if [ -z "$INOTIFY_CMD" ]; then
  echo "ERROR: inotifywait is required (install inotify-tools)." >&2
  exit 1
fi

while true; do
  echo "Waiting for changes in ${WATCH_DIRS[*]}..."
  "$INOTIFY_CMD" -qq -e modify,create,delete -r "${WATCH_DIRS[@]}"
  echo "Change detected - running deploy hook at $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
  if ./scripts/deploy-openclaw.sh; then
    echo "OpenClaw deployment hook executed successfully."
  else
    echo "OpenClaw deployment hook failed. Check logs above." >&2
  fi
  sleep 3
done
