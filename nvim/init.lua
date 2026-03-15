-- ---------------------------------------------------------------------------
-- NEOVIM
-- ---------------------------------------------------------------------------
-- Bare configuration no plugins
-- ---------------------------------------------------------------------------

-- Configuración básica
vim.o.encoding = 'utf-8'
vim.o.fileformats = 'unix,dos,mac'

-- Historial y autoread
vim.o.history = 1000
vim.o.autoread = true

-- Visuals
vim.o.cursorline = true
vim.o.number = true

-- Status bar
vim.o.laststatus = 2
-- Always show current position
vim.o.ruler = true
-- Height of the command bar
vim.o.cmdheight = 2

-- A buffer becomes hidden when it is abandoned
vim.o.hidden = true

-- Configure backspace so it acts as it should act
vim.o.backspace = 'eol,start,indent'
vim.o.whichwrap = vim.o.whichwrap .. '<,>,h,l'

-- Searching
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true
-- Search path
vim.o.path = vim.o.path .. ',**'

-- For regular expressions turn magic on
vim.o.magic = true

-- Brackets indicator
vim.o.showmatch = true
vim.o.matchtime = 5

-- Error indicators
vim.o.errorbells = false
vim.o.visualbell = true

-- Scrolling
vim.o.scrolloff = 8
vim.o.sidescrolloff = 15
vim.o.sidescroll = 1

-- Backup and undo
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.undodir = vim.fn.stdpath('config') .. '/undodir'
vim.o.undofile = true

-- Folding
vim.o.foldmethod = 'indent'
vim.o.foldnestmax = 3
vim.o.foldenable = false

-- Draw a foldculumn with a fixed number of columns
vim.o.foldcolumn = '2'
-- Number of characters from the right window border where wrapping
vim.o.wrapmargin = 8

-- Clipboard and mouse
vim.o.clipboard = 'unnamed'
vim.o.mouse = 'a'

vim.o.termguicolors = true

-- Set ColorScheme
vim.cmd("colorscheme retrobox")

vim.cmd([[highlight ExtraWhitespace ctermbg=red guibg=red]])
vim.cmd([[match ExtraWhitespace /\s\+$/]])
vim.o.list = true
vim.o.listchars = 'tab:| ,trail:·'

-- Time in milliseconds to wait for a mapped sequence to complete.
vim.o.timeoutlen = 500

-- Mappings
vim.api.nvim_set_keymap('n', ';', ':',  { noremap = true })
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })

-- Shift + space map to esc
vim.api.nvim_set_keymap('i', '<S-Space>', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Space>', 'i',     { noremap = true })

-- Window navigation
vim.api.nvim_set_keymap('n', '<C-j>', '<C-W>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-W>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-W>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-W>l', { noremap = true })

-- Clear search highlight with Enter
vim.api.nvim_set_keymap('n', '<CR>', ':nohlsearch<CR><CR>', { noremap = true, silent = true })

-- Move lines with Shift+Up/Down
vim.api.nvim_set_keymap('n', '<S-Up>',   ':m-2<CR>',      { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Down>', ':m+<CR>',       { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Up>',   '<Esc>:m-2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Down>', '<Esc>:m+<CR>',  { noremap = true, silent = true })

-- Leader Mapping to spacebar
vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', '<leader>n', ':set number!<CR>', { noremap = true, silent = true })

-- Buffers
vim.api.nvim_set_keymap('n', '<leader>bh', ':enew<CR>',         { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>bv', ':vnew<CR>',         { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>bt', ':tabnew<CR>',       { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>bd', ':bdelete!<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bx', ':w | bdelete<CR>',  { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ba', ':%bdelete<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bn', ':bnext<CR>',        { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bp', ':bprevious<CR>',    { noremap = true, silent = true })

-- Tabs
vim.api.nvim_set_keymap('n', '<leader>tn', ':tabnew<CR>',   { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>to', ':tabonly<CR>',  { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>tc', ':tabclose<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>tm', ':tabmove<CR>',  { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>te', ':tabedit <C-R>=expand("%:~:.:h")<CR>/', { noremap = true })

vim.api.nvim_set_keymap('n', '<S-Right>', ':tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Left>',  ':tabprevious<CR>', { noremap = true })

-- Splits
vim.o.splitright = true
vim.o.splitbelow = true
vim.api.nvim_set_keymap('n', '<leader>sv', ':vsplit <C-R>=expand("%:~:.:h")<CR>/', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>sh', ':split <C-R>=expand("%:~:.:h")<CR>/', { noremap = true })

-- Change directory to buffer's directory
vim.api.nvim_set_keymap('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>', { noremap = true })

-- Reload vimrc
vim.api.nvim_set_keymap('n', '<leader>rc', ':view $MYVIMRC<CR>', { noremap = true, silent = true })

-- Save and quit
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wa', ':wa<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>x', ':x<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>xa', ':xa<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>q', ':q!<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>qa', ':qa!<CR>', { noremap = true, silent = true })

-- Spell checking
vim.api.nvim_set_keymap('n', '<leader>sl', ':setlocal spell!<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>sn', ']s', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>sp', '[s', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>sa', 'zg', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ss', 'z=', { noremap = true })

-- Misc
vim.api.nvim_set_keymap('n', '<leader>pp', ':setlocal paste!<CR>', { noremap = true })

-- Filetype based configurations
vim.cmd([[
  augroup FileTypeSettings
    autocmd!
    autocmd Filetype c,cpp setlocal noexpandtab sw=4 ts=4 cinoptions+=L0
    autocmd FileType sh,bash,go setlocal noexpandtab ci pi sts=0 sw=4 ts=4
    autocmd Filetype python,ruby,php setlocal expandtab sw=4 ts=4
    autocmd Filetype json,javascript,typescript,html setlocal expandtab sw=2 ts=2 sts=2
    autocmd Filetype yaml setlocal expandtab sw=2 ts=2 sts=2 wrap
    autocmd Filetype markdown setlocal expandtab sw=2 ts=2 wrap linebreak
    autocmd FileType xml setlocal noet ci pi sts=0 sw=2 ts=2
  augroup END
]])

-- Syntax
vim.cmd([[syntax on]])
