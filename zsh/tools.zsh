# vim: set ft=zsh ts=4 sw=4 noet :

# -----------------------------------------------------------------------------
# Carapace configuration & ZSH Completion system
# -----------------------------------------------------------------------------

ZLE_REMOVE_SUFFIX_CHARS=$' \t\n;&|'
ZLE_SPACE_SUFFIX_CHARS=$'&|'

# Initialize zsh completion system
autoload -Uz compinit && compinit -d ~/.config/zsh/.zcompdump

# Set appearance for completion headers
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'

# Optional: bridge other shell completions
export CARAPACE_BRIDGES='zsh,bash,inshellisense'

# Disable space sufix for dirs
export CARAPACE_NOSPACE='=/'

# Initialize carapace-bin
source <(carapace _carapace)
