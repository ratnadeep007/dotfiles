-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny


lvim.transparent_window = true
-- vim.lsp.handlers["textDocument/signatureHelp"] = nil
-- lvim.lsp.handlers = nil
-- lvim.builtin.nvimtree.active = false

-- catppuccin theme
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
  rosewater = '#f5e0dc',
  flamingo  = '#f2cdcd',
  pink      = '#f5c2e2',
  mauve     = '#cba6f7',
  read      = '#f38ba8',
  maroon    = '#eba0ac',
  peach     = '#fab387',
  yellow    = '#f9e2af',
  green     = '#a6e3a1',
  teal      = '#94e2d5',
  sky       = '#89dceb',
  sapphire  = '#74c7ec',
  blue      = '#89b4fa',
  lavender  = '#b4befe'
}

lvim.keys.normal_mode["<C-h>"] = "<cmd>vsplit<CR>"
lvim.keys.normal_mode["<C-v>"] = "<cmd>split<CR>"

lvim.plugins = {
  { "catppuccin/nvim",         name = "catppuccin" },
  { "mg979/vim-visual-multi",  name = "vim-visual-multi" },
  { "Exafunction/codeium.vim", name = "codeium" },
  { "ryanoasis/vim-devicons",  name = "vim-devicons" },
  {
    "norcalli/nvim-colorizer.lua",
    name = "nvim-colorizer",
    config = function()
      require("colorizer").setup()
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    name = "neo-tree",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
    end
  },
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
    'ratnadeep007/modes.nvim',
    version = 'v1.1',
    config = function()
      require('modes').setup({
        colors = {
          copy = colors.rosewater,
          delete = colors.red,
          insert = colors.green,
          visual = colors.blue,
          replace = colors.pink,
          normal = colors.blue,
        },
        line_opacity = 0.15,
        set_cursor = true,
        set_cursorline = true,
        set_number = true,
      })
    end
  },
  -- lazy.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      local params = vim.lsp.util.make_range_params()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          hover = {
            enabled = false,
          },
          signature = {
            enabled = false,
            auto_open = {
              enabled = false,
              trigger = true,
              luasnip = true,
              throttle = 50,
            }
          },
          presets = {
            bottom_search = true,         -- use a classic bottom cmdline for search
            command_palette = true,       -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false,           -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = false,       -- add a border to hover docs and signature help
          },
        }
      })
      -- vim.lsp.buf_request(0, "textDocument/signatureHelp", params,
      --   require("noice.lsp.signature").on_signature)
      require("notify").setup({
        background_colour = "#000000",
      })
    end
  }
}
-- require("neo-tree").setup({
--   close_if_last_window = true,
--   popup_border_style = "rounded",
--   enable_git_status = true,
--   enable_diagnostics = true,
-- })
-- vim.api.nvim_create_augroup("neotree", {})
-- vim.api.nvim_create_autocmd("VimEnter", {
--   desc = "Open Neotree automatically",
--   group = "neotree",
--   callback = function()
--     if vim.fn.argc() == 0 and not vim.fn.exists "s:std_in" then
--       vim.cmd "Neotree toggle"
--     end
--   end,
-- })
-- vim.api.nvim_create_autocmd("BufEnter", {
--   desc = "Open Neotree automatically",
--   group = "neotree",
--   callback = function()
--     if vim.fn.argc() == 0 and not vim.fn.exists "s:std_in" then
--       vim.cmd "Neotree toggle"
--     end
--   end,
-- })

lvim.colorscheme = "catppuccin"

vim.wo.relativenumber = true

-- no need to set style = "lvim"
local components = require("lvim.core.lualine.components")

-- to make cursor block in insert mode
-- vim.opt.guicursor:append('i-ci-ve:block-ModesInsert')
vim.opt.guicursor = "i:block"

-- vim.cmd([[
--   augroup CustomCursorColor
--   autocmd!
--   autocmd VimEnter,ColorScheme * highlight Cursor guifg=#FF0000 guibg=#FF0000
--   augroup END
-- ]])


local bubbles_theme = {
  normal = {
    a = { fg = colors.base, bg = colors.mauve },
    b = { fg = colors.base, bg = colors.rosewater },
    c = { fg = colors.white, bg = colors.base },
    x = { fg = colors.white, bg = colors.base },
    y = { fg = colors.base, bg = colors.mauve },
    z = { fg = colors.base, bg = colors.peach }
  },

  insert = {
    a = { fg = colors.black, bg = colors.green },
    b = { fg = colors.base, bg = colors.pink },
    c = { fg = colors.white, bg = colors.base },
    x = { fg = colors.white, bg = colors.base },
    y = { fg = colors.base, bg = colors.green },
    z = { fg = colors.base, bg = colors.maroon }
  },
  visual = {
    a = { fg = colors.black, bg = colors.blue },
    b = { fg = colors.base, bg = colors.pink },
    c = { fg = colors.white, bg = colors.base },
    x = { fg = colors.white, bg = colors.base },
    y = { fg = colors.base, bg = colors.blue },
    z = { fg = colors.base, bg = colors.maroon }
  },
  replace = { a = { fg = colors.black, bg = colors.flamingo } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

lvim.builtin.lualine.options.section_separators = {
  left = '',
  right = ''
}
lvim.builtin.lualine.options.component_separators = '|'
lvim.builtin.lualine.sections.lualine_a = {
  {
    "mode",
    separator = {
      -- left = ''
    },
    right_padding = 2
  }
}
lvim.builtin.lualine.sections.lualine_c = { "diff", "searchcount", "tabs", "require'lsp-status'.status()" }
lvim.builtin.lualine.sections.lualine_y = {
  components.filename,
  components.location,
}
lvim.builtin.lualine.sections.lualine_z = {
  {
    'progress',
    separator = {
      -- right = ''
    }
  }
}

lvim.builtin.lualine.options.theme = bubbles_theme
lvim.builtin.lualine.options.icons_enabled = true
lvim.format_on_save.enabled = true

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint", filetypes = { "typescript" } },
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = { "typescript" }
  }
}

lvim.builtin.mason.ui = {
  icons = {
    package_installed = "●",
    package_pending = "●",
    package_uninstalled = "●"
  }
}
