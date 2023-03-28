return {
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      filetype_exclude = {
        'help',
        'neo-tree',
        'Trouble',
        'lazy',
        'fzf',
        'toggleterm',
        'quickfix',
      },
      show_trailing_blankline_indent = false,
      show_end_of_line = true,
      space_char_blankline = ' ',
      show_current_context = true,
      use_treesitter = true,
    },
  },
  {
    'echasnovski/mini.cursorword',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function() require('mini.cursorword').setup() end,
  },
  {
    'j-hui/fidget.nvim',
    event = 'VeryLazy',
    config = true,
  },
  {
    'echasnovski/mini.animate',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function() require('mini.animate').setup() end,
  },
  {
    'anuvyklack/windows.nvim',
    dependencies = {
      'anuvyklack/middleclass',
      'anuvyklack/animation.nvim',
    },
    keys = {
      { '<C-w>z', '<cmd>WindowsMaximize<cr>' },
      { '<C-w>_', '<cmd>WindowsMaximizeVertically<cr>' },
      { '<C-w>|', '<cmd>WindowsMaximizeHorizontally<cr>' },
      { '<C-w>=', '<cmd>WindowsEqualize<cr>' },
    },
    init = function()
      vim.o.winwidth = 12
      vim.o.winminwidth = 5
      vim.o.equalalways = false
    end,
    opts = {
      autowidth = {
        enable = false,
      },
    },
  },
}
