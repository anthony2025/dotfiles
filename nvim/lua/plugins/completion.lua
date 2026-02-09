return {
  {
    'hrsh7th/nvim-cmp',
    event = 'VeryLazy',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lua',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim',
      'L3MON4D3/LuaSnip',
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      cmp.setup {
        preselect = cmp.PreselectMode.None,
        view = {
          entries = 'custom',
        },
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          format = require('lspkind').cmp_format(),
        },
        experimental = {
          ghost_text = {
            hl_group = 'LspCodeLens',
          },
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'cmp-path' },
          { name = 'cmp-buffer' },
          { name = 'luasnip' },
          { name = 'cmp-cmdline' },
          { name = 'nvim_lua' },
        },
        mapping = cmp.mapping.preset.insert {
          ['<c-up>'] = cmp.mapping.scroll_docs(-4),
          ['<c-down>'] = cmp.mapping.scroll_docs(4),
          ['<c-space>'] = cmp.mapping.complete(),
          ['<cr>'] = cmp.mapping.confirm {
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
          },
          ['<tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<s-tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
      }

      -- use buffer source for `/` and `?`
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        },
      })

      -- use path and cmdline on command mode
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
        }, {
          { name = 'cmdline' },
        }),
      })
    end,
  },
  {
    'L3MON4D3/LuaSnip',
    build = 'make install_jsregexp',
    event = 'VeryLazy',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'rafamadriz/friendly-snippets',
      'honza/vim-snippets',
    },
    config = function()
      local luasnip = require 'luasnip'
      luasnip.setup {
        history = true,
        enable_autosnippets = true,
        store_selection_keys = '<tab>',
        update_events = 'TextChanged,TextChangedI',
        delete_check_events = 'TextChanged',
        ft_func = require('luasnip.extras.filetype_functions').from_cursor_pos,
        ext_opts = {
          [require('luasnip.util.types').choiceNode] = {
            active = {
              virt_text = { { 'choiceNode', 'Comment' } },
            },
          },
        },
      }
      luasnip.filetype_extend('all', { '_' })
      require('luasnip.loaders.from_vscode').lazy_load()
      require('luasnip.loaders.from_snipmate').lazy_load()
    end,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "antosha417/nvim-lsp-file-operations", config = true },
      { "folke/lazydev.nvim", opts = {} },
    },
    config = function()
      -- import cmp-nvim-lsp plugin
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      -- used to enable autocompletion (assign to every lsp server config)
      local capabilities = cmp_nvim_lsp.default_capabilities()

      vim.lsp.config("*", {
        capabilities = capabilities,
      })
    end,
  },
}
