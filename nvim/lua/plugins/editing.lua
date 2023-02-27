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
    "ggandor/leap.nvim",
    keys = {
      { "s", mode = { "n", "x", "o" } },
      { "S", mode = { "n", "x", "o" } },
      { "gs", mode = { "n", "x", "o" } },
    },
    config = function()
      local leap = require'leap'
      leap.add_default_mappings()
      leap.init_highlight(true)
    end
  },
  {
    "ggandor/flit.nvim",
    dependencies =  { "ggandor/leap.nvim" },
    config = true
  },
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    config = function()
      require'mini.ai'.setup()
    end
  },
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function()
      require'mini.pairs'.setup()
    end
  },
  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    config = function()
      require'mini.surround'.setup {
        mappings = {
          add = "gza", -- Add surrounding in Normal and Visual modes
          delete = "gzd", -- Delete surrounding
          find = "gzf", -- Find surrounding (to the right)
          find_left = "gzF", -- Find surrounding (to the left)
          highlight = "gzh", -- Highlight surrounding
          replace = "gzr", -- Replace surrounding
          update_n_lines = "gzn", -- Update `n_lines`
        }
      }
    end
  }
}
