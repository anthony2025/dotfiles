return {
  {
    "marko-cerovac/material.nvim",
    lazy = false,
    priority = 90,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lualine/lualine.nvim"
    },
    config = function()
      require'material'.setup {
        contrast = {
          terminal = true,
          sidebars = true,
          floating_windows = true,
          cursor_line = true
        },
        styles = {
          comments = { italic = true }
        },
        plugins = { "nvim-web-devicons", "trouble", "nvim-cmp" },
        lualine_style = "default"
      }
      vim.g.material_style = "deep ocean"
      vim.cmd "colorscheme material"
    end
  }
}
