return {
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    priority = 80,
    dependencies = {
      'folke/tokyonight.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      options = {
        theme = 'tokyonight',
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
      extensions = { 'fzf', 'nerdtree' },
    },
  },
}
-- ['neo-tree'] = 'File Explorer',
-- fzf = 'File Picker',
-- spectre_panel = 'Search/Replace',
-- toggleterm = 'Terminal',
-- quickfix = 'Quickfix',
