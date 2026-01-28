#!/usr/bin/env bash
# Symlink dotfiles from this repo into $HOME. Backs up existing files first.
set -e

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

link() {
  local src="$ROOT/$1"
  local dst="$HOME/$2"
  if [[ ! -e "$src" ]]; then return; fi
  if [[ -e "$dst" && ! -L "$dst" ]]; then
    cp -a "$dst" "${dst}.backup.$(date +%Y%m%d)"
  fi
  mkdir -p "$(dirname "$dst")"
  ln -sf "$src" "$dst"
}

link .zshrc              .zshrc
link .aliases            .aliases
link .editorconfig       .editorconfig
link .gitconfig          .gitconfig
link .ideavimrc          .ideavimrc
link init.vim            .config/nvim/init.vim
link ssh/config          .ssh/config

if [[ -f "$ROOT/gpg-agent.conf" ]]; then link gpg-agent.conf .gnupg/gpg-agent.conf; fi
if [[ -f "$ROOT/gpg.conf" ]]; then link gpg.conf .gnupg/gpg.conf; fi
