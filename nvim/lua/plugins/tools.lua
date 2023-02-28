return {
  {
    "akinsho/toggleterm.nvim",
    keys = {
      { "<c-y>", mode = { "i", "n", "v" }}
    },
    opts = {
      open_mapping = "<c-y>",
      open_mapping = "<c-y>",
      autochdir = true,
      direction = "float",
      close_on_exit = false,
    }
  },
  {
    "windwp/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    keys = {
      { "<leader>r", function() require('spectre').open() end }
    },
  },
  {
    "ibhagwan/fzf-lua",
    keys = {
      { "<c-t>", function() require'fzf-lua'.files() end, mode = { "i", "n", "v" }}
    }
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = true,
    keys  = {
      { "<leader>h", function() require'persistence'.load() end }
    }
  },
}
