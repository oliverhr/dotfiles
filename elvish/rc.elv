# ----------------------------------------------------------------------------
# "Welcome to elviSH!!"
# ----------------------------------------------------------------------------

set-env SHELL 'elvish'

# --- Modify PATH
set paths = [
    $E:HOMEPATH/.local/bin
    $@paths
]

# --- Prompt
eval (starship init elvish)

# --- Tools Initialization
eval (zoxide init elvish | slurp)

# ----------------------------------------------------------------------------
# Elvish does not come with batteries
# ----------------------------------------------------------------------------
# Requires external tools like uutils-coreutils | busybox
# ----------------------------------------------------------------------------

# -- Windows tools
fn open {|app @args| cmd /c start $app $@args }

# --- bat
fn cat {|@args| e:bat $@args }

# --- lsd/eza
fn ls {|@args| e:lsd --color=always $@args }
fn la {|@args| e:lsd -la $@args }
fn ll {|@args| e:lsd -l $@args }

# --- Busybox
# fn pwd {|@args| e:busybox pwd $@args }
# fn mkdir {|@args| e:busybox mkdir $@args }

# ----------------------------------------------------------------------------
# Modules
# ----------------------------------------------------------------------------
# --- Git alias
use git g

