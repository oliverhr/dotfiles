# vim: ft=bash :

# ---------------------------------------------------------
# History Control
# ---------------------------------------------------------
HISTSIZE=2000
HISTFILESIZE=2000
HISTTIMEFORMAT="%m/%d/%y %T "
# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups

# ---------------------------------------------------------
# Prompt
# ---------------------------------------------------------
# eval "$(starship init bash)"

# ---------------------------------------------------------
# Custom Alias
# ---------------------------------------------------------
test -f ~/.alias.rc && . ~/.alias.rc

# CD alias
alias ls='ls --color=always'
alias ll='ls -l'
alias la='ls -la'
alias cd..='cd ..'
alias lsd='ls -ld */'
alias lsh='ls -d .*'

# Git alias
alias g='git'
alias gst='git status'
alias gc='git commit -v'
alias ga='git add'
alias gaa='git add --all'
alias gf='git fetch'
alias gl='git pull'
alias gp='git push'
alias gb='git branch'
alias gsw='git switch'
alias gd='git diff'

# ---------------------------------------------------------
# Appliction Initialization
# ---------------------------------------------------------
eval "$(fzf --bash)"
eval "$(zoxide init bash)"


# ---------------------------------------------------------
cd ~/Projects
# ---------------------------------------------------------

