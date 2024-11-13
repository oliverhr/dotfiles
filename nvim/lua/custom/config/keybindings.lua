return {
  --[[ Buffer Actions mappings ]]
  vim.keymap.set('n', '<leader>be', '<cmd>enew<CR><Esc>', { desc = '[B]uffer N[e]w' }),
  vim.keymap.set('n', '<leader>bv', '<cmd>vnew<CR><Esc>', { desc = '[B]uffer New [V]ertical' }),
  vim.keymap.set('n', '<leader>bw', '<cmd>write<CR>', { desc = '[B]uffer [W]rite' }),
  vim.keymap.set('n', '<leader>ba', '<cmd>wall<CR>', { desc = '[B]uffer Write [A]ll' }),
  vim.keymap.set('n', '<leader>bx', '<cmd>wq<CR>', { desc = '[B]uffer Write and E[x]it' }),
  vim.keymap.set('n', '<leader>bq', '<cmd>wqa<CR>', { desc = '[B]uffer Write All and [Q]uit' }),
  vim.keymap.set('n', '<leader>bd', '<cmd>bdel<CR><Esc>', { desc = '[B]uffer [D]elete' }),
  vim.keymap.set('n', '<leader>bl', '<cmd>%bdel<CR><Esc>', { desc = '[B]uffer Delete Al[l]' }),
  vim.keymap.set('n', '<leader>bn', '<cmd>bnext<CR><Esc>', { desc = '[B]uffer [N]ext' }),
  vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<CR><Esc>', { desc = '[B]uffer [P]revious' }),
  vim.keymap.set('n', '<leader>bt', '<cmd>tabnew<CR><Esc>', { desc = '[B]uffer New [T]ab' }),
}
