return {
  {
    "ibhagwan/fzf-lua",
    keys = {
      { "<c-t>", function() require'fzf-lua'.files() end }
    }
  },
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
    init = function()
      vim.g.tmux_navigator_disable_when_zoomed = 1
    end
  },
  {
    "echasnovski/mini.bufremove",
    keys = {
      { "<c-c>", function() require'mini.bufremove'.wipeout(0, false) end },
      { "<c-C>", function() require'mini.bufremove'.wipeout(0, true) end },
    },
    config = function()
      require'mini.bufremove'.setup()
    end
  },
  {
    "mboughaba/vim-lessmess",
    event = "VeryLazy"
  },
  {
    "lambdalisue/suda.vim",
    event = "VeryLazy",
    init = function()
      vim.g.suda_smart_edit = 1
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
      { "<leader>p", function() require'persistence'.load() end }
    }
  },
  {
    "windwp/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>S", function() require('spectre').open() end }
    },
    config = true
  }
}
