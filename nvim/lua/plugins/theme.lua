return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
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
          'toggleterm',
          'quickfix',
        },
        dim_inactive = true,
      }
      vim.cmd.colorscheme 'tokyonight'
    end,
  },
}
-- -- you can override any hightlight group as follows:
-- init = function()
--   vim.api.nvim_create_autocmd({ 'ColorScheme', 'FileType' }, {
--     group = vim.api.nvim_create_augroup('tab_color', {}),
--     callback = function()
--       -- custom hightlights for a slightly darker current tab colors
--       vim.api.nvim_set_hl(0, 'BufferCurrent', { bg = '#242536' })
--       vim.api.nvim_set_hl(0, 'BufferCurrentSign', { bg = '#242536' })
--       vim.api.nvim_set_hl(0, 'BufferCurrentMod', { bg = '#242536' })
--       vim.api.nvim_set_hl(0, 'BufferCurrentIndex', { bg = '#242536' })
--     end
--   })
-- end
