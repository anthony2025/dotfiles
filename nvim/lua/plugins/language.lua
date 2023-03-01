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
      metals_config.capabilities.textDocument.completion.completionItem.snippetSupport = true
      metals.initialize_or_attach(metals_config)
    end,
  },
  {
    'folke/neodev.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
    },
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
    dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'b0o/SchemaStore.nvim',
    },
    ft = { 'json' },
    config = function()
      local schemas = require('schemastore').json.schemas()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      require('lspconfig').jsonls.setup {
        capabilities = capabilities,
        settings = {
          json = {
            schemas = schemas,
            format = { enable = true },
            validate = { enable = true },
          },
        },
      }
    end,
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    ft = {
      'sh',
      'bash',
      'fish',
      'nix',
      'markdown',
      'text',
      'gitcommit',
    },
    config = function()
      local nls = require 'null-ls'
      nls.setup {
        sources = {
          -- text
          nls.builtins.diagnostics.proselint,
          -- shell
          nls.builtins.diagnostics.shellcheck,
          nls.builtins.diagnostics.fish,
          nls.builtins.formatting.fish_indent,
          -- nix
          nls.builtins.diagnostics.statix,
          nls.builtins.formatting.alejandra,
        },
      }
    end,
  },
}
