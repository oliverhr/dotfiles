" vim: set ft=vim:

"==================================================================
" Windows Msys2
"
" Msys2 terminal has specific issues with color
" require to set t_Co=256 for some color schemes
"
" Since in msysw the $TERM_PROGRAM env var is set
" we can customize not like mac or linux since
" still some extra configuration is achivable
"==================================================================

"==================================================================
" VIMproved
set nocompatible
filetype off

" ======================= Plug Settings =========================
" set the runtime path to include Vundle and initialize
call plug#begin()

" - - - Utilities - - -
    Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'preservim/nerdcommenter'
    Plug 'tpope/vim-fugitive'
    Plug 'machakann/vim-sandwich'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'LunarWatcher/auto-pairs'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " - - - Syntax - - -
    " Plug 'hashivim/vim-terraform'
    " Plug 'pearofducks/ansible-vim'

    " - - - Colorschemes - - -
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'altercation/vim-colors-solarized'
    Plug 'catppuccin/vim', { 'as': 'catppuccin' }
    Plug 'cormacrelf/vim-colors-github'
    Plug 'crucerucalin/peaksea.vim'
    Plug 'crusoexia/vim-monokai'
    Plug 'ghifarit53/tokyonight-vim'
    Plug 'joshdick/onedark.vim'
    Plug 'morhetz/gruvbox'
    Plug 'tyrannicaltoucan/vim-deep-space'

" All of your Plugins must be added before the following line
call plug#end()            " required

" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting
"
" Put your non-Plugin stuff after this line

" -------------------------------------------------------------------
" Plugins Settings
" -------------------------------------------------------------------
let NERDTreeIgnore = ['.git$[[dir]]']
let g:NERDTreeQuitOnOpen = 3
let g:NERDTreeWinPos = 'right'
let NERDTreeRespectWildIgnore = 1

" CtrlP ignored git files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
" Exclude files and directories using Vim's wildignore and CtrlP's own custom ignore
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|pdb|so|dll|DS_Store)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Format Terraform
let g:terraform_fmt_on_save=1
let g:terraform_align=1

" ========================= General Settings ========================
" Sets how many lines of history VIM has to remember
set history=1000

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

" Fast saving
nnoremap <leader>w :w!<cr>
nnoremap <silent> <leader>wx :xa<cr>
nnoremap <leader>x :x<cr>
nnoremap <silent> <leader>wa :wa<cr>

" Fast quit
nnoremap <leader>q :q!<cr>
nnoremap <silent> <leader>qa :qa!<cr>

" Nerdtree
nnoremap <silent> <leader>m :NERDTreeToggle<Enter>
nnoremap <silent> <leader>f :NERDTreeFind<cr>

" Search down for folders and tab-completition for all file related tasks
set path+=**

" ========================= User interface ==========================
" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7

" Turn on the WiLd menu
set wildmode=list:longest
" enable ctrl-n and ctrl-p to scroll thru matches
set wildmenu

" ========================= Completion ==============================
" stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~,*.pyc
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=node_modules/**
set wildignore+=bower_components/**
set wildignore+=vendor/rails/**
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=__pycache__
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.zip,*.exe,*.pdb  " Windows

"Always show current position
set ruler
" Height of the command bar
set cmdheight=2
" A buffer becomes hidden when it is abandoned
set hidden
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
" Don't redraw while executing macros (good performance config)
set lazyredraw
" For regular expressions turn magic on
set magic
" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Scrolling
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Show status line
set laststatus=2

" ========================= Font & Color's ===========================
" Enable syntax highlighting
syntax enable

" Absolute number on view mode relative on insert mode
set number " nonumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusLost,InsertEnter,WinLeave * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu                | set nornu | endif
augroup END

" Set more space on the left
set nonumber
set foldcolumn=4 "max 12
set wrapmargin=4
highlight! link FoldColumn Normal

" Line number column transparent on colorscheme change its overriden
highlight clear LineNr
" Enable yanked to system clipboard
set clipboard=unnamed
set mouse=a
set t_Co=256

set background=light
let g:solarized_termtrans = 1
let g:solarized_termcolors = 16
color solarized

" Set Tab bar color background to translucid and line to black
highlight TabLineFill ctermfg=Black
highlight SpecialKey guibg=bg ctermbg=none

" Spelling mistakes will be colored up red.
hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellCap cterm=underline ctermfg=203 guifg=#ff5f5f

" Airline settings
let g:airline_powerline_fonts = 1
" Airline customization
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Set Gutter column translucid - only work at start
highlight clear FoldColumn
highlight clear Folded
highlight clear SignColumn

" Colorize right extra white tab or space chars
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
" Display tabs and trailing spaces visually
set list listchars=tab:\|\ ,trail:·


" Set utf8 as standard encoding and en_US as the standard language
scriptencoding utf-8
set encoding=utf8

" Use Unix as the standard file type
set fileformats=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Persistent Undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keep undo history across sessions, by storing in file.
" Only works all the time.

"silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/undodir
set undofile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
" 1 tab 4 spaces for auto-identation and <<>> ==
set shiftwidth=4
" width of the TAB character
set tabstop=4

if has('autocmd')
  autocmd FileType gitcommit setlocal spell
  autocmd Filetype c,cpp set noexpandtab sw=4 ts=4 cinoptions+=L0
  autocmd Filetype python,ruby,php set expandtab sw=4 ts=4
  autocmd Filetype json,javascript,typescript,html set expandtab sw=2 ts=2
  autocmd Filetype yaml,markdown set expandtab sw=2 ts=2 wrap

  " Shell files Indent with tabs, align with spaces
  autocmd FileType sh set noet ci pi sts=0 sw=8 ts=8

  " Go files Indent with tabs, align with spaces
  autocmd FileType go set noet ci pi sts=0 sw=4 ts=4

  " XML files Indent with tabs, align with spaces
  autocmd FileType xml set noet ci pi sts=0 sw=2 ts=2

  " Remove all whitespace at buffer saving
  autocmd BufWrite * :call DeleteTrailingWS()

  " Return to last edit position when opening files
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  " But don't remember the cursor position in git commits
  au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
endif

" Linebreak on 500 characters
set linebreak
set textwidth=500

set autoindent "Auto indent
set smartindent "Smart indent
set nowrap "Wrap lines

" Folds
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk
nnoremap <S-LEFT> :tabprevious<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Quick open blank/new buffers
map <leader>bh :enew<cr>
map <leader>bv :vnew<cr>
map <leader>bt :tabnew<cr>
" Close the current buffer
map <silent><leader>bd :Bclose<cr>
" Close all the buffers
map <silent><leader>ba :%bd!<cr>
" Move between bufferrs
map <leader>bn :bnext<cr>
map <leader>bp :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
" Opens a new tab with the current buffer's relative path
map <leader>te :tabedit <c-r>=expand("%:~:.:h")<cr>/
" Shift+ arrow -> <-
nnoremap <S-RIGHT> :tabnext<cr>
nnoremap <S-LEFT> :tabprevious<cr>

" Splits prefer to the right and below
set splitright
set splitbelow
" Open a vertical split with the current buffer's relative path
map <leader>sv :vsplit <c-r>=expand("%:~:.:h")<cr>/
" Open a horizontal split with the current buffer's relative path
map <leader>sh :split <c-r>=expand("%:~:.:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
    " nothing for the moment
endtry

" Remember info about open buffers on close
set viminfo^=%

" ================ Custom Mappings ==================
" Additional way to go to toggle from insert and nomal mode
" Works on terminal and GUI in windows, in macos only with GUI
imap <S-Space> <Esc>
nmap <S-Space> i

" Insert date time pressing <f7> key
:nnoremap <F7> "=strftime("%c")<cr>P
:inoremap <F7> <C-R>=strftime("%c")<cr>

" Clear search higlight pressing enter
:nnoremap <silent> <CR> :nohlsearch<cr><cr>

" Move a line of text using SHIFT+[jk]
nnoremap <S-Up> :m-2<cr>
nnoremap <S-Down> :m+<cr>
inoremap <S-Up> <Esc>:m-2<cr>
inoremap <S-Down> <Esc>:m+<cr>

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing <leader>sl will toggle and turn toggle spell checking
map <leader>sl :setlocal spell!<cr>
" Move between errors
map <leader>sn ]s
map <leader>sp [s
" Add word to dictionary
map <leader>sa zg
" Suggest correction
map <leader>ss z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <leader>rw mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" ================ Helper Functions ==================
" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

