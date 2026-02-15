# vim: set ft=sh ts=4 sw=4 noet :
# .bashrc

export SHELL='bash'

# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

export PATH="$PATH:$HOME/.local/bin:/usr/local/bin"

[[ -z $BSHDOTDIR ]] || export BSHDOTDIR="$HOME/.config/bash"
[[ -z $RCDOTDIR ]] || export RCDOTDIR="$HOME/.config/rcs"

# -----------------------------------------------------------------------------
# Oh My Bash configuration
# -----------------------------------------------------------------------------
source $BSHDOTDIR/ohmyba.sh

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
# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# -----------------------------------------------------------------------------
# ALIAS
# For a full list of active aliases, run `alias`.
alias edit='vim $(fzf)'

# -----------------------------------------------------------------------------
# Initialization
# -----------------------------------------------------------------------------
test -s $RCDOTDIR/init.rc && . $RCDOTDIR/init.rc || true

