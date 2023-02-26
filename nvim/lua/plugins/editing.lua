return {
  {
    "matze/vim-move",
    event = "VeryLazy",
    init = function()
      vim.g.move_normal_option = 1
    end
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
  },
  {
    "ggandor/leap.nvim",
    enabled = false,
    dependencies = { "tpope/vim-repeat" },
    event = "VeryLazy",
    config = function()
      require'leap'.add_default_mappings()
    end
  },
  {
    "ggandor/leap-spooky.nvim",
    enabled = false,
    dependencies = { "ggandor/leap.nvim" },
    event = "VeryLazy",
    config = true,
  },
  {
    "ggandor/flit.nvim",
    enabled = false,
    dependencies = { "ggandor/leap.nvim" },
    event = "VeryLazy",
    config = true,
  },
  {
    "ggandor/leap-ast.nvim",
    enabled = false,
    dependencies = {
      "ggandor/leap.nvim",
      "nvim-treesitter/nvim-treesitter"
    },
    keys = {
      { "<leader>s", function() require'leap-ast'.leap() end, mode = {"n", "x", "o"} }
    }
  },
}
