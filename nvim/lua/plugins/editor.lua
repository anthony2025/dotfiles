return {
  {
    'echasnovski/mini.jump',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function() require('mini.jump').setup() end,
  },
  {
    'echasnovski/mini.jump2d',
    event = { 'BufReadPost', 'BufNewFile' },
    keys = {
      { '<leader>f', function() require('mini.jump2d').start() end },
    },
    config = function()
      require('mini.jump2d').setup {
        mappings = {
          start_jumping = '',
        },
      }
    end,
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
    'echasnovski/mini.splitjoin',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('mini.splitjoin').setup {
        mappings = { toggle = 'gs' },
      }
    end,
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
    'echasnovski/mini.comment',
    enabled = false,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('mini.comment').setup {
        hooks = {
          pre = function() require('ts_context_commentstring.internal').update_commentstring {} end,
        },
        options = {
          ignore_blank_line = true,
        },
      }
    end,
  },
  {
    'max397574/better-escape.nvim',
    event = 'VeryLazy',
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    'lambdalisue/suda.vim',
    event = 'VeryLazy',
    init = function() vim.g.suda_smart_edit = 1 end,
  },
  {
    'jghauser/mkdir.nvim',
    event = 'VeryLazy',
  },
}
