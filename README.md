# dotfiles

macOS setup without Nix: Homebrew (Brewfile), a single bootstrap script, and symlinked dotfiles.

## Requirements

- macOS
- [Xcode Command Line Tools](https://developer.apple.com/xcode/) (run `xcode-select --install` if needed)

## Quick start

```bash
git clone --recursive https://github.com/you/dotfiles.git ~/dotfiles
cd ~/dotfiles
./setup.sh
```

Or run specific steps:

- `./setup.sh --help` — show options
- `./setup.sh --brew-only` — install Homebrew and run `brew bundle` only
- `./setup.sh --dotfiles-only` — symlink dotfiles into `$HOME` only
- `./setup.sh --macos-defaults` — apply Dock, Finder, menu bar, etc. only
- `./setup.sh --dvorak` — install Programmer Dvorak keyboard layout only

## What’s in here

- **Brewfile** — Homebrew formulae and casks (CLI tools, GUIs, fonts). Install with `brew bundle` or via `setup.sh`.
- **setup.sh** — Entry point: runs all steps or a single one (`--brew-only`, `--dotfiles-only`, `--macos-defaults`, `--dvorak`). Delegates to `scripts/install-brew.sh`, `scripts/link-dotfiles.sh`, `scripts/macos-defaults.sh`, and `scripts/install-dvorak.sh`.
- **Dotfiles** — `.zshrc`, `.aliases`, `.gitconfig`, `.editorconfig`, `.vimrc`, `.ideavimrc`, `.prettierrc`, `init.vim` (→ `~/.config/nvim/`), `ssh/config`, and optionally `gpg-agent.conf` / `gpg.conf` → `~/.gnupg/`.

## Scripts (in `scripts/`)

- **install-brew.sh** — Xcode CLI check, Homebrew install, `brew bundle`. Can be run alone: `./scripts/install-brew.sh`
- **link-dotfiles.sh** — Symlink repo dotfiles into `$HOME`, backing up existing files. Run alone: `./scripts/link-dotfiles.sh`
- **install-vim-plug.sh** — Install vim-plug and run `PlugInstall` for Vim and Neovim.
- **macos-defaults.sh** — Dock, Finder, login window, menu bar clock, Activity Monitor, screencapture. Safe to re-run.
- **install-dvorak.sh** — Install Programmer Dvorak keyboard layout via Homebrew cask. Run alone: `./scripts/install-dvorak.sh`. After install, add the layout in System Settings > Keyboard > Input Sources and reboot.

## Vim + Neovim plugins

Plugin installation is automatic during `./setup.sh` and `./setup.sh --dotfiles-only`.

If you need to re-run it manually:

```bash
./scripts/install-vim-plug.sh
```

This installs vim-plug for both Vim and Neovim, then runs `PlugInstall` for each.

For formatting and linting, this setup expects global tools (e.g. `prettier`, `eslint`) available in `$PATH`.

## Links

- Programmer Dvorak (macOS): https://www.kaufmann.no/roland/dvorak/macosx.html
- iTerm2 Github Theme: https://github.com/cdalvaro/github-vscode-theme-iterm
- YubiKey setup guide: https://github.com/drduh/YubiKey-Guide
- Resident SSH keys: https://www.yubico.com/blog/github-now-supports-ssh-security-keys
- AstroNvim: https://github.com/AstroNvim/AstroNvim
- Nerd JetBrains Mono font: https://github.com/ryanoasis/nerd-fonts#option-4-homebrew-fonts
