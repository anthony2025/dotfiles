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
  {
    'nyngwang/nvimgelion',
    enabled = false,
    init = function ()
      vim.api.nvim_create_autocmd({ 'ColorScheme', 'FileType' }, {
        pattern = '*',
        callback = function ()
          vim.cmd([[
            hi IndentBlanklineChar gui=nocombine guifg=#444C55
            hi IndentBlanklineSpaceChar gui=nocombine guifg=#4d5154
            hi IndentBlanklineContextChar gui=nocombine guifg=#FB5E2A
            " NOTE: don't use `gui=nocombine` here to have correct coloring of gitsigns.nvim.
            hi IndentBlanklineContextStart gui=underline guisp=#FB5E2A
          ]])
        end,
      })
    end
  }
}
-- you can override any hightlight group as follows:
-- init = function()
--   -- vim.api.nvim_create_autocmd('Colorscheme', {
--   group = vim.api.nvim_create_augroup('tab_color', {}),
--   callback = function()
-- -- custom hightlights for a slightly darker current tab color
--   vim.api.nvim_set_hl(0, 'BufferCurrent', { bg = '#242536' })
--   vim.api.nvim_set_hl(0, 'BufferCurrentSign', { bg = '#242536' })
--   vim.api.nvim_set_hl(0, 'BufferCurrentMod', { bg = '#242536' })
--   vim.api.nvim_set_hl(0, 'BufferCurrentIndex', { bg = '#242536' })
--     end
--   })
-- end,
