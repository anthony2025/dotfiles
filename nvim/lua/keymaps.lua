-- setup leader the earliest for correct key mappings
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disable search highlighting
vim.keymap.set("n", "<esc>", ":noh<cr>")

-- quickly exit to normal mode
vim.keymap.set("i", "jj", "<esc>")
