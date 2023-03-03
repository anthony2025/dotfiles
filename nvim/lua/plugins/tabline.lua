return {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'folke/tokyonight.nvim',
    },
    lazy = false,
    priority = 70,
    config = function()
      require('bufferline').setup {
        icon_custom_colors = true,
      }
    end,
  },
}
