# vim: set ft=sh ts=4 sw=4 noet :
# ~/.bashrc

# Stop loading configs if non interactive
[[ $- != *i* ]] && return;

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# language environment vars
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# #############################################################################
# User configuration
# #############################################################################

# -----------------------------------------------------------------------------
# Dotdir directories
# -----------------------------------------------------------------------------
[[ -n $BSHDOTDIR ]] || export BSHDOTDIR="$HOME/.config/bash"
[[ -n $RCDOTDIR ]] || export RCDOTDIR="$HOME/.config/rcs"

# -----------------------------------------------------------------------------
# Load Bash Resouce Configuration
# -----------------------------------------------------------------------------
source $BSHDOTDIR/rc.sh

