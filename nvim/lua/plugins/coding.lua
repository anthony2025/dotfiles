return {
  {
    'mg979/vim-visual-multi',
    branch = 'master',
    event = 'VeryLazy',
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
