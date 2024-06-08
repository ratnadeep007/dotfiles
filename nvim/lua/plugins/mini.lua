return {
  "echasnovski/mini.nvim",
  version = false,
  dependencies = {
    "echasnovski/mini.ai",
  },
  config = function()
    require("mini.ai").setup()
    require("mini.bufremove").setup()
    require("mini.pairs").setup()
    require("mini.surround").setup({
      mappings = {
        add = "gsa",
	    }
    })
  end
}
