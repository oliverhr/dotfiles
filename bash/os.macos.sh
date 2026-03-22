# vim: set ft=bash ts=4 sw=4 noet :

# -----------------------------------------------------------------------------
# Completion Configuration
# -----------------------------------------------------------------------------
# Load system bash-completion (from Homebrew)
# We load it first so we can override its specific commands later
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Readline Settings for macOS Terminal
set completion-ignore-case on       # Case insensitive
set completion-display-width 1      # Vertical list
set show-all-if-ambiguous on        # Show list on first TAB if multiple options
set show-all-if-unmodified on       # Force list display even if no new chars added
set menu-complete-display-prefix on # Show common prefix while cycling

# Key Bindings
bind 'TAB:menu-complete'              # Cycle through options
bind '"\e[Z": menu-complete-backward' # Shift-Tab (Backwards)

# History and Navigation
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
bind '"\e[1;5C":forward-word'
bind '"\e[1;5D":backward-word'

