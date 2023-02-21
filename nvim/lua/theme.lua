return {
  {
    "marko-cerovac/material.nvim",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lualine/lualine.nvim"
    },
    init = function()
      vim.g.material_style = "deep ocean"
      vim.cmd "colorscheme material"
    end,
    opts = {
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
  }
}
