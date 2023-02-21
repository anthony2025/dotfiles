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
          "json",
          "yaml",
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
  }
}
