return {
	{
		"christoomey/vim-tmux-navigator",
		event = "VeryLazy",
		init = function()
			vim.g.tmux_navigator_disable_when_zoomed = 1
		end,
	},
	{
		"lambdalisue/suda.vim",
		event = "VeryLazy",
		init = function()
			vim.g.suda_smart_edit = 1
		end,
	},
	{
		"echasnovski/mini.trailspace",
		event = "BufWrite",
		init = function()
			vim.api.nvim_create_autocmd("BufWrite", {
				group = vim.api.nvim_create_augroup("trim_whitespace", {}),
				callback = function()
					require("mini.trailspace").trim()
				end,
			})
		end,
		config = function()
			require("mini.trailspace").setup()
		end,
	},
	{
		"echasnovski/mini.bufremove",
		keys = {
			{
				"<s-q>",
				function()
					require("mini.bufremove").wipeout(0, false)
				end,
				mode = { "i", "n", "v" },
			},
			{
				"<c-c>",
				function()
					require("mini.bufremove").wipeout(0, true)
				end,
				mode = { "i", "n", "v" },
			},
		},
		config = function()
			require("mini.bufremove").setup()
		end,
	},
}
