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
          enable_autocmd = true
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
    "terrortylor/nvim-comment",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "JoosepAlviste/nvim-ts-context-commentstring"
    },
    keys = {
      { "gc", "<cmd>CommentToggle<cr>", mode = { "n", "v" } }
    },
    name = "nvim_comment",
    opts = {
      comment_empty = false,
      create_mappings = false,
      hook = function()
        require'ts_context_commentstring.internal'.update_commentstring()
      end
    }
  }
}
