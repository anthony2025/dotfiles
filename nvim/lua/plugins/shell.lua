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
    opts = { 'skim' }, -- fzf-native or fzf-tmux
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
