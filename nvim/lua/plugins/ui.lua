return {
	{
		"marko-cerovac/material.nvim",
		lazy = false,
		priority = 90,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-lualine/lualine.nvim",
		},
		config = function()
			require("material").setup({
				contrast = {
					terminal = true,
					sidebars = true,
					floating_windows = true,
					cursor_line = true,
				},
				styles = {
					comments = { italic = true },
				},
				plugins = { "nvim-web-devicons", "trouble", "nvim-cmp" },
				lualine_style = "default",
			})
			vim.g.material_style = "deep ocean"
			vim.cmd("colorscheme material")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			filetype_exclude = {
				"help",
				"neo-tree",
				"Trouble",
				"lazy",
				"fzf",
				"spectre_panel",
				"toggleterm",
				"quickfix",
			},
			show_trailing_blankline_indent = false,
			show_current_context = true,
			use_treesitter = true,
		},
	},
	{
		"echasnovski/mini.cursorword",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("mini.cursorword").setup()
		end,
	},
	{
		"echasnovski/mini.animate",
		event = "VeryLazy",
		config = function()
			require("mini.animate").setup()
		end,
	},
}
