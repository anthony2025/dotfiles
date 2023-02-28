return {
  {
    "akinsho/toggleterm.nvim",
    keys = {
      { "<c-y>", mode = { "i", "n", "v" }}
    },
    opts = {
      open_mapping = "<c-y>",
      autochdir = true,
      direction = "float",
      close_on_exit = false,
    }
  }
}
