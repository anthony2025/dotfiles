return {
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
  {
    'jghauser/mkdir.nvim',
    event = "VeryLazy"
  },
  {
    'gennaro-tedesco/nvim-peekup',
    keys = {
      { '""', mode = { "v", "n" } }
    }
  }
}