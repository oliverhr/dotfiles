vim9script

# Windows specific configurations

# Shell settings
# set shell=powershell
# :help powershell

# Terminal mappings
nnoremap <silent> <leader>ts :ter ++close pwsh -nol<cr>
nnoremap <silent> <leader>tp :ter ++close powershell -nol<cr>
nnoremap <silent> <leader>tb :ter ++close bash<cr>