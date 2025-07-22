# ----------------------------------------------------------
# "Welcome to elviSH!!"
# ----------------------------------------------------------

# --- Modify PATH
set paths = [
    $E:HOME/.local/bin
    /usr/local/bin
    $@paths
]

# --- Prompt
eval (starship init elvish)

# --- Modules
use git g

