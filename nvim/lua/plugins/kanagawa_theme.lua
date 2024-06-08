return {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    priority = 1000,
    opts = {},
    config = function ()
      vim.cmd("colorscheme kanagawa", opts)
    end
}
