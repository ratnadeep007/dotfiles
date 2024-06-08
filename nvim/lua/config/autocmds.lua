local ignore_filetypes = { "dapui_console", "dap-repl", "dapui_watches", "dapui_stacks", "dapui_breakpoints", "outline" }
local ignore_buftypes = { 'nofile', 'prompt', 'popup' }

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local augroup =
    vim.api.nvim_create_augroup('FocusDisable', { clear = true })

-- vim.api.nvim_create_autocmd('WinEnter', {
--     group = augroup,
--     callback = function(_)
--         if vim.tbl_contains(ignore_buftypes, vim.bo.buftype)
--         then
--             vim.w.focus_disable = true
--         else
--             vim.w.focus_disable = false
--         end
--     end,
--     desc = 'Disable focus autoresize for BufType',
-- })
--
-- vim.api.nvim_create_autocmd('FileType', {
--     group = augroup,
--     callback = function(_)
--         if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
--             vim.b.focus_disable = true
--         else
--             vim.b.focus_disable = false
--         end
--     end,
--     desc = 'Disable focus autoresize for FileType',
-- })
