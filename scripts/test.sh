#!/usr/bin/env bash
# Run the tests:
#   ./scripts/test.sh                 # run all tests
#   ./scripts/test.sh tests/test_main.py   # run one file
#   ./scripts/test.sh -k hand         # run tests with "hand" in the name
set -euo pipefail
cd "$(dirname "$0")/.."
uv run pytest -v "$@"
