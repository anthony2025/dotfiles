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
            max_length = vim.o.columns,
            filetype_names = {
              trouble = "Diagnostics",
              lazy = "Plugin Manager",
              ["neo-tree"] = "File Explorer",
              fzf = "File Picker"
            }
          }
        }
      },
      extensions = { "fzf", "nerdtree" }
    }
  }
}
