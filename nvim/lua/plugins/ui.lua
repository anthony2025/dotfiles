return {
  -- TODO: setup mini.starter
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
    'echasnovski/mini.animate',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function() require('mini.animate').setup() end,
  },
}
