return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "material-nvim",
        globalstatus = true
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_x = { "filename" },
        lualine_y = { "filetype" },
        lualine_z = { "location" }
      },
      tabline = {
        lualine_a = {
          {
            "buffers",
            hide_filename_extension = true,
            filetype_names = {
              Trouble = "Diagnostics",
              packer = "Plugin Manager",
              nerdtree = "File Explorer",
              fzf = "File Picker"
            }
          }
        }
      },
      extensions = { "fzf", "nerdtree", "quickfix" }
    }
  },
  {
    "marko-cerovac/material.nvim",
    lazy = false,
    priority = 99,
    dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lualine/lualine.nvim" },
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
