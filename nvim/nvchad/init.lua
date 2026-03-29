vim.g.mapleader = " "
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"

-- ---------------------------------------------------------------------------
-- Bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" }, -- lua/plugins/*.lua
}, lazy_config)

-- ---------------------------------------------------------------------------

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

-- Load vim Settings and Autocommands
require "options"     -- lua/options.lua
require "autocmds"    -- lua/autocmds

-- Load custom Keybindings
vim.schedule(function()
  require "mappings"  -- lua/mappings.lua
end)
