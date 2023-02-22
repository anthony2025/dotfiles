return {
  {
    "akinsho/toggleterm.nvim",
    keys = {
      { "<c-s>", ":ToggleTerm direction=float<cr>" }
    },
    opts = {
      open_mapping = "<c-s>",
      autochdir = true,
      direction = "float",
      close_on_exit = false,
    }
  }
}
