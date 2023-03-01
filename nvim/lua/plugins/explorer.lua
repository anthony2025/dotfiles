return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{
				"<c-e>",
				function()
					require("neo-tree.command").execute({ toggle = true, reveal_force_cwd = true })
				end,
				mode = { "i", "n", "v" },
			},
		},
		init = function()
			vim.g.neo_tree_remove_legacy_commands = 1
			if vim.fn.argc() == 0 then
				require("neo-tree.command").execute({
					action = "show",
				})
			end
			if vim.fn.argc() == 1 then
				local stat = vim.loop.fs_stat(vim.fn.argv(0))
				if stat and stat.type == "directory" then
					require("neo-tree")
				end
			end
		end,
		opts = {
			close_if_last_window = true,
			source_selector = {
				winbar = true,
			},
			filesystem = {
				bind_to_cwd = true,
				follow_current_file = true,
				group_empty_dirs = true,
				use_libuv_file_watcher = true,
			},
		},
	},
}
