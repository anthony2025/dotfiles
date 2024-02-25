return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    event = { 'BufReadPost', 'BufNewFile' },
    config = function() require('ibl').setup () end
  },
  {
    'echasnovski/mini.cursorword',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function() require('mini.cursorword').setup() end,
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
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
    end,
    opts = {
      autowidth = {
        enable = false,
      },
    },
  },
}
