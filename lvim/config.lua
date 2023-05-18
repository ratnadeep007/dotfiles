-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.plugins = {
  { "catppuccin/nvim", name = "catppuccin" },
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
  },
  {
    'mvllow/modes.nvim',
    version = 'v0.2.0',
    config = function()
      require('modes').setup()
    end
  }
}

lvim.colorscheme = "catppuccin"

vim.wo.relativenumber = true

-- no need to set style = "lvim"
local components = require("lvim.core.lualine.components")


-- bubble theme
-- stylua: ignore
local colors = {
  cyan      = '#79dac8',
  black     = '#080808',
  white     = '#c6c6c6',
  red       = '#ff5189',
  violet    = '#d183e8',
  grey      = '#303030',
  base      = '#1e1e2e',
  text      = '#cdd6f4',
  rosewater = '#cdd6f4',
  flamingo  = '#f2cdcd',
  pink      = '#f2cdcd',
  mauve     = '#cba6f7',
  read      = '#f38ba8',
  maroon    = '#eba0ac',
  peach     = '#eba0ac',
  yellow    = '#f9e2af',
  green     = '#a6e3a1',
  teal      = '#94e2d5',
  sky       = '#89dceb',
  sapphire  = '#74c7ec',
  blue      = '#89b4fa',
  lavender  = '#b4befe'
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.base, bg = colors.rosewater },
    b = { fg = colors.base, bg = colors.pink },
    c = { fg = colors.white, bg = colors.base },
    x = { fg = colors.white, bg = colors.base },
    y = { fg = colors.base, bg = colors.flamingo },
    z = { fg = colors.base, bg = colors.maroon }
  },

  insert = {
    a = { fg = colors.black, bg = colors.green },
    b = { fg = colors.white, bg = colors.pink },
    c = { fg = colors.white, bg = colors.base },
    x = { fg = colors.white, bg = colors.base },
    y = { fg = colors.base, bg = colors.flamingo },
    z = { fg = colors.base, bg = colors.maroon }
  },
  visual = {
    a = { fg = colors.black, bg = colors.blue },
    b = { fg = colors.white, bg = colors.pink },
    c = { fg = colors.white, bg = colors.base },
    x = { fg = colors.white, bg = colors.base },
    y = { fg = colors.base, bg = colors.lavender },
    z = { fg = colors.base, bg = colors.maroon }
  },
  replace = { a = { fg = colors.black, bg = colors.flamingo } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

lvim.builtin.lualine.options.section_separators = { left = '', right = '' }
lvim.builtin.lualine.options.component_separators = '|'
lvim.builtin.lualine.sections.lualine_a = { { "mode", separator = { left = ''}, right_padding = 2 } }
lvim.builtin.lualine.sections.lualine_c = { "diff", "searchcount", "tabs", "require'lsp-status'.status()" }
lvim.builtin.lualine.sections.lualine_y = {
  components.filename,
  components.location,
}
lvim.builtin.lualine.sections.lualine_z = {
  { 'progress', separator = { right = '' } }
}

lvim.builtin.lualine.options.theme = bubbles_theme
lvim.builtin.lualine.options.icons_enabled = true
