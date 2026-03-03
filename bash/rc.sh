# vim: set ft=sh ts=4 sw=4 noet :
# .bashrc

export _SHELL='bash'
export SHELL=/usr/local/bin/bash

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

