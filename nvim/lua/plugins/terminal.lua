return {
  {
    'akinsho/toggleterm.nvim',
    keys = {
      { '<c-t>', mode = { 'i', 'n', 'v' } },
    },
    opts = {
      open_mapping = '<c-t>',
      autochdir = true,
      direction = 'float',
      close_on_exit = false,
    },
  },
}
