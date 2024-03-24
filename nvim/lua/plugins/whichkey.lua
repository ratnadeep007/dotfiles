return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    ["<leader>e"] = { name = "Oil Float" },
  },
  init = function ()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end
}
