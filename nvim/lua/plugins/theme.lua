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
        group = vim.api.nvim_create_augroup('tab_color', {}),
        callback = function()
          vim.api.nvim_set_hl(0, 'BufferCurrent', { bg = '#242536' })
          vim.api.nvim_set_hl(0, 'BufferCurrentSign', { bg = '#242536' })
          vim.api.nvim_set_hl(0, 'BufferCurrentMod', { bg = '#242536' })
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
        dim_inactive = true,
      }
      vim.cmd 'colorscheme tokyonight'
    end,
  },
}
