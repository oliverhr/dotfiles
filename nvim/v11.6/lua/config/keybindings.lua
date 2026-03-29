local map = vim.keymap.set

--Buffer Actions mappings
map('n', '<leader>bw', '<cmd>enew<CR><Esc>', { desc = 'New buffer' })
map('n', '<leader>bh', '<cmd>new<CR><Esc>', { desc = 'New horizontal buffer' })
map('n', '<leader>bv', '<cmd>vnew<CR><Esc>', { desc = 'New vertical buffer' })
map('n', '<leader>bt', '<cmd>tabnew<CR><Esc>', { desc = 'New tab' })

map('n', '<leader>bw', '<cmd>write<CR>', { desc = 'Buffer write' })
map('n', '<leader>bs', '<cmd>wall<cr>', { desc = 'Buffer write/save all' })
map('n', '<leader>bx', '<cmd>w | bdelete<CR>', { desc = 'Buffer write and close' })
map('n', '<leader>bq', '<cmd>wqall<CR>', { desc = 'Buffer write all and quit' })
map('n', '<leader>bd', '<cmd>bdelete<CR><Esc>', { desc = 'Buffer delete' })
map('n', '<leader>ba', '<cmd>%bdelete<CR><Esc>', { desc = 'Buffer delete all' })

map('n', '<leader>bn', '<cmd>bnext<CR><Esc>', { desc = 'Buffer next' })
map('n', '<leader>bp', '<cmd>bprevious<CR><Esc>', { desc = 'Buffer previous' })

-- Tabs
map('n', '<leader>to', ':tabonly<CR>', { desc = 'Leave current tab open and close the rest' })
map('n', '<leader>tc', ':tabclose<CR>', { desc = 'Close current tab' })
map('n', '<leader>tm', ':tabmove<CR>', { desc = 'Move the current tab to after tab page N' })
map('n', '<leader>tn', ':tabnext<CR>', { desc = 'Next Tab' })
map('n', '<leader>tp', ':tabprevious<CR>', { desc = 'Previous Tab' })

-- Semicolon to enter command mode (más rápido que Shift + :)
map('n', ';', ':')

-- Shift + Space para alternar entre Insert y Normal
map('i', '<S-Space>', '<Esc>')
map('n', '<S-Space>', 'i')

-- Treat long lines as visual lines instead of logic lines
-- with a counter (ie. 5j), use j as usual, otherwise use gj
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Clear highlight search
map('n', '<CR>', '<cmd>nohlsearch<CR>', { silent = true })

-- Move línes Shift+Up/Down (Normal mode)
map('n', '<S-Up>', '<cmd>m-2<CR>==', { silent = true })
map('n', '<S-Down>', '<cmd>m+<CR>==', { silent = true })
-- Move línes Shift+Up/Down (Insert mode)
map('i', '<S-Up>', '<Esc><cmd>m-2<CR>==gi', { silent = true })
map('i', '<S-Down>', '<Esc><cmd>m+<CR>==gi', { silent = true })
-- Move línes Shift+Up/Down (Visual mode)
map('v', '<S-Up>', ":m '<-2<CR>gv=gv", { silent = true })
map('v', '<S-Down>', ":m '>+1<CR>gv=gv", { silent = true })

-- Toggle numbers
map('n', '<leader>n', '<cmd>set nu! rnu!<CR>', { silent = true, desc = 'Toggle line numbers' })

-- Change directory to buffer's directory
map('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>', { desc = 'CD to the current open buffer container dir' })

-- Spell checking
map('n', '<leader>sl', ':setlocal spell!<CR>', { desc = 'Toggle spell check for current buffer' })
map('n', '<leader>sn', ']s', { desc = 'Move to the next misspelled word' })
map('n', '<leader>sp', '[s', { desc = 'Move to the previous misspelled word' })
map('n', '<leader>sa', 'zg', { desc = 'Add misspelles word as good to the spellfile' })
map('n', '<leader>ss', 'z=', { desc = 'Find a suggestion for current misspelled word' })

-- Avoid weird behavior when pasting
map('n', '<leader>pp', ':setlocal paste!<CR>', { desc = 'Toggle local paste' })

-- vim: ts=2 sts=2 sw=2 et
