local lsp = {
  function()
    local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
    if #buf_clients == 0 then
      return "LSP Inactive"
    end

    local buf_ft = vim.bo.filetype
    local buf_client_names = {}
    -- local copilot_active = false

    -- add client
    for _, client in pairs(buf_clients) do
      if client.name ~= "null-ls" and client.name ~= "copilot" then
        table.insert(buf_client_names, client.name)
      end

      -- if client.name == "copilot" then
      --   copilot_active = true
      -- end
    end

    -- add formatter
    -- local formatters = require("lvim.lsp.null-ls.formatters")
    -- local supported_formatters = formatters.list_registered(buf_ft)
    -- vim.list_extend(buf_client_names, supported_formatters)
    --
    -- -- add linter
    -- local linters = require("lvim.lsp.null-ls.linters")
    -- local supported_linters = linters.list_registered(buf_ft)
    -- vim.list_extend(buf_client_names, supported_linters)

    local unique_client_names = table.concat(buf_client_names, ", ")
    local language_servers = string.format("[%s]", unique_client_names)

    -- if copilot_active then
    --   language_servers = language_servers .. "%#SLCopilot#" .. " " .. lvim.icons.git.Octoface .. "%*"
    -- end

    return language_servers
  end,
  color = { gui = "bold" },
}

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = function (_, opts)
		local function maximize_status()
      return vim.t.maximized and "   " or ""
		end
		return {
      options = {
        theme = "rose-pine",
        disable_filetypes = { statusline = { "dashboard", "alpha" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", { "diff", colored = true, source = diff_source }, "diagnostics" },
        lualine_c = { "filename", lsp, maximize_status },
        lualine_x = {
          -- { "diff", colored = true, source = diff_source },
          "encoding",
          "fileformat",
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      extensions = {
        "neo-tree",
        "lazy",
      },
    }
	end,
	config = true,
}
