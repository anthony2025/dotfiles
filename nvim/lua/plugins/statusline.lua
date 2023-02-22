return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    opts = {
      options = {
        theme = "material-nvim",
        globalstatus = true
      },
      disabled_filetypes = {
        tabline = {},
        winbar = {},
      },
      sections = {
        lualine_b = {
          "branch",
          "diff",
          {
            "diagnostics",
            sources = {
              "nvim_workspace_diagnostic",
              "nvim_lsp",
              "nvim_diagnostic"
            }
          }
        },
        lualine_c = {
          {
            "filename",
            path = 3,
          }
        },
        lualine_x = { "location" },
        lualine_y = { "filetype" },
        lualine_z = { "progress" }
      },
      tabline = {
        lualine_a = {
          {
            "buffers",
            hide_filename_extension = true,
            mode = 2,
            filetype_names = {
              Trouble = "Diagnostics",
              packer = "Plugin Manager",
              nerdtree = "File Explorer",
              fzf = "File Picker"
            }
          }
        }
      },
      extensions = { "fzf", "nerdtree" }
    }
  }
}
