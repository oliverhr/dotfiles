# vim: set ft=bash ts=4 sw=4 noet :
# .bashrc

# Stop loading configs if non interactive
[[ $- != *i* ]] && return;

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# #############################################################################
# User configuration
# #############################################################################

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
	PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

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

