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

# RN Android Studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:$HOME/.composer/vendor/bin

# Golang (formula: go)
export GOPATH=$HOME/go
if command -v brew &>/dev/null; then
  export GOROOT="$(brew --prefix go)/libexec"
  export PATH=$PATH:${GOPATH}/bin:${GOROOT}/bin
fi

ZSH_THEME="robbyrussell"

plugins=(git gpg-agent ssh-agent kubectl)

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
