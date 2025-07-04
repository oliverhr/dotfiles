return {

  { -- Buffer Format
    "stevearc/conform.nvim",
    event = 'BufWritePre',      -- for format on save
    opts = require "configs.conform",
  },

  { -- LSP configuration
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },


  { -- Treesitter
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css",
        "json", "javascript",
        "python",
      },
    },
  },
}

