return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = function()
      require'nvim-treesitter.install'.update{ with_sync = true }()
    end,
    config = function()
      require'nvim-treesitter.configs'.setup {
        context_commentstring = {
          enable = true,
          enable_autocmd = false
        },
        ensure_installed = {
          "arduino",
          "bash",
          "fish",
          "vim",
          "python",
          "nix",
          "markdown",
          "yaml",
          "json",
          "javascript",
          "typescript",
          "tsx",
          "html",
          "go",
          "gitignore",
          "gitcommit",
          "dockerfile",
          "diff",
          "lua",
          "python",
          "regex",
          "css",
          "scss"
        },
        highlight = {
          enable = true
        },
        incremental_selection = {
          enable = true
        },
        indent = {
          enable = true
        }
      }
    end
  },
  {
    "echasnovski/mini.comment",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "JoosepAlviste/nvim-ts-context-commentstring"
    },
    keys = {
      { "gc", mode = { "n", "v" } }
    },
    config = function()
      require("mini.comment").setup {
        hooks = {
          pre = function()
            require("ts_context_commentstring.internal").update_commentstring({})
          end
        },
        options = {
          ignore_blank_line = true
        }
      }
    end
  }
}
