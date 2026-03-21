# vim: set ft=zsh ts=4 sw=4 noet :

# -----------------------------------------------------------------------------
# Carapace configuration & ZSH Completion system
# -----------------------------------------------------------------------------

# ZLE (Zsh Line Editor) Settings
# Handles how spaces/suffixes are treated when completing commands
ZLE_REMOVE_SUFFIX_CHARS=$' \t\n;&|'
ZLE_SPACE_SUFFIX_CHARS=$'&|'

# Allows completion from the middle of a word
setopt COMPLETE_IN_WORD

# Initialize Completion System
# Load the module required for arrow key navigation
zmodload zsh/complist

# Initialize compinit with -C for faster terminal startup
autoload -Uz compinit && compinit -C -d ~/.config/zsh/.zcompdump

# Case-insensitive & Smart Matching
# Tries exact match, then case-insensitive, then substring/partial matching
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Interactive Menu
# Enables arrow key navigation (trigger by pressing Tab twice)
zstyle ':completion:*' menu yes select

# Visual Formatting
# Displays the completion category header in grey
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'

# Carapace-bin Configuration
# Bridge other shell completions for maximum compatibility
export CARAPACE_BRIDGES='zsh,bash,fish,inshellisense'

# Prevent trailing spaces on directories to allow for easy path chaining
export CARAPACE_NOSPACE='=/'

# Initialize Carapace - This must remain at the
source <(carapace _carapace)

