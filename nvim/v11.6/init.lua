--[[ Configuration based on Kickstart ]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
require 'config.settings'

-- [[ Basic Keymaps ]]
require 'config.keymaps'
-- Custom keymaps
require 'config.keybindings'

-- [[ Basic Autocommands ]]
require 'config.autocommands'

-- [[ Lazy Package manager ]]
require 'lazy.init'

-- Load the colorscheme here - after lazy configuration
-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
vim.cmd.colorscheme 'tokyonight-night'

-- vim: ts=2 sts=2 sw=2 et
