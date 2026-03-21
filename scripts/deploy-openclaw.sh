#!/bin/bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"

if [ -z "${OPENCLAW_GATEWAY_TOKEN:-}" ]; then
  echo "ERROR: OPENCLAW_GATEWAY_TOKEN must be set." >&2
  exit 1
fi

MISSION_NAME="${OPENCLAW_MISSION_NAME:-KaiNova-Deployment}"
COMMIT_HASH=$(git rev-parse HEAD)
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

PAYLOAD=$(cat <<EOF
Kai&Nova The Twin Sisters deployment
- mission: $MISSION_NAME
- commit: $COMMIT_HASH
- timestamp: $TIMESTAMP
EOF
)

if ! command -v hermes &> /dev/null; then
  echo "WARNING: hermes CLI is not available locally. Install it or run this script from a machine that has hermes." >&2
  echo "Payload preview:\n$PAYLOAD"
  exit 0
fi

hermes openclaw run \
  --gateway "$OPENCLAW_GATEWAY_TOKEN" \
  --mission "$MISSION_NAME" \
  --description "Deploy commit $COMMIT_HASH" \
  --payload "$PAYLOAD"
