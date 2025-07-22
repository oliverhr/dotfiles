# vim: set ft=zsh ts=4 sw=4 noet :
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Oh-My-ZSH
source ~/.config/zsh/ohmy.zsh
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
# ALIAS
# For a full list of active aliases, run `alias`.
test -s ~/.alias.rc && . ~/.alias.rc

# -----------------------------------------------------------------------------
# OS Specific Configuration
# -----------------------------------------------------------------------------
test -s ~/.config/zsh/os.conf.zsh && . ~/.config/zsh/os.conf.zsh
#
# -----------------------------------------------------------------------------
# Custom configuration (Needs to be created explicitly)
# -----------------------------------------------------------------------------
test -s ~/.config/zsh/custom.zsh && . ~/.config/zsh/custom.zsh || true

# -----------------------------------------------------------------------------
# Tools initialization
# -----------------------------------------------------------------------------

# Direnv
eval "$(direnv hook zsh)"

# Fuzzy finder fzf
source <(fzf --zsh)

# Zoxide
eval "$(zoxide init zsh)"

