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
    "famiu/bufdelete.nvim",
    keys = {
      { "<c-c>", ":Bwipeout<cr>" }
    }
  },
  {
    "lambdalisue/suda.vim",
    event = "VeryLazy",
    init = function()
      vim.g.suda_smart_edit = 1
    end
  },
}
