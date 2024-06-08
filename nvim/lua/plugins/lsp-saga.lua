return {
  "nvimdev/lspsaga.nvim",
	cmd = "Lspsaga",
	lazy = false,
  config = function()
    require("lspsaga").setup({
      lightbulb = {
        enable = false,
      },
			symbol_in_winbar =  {
				enable = true,
			},
      finder = {
        default = "ref+imp+def",
      },
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
}
