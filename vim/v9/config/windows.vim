vim9script

# Windows specific configurations

# Shell settings
# set shell=powershell
# :help powershell

# Terminal mappings
nnoremap <silent> <leader>ts :ter ++close pwsh -nol<cr>
nnoremap <silent> <leader>tp :ter ++close powershell -nol<cr>
nnoremap <silent> <leader>tb :ter ++close bash<cr>

# == Color terminal related stuff ==
set termguicolors

# Colors
set background=dark
colorscheme PaperColor
g:airline_theme = 'transparent'

# Fix FZF windows on powershell
g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 0.5 } }

if has('gui_running')
  set gfn=JetBrainsMono_NFM:h12
  set lines=25 columns=100

  set background=dark
  colorscheme nord
  g:airline_theme = 'nord'
endif


