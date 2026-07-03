#!/usr/bin/env bash
set -euo pipefail

script_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
repo_root="$(CDPATH= cd -- "$script_dir/.." && pwd)"
stow_dir="$repo_root/stow"
dry_run=0
packages=()

usage() {
  cat <<'USAGE'
Usage: scripts/link.sh [--dry-run|-n] [package ...]

Back up conflicting files under ~/.dotfiles-backup, then symlink packages with
GNU Stow. If no packages are provided, all packages under stow/ are linked.
USAGE
}

resolve_existing() {
  if command -v realpath >/dev/null 2>&1; then
    realpath "$1" 2>/dev/null && return 0
  fi

  perl -MCwd=abs_path -e 'my $p = abs_path($ARGV[0]); print $p if defined $p' "$1"
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    -n|--dry-run)
      dry_run=1
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    --)
      shift
      while [ "$#" -gt 0 ]; do
        packages+=("$1")
        shift
      done
      break
      ;;
    -*)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 2
      ;;
    *)
      packages+=("$1")
      ;;
  esac
  shift
done

if ! command -v stow >/dev/null 2>&1; then
  echo "GNU Stow is required. Install it with: brew install stow" >&2
  exit 1
fi

if [ "${#packages[@]}" -eq 0 ]; then
  for package_dir in "$stow_dir"/*; do
    [ -d "$package_dir" ] || continue
    packages+=("$(basename "$package_dir")")
  done
fi

timestamp="$(date +%Y%m%d-%H%M%S)"
backup_root="$HOME/.dotfiles-backup/$timestamp"
conflict_count=0

for package in "${packages[@]}"; do
  package_dir="$stow_dir/$package"
  if [ ! -d "$package_dir" ]; then
    echo "Unknown package: $package" >&2
    exit 1
  fi

  while IFS= read -r -d '' source_path; do
    rel_path="${source_path#$package_dir/}"
    target_path="$HOME/$rel_path"

    if [ ! -e "$target_path" ] && [ ! -L "$target_path" ]; then
      continue
    fi

    if [ -L "$target_path" ]; then
      resolved_target="$(resolve_existing "$target_path" || true)"
      case "$resolved_target" in
        "$stow_dir"/*)
          continue
          ;;
      esac
    fi

    conflict_count=$((conflict_count + 1))
    backup_path="$backup_root/$rel_path"

    if [ "$dry_run" -eq 1 ]; then
      echo "would back up: $target_path -> $backup_path"
    else
      mkdir -p "$(dirname "$backup_path")"
      mv "$target_path" "$backup_path"
      echo "backed up: $target_path -> $backup_path"
    fi
  done < <(find "$package_dir" -type f -print0)
done

if [ "$dry_run" -eq 1 ]; then
  if [ "$conflict_count" -gt 0 ]; then
    echo "dry run found $conflict_count conflicting file(s). Live mode backs these up before running Stow."
    exit 0
  fi

  exec stow --no-folding -n -v -d "$stow_dir" -t "$HOME" "${packages[@]}"
fi

stow --no-folding -d "$stow_dir" -t "$HOME" "${packages[@]}"

if [ "$conflict_count" -gt 0 ]; then
  echo "Backups saved under: $backup_root"
fi
