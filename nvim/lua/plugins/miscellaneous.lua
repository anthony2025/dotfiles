return {
  {
    "christoomey/vim-tmux-navigator",
    keys = {
      "<c-h>",
      "<c-j>",
      "<c-k>",
      "<c-l>",
    },
    init = function()
      vim.g.tmux_navigator_disable_when_zoomed = 1
    end
  },
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    config = function()
      require'mini.animate'.setup()
    end
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = true,
    keys  = {
      { "<leader>h", function() require'persistence'.load() end }
    }
  },
  {
    "windwp/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    keys = {
      { "<leader>r", function() require('spectre').open() end }
    },
  }
}
