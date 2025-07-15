require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

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
map("n", "<C-p>",
    "<cmd>Telescope find_files<cr>",
    { desc = "ControlP find files", noremap = true }
)

