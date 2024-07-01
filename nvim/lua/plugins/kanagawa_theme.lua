return {
   "rebelot/kanagawa.nvim",
   name = "kanagawa",
   priority = 1000,
   opts = {},
   config = function (opts)
       vim.cmd("colorscheme kanagawa", opts)
   end
}
