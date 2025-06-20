# vim: set ft=sh ts=4 sw=4 noet :

# -----------------------------------------------------------------------------
# Oh My Bash configuration
# -----------------------------------------------------------------------------
source $HOME/.config/bash/ohmyba.sh

# #############################################################################
# User configuration
# #############################################################################
# export MANPATH="/usr/local/man:$MANPATH"
export HISTCONTROL=ignoreboth
export PATH=$PATH:/usr/local/bin:$HOME/.local/bin

# -----------------------------------------------------------------------------
# Environment Variables
# -----------------------------------------------------------------------------
export WIN=/mnt/c/Users/P3280455/
export WIN_PROJ=/mnt/c/Users/P3280455/Projects/

# language environment vars
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Compilation flags
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

