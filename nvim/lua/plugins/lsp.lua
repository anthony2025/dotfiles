return {
	{
		"scalameta/nvim-metals",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
		},
		ft = { "scala", "sbt", "sc", "java" },
		keys = {
			{ "K", vim.lsp.buf.hover },
			{ "gd", vim.lsp.buf.definition },
			{ "gi", vim.lsp.buf.implementation },
			{ "gr", vim.lsp.buf.references },
			{ "gds", vim.lsp.buf.document_symbol },
			{ "gws", vim.lsp.buf.workspace_symbol },
			{ "<leader>cl", vim.lsp.codelens.run },
			{ "<leader>sh", vim.lsp.buf.signature_help },
			{ "<leader>rn", vim.lsp.buf.rename },
			{ "<leader>f", vim.lsp.buf.formatting },
			{ "<leader>ca", vim.lsp.buf.code_action },
			{ "<leader>aa", vim.diagnostic.setqflist },
		},
		init = function()
			vim.opt_global.shortmess:remove("F")
		end,
		config = function()
			local metals = require("metals")
			local metals_config = metals.bare_config()
			metals_config.init_options.statusBarProvider = "on"
			metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
			metals.initialize_or_attach(metals_config)
		end,
	},
}
