return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  -- Optional dependencies
  dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  keys = {
    -- Open oil in a floating window
    { '-', '<cmd>Oil --float<CR>', desc = 'Oil floating' },
  },
  opts = {
    -- Floating window configuration
    view_options = {
      show_hidden = true,
    },
    float = {
      padding = 5,
      max_width = 0.75, -- 0 means no limit
      max_height = 0.75,
      border = 'rounded', -- "single", "double", "shadow", "rounded"
      win_options = {
        winblend = 0,
      },
    },
    win_options = {
      number = false,
      relativenumber = false,
    },
  },
}
