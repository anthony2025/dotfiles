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
    event = "VeryLazy",
    config = function()
      local leap = require'leap'
      leap.add_default_mappings()
      leap.init_highlight(true)
    end
  },
  {
    "echasnovski/mini.surround",
    enabled = false,
    event = "VeryLazy",
    config = function()
      require'mini.surround'.setup()
    end
  }
}
