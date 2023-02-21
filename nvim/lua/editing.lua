return {
  {
    "mboughaba/vim-lessmess",
    event = "VeryLazy"
  },
  {
    "matze/vim-move",
    event = "VeryLazy",
    init = function()
      vim.g.move_normal_option = 1
    end
  },
  {
    'terrortylor/nvim-comment',
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "JoosepAlviste/nvim-ts-context-commentstring"
    },
    keys = {
      { "gc", ":CommentToggle<cr>", mode = { "n", "v" } }
    },
    name = "nvim_comment",
    opts = {
      comment_empty = false,
      create_mappings = false,
      hook = function()
        require'ts_context_commentstring.internal'.update_commentstring()
      end
    }
  },
  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    config = function()
      require'mini.surround'.setup()
    end
  }
}
