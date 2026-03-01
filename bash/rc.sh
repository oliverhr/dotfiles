# vim: set ft=sh ts=4 sw=4 noet :
# .bashrc

export _SHELL='bash'
export SHELL=/usr/local/bin/bash

# tmux alias for bash
alias tmux='tmux new-session -A -s BASH'

export EDITOR='vim'

export PATH="$PATH:$HOME/.local/bin:/usr/local/bin"

[[ -n $RCDOTDIR ]] || export RCDOTDIR="$HOME/.config/rcs"

# -----------------------------------------------------------------------------
# Oh My Bash configuration
# -----------------------------------------------------------------------------
test -s $BSHDOTDIR/ohmyba.sh && . $BSHDOTDIR/ohmyba.sh

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
# -----------------------------------------------------------------------------
# export ARCHFLAGS="-arch x86_64"

# -----------------------------------------------------------------------------
# Initialization
# -----------------------------------------------------------------------------
test -s $RCDOTDIR/init.rc && . $RCDOTDIR/init.rc || true

# -----------------------------------------------------------------------------
# OS BASH specific configuration - symlink
# -----------------------------------------------------------------------------
test -s $BSHDOTDIR/os.conf.sh && . $BSHDOTDIR/os.conf.sh || true

# -----------------------------------------------------------------------------
# Custom BASH configuration (Needs to be created explicitly)
# -----------------------------------------------------------------------------
test -s $BSHDOTDIR/custom.sh && . $BSHDOTDIR/custom.sh || true


