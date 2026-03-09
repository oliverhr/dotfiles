" vim: set ft=vim ts=2 sw=2 et :

" ==============================================================================
" VIMproved
set nocompatible
filetype plugin on
set modeline
set modelines=10

" Set utf8 as standard encoding and en_US as the standard language
scriptencoding utf-8
set encoding=utf8

" Use Unix as the standard file type
set fileformats=unix,dos,mac

" ========================= General Settings ========================
" Sets how many lines of history VIM has to remember
set history=1000

" Set to auto read when a file is changed from the outside
set autoread

" ========================= WildOptions ==============================
" Turn on the WiLd menu
set wildmode=list:longest
" enable ctrl-n and ctrl-p to scroll trough matches
set wildmenu

" stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~,*.pyc
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=node_modules/**
set wildignore+=bower_components/**
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=__pycache__
set wildignore+=.venv/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.zip,*.exe,*.pdb  " Windows

" Always show current position
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
set scrolloff=8         " Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Show status line
set laststatus=2

" -------------------------------------------------------------------
" => File backups
" -------------------------------------------------------------------
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set noswapfile

" -------------------------------------------------------------------
" => Persistent Undo
" -------------------------------------------------------------------
" Keep undo history across sessions, by storing in file.
" silent !mkdir ~/.vim/undodir > /dev/null 2>&1
set undodir=~/.vim/undodir
set undofile

" -------------------------------------------------------------------
" => Text, tab and indent related
" -------------------------------------------------------------------
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
" 1 tab 4 spaces for auto-identation and <<>> ==
set shiftwidth=4
" width of the TAB character
set tabstop=4

" Linebreak on 500 characters
set linebreak
set textwidth=500

set autoindent    " Auto indent
set smartindent   " Smart indent
set nowrap        " Wrap lines

" Folds
set foldmethod=indent   " fold based on indent
set foldnestmax=3       " deepest fold is 3 levels
set nofoldenable        " dont fold by default

