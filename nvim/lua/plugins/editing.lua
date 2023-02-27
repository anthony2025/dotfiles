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
  }
}
