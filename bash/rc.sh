# vim: set ft=sh ts=4 sw=4 noet :
# .bashrc

export SHELL='bash'

# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

export EDITOR='vim'

export PATH="$PATH:$HOME/.local/bin:/usr/local/bin"

[[ -z $RCDOTDIR ]] || export RCDOTDIR="$HOME/.config/bash"

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
# Load additional configuration RC/SH files
# -----------------------------------------------------------------------------
test -s $RCDOTDIR/custom.rc && . $RCDOTDIR/custom.rc || true
test -s $RCDOTDIR/tools.rc && . $RCDOTDIR/tools.rc || true

# -----------------------------------------------------------------------------
# Compilation flags
# -----------------------------------------------------------------------------
# export ARCHFLAGS="-arch x86_64"

# -----------------------------------------------------------------------------
# Initialization
# -----------------------------------------------------------------------------
test -s $RCDOTDIR/init.rc && . $RCDOTDIR/init.rc || true

