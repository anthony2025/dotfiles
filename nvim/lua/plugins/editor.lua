return {
  {
    'echasnovski/mini.jump',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function() require('mini.jump').setup() end,
  },
  {
    'echasnovski/mini.jump2d',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function() require('mini.jump2d').setup() end,
  },
  {
    'echasnovski/mini.move',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function() require('mini.move').setup() end,
  },
  {
    'echasnovski/mini.ai',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function() require('mini.ai').setup() end,
  },
  {
    'echasnovski/mini.surround',
    event = {'BufReadPost', 'BufNewFile'},
    config = function() require('mini.surround').setup() end,
  },
  {
    'echasnovski/mini.splitjoin',
    keys = { "gs" },
    config = function()
      require('mini.splitjoin').setup {
        mappings = {
          toggle = 'gs',
        }
      }
    end
  },
  {
    'echasnovski/mini.trailspace',
    event = 'BufWritePre',
    init = function()
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('trim_whitespace', {}),
        callback = function() require('mini.trailspace').trim() end,
      })
    end,
    config = function() require('mini.trailspace').setup() end,
  },
  {
    'max397574/better-escape.nvim',
    event = "VeryLazy",
    opts = {
      clear_empty_lines = true,
    },
  },
}
