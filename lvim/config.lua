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
	  tag = 'v0.2.0',
	  config = function()
		  require('modes').setup()
      vim.opt.guicursor = "i:block-blinkwait0-blinkon30-blinkoff10"
	  end
  }
}

lvim.colorscheme = "catppuccin"

vim.wo.relativenumber = true

vim.opt.guicursor = "i:block-blinkwait0-blinkon30-blinkoff10"

-- no need to set style = "lvim"
local components = require("lvim.core.lualine.components")

lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_y = {
  components.location,
  components.filename,
}
lvim.builtin.lualine.sections.lualine_c = { "diff" }
