local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.g.mapleader = " "
vim.g.localleader = "\\"
vim.api.nvim_set_option("tabstop", 2)
vim.api.nvim_set_option("shiftwidth", 2)
vim.api.nvim_set_option("expandtab", true)
vim.api.nvim_set_option("softtabstop", 2)
vim.o.laststatus = 3


require("lazy").setup({
  { import = "plugins" },
}, {
  install = {
    missing = true,
    colorscheme = { "tokyonight-night" },
  }
})

require("config.keymaps")
require("config.autocmds")
require("config.lsp")
