return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function(_, opts)
    require('bufferline').setup(opts)
    vim.keymap.set('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
    vim.keymap.set('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
    vim.keymap.set('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
    vim.keymap.set('n', ']b', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
    vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<cr>', { desc = 'Delete Buffer' })
  end,
}
