vim9script

# Enable syntax highlighting
syntax enable

# Absolute number on view mode relative on insert mode
if has('autocmd')
  augroup numbertoggle
    autocmd!
    # This is activated after 'set number'
    autocmd BufEnter,FocusLost,InsertEnter,WinLeave * {
      if &nu && mode() != 'i' | set rnu | endif
    }
    autocmd BufLeave,FocusGained,InsertLeave,WinEnter * {
      if &nu | set nornu | endif
    }
  augroup END
endif

# Set more space on the left
set nonumber       # Avoid gutter clutter if not necessary
set foldcolumn=4   # max 12
set wrapmargin=4
highlight! link FoldColumn Normal

# Line number column transparent on colorscheme change its overriden
highlight clear LineNr

# Highlight current line
set cursorline

# Colorize right extra white tab or space chars
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

# Display tabs and trailing spaces visually
set list listchars=tab:\|\ ,trail:·

# ================= Color for Terminal, Scheme and Statusbar =================
# Set options only for GUI
if has('gui_running')
  set guioptions-=r     # Hide rigth scrollbar
  set guioptions-=L     # Hide left scrollbar
  set guioptions-=e     # Set gui-tabs as terminal
  set guitablabel=%M\ %t
endif

# Running on a terminal
if ! has('gui_running')
  # Enable yanked to system clipboard
  set clipboard=unnamed
  set mouse=a

  highlight SpecialKey guibg=bg ctermbg=none

  # Spelling mistakes will be colored up red.
  hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f
  hi SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f
  hi SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f
  hi SpellCap cterm=underline ctermfg=203 guifg=#ff5f5f
endif

# Airline settings
g:airline_powerline_fonts = 1
# Airline customization
if !exists('g:airline_symbols')
  g:airline_symbols = {}
endif

# Set Gutter column translucid - only work at start
highlight clear FoldColumn
highlight clear Folded
highlight clear SignColumn

# vim: set ft=vim ts=2 sw=2 et :
