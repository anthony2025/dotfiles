return {
  {
    'hrsh7th/nvim-cmp',
    ft = { "scala", "sbt", "sc", "java", "lua" },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lsp-document-symbol',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
      'onsails/lspkind.nvim',
    },
    init = function()
      vim.opt.completeopt = { "menu", "menuone", "noselect" }
    end,
    config = function()
      local cmp = require'cmp'
      local luasnip = require'luasnip'
      cmp.setup {
        view = {
          entries = 'custom',
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          format = require'lspkind'.cmp_format(),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'nvim_lsp_document_symbol' },
          { name = 'luasnip' },
          { name = 'cmp-path' },
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
}
