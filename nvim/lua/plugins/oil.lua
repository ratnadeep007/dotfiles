return {
    "stevearc/oil.nvim",
    lazy = false,
    enable = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        view_options = {
          show_hidden_files = true,
        },
      })
    end,
    keys = {
      { "<leader>e", "<cmd>Oil --float<cr>", desc = "Open Oil Float", remap = true },
    },
}
