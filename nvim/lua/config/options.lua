-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- local M = {}
--
-- M.maximize_status = function()
--   return vim.t.maximized and "   " or ""
-- end
vim.o.winbar = "%{%v:lua.require('winbar').maximize_status()%}"
