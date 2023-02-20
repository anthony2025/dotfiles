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
  },
  {
    "scalameta/nvim-metals",
    dependencies = { "nvim-lua/plenary.nvim", "hrsh7th/nvim-cmp",  },
    ft = { "scala", "sbt", "sc", "java" },
    keys = {
      { "K",  vim.lsp.buf.hover },
      { "gd",  vim.lsp.buf.definition },
      { "gi", vim.lsp.buf.implementation },
      { "gr", vim.lsp.buf.references },
      { "gds", vim.lsp.buf.document_symbol },
      { "gws", vim.lsp.buf.workspace_symbol },
      { "<leader>cl", vim.lsp.codelens.run },
      { "<leader>sh", vim.lsp.buf.signature_help },
      { "<leader>rn", vim.lsp.buf.rename },
      { "<leader>f", vim.lsp.buf.formatting },
      { "<leader>ca", vim.lsp.buf.code_action },
      { "<leader>aa", vim.diagnostic.setqflist }
    },
    init = function()
      vim.opt_global.shortmess:remove("F")
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "scala", "sbt", "sc", "java" },
        group = vim.api.nvim_create_augroup("nvim-metals", { clear = true }),
        callback = function()
          local metals = require'metals'
          local metals_config = metals.bare_config()
          metals_config.init_options.statusBarProvider = "on"
          metals_config.capabilities = require'cmp_nvim_lsp'.default_capabilities()
          metals.initialize_or_attach(metals_config)
        end
      })
    end
  }
}
