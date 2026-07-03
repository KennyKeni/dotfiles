#!/usr/bin/env bash
set -euo pipefail

script_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
repo_root="$(CDPATH= cd -- "$script_dir/.." && pwd)"

if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi

brew bundle --file "$repo_root/Brewfile"

"$repo_root/scripts/link.sh"

if command -v mise >/dev/null 2>&1; then
  mise install
else
  echo "mise is not on PATH after brew bundle." >&2
  exit 1
fi

"$repo_root/scripts/install-pnpm-globals.sh"
