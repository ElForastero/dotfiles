# Essential exports (needed for non-interactive and Cursor agent)
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:$HOME/.composer/vendor/bin
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools
export GOPATH=$HOME/go
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

if command -v brew &>/dev/null; then
  export GOROOT="$(brew --prefix go)/libexec"
  export PATH=$PATH:${GOPATH}/bin:${GOROOT}/bin
fi

# Non-interactive: stop after PATH so scripts get a working environment
[[ $- != *i* ]] && return

# Minimal mode for Cursor AI agent: skip interactive bloat when agent runs shell commands
if [[ -n "$VSCODE_GIT_ASKPASS_NODE" && "$VSCODE_GIT_ASKPASS_NODE" == *"Cursor"* && ! -t 0 ]]; then
  return
fi

# ── Interactive config below ──

# OPENSPEC:START
# OpenSpec shell completions configuration
fpath=("$HOME/.oh-my-zsh/custom/completions" $fpath)
autoload -Uz compinit
compinit
# OPENSPEC:END

# Better history
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS

# Better directory navigation
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

ZSH_THEME="robbyrussell"
plugins=(git gpg-agent ssh-agent kubectl tmux)
ZSH=${ZSH:-$HOME/.oh-my-zsh}
if [ -f "$ZSH/oh-my-zsh.sh" ]; then
  source "$ZSH/oh-my-zsh.sh"
fi
source $HOME/.aliases

# Starship prompt
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi

# Kubectl completion
if command -v kubectl &>/dev/null; then
  source <(kubectl completion zsh)
fi

# VSCode Terminal Shell Integration
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
