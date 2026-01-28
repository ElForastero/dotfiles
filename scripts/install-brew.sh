#!/usr/bin/env bash
# Install Xcode CLI (check), Homebrew, and run brew bundle.
set -e

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

# Require Xcode Command Line Tools
if ! xcode-select -p &>/dev/null; then
  echo "Run: xcode-select --install"
  exit 1
fi

# Install Homebrew if missing
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Put Homebrew on PATH (Apple Silicon)
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install everything from Brewfile
brew bundle --file="$ROOT/Brewfile"
