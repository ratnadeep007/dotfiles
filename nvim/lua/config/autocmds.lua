-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local ignore_filetypes = { "nvcheatsheet", "neo-tree", "Outline" }

vim.api.nvim_create_autocmd("FileType", {
  pattern = ignore_filetypes,
  callback = function()
    -- if ignore_filetypes[vim.bo.filetype] or vim.bo.buftype == "nofile" then
    --   require("ufo").detach()
    --   vim.opt_local.foldenable = false
    -- end
    -- print("working")
    require("ufo").detach()
    vim.opt_local.foldenable = false
  end,
})
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = ignore_filetypes,
  callback = function()
    -- if ignore_filetypes[vim.bo.filetype] or vim.bo.buftype == "nofile" then
    --   require("ufo").detach()
    --   vim.opt_local.foldenable = false
    -- end
    -- print("working")
    require("ufo").detach()
    vim.opt_local.foldenable = false
  end,
})

vim.opt.updatetime = 200

vim.api.nvim_create_autocmd({
  "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
  "BufWinEnter",
  "CursorHold",
  "InsertLeave",

  -- include this if you have set `show_modified` to `true`
  "BufModifiedSet",
}, {
  group = vim.api.nvim_create_augroup("barbecue.updater", {}),
  callback = function()
    require("barbecue.ui").update()
  end,
})
