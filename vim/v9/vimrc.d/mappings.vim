vim9script

# -------------------------- Mappings -------------------------------
# With a map leader it's possible to do extra key combinations
var mapleader = ','
g:mapleader = ','

# Look at vim config since we live here XD
nnoremap <silent> <leader>rc :view $MYVIMRC<cr>

# Fast saving
nnoremap <silent> <leader>w :w<cr>
nnoremap <silent> <leader>wa :wa<cr>
nnoremap <silent> <leader>x :x<cr>
nnoremap <silent> <leader>wx :xa<cr>

# Fast quit
nnoremap <leader>q :q!<cr>
nnoremap <silent> <leader>qa :qa!<cr>

# Nerdtree
nnoremap <silent> <Bslash> :NERDTreeToggle<CR>
nnoremap <silent> <leader>l :NERDTreeFind<cr>

# Fuzzy finder
$FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden'
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>fa :Ag<cr>
nnoremap <silent> <leader>fr :Rg<cr>
nnoremap <silent> <leader>ff :Files<cr>
nnoremap <silent> <leader>fb :Buffers<cr>
nnoremap <silent> <leader>fw :Windows<cr>
nnoremap <silent> <leader>fg :GitFiles?<cr>
nnoremap <silent> <leader>fl :Lines<cr>
nnoremap <silent> <leader>fs :BLines<cr>
nnoremap <silent> <leader>fc :Commits<cr>

# Search down for folders and tab-completition for all file related tasks
set path+=**

# -----------------------------------------------------------------------------
# => Moving around, tabs, windows and buffers
# -----------------------------------------------------------------------------
# Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

# Toggle line numbers on/off
map <silent><leader>n :set number!<cr>

# Move between panes replace: vim-tmux-navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

# Quick open blank/new buffers
map <leader>bh :enew<cr>
map <leader>bv :vnew<cr>
map <leader>bt :tabnew<cr>

# Close the current buffer
map <silent><leader>bd :bdel!<cr>
map <leader>bx :w \| :bdel<cr>

# Close all the buffers
map <silent><leader>ba :%bdelete<cr>

# Move between bufferrs
map <silent><leader>bn :bnext<cr>
map <silent><leader>bp :bprevious<cr>

# Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>

# Opens a new tab with the current buffer's relative path
map <leader>te :tabedit <c-r>=expand('%:~:.:h')<cr>/

# Shift+ arrow -> <-
nnoremap <S-RIGHT> :tabnext<cr>
nnoremap <S-LEFT> :tabprevious<cr>

# Open a vertical split with the current buffer's relative path
map <leader>sv :vsplit <c-r>=expand('%:~:.:h')<cr>/
# Open a horizontal split with the current buffer's relative path
map <leader>sh :split <c-r>=expand('%:~:.:h')<cr>/

# Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

# ================ Custom Mappings ==================
# Additional way to go to toggle from insert and nomal mode
# Works on terminal and GUI in windows, in macos only with GUI
imap <S-Space> <Esc>
nmap <S-Space> i
# In normal mode press ; to go to commamd mode ':'
nnoremap ; :

# Insert date time pressing <f7> key
nnoremap <silent> <F7> A<C-R>=strftime('%Y-%m-%d %H:%M:%S ')<cr>
inoremap <silent> <F7> <C-R>=strftime('%c ')<cr>

# Clear search higlight pressing enter same as :noh
:nnoremap <silent> <CR> :nohlsearch<cr><cr>

# Move a line of text using SHIFT+[jk]
nnoremap <S-Up> :m-2<cr>
nnoremap <S-Down> :m+<cr>
inoremap <S-Up> <Esc>:m-2<cr>
inoremap <S-Down> <Esc>:m+<cr>

# -----------------------------------------------------------------------------
# => Spell checking
# -----------------------------------------------------------------------------
# Pressing <leader>sl will toggle and turn toggle spell checking
map <leader>sl :setlocal spell!<cr>
# Move between errors
map <leader>sn ]s
map <leader>sp [s
# Add word to dictionary
map <leader>sa zg
# Suggest correction
map <leader>ss z=

# -----------------------------------------------------------------------------
# => Misc
# -----------------------------------------------------------------------------
# Remove the Windows ^M - when the encodings gets messed up
noremap <leader>rw mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

# Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

# vim: set ft=vim ts=2 sw=2 et :
