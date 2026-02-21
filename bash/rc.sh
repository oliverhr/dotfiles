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
# Custom BASH configuration (Needs to be created explicitly)
# -----------------------------------------------------------------------------
test -s $BSHDOTDIR/custom.sh && . $BSHDOTDIR/custom.sh || true

# tmux alias for bash
alias tmux='tmux new-session -A -s BASH'

# -----------------------------------------------------------------------------
# Completion
# -----------------------------------------------------------------------------
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

set completion-display-width 1

# Complete case unsensitive
bind 'set completion-ignore-case on'

# Tab complete
#bind 'TAB:menu-complete'

# And Shift-Tab should cycle backwards
bind '"\e[Z": menu-complete-backward'

# Display a list of the matching files
bind "set show-all-if-ambiguous on"

# Perform partial (common) completion on the first Tab press, only start
# cycling full results on the second Tab press (from bash version 5)
bind "set menu-complete-display-prefix on"

# Cycle through history based on characters already typed on the line
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# Keep Ctrl-Left and Ctrl-Right working when the above are used
bind '"\e[1;5C":forward-word'
bind '"\e[1;5D":backward-word'

