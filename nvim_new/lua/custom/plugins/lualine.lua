local lsp = {
  function()
    local buf_clients = vim.lsp.get_clients { bufnr = 0 }

    if #buf_clients == 0 then
      return 'LSP Inactive'
    end

    local buf_client_names = {}
    for _, client in pairs(buf_clients) do
      table.insert(buf_client_names, client.name)
    end

    local unique_client_names = table.concat(buf_client_names, ', ')
    local language_servers = string.format('🚀 [%s]', unique_client_names)

    return language_servers
  end,
  color = { gui = 'bold' },
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
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  opts = function(_, _)
    local function maximize_status()
      return vim.t.maximized and '   ' or ''
    end
    return {
      options = {
        disable_filetypes = { statusline = { 'dashboard', 'alpha' } },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', { 'diff', colored = true, source = diff_source }, 'diagnostics' },
        lualine_c = { 'filename', lsp, maximize_status },
        lualine_x = {
          -- { "diff", colored = true, source = diff_source },
          'encoding',
          'fileformat',
          'filetype',
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      extensions = {
        'neo-tree',
        'lazy',
      },
    }
  end,
  config = true,
}
