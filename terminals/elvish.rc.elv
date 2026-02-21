# ----------------------------------------------------------
# "Welcome to elviSH!!"
# ----------------------------------------------------------

echo '# ----------------------------------------------------------'
echo '# Elvish shell'
echo '# ----------------------------------------------------------'

# --- Modify PATH
set paths = [
    $E:HOME/.local/bin
    /usr/local/bin
    $@paths
]

# --- Prompt
eval (starship init elvish)

# --- Zoxide
eval (zoxide init elvish | slurp)

fn ls {|@args|
  e:ls --color=always $@args
}

# --- Modules
use git g

