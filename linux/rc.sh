# vim: set ft=sh ts=4 sw=4 noet :
# .bashrc

# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

# #############################################################################
# User configuration
# #############################################################################
export PATH=$PATH:$HOME/.local/bin
export HISTCONTROL=ignoreboth

# -----------------------------------------------------------------------------
# Oh My Bash configuration
# -----------------------------------------------------------------------------
source $HOME/.config/bash/ohmyba.sh

# -----------------------------------------------------------------------------
# Compilation flags
# -----------------------------------------------------------------------------
# export ARCHFLAGS="-arch x86_64"

# -----------------------------------------------------------------------------
# ALIAS
# For a full list of active aliases, run `alias`.
# -----------------------------------------------------------------------------
test -s ~/.alias.rc && . ~/.alias.rc || true

alias confvim='view ~/.vim/vimrc'
alias edit='vim $(fzf)'

# -----------------------------------------------------------------------------
# Tools initialization
# -----------------------------------------------------------------------------
export XDG_RUNTIME_DIR="/tmp/run/user/$(id -u)"
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

# Direnv
eval "$(direnv hook bash)"

# Fuzzy finder fzf
eval "$(fzf --bash)"

# Zoxide
eval "$(zoxide init bash)"

