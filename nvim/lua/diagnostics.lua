return {
  {
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    keys = {
      { "<leader>l", function() require'lsp_lines'.toggle() end }
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
    opts = { use_diagnostic_signs = true },
    keys = {
      { "gl", ":TroubleToggle<cr>" }
    }
  }
}
