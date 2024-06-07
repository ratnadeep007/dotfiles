-- Buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })

-- clear hlsearch
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- split window
vim.keymap.set("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

-- lsp saga
vim.keymap.set("n", "gd", ":Lspsaga goto_definition<CR>", { remap = true, silent = true, desc = "Go to definition"})
vim.keymap.set("n", "gr", ":Lspsaga finder<CR>", { remap = true, silent = true, desc = "Saga References"})
vim.keymap.set("n", "K", ":Lspsaga hover_doc<CR>", { remap = true, silent = true, desc = "Hover Doc"})
vim.keymap.set("n", "<leader>ca", ":Lspsaga code_action<CR>", { remap = true, silent = true, desc = "Code Actions"})
vim.keymap.set("n", "<leader>cd", ":Lspsaga show_line_diagnostics<CR>", { remap = true, silent = true, desc = "Line Diagnostc"})
vim.keymap.set("n", "<leader>sd", ":Lspsaga show_buf_diagnostics<CR>", { remap = true, silent = true, desc = "Buffer Diagnostc"})
vim.keymap.set("n", "<leader>wd", ":Lspsaga show_workspace_diagnostics<CR>", { remap = true, silent = true, desc = "Buffer Diagnostc"})

-- nvim tmux navigate
vim.keymap.set("n", "<c-h>", ":TmuxNavigateLeft<CR>", { remap = true, silent = true, desc = "Go to definition"})
vim.keymap.set("n", "<c-j>", ":TmuxNavigateDown<CR>", { remap = true, silent = true, desc = "Go to definition"})
vim.keymap.set("n", "<c-k>", ":TmuxNavigateUp<CR>", { remap = true, silent = true, desc = "Go to definition"})
vim.keymap.set("n", "<c-l>", ":TmuxNavigateRight<CR>", { remap = true, silent = true, desc = "Go to definition"})
vim.keymap.set("n", "<c-\\>", ":TmuxNavigatePrevious<CR>", { remap = true, silent = true, desc = "Go to definition"})

-- Trouble.nvim
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, { remap = true, silent = true, desc = "Toggle Trouble"})
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, { remap = true, silent = true, desc = "Trouble Workspace Diagnostics"})
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end, { remap = true, silent = true, desc = "Trouble Document Diagnostics"})
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end, { remap = true, silent = true, desc = "Trouble Quickfix"})
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end, { remap = true, silent = true, desc = "Trouble Loclist"})
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end, { remap = true, silent = true, desc = "Trouble Lsp References"})

-- Harpoon
vim.keymap.set("n", "<leader>hm", function() require("harpoon.mark").add_file() end, { remap = true, silent = true, desc = "Harpoon add file"})
vim.keymap.set("n", "<leader>hu", function() require("harpoon.ui").toggle_quick_menu() end, { remap = true, silent = true, desc = "Harpoon show UI"})
vim.keymap.set("n", "<leader>hn", function() require("harpoon.ui").nav_next() end, { remap = true, silent = true, desc = "Harpoon Next"})
vim.keymap.set("n", "<leader>hp", function() require("harpoon.ui").nav_prev() end, { remap = true, silent = true, desc = "Harpoon Previous"})

-- wrap around 
-- local function try_jump_window(direction, count)
--   local prev_win_nr = vim.fn.winnr()
--   vim.cmd(count .. "wincmd " .. direction)
--   return vim.fn.winnr() ~= prev_win_nr
-- end
--
-- local function jump_window_with_wrap(direction, opposite)
--   return function ()
--     if not try_jump_window(direction, vim.v.count1) then
--       try_jump_window(opposite, 999)
--     end
--   end
-- end
-- local opts = { silent = true, noremap = true }
-- vim.keymap.set("n", "<C-w><C-h>", jump_window_with_wrap("h", "l"), opts)
-- vim.keymap.set("n", "<C-w><C-l>", jump_window_with_wrap("l", "h"), opts)
-- vim.keymap.set("n", "<C-w><C-j>", jump_window_with_wrap("j", "k"), opts)
-- vim.keymap.set("n", "<C-w><C-k>", jump_window_with_wrap("k", "j"), opts)
