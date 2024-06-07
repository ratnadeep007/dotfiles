require("lspconfig").pylsp.setup({
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { "E501" },
          maxLineLength = 100,
        },
      },
    },
  },
})

