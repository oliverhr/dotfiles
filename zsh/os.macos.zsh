# vim: set ft=zsh ts=4 sw=4 noet :

export PATH="/usr/local/sbin:$PATH"

export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
source <(carapace _carapace)

# iTerm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#RubyEnv
eval "$(rbenv init - zsh)"

# ---
# Added by Antigravity
export PATH="/Users/oliver/.antigravity/antigravity/bin:$PATH"
