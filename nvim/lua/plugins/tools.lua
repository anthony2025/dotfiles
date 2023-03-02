return {
	{
		"akinsho/toggleterm.nvim",
		keys = {
			{ "<c-t>", mode = { "i", "n", "v" } },
		},
		opts = {
			open_mapping = "<c-t>",
			autochdir = true,
			direction = "float",
			close_on_exit = false,
		},
	},
	{
		"windwp/nvim-spectre",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = true,
		keys = {
			{
				"<leader>r",
				function()
					require("spectre").open()
				end,
			},
		},
	},
	{
		"ibhagwan/fzf-lua",
		keys = {
			{
				"<c-p>",
				function()
					require("fzf-lua").files()
				end,
				mode = { "i", "n", "v" },
			},
		},
	},
	{
		"folke/persistence.nvim",
		event = "VeryLazy",
		config = true,
		keys = {
			{
				"<leader>h",
				function()
					require("persistence").load()
				end,
			},
		},
	},
}
