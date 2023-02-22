return {
  {
    "ggandor/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
    event = "VeryLazy",
    config = function()
      require'leap'.add_default_mappings()
    end
  },
  {
    "ggandor/leap-spooky.nvim",
    dependencies = { "ggandor/leap.nvim" },
    event = "VeryLazy",
    config = true,
  },
  {
    "ggandor/flit.nvim",
    dependencies = { "ggandor/leap.nvim" },
    event = "VeryLazy",
    config = true,
  },
  {
    "ggandor/leap-ast.nvim",
    dependencies = {
      "ggandor/leap.nvim",
      "nvim-treesitter/nvim-treesitter"
    },
    keys = {
      { "<leader>s", function() require'leap-ast'.leap() end, mode = {"n", "x", "o"} }
    }
  },
  {
    "mg979/vim-visual-multi",
    branch = "master",
    event = "VeryLazy",
  },
  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    config = function()
      require'mini.surround'.setup()
    end
  }
}
