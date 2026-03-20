# vim: set ft=zsh ts=4 sw=4 noet :
# -----------------------------------------------------------------------------

export _SHELL='zsh'

[[ -n $ZDOTDIR ]] || export ZDOTDIR="$HOME/.config/zsh"
[[ -n $RCDOTDIR ]] || export RCDOTDIR="$HOME/.config/rcs"

# -----------------------------------------------------------------------------
# Oh-My-ZSH
source $ZDOTDIR/ohmy.zsh
# -----------------------------------------------------------------------------

# #############################################################################
# User configuration
# #############################################################################
# export MANPATH="/usr/local/man:$MANPATH"

# -----------------------------------------------------------------------------
# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# -----------------------------------------------------------------------------
# Initialization
# -----------------------------------------------------------------------------
test -s $RCDOTDIR/init.rc && . $RCDOTDIR/init.rc || true

# -----------------------------------------------------------------------------
# OS ZSH specific configuration - symlink
# -----------------------------------------------------------------------------
test -s $ZDOTDIR/os.conf.zsh && . $ZDOTDIR/os.conf.zsh || true

# -----------------------------------------------------------------------------
# Custom ZSH configuration (Needs to be created explicitly)
# -----------------------------------------------------------------------------
test -s $ZDOTDIR/custom.zsh && . $ZDOTDIR/custom.zsh || true

# -----------------------------------------------------------------------------
# ZSH Antidode plugin manager
# -----------------------------------------------------------------------------
source $ZDOTDIR/antidote/antidote.zsh
antidote load $ZDOTDIR/antidote_zsh_plugins.conf

