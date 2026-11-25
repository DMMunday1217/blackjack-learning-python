#!/usr/bin/env bash
# Save your work as a commit (runs the tests first):
#   ./scripts/commit.sh "Add a Card class"
set -euo pipefail
cd "$(dirname "$0")/.."

message="${1:-}"
if [ -z "$message" ]; then
  read -r -p "Describe what you changed: " message
fi
if [ -z "$message" ]; then
  echo "A commit needs a message. Nothing was committed."
  exit 1
fi

if [ -z "$(git status --porcelain)" ]; then
  echo "Nothing has changed since your last commit."
  exit 0
fi

echo "Running tests first..."
if ! uv run pytest -q; then
  read -r -p "Tests failed. Commit anyway? (y/N) " answer
  if [ "$answer" != "y" ] && [ "$answer" != "Y" ]; then
    echo "Nothing was committed. Fix the tests and try again."
    exit 1
  fi
fi

git add -A
git commit -m "$message"
echo
echo "Committed! Run ./scripts/push.sh to upload it to GitHub."
