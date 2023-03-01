return {
  {
    'scalameta/nvim-metals',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
    },
    ft = { 'scala', 'sbt', 'sc', 'java' },
    config = function()
      local metals = require 'metals'
      local metals_config = metals.bare_config()
      metals_config.init_options.statusBarProvider = 'on'
      metals_config.capabilities = require('cmp_nvim_lsp').default_capabilities()
      metals.initialize_or_attach(metals_config)
    end,
  },
  {
    'folke/neodev.nvim',
    dependencies = { 'neovim/nvim-lspconfig' }, -- shouldn't be needed
    ft = { 'lua' },
    config = function()
      require('neodev').setup()
      vim.lsp.start {
        name = 'lua-language-server',
        cmd = { 'lua-language-server' },
        before_init = require('neodev.lsp').before_init,
        root_dir = vim.fn.getcwd(),
        settings = { Lua = {} },
      }
    end,
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local nls = require 'null-ls'
      nls.setup {
        sources = {
          -- text
          nls.builtins.diagnostics.proselint,
          nls.builtins.code_actions.proselint,
          -- shell
          nls.builtins.diagnostics.shellcheck,
          nls.builtins.diagnostics.fish,
          nls.builtins.formatting.fish_indent,
          -- nix
          nls.builtins.diagnostics.statix,
          nls.builtins.code_actions.statix,
          nls.builtins.formatting.alejandra,
        },
      }
    end,
  },
}
