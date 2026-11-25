#!/usr/bin/env bash
# Upload your commits to GitHub:
#   ./scripts/push.sh
set -euo pipefail
cd "$(dirname "$0")/.."

if [ -n "$(git status --porcelain)" ]; then
  echo "Heads up: you have changes that aren't committed yet."
  echo "Run ./scripts/commit.sh \"message\" first if you want them included."
  echo
fi

branch="$(git branch --show-current)"
git push -u origin "$branch"
