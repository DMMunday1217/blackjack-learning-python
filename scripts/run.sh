#!/usr/bin/env bash
# Play the game:
#   ./scripts/run.sh
set -euo pipefail
cd "$(dirname "$0")/.."
uv run python main.py "$@"
