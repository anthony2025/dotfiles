return {
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    config = function()
      require'mini.animate'.setup()
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      filetype_exclude = {
        "help",
        "neo-tree",
        "trouble",
        "lazy",
        "fzf",
        "spectre_panel",
        "toggleterm",
      },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
  },
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      { "]]", function() require'illuminate'.goto_next_reference() end },
      { "[[", function() require'illuminate'.goto_prev_reference() end },
    },
    config = function()
      require("illuminate").configure()
    end,
  },
}
