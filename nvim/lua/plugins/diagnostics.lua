return {
  {
    'folke/trouble.nvim',
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<c-d>", "<cmd>TroubleToggle<cr>", mode = { "i", "n", "v" }}
    },
    opts = { use_diagnostic_signs = true }
  },
  {
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    keys = {
      { "<leader>d", function() require'lsp_lines'.toggle() end }
    },
    config = function()
      local lsp_lines = require'lsp_lines'
      lsp_lines.setup()
      lsp_lines.toggle()
      vim.diagnostic.config({ virtual_text = false }) -- disable redundant text
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
    },
    event = { "BufReadPost", "BufNewFile" },
    config = true,
    keys = {
      { "<leader>dd", "<cmd>TodoTrouble<cr>" },
    },
  }
}
