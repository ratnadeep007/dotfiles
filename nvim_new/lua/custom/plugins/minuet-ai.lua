return {
  'milanglacier/minuet-ai.nvim',
  -- opts = {
  --   virtualtext = {
  --     auto_trigger_ft = {},
  --     keymap = {
  --       accept = '<A-A>',
  --       accept_line = '<A-a>',
  --       -- Cycle to prev completion item, or manually invoke completion
  --       prev = '<A-[>',
  --       -- Cycle to next completion item, or manually invoke completion
  --       next = '<A-]>',
  --       dismiss = '<A-e>',
  --     },
  --   },
  --   provider = 'gemini',
  -- },
  config = function()
    require('minuet').setup {
      virtualtext = {
        auto_trigger_ft = {},
        keymap = {
          accept = '<A-A>',
          accept_line = '<A-a>',
          -- Cycle to prev completion item, or manually invoke completion
          prev = '<A-[>',
          -- Cycle to next completion item, or manually invoke completion
          next = '<A-]>',
          dismiss = '<A-e>',
        },
      },
      provider = 'gemini',
    }
  end,
}
