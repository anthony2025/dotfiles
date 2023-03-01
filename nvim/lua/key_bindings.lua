return {
	setup = function()
		-- setup leader the earliest for correct key mappings
		vim.g.mapleader = " "

		-- quickly exit to normal mode
		vim.keymap.set("i", "jj", "<esc>")

		-- clear search
		vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")

		-- alternative way to save file
		vim.keymap.set("n", "<c-s>", "<cmd>silent! update | redraw<cr>")
		vim.keymap.set({ "i", "v" }, "<c-s>", "<esc><cmd>silent! update | redraw<cr>")

		-- new file
		vim.keymap.set("n", "<leader>e", "<cmd>enew<cr>")

		-- quit all windows
		vim.keymap.set({ "i", "n", "v" }, "<c-q>", "<cmd>qa<cr>")

		-- yank to system clipboard
		vim.keymap.set("v", "gy", '"+y')
		vim.keymap.set("n", "gy", '"+yy')
		vim.keymap.set("n", "gp", '"+p')

		-- go up/down more intuitievly on long lines that wrap
		vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
		vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

		-- focus on other window
		vim.keymap.set("n", "<C-W>", [[<C-\><C-N><C-w>]])

		-- buffer navigation
		vim.keymap.set({ "i", "n", "v" }, "<c-i>", "<cmd>bnext<cr>")
		vim.keymap.set({ "i", "n", "v" }, "<c-u>", "<cmd>bprevious<cr>")

		-- resize splits using arrow keys
		vim.keymap.set({ "i", "n", "v" }, "<c-up>", "<cmd>resize +2<cr>")
		vim.keymap.set({ "i", "n", "v" }, "<c-down>", "<cmd>resize -2<cr>")
		vim.keymap.set({ "i", "n", "v" }, "<c-left>", "<cmd>vertical resize +2<cr>")
		vim.keymap.set({ "i", "n", "v" }, "<c-right>", "<cmd>vertical resize -2<cr>")

		-- add empty lines before and after cursor line
		vim.keymap.set("n", "gO", "<cmd>call append(line('.') - 1, repeat([''], v:count1))<cr>")
		vim.keymap.set("n", "go", "<cmd>call append(line('.'), repeat([''], v:count1))<cr>")

		-- reselect latest changed, put, or yanked text
		vim.keymap.set("n", "gv", '"`[" . strpart(getregtype(), 0, 1) . "`]"', { expr = true })

		-- move with home row in insert mode
		vim.keymap.set("i", "<a-h>", "<left>", { silent = false })
		vim.keymap.set("i", "<a-l>", "<right>", { silent = false })
		vim.keymap.set("i", "<a-j>", "<down>", { silent = false })
		vim.keymap.set("i", "<a-k>", "<up>", { silent = false })

		-- open plugin manager
		vim.keymap.set("n", "gl", "<cmd>Lazy<cr>")
	end,
}
