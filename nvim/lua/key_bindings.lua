return {
  setup = function()
    -- setup leader the earliest for correct key mappings
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "

    -- quickly exit to normal mode
    vim.keymap.set("i", "jj", "<esc>")

    -- clear search
    vim.keymap.set({ "i", "n", "v" }, "<esc>", "<cmd>noh<cr><esc>")

    -- save file
    vim.keymap.set({ "n", "v" }, "<c-s>", "<cmd>w<cr>")

    -- new file
    vim.keymap.set("n", "<c-e>", "<cmd>enew<cr>")

    -- quit all windows
    vim.keymap.set("n", "<c-q>", "<cmd>qa<cr>")

    -- yank to system clipboard
    vim.keymap.set("v", "<leader>y", '"+y')
    vim.keymap.set("n", "<leader>y", '"+yy')
    vim.keymap.set("n", "<leader>p", '"+p')

    -- go up/down more intuitievly on long lines that wrap
    vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
    vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

    -- buffer navigation
    vim.keymap.set("n", "<c-i>", "<cmd>bnext<cr>")
    vim.keymap.set("n", "<c-u>", "<cmd>bprevious<cr>")

    -- resize splits using arrow keys
    vim.keymap.set("n", "<a-up>", "<cmd>resize +2<cr>")
    vim.keymap.set("n", "<a-down>", "<cmd>resize -2<cr>")
    vim.keymap.set("n", "<a-left>", "<cmd>vertical resize +2<cr>")
    vim.keymap.set("n", "<a-right>", "<cmd>vertical resize -2<cr>")

    -- open plugin manager
    vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>")
  end
}
