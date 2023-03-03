return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 90,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-lualine/lualine.nvim',
    },
    config = function()
      require('tokyonight').setup {
        style = "night",
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
        lualine_bold = true,
      }
      vim.cmd 'colorscheme tokyonight'
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      filetype_exclude = {
        'help',
        'neo-tree',
        'Trouble',
        'lazy',
        'fzf',
        'spectre_panel',
        'toggleterm',
        'quickfix',
      },
      show_trailing_blankline_indent = false,
      show_current_context = true,
      use_treesitter = true,
    },
  },
  {
    'echasnovski/mini.cursorword',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function() require('mini.cursorword').setup() end,
  },
  {
    'echasnovski/mini.animate',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function() require('mini.animate').setup() end,
  },
}
