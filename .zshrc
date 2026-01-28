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

# Cursor CLI
export PATH=$HOME/.local/bin:$PATH

# Composer binaries
export PATH=$PATH:$HOME/.composer/vendor/bin

# Golang (formula: go)
export GOPATH=$HOME/go
if command -v brew &>/dev/null; then
  export GOROOT="$(brew --prefix go)/libexec"
  export PATH=$PATH:${GOPATH}/bin:${GOROOT}/bin
fi

# NVM
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

# Custom SSH agent socket to avoid conflicts with macOS native agent
export SSH_AUTH_SOCK="$HOME/.ssh/auth_sock"
if [ ! -S "$SSH_AUTH_SOCK" ]; then
  eval $(ssh-agent -a "$SSH_AUTH_SOCK") >/dev/null 2>&1
fi

ZSH_THEME="robbyrussell"

plugins=(git gpg-agent ssh-agent ssh-agent kubectl)

# ssh-agent plugin config
zstyle :omz:plugins:ssh-agent quiet yes

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

# Starship prompt
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi

# Kubectl completion
if command -v kubectl &>/dev/null; then
  source <(kubectl completion zsh)
fi
