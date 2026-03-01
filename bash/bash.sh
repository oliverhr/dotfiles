# vim: set ft=bash ts=4 sw=4 noet :
# .bashrc

# Continue loading settings only for interactive sessions
[[ $- != *i* ]] && return

# #############################################################################
# User configuration
# #############################################################################

# language environment vars
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# ----------------------------------------------------------
# Dotdir directories
# ----------------------------------------------------------
[[ -n $BSHDOTDIR ]] || export BSHDOTDIR="$HOME/.config/bash"
[[ -n $RCDOTDIR ]] || export RCDOTDIR="$HOME/.config/rcs"

# ----------------------------------------------------------
# Load Bash Resouce Configuration
# ----------------------------------------------------------
source $BSHDOTDIR/rc.sh

