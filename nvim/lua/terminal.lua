return {
  {
    "akinsho/toggleterm.nvim",
    keys = {
      { "<c-s>", ":ToggleTerm direction=float" }
    },
    opts = {
      open_mapping = "<c-s>",
      autochdir = true,
      direction = "float",
      close_on_exit = false,
      winbar = {
        enabled = false,
        name_formatter = function(term)
          return term.name
        end
      }
    }
  }
}
