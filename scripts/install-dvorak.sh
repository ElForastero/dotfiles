#!/usr/bin/env bash
# Install Programmer Dvorak keyboard layout via Homebrew cask.
# Safe to re-run. After install, enable in System Settings > Keyboard > Input Sources.
set -e

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

# Require Homebrew
if ! command -v brew &>/dev/null; then
  echo "Homebrew is required. Run: ./setup.sh --brew-only"
  exit 1
fi

# Put Homebrew on PATH (Apple Silicon)
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install Programmer Dvorak cask if not already installed
if brew list --cask programmer-dvorak &>/dev/null; then
  echo "Programmer Dvorak is already installed."
else
  echo "Installing Programmer Dvorak keyboard layout..."
  brew install --cask programmer-dvorak
fi

echo ""
echo "Next steps:"
echo "  1. Open System Settings > Keyboard > Input Sources"
echo "  2. Click '+' and add English > Programmer Dvorak"
echo "  3. Reboot so the layout is recognized (required on some macOS versions)"
echo ""
echo "See: https://www.kaufmann.no/roland/dvorak/macosx.html"
