vim9script

# --- Core Editor Behavior ---
set nocompatible
set encoding=utf-8
syntax on
filetype plugin indent on

# --- Git Commit Specifics ---
# These apply globally to this config since it's only for Git
setlocal spell
setlocal nofoldenable
setlocal textwidth=72
setlocal colorcolumn=73

# Move cursor to start
cursor(1, 1)

# --- Aesthetics (Optional) ---
set background=dark
silent! colorscheme quiet

# --- Auto-delete buffer on close ---
autocmd BufWinLeave COMMIT_EDITMSG bdelete
