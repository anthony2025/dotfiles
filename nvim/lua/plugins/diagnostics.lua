return {
  {
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    keys = {
      { "<c-l>", function() require'lsp_lines'.toggle() end }
    },
    config = function()
      local lsp_lines = require'lsp_lines'
      lsp_lines.setup()
      lsp_lines.toggle()
      vim.diagnostic.config({ virtual_text = false }) -- disable redundant text
    end,
  },
  {
    'folke/trouble.nvim',
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<c-x>", "<cmd>TroubleToggle<cr>" }
    },
    opts = {
      use_diagnostic_signs = true ,
      auto_close = false,
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = true,
    keys = {
      { "<c-d>", "<cmd>TodoTrouble<cr>" },
    },
  }
}
