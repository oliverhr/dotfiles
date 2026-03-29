require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Ctrl+S to save
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <CR>")

-- Migrated map's
map("n", "<Bslash>", "<cmd> NvimTreeToggle <CR>")

-- Emulate old comma leader used on classic vim
map("n", ",ba", "<cmd> %bdelete <CR>", { silent = true, desc = "Close all buffers" })
map("n", ",ww", "<cmd> w <CR>", { desc = "Write current buffer" })
map("n", ",wa", "<cmd> wa <CR>", { desc = "Write all buffers" })

map("n", ",x",
  function()
    vim.cmd.write()
    require("nvchad.tabufline").close_buffer()
  end,
  { desc = "Write and Exit" })

map("n", ",qb",
  function()
    require("nvchad.tabufline").close_buffer()
  end,
  { desc = "Quit the buffer discarding changes" })

map("n", ",qa",
  function()
    require("nvchad.tabufline").closeAllBufs(true)
  end,
  { desc = "Discard any change and Quit" })

--
-- Nvchad Remaps and Remove of mappings
--

-- Terminal
nomap("n", "<leader>h")
map("n", "<leader>ts",
  function()
    require("nvchad.term").new { pos = "sp" }
  end,
  { desc = "terminal new horizontal term" })

nomap("n", "<leader>v")
map("n", "<leader>tv",
  function()
    require("nvchad.term").new { pos = "vsp" }
  end,
  { desc = "terminal new vertical term" })

nomap("n", "<leader>pt")
map("n", "<leader>th", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })

-- Themes to C
map("n", "<leader>ct",
  function()
    require("nvchad.themes").open()
  end,
  { desc = "telescope nvchad themes" })

-- Git stuff
nomap("n", "<leader>cm")
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })

nomap("n", "<leader>gt")
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })

-- Line numbering
nomap("n", "<leader>n")
map("n", "<leader>nl", "<cmd>set nu!<CR>", { desc = "toggle line number" })
-- Line relative numbering
nomap("n", "<leader>rn")
map("n", "<leader>nr", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

