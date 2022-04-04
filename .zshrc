# RN Android Studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Composer binaries
export PATH=$PATH:$HOME/.composer/vendor/bin

# Golang
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH=$PATH:${GOPATH}/bin:${GOROOT}/bin

# NVM
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

ZSH_THEME="robbyrussell"

plugins=(zsh-nvm git react-native yarn npm gpg-agent kubectl)

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship
