-- local colors = require("base46").get_theme_tb "base_30"
local palette = require("rose-pine.palette")

-- local function test_fn()
--   local highlights = {
--     init = function()
--       return {
--         a = { "hello " }
--       }
--     end
--   }
--   return highlights
-- end
--
--
-- print(vim.inspect(test_fn().init()))

return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      -- stylua: ignore
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    },
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
      'nvim-lua/plenary.nvim',
    },
    opts = {
      TelescopePromptPrefix = {
        fg = palette.base,
        bg = palette.surface,
      },
      TelescopeBorder = {
        config = {
          fg = palette.rose,
          bg = palette.muted,
        },
      },
      TelescopeNormal = {
        fg = palette.surface,
        bg = palette.surface,
      },
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "bottom" },
        sorting_strategy = "ascending",
        winblend = 0,
        --
        -- TelescopeNormal = { bg = colors.darker_black },
        --
        -- TelescopePreviewTitle = {
        --   fg = colors.black,
        --   bg = colors.green,
        -- },
        --
        -- TelescopePromptTitle = {
        --   fg = colors.black,
        --   bg = colors.red,
        -- },
        --
        -- TelescopeSelection = { bg = colors.black2, fg = colors.white },
        -- TelescopeResultsDiffAdd = { fg = colors.green },
        -- TelescopeResultsDiffChange = { fg = colors.yellow },
        -- TelescopeResultsDiffDelete = { fg = colors.red },
        --
        -- TelescopeMatching = { bg = colors.one_bg, fg = colors.blue },
      },
    },
    config = true,
}
