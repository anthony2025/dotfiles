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
        transparent = true,
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
    'marko-cerovac/material.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      vim.g.material_style = "deep ocean"
      require('material').setup {
        disable = {
          background = true,
        }
      }
      vim.cmd.colorscheme 'material'
    end,
    init = function()
      vim.api.nvim_create_autocmd({ 'ColorScheme', 'FileType' }, {
        group = vim.api.nvim_create_augroup('color_overrides', {}),
        callback = function()
          -- custom highlights for a slightly darker current tab colors
          vim.api.nvim_set_hl(0, 'BufferCurrent', { bg = '#242536' })
          vim.api.nvim_set_hl(0, 'BufferCurrentSign', { bg = '#242536' })
          vim.api.nvim_set_hl(0, 'BufferCurrentMod', { bg = '#242536' })
          vim.api.nvim_set_hl(0, 'BufferCurrentIndex', { bg = '#242536' })
          vim.api.nvim_set_hl(0, 'BufferCurrentIndex', { bg = '#242536' })
        end
      })
    end
  },
}

-- follow the background from the terminal
-- vim.cmd 'highlight! Normal ctermbg=None guibg=None'
