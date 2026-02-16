#!/usr/bin/env bash
# Run one step or everything. Examples:
#   ./setup.sh              # full setup
#   ./setup.sh --brew-only  # only Homebrew + Brewfile
#   ./setup.sh --dotfiles-only
#   ./setup.sh --macos-defaults
#   ./setup.sh --dvorak
set -e

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  echo "Usage: ./setup.sh [--brew-only | --dotfiles-only | --macos-defaults | --dvorak]"
  exit 0
fi

case "${1:-full}" in
  --brew-only)
    "$ROOT/scripts/install-brew.sh"
    ;;
  --dotfiles-only)
    "$ROOT/scripts/link-dotfiles.sh"
    "$ROOT/scripts/install-vim-plug.sh"
    ;;
  --macos-defaults)
    "$ROOT/scripts/macos-defaults.sh"
    ;;
  --dvorak)
    "$ROOT/scripts/install-dvorak.sh"
    ;;
  full)
    "$ROOT/scripts/install-brew.sh"
    "$ROOT/scripts/link-dotfiles.sh"
    "$ROOT/scripts/install-vim-plug.sh"
    "$ROOT/scripts/macos-defaults.sh"
    "$ROOT/scripts/install-dvorak.sh"
    ;;
  *)
    echo "Unknown option. Use --help."
    exit 1
    ;;
esac
