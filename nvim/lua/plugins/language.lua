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
    dependencies = { 'neovim/nvim-lspconfig' },
    ft = { 'lua' },
    config = function()
      require('neodev').setup()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      require('lspconfig').lua_ls.setup {
        capabilities = capabilities,
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
          },
        },
      }
    end,
  },
  {
    'neovim/nvim-lspconfig',
    ft = { 'json' },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'b0o/SchemaStore.nvim',
    },
    config = function()
      local schemas = require('schemastore').json.schemas()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      require('lspconfig').jsonls.setup {
        capabilities = capabilities,
        settings = {
          json = {
            format = { enable = true },
            validate = { enable = true },
          },
          schemas = schemas,
        },
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
