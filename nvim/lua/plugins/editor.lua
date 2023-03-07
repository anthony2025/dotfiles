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
    event = { 'BufReadPost', 'BufNewFile' },
    config = function() require('mini.surround').setup() end,
  },
  {
    'echasnovski/mini.trailspace',
    event = 'BufWrite',
    init = function()
      vim.api.nvim_create_autocmd('BufWrite', {
        group = vim.api.nvim_create_augroup('trim_whitespace', {}),
        callback = function() require('mini.trailspace').trim() end,
      })
    end,
    config = function() require('mini.trailspace').setup() end,
  },
}
