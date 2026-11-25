#!/usr/bin/env bash
# Download the latest changes from GitHub (e.g. after a code review):
#   ./scripts/pull.sh
set -euo pipefail
cd "$(dirname "$0")/.."

if [ -n "$(git status --porcelain)" ]; then
  echo "You have uncommitted changes. Commit them first with:"
  echo "  ./scripts/commit.sh \"message\""
  exit 1
fi

git pull
uv sync
