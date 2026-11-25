#!/usr/bin/env bash
# See what you've changed since your last commit:
#   ./scripts/status.sh
set -euo pipefail
cd "$(dirname "$0")/.."

echo "=== Files changed ==="
git status --short
echo
echo "=== Last 5 commits ==="
git log --oneline -5
