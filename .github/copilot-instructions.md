# Copilot instructions for this dotfiles repo

## Big picture

- This repo is a macOS bootstrap + dotfiles setup: install Homebrew packages, symlink dotfiles, then apply macOS defaults.
- The entry point is [setup.sh](setup.sh), which delegates to scripts in [scripts/](scripts/).
- Package choices live in [Brewfile](Brewfile). Dotfiles are stored at repo root and symlinked into $HOME.

## Key workflows (expected entry points)

- Full setup: ./setup.sh (runs brew install + symlinks + defaults)
- Single steps: ./setup.sh --brew-only | --dotfiles-only | --macos-defaults
- Individual scripts can run directly: [scripts/install-brew.sh](scripts/install-brew.sh), [scripts/link-dotfiles.sh](scripts/link-dotfiles.sh), [scripts/macos-defaults.sh](scripts/macos-defaults.sh).

## Project-specific conventions

- Dotfiles are **symlinked**, not copied. See `link()` in [scripts/link-dotfiles.sh](scripts/link-dotfiles.sh).
- Existing files are backed up as \*.backup.YYYYMMDD before linking (only if a non-symlink exists).
- Neovim config is stored as [init.vim](init.vim) and linked to ~/.config/nvim/init.vim.
- Optional GPG configs are only linked if present: [gpg-agent.conf](gpg-agent.conf) and [gpg.conf](gpg.conf).

## macOS defaults behavior

- [scripts/macos-defaults.sh](scripts/macos-defaults.sh) uses `defaults` + `sudo` for login window settings and restarts Dock/Finder/SystemUIServer.
- Expect some changes to require logout; keep this in mind when editing defaults.

## Integration points / external dependencies

- Homebrew install is bootstrapped if `brew` is missing, then `brew bundle` runs against [Brewfile](Brewfile).
- Xcode Command Line Tools must be installed first (checked in [scripts/install-brew.sh](scripts/install-brew.sh)).

## When editing

- Keep `setup.sh` options in sync with the scripts and README usage in [README.md](README.md).
- If you add a new dotfile, update [scripts/link-dotfiles.sh](scripts/link-dotfiles.sh) and mention it in [README.md](README.md).
