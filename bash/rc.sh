# vim: set ft=sh ts=4 sw=4 noet :
# .bashrc

# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

export PATH="$PATH:$HOME/.local/bin:/usr/local/bin"

# if not set this on ~/.bashrc
${RCDOTDIR:="$HOME/.config/bash"} && export RCDOTDIR

# -----------------------------------------------------------------------------
# Oh My Bash configuration
# -----------------------------------------------------------------------------
source $RCDOTDIR/ohmyba.sh

# #############################################################################
# User configuration
# #############################################################################
export HISTCONTROL=ignoreboth

# -----------------------------------------------------------------------------
# System Environment Variables
# -----------------------------------------------------------------------------
export XDG_RUNTIME_DIR="/tmp/run/user/$(id -u)"
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

# -----------------------------------------------------------------------------
# Load additional configuration RC/SH files
# -----------------------------------------------------------------------------
test -s $RCDOTDIR/custom.rc && . $RCDOTDIR/custom.rc || true

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

# Direnv
eval "$(direnv hook bash)"

# Fuzzy finder fzf
eval "$(fzf --bash)"

# Zoxide
eval "$(zoxide init bash)"

