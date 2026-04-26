#!/usr/bin/env bash
# Symlink dotfiles from this repo into $HOME. Backs up existing files first.
set -e

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DRY_RUN=false

if [[ "${1:-}" == "--dry-run" ]]; then
  DRY_RUN=true
fi

link() {
  local src="$ROOT/$1"
  local dst="$HOME/$2"
  if [[ ! -e "$src" ]]; then return; fi
  echo "Would link: $dst -> $src"
  if [[ "$DRY_RUN" == "true" ]]; then return; fi
  if [[ -e "$dst" && ! -L "$dst" ]]; then
    cp -a "$dst" "${dst}.backup.$(date +%Y%m%d)"
  fi
  mkdir -p "$(dirname "$dst")"
  ln -sf "$src" "$dst"
}

copy() {
  local src="$ROOT/$1"
  local dst="$HOME/$2"
  if [[ ! -e "$src" ]]; then return; fi
  if [[ -e "$dst" ]]; then return; fi
  echo "Copying: $src -> $dst"
  if [[ "$DRY_RUN" == "true" ]]; then return; fi
  mkdir -p "$(dirname "$dst")"
  cp "$src" "$dst"
}

link .zshrc              .zshrc
link .aliases            .aliases
link .editorconfig       .editorconfig
link .gitconfig          .gitconfig
link .aerospace.toml     .aerospace.toml
link .ideavimrc          .ideavimrc
link .vimrc              .vimrc
link init.vim            .config/nvim/init.vim
copy ssh/config          .ssh/config

if [[ -f "$ROOT/gpg-agent.conf" ]]; then link gpg-agent.conf .gnupg/gpg-agent.conf; fi
if [[ -f "$ROOT/gpg.conf" ]]; then link gpg.conf .gnupg/gpg.conf; fi

if [[ ! -f "$HOME/.gitconfig.local" ]]; then
  if [[ -f "$ROOT/.gitconfig.local.example" ]]; then
    cp "$ROOT/.gitconfig.local.example" "$HOME/.gitconfig.local"
    echo "Created ~/.gitconfig.local from example. Please edit it."
  else
    echo "Reminder: create ~/.gitconfig.local with your [user] name, email, signingkey"
  fi
fi
