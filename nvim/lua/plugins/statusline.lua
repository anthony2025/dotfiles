return {
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    priority = 80,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      options = {
        theme = 'ayu_dark',
        globalstatus = true,
      },
      sections = {
        lualine_b = {
          'branch',
          'diff',
          {
            'diagnostics',
            sources = {
              'nvim_workspace_diagnostic',
              'nvim_lsp',
              'nvim_diagnostic',
            },
          },
        },
        lualine_c = {
          {
            'filename',
            path = 3,
          },
        },
        lualine_x = { 'location' },
        lualine_y = { 'filetype' },
        lualine_z = { 'progress' },
      },
      extensions = {
        'fzf',
        'neo-tree',
        'quickfix',
        'toggleterm',
      },
    },
  },
}
