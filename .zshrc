# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Locate
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-ocean.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL ]

# aliases
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

alias upgrade_prezto="pushd ${ZDOTDIR:-$HOME}/.zprezto && gco master && g sync && g rebase upstream/master && g submodule update --init --recursive && popd"

# Z
. `brew --prefix`/etc/profile.d/z.sh

# Golang
export GOPATH="$HOME/.gopath"
mkdir -p "$GOPATH"
export PATH=$PATH:$GOPATH/bin


# thefuck
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'

# Java
export JAVA_HOME="$(/usr/libexec/java_home 2>/dev/null)"

# virtualenv
export WORKON_HOME="$HOME/.virtualenvs"
mkdir -p "$WORKON_HOME"
source virtualenvwrapper.sh

# git alias
alias gcm="git checkout master"
alias gsc='code sync -b `git rev-parse --abbrev-ref HEAD`'

# dotfiles
function dotfiles () {
    if [[ -n $1 ]]; then
        echo "deactivating dotfiles..."
        unset GIT_DIR
        unset GIT_WORK_TREE
    else
        echo "working on dotfiles..."
        export GIT_DIR="$HOME/.dotfiles.git"
        export GIT_WORK_TREE="$HOME"
    fi
}

# Binary Tools and Scripts
TOOL_DIR="$HOME/.bin"
mkdir -p "$TOOL_DIR"
export PATH="$PATH:$TOOL_DIR"
