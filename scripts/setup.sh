#!/usr/bin/env bash
# First-time setup. Run this once after cloning the repo:
#   ./scripts/setup.sh
set -euo pipefail
cd "$(dirname "$0")/.."

if ! command -v uv >/dev/null 2>&1; then
  echo "uv is not installed. Install it with:"
  echo "  curl -LsSf https://astral.sh/uv/install.sh | sh"
  echo "Then open a new terminal and run this script again."
  exit 1
fi

if [ -z "$(git config user.name || true)" ] || [ -z "$(git config user.email || true)" ]; then
  echo "Git doesn't know who you are yet. Set it up with:"
  echo '  git config --global user.name "Your Name"'
  echo '  git config --global user.email "you@example.com"'
  echo
fi

echo "Installing Python and project tools..."
uv sync

echo
echo "All set! Try:"
echo "  ./scripts/run.sh     # play the game"
echo "  ./scripts/test.sh    # run the tests"
