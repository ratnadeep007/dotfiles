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
vim.keymap.set("n", "ca", ":Lspsaga code_action<CR>", { remap = true, silent = true, desc = "Code Actions"})
vim.keymap.set("n", "K", ":Lspsaga hover_doc<CR>", { remap = true, silent = true, desc = "Hover Doc"})
vim.keymap.set("n", "cd", ":Lspsaga show_line_diagnostics<CR>", { remap = true, silent = true, desc = "Line Diagnostc"})
vim.keymap.set("n", "sd", ":Lspsaga show_buf_diagnostics<CR>", { remap = true, silent = true, desc = "Buffer Diagnostc"})
vim.keymap.set("n", "wd", ":Lspsaga show_workspace_diagnostics<CR>", { remap = true, silent = true, desc = "Buffer Diagnostc"})
