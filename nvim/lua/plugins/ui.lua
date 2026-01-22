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
}
