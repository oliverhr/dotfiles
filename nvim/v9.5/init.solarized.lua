-- ---------------------------------------------------------------------------
-- NEOVIM
-- ---------------------------------------------------------------------------
-- Bare configuration no plugins
-- ---------------------------------------------------------------------------

local opt = vim.opt

opt.termguicolors = false -- Colores reales de 24 bits
opt.background = 'light'
vim.cmd.colorscheme 'solarized'

-- https://github.com/altercation/vim-colors-solarized?tab=readme-ov-file#the-values
-- Status Bar colors
local _bg_d    = 0  -- dark
local _bg_l    = 10 -- light

local _blue    = 33
local _green   = 64
local _magenta = 125
local _orange  = 166
local _red     = 160
local _white   = 230
local _yellow  = 136

local _bg = _bg_d
local _fg = _white

-- Interfaz y Visualización
opt.number = true          -- Desactiva números
opt.relativenumber = true  -- Desactiva números relativos
opt.cursorline = true      -- Resalta la línea actual
opt.laststatus = 2         -- Siempre mostrar la barra de estado
opt.showmode = false       -- No mostrar mode, ya se muestra en la barra de estado
opt.ruler = true           -- Mostrar regla (línea/columna) en la parte inferior
opt.cmdheight = 1          -- Espacio para mensajes de comandos
opt.showmatch = true       -- Resalta brevemente el paréntesis/llave de cierre
opt.matchtime = 5          -- Décimas de segundo para mostrar el match
opt.scrolloff = 8          -- Mantiene 8 líneas de margen al hacer scroll vertical
opt.sidescrolloff = 15     -- Mantiene 15 columnas de margen al hacer scroll horizontal
opt.sidescroll = 1         -- Scroll horizontal más fluido (1 columna a la vez)

-- Splits
opt.splitright = true      -- Split Vertical a la derecha
opt.splitbelow = true      -- Split Horizontal abajo

-- Campanas (Bells)
opt.errorbells = false     -- Sin sonido de error
opt.visualbell = true      -- Destello visual en lugar de pitido

-- Archivos y Persistencia
opt.backup = false         -- No crear backups
opt.writebackup = false    -- No crear backup antes de sobreescribir
opt.swapfile = false       -- No usar archivos swap
-- Dónde guardar los undos
local undodir = vim.fn.stdpath('state') .. '/undodir'
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, 'p')
end
opt.undodir = undodir
opt.undofile = true        -- Guardar historial de "undo" en un archivo

-- Comportamiento de Búsqueda
opt.ignorecase = true      -- Ignorar mayúsculas al buscar...
opt.smartcase = true       -- ...a menos que se use una mayúscula explícita
opt.path:append('**')      -- Permite buscar en subdirectorios (fuzzer nativo)
opt.wildmenu = true                 -- Menú visual para sugerencias
opt.wildmode = 'longest:full,full'  -- Completa hasta lo más largo y luego abre el menú
-- Ignora basura
opt.wildignore:append({ '*.pyc', '__pycache__', '.git', 'node_modules/*', '.venv/*', '**/undodir/**' })
-- Preview substitutions while typing
opt.inccommand = 'split'

-- Configure backspace so it acts as it should act
opt.backspace = { 'eol', 'indent', 'start' }
-- Permite que h, l, las flechas y Espacio salten a la línea anterior/siguiente
opt.whichwrap:append('<,>,[,]')
opt.wrapmargin = 8         -- Margen de caracteres antes del wrap a una línea

opt.clipboard = 'unnamed'  -- Usa el portapapeles del sistema
opt.mouse = 'a'            -- Soporte total de ratón

-- Highlight Trailing whitespace
vim.api.nvim_set_hl(0, 'ExtraWhitespace', { bg = 'red', ctermbg = 'red' })
vim.fn.matchadd('ExtraWhitespace', [[\s\+$]])
opt.list = true
opt.listchars = {
  tab = '| ',
  trail = '·',
}

-- Folds (Plegado de código)
opt.foldmethod = 'indent'  -- Plegar basado en la indentación
opt.foldnestmax = 3        -- Máximo 3 niveles de profundidad
opt.foldenable = false     -- Que los archivos no se abran plegados por defecto
opt.foldcolumn = '2'       -- Mostrar columna lateral de folds

-- Format for columns: number, fold and foldsign
opt.signcolumn = true
opt.statuscolumn = '%=%{v:relnum == 0 ? v:lnum : "   " .. v:relnum}   '
vim.api.nvim_set_hl(0, 'LineNr',       { ctermfg = _bg_l, ctermbg = none })
vim.api.nvim_set_hl(0, 'CursorLineNr', { ctermbg = _yellow, ctermfg = _fg, bold = true })

-- Mappings
-- Time in milliseconds to wait for a mapped sequence to complete.
-- Comportamiento y Tiempos
opt.timeoutlen = 400       -- Tiempo de espera para mapeos (ms)
opt.updatetime = 300       -- Tiempo para disparar eventos (buena práctica)

-- Leader Mapping to spacebar
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Semicolon to enter command mode (más rápido que Shift + :)
vim.keymap.set('n', ';', ':')

-- Shift + Space para alternar entre Insert y Normal
vim.keymap.set('i', '<S-Space>', '<Esc>')
vim.keymap.set('n', '<S-Space>', 'i')

-- Treat long lines as visual lines instead of logic lines
-- si hay un "count" (ej. 5j), usa j normal, si no, usa gj.
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Navegación de ventanas (Se quita el Ctrl+W para ganar velocidad)
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Limpiar resaltado de búsqueda con Enter
vim.keymap.set('n', '<CR>', '<cmd>nohlsearch<CR>', { silent = true })

-- Mover líneas con Shift+Up/Down (Normal mode)
vim.keymap.set('n', '<S-Up>', '<cmd>m-2<CR>==', { silent = true })
vim.keymap.set('n', '<S-Down>', '<cmd>m+<CR>==', { silent = true })
-- Mover líneas con Shift+Up/Down (Insert mode)
vim.keymap.set('i', '<S-Up>', '<Esc><cmd>m-2<CR>==gi', { silent = true })
vim.keymap.set('i', '<S-Down>', '<Esc><cmd>m+<CR>==gi', { silent = true })
-- Mover líneas con Shift+Up/Down (Visual mode)
vim.keymap.set('v', '<S-Up>', ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set('v', '<S-Down>', ":m '>+1<CR>gv=gv", { silent = true })

-- Toggle explorer
vim.g.netrw_banner = false
vim.g.netrw_liststyle = 3
vim.keymap.set('n', '<Bslash>', '<cmd>25Lexplore!<CR>', { silent = true, desc = 'Toggle file explorer' })

-- Toggle numbers
vim.keymap.set('n', '<leader>n', '<cmd>set nu! rnu!<CR>', { silent = true, desc = 'Toggle line numbers' })

-- Buffer management
vim.keymap.set('n', '<leader>bw', '<cmd>enew<CR>',         { silent = true, desc = 'New buffer' })
vim.keymap.set('n', '<leader>bh', '<cmd>new<CR>',          { silent = true, desc = 'New horizontal buffer' })
vim.keymap.set('n', '<leader>bv', '<cmd>vnew<CR>',         { silent = true, desc = 'New vertical buffer' })
vim.keymap.set('n', '<leader>bt', '<cmd>tabnew<CR>',       { silent = true, desc = 'New tab' })
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<CR>',      { silent = true, desc = 'Delete current buffer' })
vim.keymap.set('n', '<leader>bx', '<cmd>w | bdelete<CR>',  { silent = true, desc = 'Write and close current buffer' })
vim.keymap.set('n', '<leader>ba', '<cmd>%bdelete<CR>',     { silent = true, desc = 'Delete all buffers' })
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<CR>',        { silent = true, desc = 'Go to next buffer' })
vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<CR>',    { silent = true, desc = 'Go to previous buffer' })

-- Tabs
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>',   { desc = 'New Tab' })
vim.keymap.set('n', '<leader>to', ':tabonly<CR>',  { desc = 'Leave current tab open and close the rest' })
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { desc = 'Close current tab' })
vim.keymap.set('n', '<leader>tm', ':tabmove<CR>',  { desc = 'Move the current tab to after tab page N' })

vim.api.nvim_set_keymap('n', '<S-Right>', ':tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Left>',  ':tabprevious<CR>', { noremap = true })

-- Go to cmd mode in current file path to open on vertical or horizontal split
vim.keymap.set('n', '<leader>oh', ':split <C-R>=expand("%:~:.:h")<CR>/',    { desc = 'Edit a file on a hsplit ...' })
vim.keymap.set('n', '<leader>ov', ':vsplit <C-R>=expand("%:~:.:h")<CR>/',   { desc = 'Edit a file on a vsplit ...' })
vim.keymap.set('n', '<leader>ot', ':tabedit <C-R>=expand("%:~:.:h")<CR>/',  { desc = 'Edit a file on a new tab ...' })

-- Change directory to buffer's directory
vim.keymap.set('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>', { desc = 'CD to the current open buffer container dir' })

-- Open vimrc in read mode
vim.keymap.set('n', '<leader>rc', ':view $MYVIMRC<CR>', { silent = true, desc = 'Open MYVIMRC in view mode' })

-- Save and quit
vim.keymap.set('n', '<leader>w',   ':w<CR>',   { silent = true, desc = 'Write buffer' })
vim.keymap.set('n', '<leader>wa',  ':wa<CR>',  { silent = true, desc = 'Write all buffers' })
vim.keymap.set('n', '<leader>x',   ':x<CR>',   { silent = true, desc = 'Write current buffer and exit' })
vim.keymap.set('n', '<leader>xa',  ':xa<CR>',  { silent = true, desc = 'Write all the buffers en exit' })

vim.keymap.set('n', '<leader>q',  ':q!<CR>',  { silent = true, desc = 'No save close the current window if last exit vim' })
vim.keymap.set('n', '<leader>qa', ':qa!<CR>', { silent = true, desc = 'No save close all the windows and exit vim'})

-- Spell checking
vim.keymap.set('n', '<leader>sl', ':setlocal spell!<CR>', { desc = 'Toggle spell check for current buffer' })
vim.keymap.set('n', '<leader>sn', ']s', { desc = 'Move to the next misspelled word' })
vim.keymap.set('n', '<leader>sp', '[s', { desc = 'Move to the previous misspelled word' })
vim.keymap.set('n', '<leader>sa', 'zg', { desc = 'Add misspelles word as good to the spellfile' })
vim.keymap.set('n', '<leader>ss', 'z=', { desc = 'Find a suggestion for current misspelled word' })

-- Misc
vim.keymap.set('n', '<leader>pp', ':setlocal paste!<CR>', { desc = 'Toggle local paste' })

-- Buscar archivos en subcarpetas de forma rápida
vim.keymap.set('n', '<leader>f', ':find *', { desc = 'Find files (native)' })

-- Filetype based configurations
vim.cmd([[
  augroup FileTypeSettings
    autocmd!
    autocmd Filetype c,cpp setlocal noexpandtab sw=4 ts=4 cinoptions+=L0
    autocmd FileType sh,bash,go setlocal noexpandtab ci pi sts=0 sw=4 ts=4
    autocmd Filetype python,ruby,php setlocal expandtab sw=4 ts=4
    autocmd Filetype lua,json,javascript,typescript,html setlocal expandtab sw=2 ts=2 sts=2
    autocmd Filetype yaml setlocal expandtab sw=2 ts=2 sts=2 wrap
    autocmd Filetype markdown setlocal expandtab sw=2 ts=2 co=120 wrap linebreak
    autocmd FileType xml setlocal noet ci pi sts=0 sw=2 ts=2
  augroup END
]])

local aug_GeneralSettings = vim.api.nvim_create_augroup('GeneralSettings', { clear = true })

-- Trim Trailing Whitespace (but excluded fts on map)
local ignore_ft_clean_trailing = {
  markdown = true,
  gitcommit = true,
}
vim.api.nvim_create_autocmd('BufWritePre', {
  group = aug_GeneralSettings,
  pattern = '*',
  callback = function(ev)
    local ft = vim.bo[ev.buf].filetype
    if ignore_ft_clean_trailing[ft] then return end

    local current_view = vim.fn.winsaveview()
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(current_view)
  end,
})

-- Return to last edit position on files (except gitcommit)
vim.api.nvim_create_autocmd('BufReadPost', {
  group = aug_GeneralSettings,
  pattern = '*',
  callback = function(ev)
    if vim.bo[ev.buf].filetype == 'gitcommit' then return end

    local mark = vim.api.nvim_buf_get_mark(ev.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(ev.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- Open Explore on a floating window
local function open_floating_explorer()
  local buf = vim.api.nvim_create_buf(false, true)
  local opts = {
    relative = 'editor',
    width = math.floor(vim.o.columns * 0.8),
    height = math.floor(vim.o.lines * 0.8),
    col = math.floor(vim.o.columns * 0.1),
    row = math.floor(vim.o.lines * 0.1),
    style = 'minimal',
    border = 'rounded',
  }
  vim.api.nvim_open_win(buf, true, opts)
  vim.cmd('Ex') -- Open netrw
end
vim.keymap.set('n', '<leader>E', open_floating_explorer)

local mode_colors = {
  n       = { bg = _green,    fg = _fg }, -- Normal
  i       = { bg = _blue,     fg = _fg }, -- Insert
  v       = { bg = _magenta,  fg = _fg }, -- Visual
  V       = { bg = _magenta,  fg = _fg }, -- V-Line
  ['\22'] = { bg = _magenta,  fg = _fg }, -- V-Block
  c       = { bg = _orange,   fg = _fg }, -- Command
  R       = { bg = _red,      fg = _fg }, -- Replace
}

function MyStatusLine()
  local mode = vim.api.nvim_get_mode().mode
  local colors = mode_colors[mode] or mode_colors.n

  vim.api.nvim_set_hl(0, 'StatusLineMode', { ctermfg = colors.fg, ctermbg = colors.bg, bold = true })
  vim.api.nvim_set_hl(0, 'StatusLineFile', { ctermfg = _fg, ctermbg = _bg })

  local sections = {
    '%#StatusLineMode# ',
    string.upper(mode),             -- Muestra el modo
    ' %#StatusLineFile# %f %m%r',   -- Archivo y estado
    '%=|',                          -- Separador central
    '%#StatusLineFile# %Y ',        -- Tipo de archivo
    '%#StatusLineMode# %l/%L:%c ',  -- Posición
  }
  return table.concat(sections)
end

vim.opt.statusline = "%!v:lua.MyStatusLine()"

-- vim: set ft=lua ts=2 sw=2 sts=2 et:
