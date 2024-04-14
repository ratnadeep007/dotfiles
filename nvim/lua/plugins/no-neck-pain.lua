return {
  "shortcuts/no-neck-pain.nvim",
  opts = {
    width = 125,
  },
  keys = {
    {
      "<leader>np",
      "<cmd>NoNeckPain<CR>",
      mode = { "n", "v" },
      desc = "Toggle NoNeckPain",
    },
    {
      "<leader>nk",
      "<cmd>NoNeckPainWidthUp<CR>",
      mode = { "n", "v" },
      desc = "NoNeckPain Increase Width",
    },
    {
      "<leader>nj",
      "<cmd>NoNeckPainWidthDown<CR>",
      mode = { "n", "v" },
      desc = "NoNeckPain Decrease Width",
    },
    {
      "<leader>nr",
      "<cmd>NoNeckPainResize 125<CR>",
      mode = { "n", "v" },
      desc = "NoNeckPain Resize to 125",
    }
  },
}
