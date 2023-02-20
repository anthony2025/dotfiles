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
    keys = {
      { "<tab>", ":bnext<cr>" },
      { "<s-tab>", ":bprevious<cr>" },
      { "<c-i>", ":bnext<cr>" },
      { "<c-u>", ":bprevious<cr>" }
    },
    init = function()
      vim.g.tmux_navigator_disable_when_zoomed = 1
    end
  },
  {
    "famiu/bufdelete.nvim",
    keys = {
      { "<c-c>", ":Bwipeout<cr>" }
    }
  }
}
