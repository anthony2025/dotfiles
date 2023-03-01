return {
	{
		"echasnovski/mini.animate",
		event = "VeryLazy",
		config = function()
			require("mini.animate").setup()
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		version = "*",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			filetype_exclude = {
				"help",
				"neo-tree",
				"trouble",
				"lazy",
				"fzf",
				"spectre_panel",
				"toggleterm",
			},
			show_trailing_blankline_indent = false,
			show_current_context = false,
		},
	},
	{
		"echasnovski/mini.cursorword",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("mini.cursorword").setup()
		end,
	},
}
