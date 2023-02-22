return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/vim-vsnip",
      "hrsh7th/vim-vsnip-integ",
      "hrsh7th/cmp-vsnip",
      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim"
    },
    init = function()
      vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }
    end,
    config = function()
      local cmp = require'cmp'
      local lspkind = require'lspkind'
      cmp.setup {
        view = {
          entries = "custom"
        },
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          format = lspkind.cmp_format()
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "nvim_lsp_signature_help" },
          { name = "nvim_lsp_document_symbol" },
          { name = "vsnip" },
        },
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end,
        })
      }
    end
  }
}