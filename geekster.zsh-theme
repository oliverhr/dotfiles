# ---------------------------------------
# geekster.zsh-theme
# https://github.com/oliverhr
# ---------------------------------------

local return_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)%{$reset_color%}"

function precmd() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    git_root=$(git rev-parse --show-toplevel)
    parent=${git_root%\/*}
    prompt_short_dir="${PWD#$parent/} "

    # parent=$(git rev-parse --show-prefix)
    # prompt_short_dir=${parent%/}
  else
    prompt_short_dir="%~ "
  fi
}

# Repository status icons
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔"
# Repository file status icons
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ⚑"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[cyan]%} ↺"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[white]%} ⇣"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%} ✭"

NEWLINE=$'\n'
PROMPT='$return_status%{$fg[white]%}$prompt_short_dir$(git_prompt_info)$(git_prompt_status)%{$reset_color%}$NEWLINE$ '
# RPROMPT='%*  %{$reset_color%}'
