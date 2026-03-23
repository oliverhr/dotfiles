vim9script
# Linux specific configurations

# Terminal mappings
nnoremap <silent> <leader>ts :ter ++noclose<cr>
nnoremap <silent> <leader>tp :ter ++close<cr>

# == Color terminal related stuff ==
set termguicolors

# Enable this only when terminal dislay weird chars
# because of an issue with devicons & airline this
# error mostly happen on Linux and WSL
set t_RV=

# Colors
set background=dark
colorscheme tokyonight
highlight Comment cterm=NONE
g:airline_theme = 'tokyonight'

if has('gui_running')
  set gfn=JetBrainsMono_NFM:h12
  set lines=25 columns=100

  set background=light
  colorscheme quiet
  g:airline_theme = 'quiet'
endif

# vim: set ft=vim ts=2 sw=2 et :
