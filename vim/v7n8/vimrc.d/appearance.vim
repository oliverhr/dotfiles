" vim: set ft=vim ts=2 sw=2 et :

" Enable syntax highlighting
syntax enable

" Absolute number on view mode relative on insert mode
augroup numbertoggle
  " This is activated after 'set number'
  autocmd!
  autocmd BufEnter,FocusLost,InsertEnter,WinLeave   * if &nu && mode() != 'i' | set rnu   | endif
  autocmd BufLeave,FocusGained,InsertLeave,WinEnter * if &nu                  | set nornu | endif
augroup END

" Set more space on the left
set nonumber      " Avoid gutter clutter if not necessary
set foldcolumn=4  " max 12
set wrapmargin=4
highlight! link FoldColumn Normal

" Line number column transparent on colorscheme change its overriden
highlight clear LineNr

" Highlight current line
set cursorline

" Enable yanked to system clipboard
set clipboard=unnamed
set mouse=a

" Spelling mistakes will be colored up red.
hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellCap cterm=underline ctermfg=203 guifg=#ff5f5f

" Colorize right extra white tab or space chars
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Display tabs and trailing spaces visually
set list listchars=tab:⫶\ ,trail:·

" ================= Color for Terminal, Scheme and Statusbar =================
set notermguicolors

" Enable this only when terminal dislay weird chars
" because of an issue with devicons & airline this
" error mostly happen on Linux and WSL
set t_RV=

" == ColorScheme
set background=dark
let g:solarized_termcolors = 16
let g:solarized_contrast='high'
colorscheme solarized

" Airline settings
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Set background translucid
"highlight Normal guibg=NONE ctermbg=NONE

" Set Gutter column translucid - only work at start
highlight clear FoldColumn
highlight clear Folded
highlight clear SignColumn

" Set Tab bar color background to translucid and line to black
highlight TabLineFill ctermbg=0 ctermfg=10
highlight SpecialKey guibg=bg ctermbg=none ctermfg=10
