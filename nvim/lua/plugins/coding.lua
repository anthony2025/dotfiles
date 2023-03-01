return {
  {
    'mg979/vim-visual-multi',
    branch = 'master',
    event = 'VeryLazy',
  },
  {
    'ggandor/leap.nvim',
    event = 'VeryLazy',
    config = function()
      local leap = require 'leap'
      leap.add_default_mappings(true)
    end,
  },
  {
    'ggandor/flit.nvim',
    enabled = false,
    event = 'VeryLazy',
    dependencies = { 'ggandor/leap.nvim' },
    config = true,
  },
  {
    'echasnovski/mini.move',
    event = 'VeryLazy',
    config = function() require('mini.move').setup() end,
  },
  {
    'echasnovski/mini.ai',
    event = 'VeryLazy',
    config = function() require('mini.ai').setup() end,
  },
  {
    'echasnovski/mini.surround',
    event = 'VeryLazy',
    config = function() require('mini.surround').setup() end,
  },
}
