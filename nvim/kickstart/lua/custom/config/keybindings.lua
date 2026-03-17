local map = vim.keymap.set
return {
  --[[ Buffer Actions mappings ]]
  map('n', '<leader>be', '<cmd>enew<CR><Esc>', { desc = '[B]uffer N[e]w' }),
  map('n', '<leader>bv', '<cmd>vnew<CR><Esc>', { desc = '[B]uffer New [V]ertical' }),
  map('n', '<leader>bw', '<cmd>write<CR>', { desc = '[B]uffer [W]rite' }),
  map('n', '<leader>ba', '<cmd>wall<CR>', { desc = '[B]uffer Write [A]ll' }),
  map('n', '<leader>bx', '<cmd>wq<CR>', { desc = '[B]uffer Write and E[x]it' }),
  map('n', '<leader>bq', '<cmd>wqa<CR>', { desc = '[B]uffer Write All and [Q]uit' }),
  map('n', '<leader>bd', '<cmd>bdel<CR><Esc>', { desc = '[B]uffer [D]elete' }),
  map('n', '<leader>bl', '<cmd>%bdel<CR><Esc>', { desc = '[B]uffer Delete Al[l]' }),
  map('n', '<leader>bn', '<cmd>bnext<CR><Esc>', { desc = '[B]uffer [N]ext' }),
  map('n', '<leader>bp', '<cmd>bprevious<CR><Esc>', { desc = '[B]uffer [P]revious' }),
  map('n', '<leader>bt', '<cmd>tabnew<CR><Esc>', { desc = '[B]uffer New [T]ab' }),
}
