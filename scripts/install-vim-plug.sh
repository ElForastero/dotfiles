#!/usr/bin/env bash
# Install vim-plug and plugins for Vim and Neovim.
set -e

VIM_PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

install_plug() {
  local plug_path="$1"
  if [[ ! -f "$plug_path" ]]; then
    mkdir -p "$(dirname "$plug_path")"
    curl -fLo "$plug_path" --create-dirs "$VIM_PLUG_URL"
  fi
}

# Install for regular Vim
install_plug "$HOME/.vim/autoload/plug.vim"

# Install for Neovim
install_plug "$HOME/.local/share/nvim/site/autoload/plug.vim"

# Install plugins for regular Vim
if command -v vim &>/dev/null; then
  vim +PlugInstall +qall
fi

# Install plugins for Neovim
if command -v nvim &>/dev/null; then
  nvim --headless +PlugInstall +qall
fi
