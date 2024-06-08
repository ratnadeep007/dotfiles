return {
  "ratnadeep007/modes.nvim",
  version = "v1.1",
  config = function()
    require("modes").setup({
      colors = {
        copy = "#7dcfff",
        delete = "#f7768e",
        insert = "#1abc9c",
        visual = "#fd57bb",
      },
      -- line_opacity = 0.15,
      set_cursor = true,
      set_cursorline = true,
      set_number = true,
    })
  end,
}
