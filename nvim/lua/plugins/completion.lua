return {
  {
    'hrsh7th/nvim-cmp',
    event = 'VeryLazy',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lsp-document-symbol',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'onsails/lspkind.nvim',
    },
    init = function() vim.opt.completeopt = { 'menu', 'menuone', 'noselect' } end,
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      cmp.setup {
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
          { name = 'nvim_lsp_document_symbol' },
          { name = 'luasnip' },
          { name = 'cmp-path' },
          { name = 'cmp-buffer' },
        },
        mapping = cmp.mapping.preset.insert {
          ['<c-up>'] = cmp.mapping.scroll_docs(-4),
          ['<c-down>'] = cmp.mapping.scroll_docs(4),
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
    end,
  },
  {
    'L3MON4D3/LuaSnip',
    build = 'make install_jsregexp',
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
        store_selection_keys = '<Tab>',
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
}
