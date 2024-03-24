return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
      },
    },
    config = function ()
			require("mason-lspconfig").setup()
			require("mason-lspconfig").setup_handlers {
				function(server_name)
					require("lspconfig")[server_name].setup {}
				end
			}
		end,
  },
  {
    "neovim/nvim-lspconfig",
  },
}
