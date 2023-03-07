return {
  -- TODO: add lazygit and htop
  -- TODO: setup an MRU picker
  {
    'ibhagwan/fzf-lua',
    keys = {
      {
        '<c-p>',
        function() require('fzf-lua').files() end,
        mode = { 'i', 'n', 'v' },
      },
    },
  },
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
  {
    'christoomey/vim-tmux-navigator',
    event = 'VeryLazy',
    init = function() vim.g.tmux_navigator_disable_when_zoomed = 1 end,
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
