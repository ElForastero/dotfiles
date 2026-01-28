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

## What’s in here

- **Brewfile** — Homebrew formulae and casks (CLI tools, GUIs, fonts). Install with `brew bundle` or via `setup.sh`.
- **setup.sh** — Entry point: runs all steps or a single one (`--brew-only`, `--dotfiles-only`, `--macos-defaults`). Delegates to `scripts/install-brew.sh`, `scripts/link-dotfiles.sh`, and `scripts/macos-defaults.sh`.
- **Dotfiles** — `.zshrc`, `.aliases`, `.gitconfig`, `.editorconfig`, `.vimrc`, `.ideavimrc`, `.prettierrc`, `init.vim` (→ `~/.config/nvim/`), `.vscode/settings.json`, `ssh/config`, and optionally `gpg-agent.conf` / `gpg.conf` → `~/.gnupg/`.

## Scripts (in `scripts/`)

- **install-brew.sh** — Xcode CLI check, Homebrew install, `brew bundle`. Can be run alone: `./scripts/install-brew.sh`
- **link-dotfiles.sh** — Symlink repo dotfiles into `$HOME`, backing up existing files. Run alone: `./scripts/link-dotfiles.sh`
- **macos-defaults.sh** — Dock, Finder, login window, menu bar clock, Activity Monitor, screencapture. Safe to re-run.

## Uninstalling Nix / nix-darwin

If you used this repo with nix-darwin and are switching to the Brewfile/setup.sh flow:

1. Uninstall nix-darwin and Nix using the method you used to install (e.g. [Determinate’s uninstaller](https://github.com/DeterminateSystems/nix-installer#uninstalling) or the [official uninstall steps](https://nixos.org/manual/nix/stable/installation/installing-binary.html#uninstalling-nix)).
2. Remove any darwin-related launchd config or symlinks if they remain.
3. Clone this repo and run `./setup.sh` (or the step-specific options above) to install tools and dotfiles via Homebrew.

## Links

- iTerm2 Github Theme: https://github.com/cdalvaro/github-vscode-theme-iterm
- YubiKey setup guide: https://github.com/drduh/YubiKey-Guide
- Resident SSH keys: https://www.yubico.com/blog/github-now-supports-ssh-security-keys
- AstroNvim: https://github.com/AstroNvim/AstroNvim
- Nerd JetBrains Mono font: https://github.com/ryanoasis/nerd-fonts#option-4-homebrew-fonts
