return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 90,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    init = function()
      vim.api.nvim_create_autocmd('Colorscheme', {
        group = vim.api.nvim_create_augroup('current_tab_color', {}),
        callback = function()
          vim.api.nvim_set_hl(0, 'BufferCurrent', { bg = '#292e42' })
          vim.api.nvim_set_hl(0, 'BufferCurrentSign', { bg = '#292e42' })
          vim.api.nvim_set_hl(0, 'BufferCurrentMod', { bg = '#292e42' })
        end,
      })
    end,
    config = function()
      require('tokyonight').setup {
        style = 'night',
        styles = {
          comments = { italic = true },
          keywords = { bold = true },
        },
        sidebars = {
          'help',
          'neo-tree',
          'trouble',
          'lazy',
          'fzf',
          'spectre_panel',
          'toggleterm',
          'quickfix',
        },
        hide_inactive_statusline = true,
        dim_inactive = true,
      }
      vim.cmd 'colorscheme tokyonight'
    end,
  },
}
