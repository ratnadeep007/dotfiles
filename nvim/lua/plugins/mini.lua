return { 
  "echasnovski/mini.nvim", 
  version = false,
  config = function()
    require("mini.bufremove").setup()
    require("mini.pairs").setup()
    require("mini.surround").setup({
      mappings = {
        add = "gsa",
	    }
    })
  end
}
