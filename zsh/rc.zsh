# vim: set ft=zsh ts=4 sw=4 noet :
# -----------------------------------------------------------------------------
export SHELL='zsh'

[[ -n $ZDOTDIR ]] || export ZDOTDIR="$HOME/.config/zsh"
[[ -n $RCDOTDIR ]] || export RCDOTDIR="$HOME/.config/rcs"

# -----------------------------------------------------------------------------
# Oh-My-ZSH
source $ZDOTDIR/ohmy.zsh
# -----------------------------------------------------------------------------

# #############################################################################
# User configuration
# #############################################################################
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

# -----------------------------------------------------------------------------
# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# -----------------------------------------------------------------------------
# Initialization
# -----------------------------------------------------------------------------
test -s $RCDOTDIR/init.rc && . $RCDOTDIR/init.rc || true

