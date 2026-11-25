#!/usr/bin/env bash
# Throw away changes to one file and go back to the last committed version:
#   ./scripts/undo.sh blackjack/deck.py
set -euo pipefail
cd "$(dirname "$0")/.."

file="${1:-}"
if [ -z "$file" ]; then
  echo "Which file? Example: ./scripts/undo.sh blackjack/deck.py"
  echo
  git status --short
  exit 1
fi

read -r -p "This deletes your uncommitted changes to $file. Are you sure? (y/N) " answer
if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
  git restore -- "$file"
  echo "Restored $file to the last commit."
else
  echo "Nothing changed."
fi
