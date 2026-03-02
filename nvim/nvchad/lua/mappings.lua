require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Ctrl+S to save
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Migrated map's
map("n", "<Bslash>", "<cmd> NvimTreeToggle <cr>")
map("n", ",ba",
    "<cmd> %bdelete <cr>",
    { desc = "Close all buffers" ,silent = true, noremap = true }
)
map("n", ",wb",
    "<cmd> w <cr>",
    { desc = "Write current buffer", noremap = true }
)
map("n", ",wa",
    "<cmd> wa <cr>",
    { desc = "Write all buffers", noremap = true }
)
map("n", ",x",
  function()
    vim.cmd.write()
    require("nvchad.tabufline").close_buffer()
  end,
  { desc = "Write and Exit", noremap = true }
)
map("n", ",qb",
  function()
    require("nvchad.tabufline").close_buffer()
  end,
  { desc = "Quit the buffer discarding changes", noremap = true }
)
map("n", ",qa",
    "<cmd> qa! <cr>",
    { desc = "Discard any change and Quit", noremap = true }
)
map("n", "<C-p>",
    "<cmd>Telescope find_files<cr>",
    { desc = "ControlP find files", noremap = true }
)

--
-- Nvchad Remaps and Remove of mappings
--

-- Terminal
nomap("n", "<leader>h")
map("n", "<leader>ts", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })

nomap("n", "<leader>v")
map("n", "<leader>tv", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal new vertical term" })

nomap("n", "<leader>pt")
map("n", "<leader>th", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })

-- Themes to C
map("n", "<leader>ct", function()
  require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })

-- Git stuff
nomap("n", "<leader>cm")
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })

nomap("n", "<leader>gt")
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })

-- Line numbering
nomap("n", "<leader>n")
map("n", "<leader>nl", "<cmd>set nu!<CR>", { desc = "toggle line number" })
nomap("n", "<leader>rn")
map("n", "<leader>nr", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

