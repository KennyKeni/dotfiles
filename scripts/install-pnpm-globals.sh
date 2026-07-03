#!/usr/bin/env bash
set -euo pipefail

script_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
repo_root="$(CDPATH= cd -- "$script_dir/.." && pwd)"
package_file="$repo_root/packages/pnpm-globals.txt"

if ! command -v pnpm >/dev/null 2>&1; then
  echo "pnpm is not on PATH. Install pnpm before installing global packages." >&2
  exit 1
fi

while IFS= read -r package || [ -n "$package" ]; do
  case "$package" in
    ""|\#*) continue ;;
  esac

  pnpm add -g "$package"
done < "$package_file"
