return {
  setup = function()
    -- setup leader the earliest for correct key mappings
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "

    -- quickly exit to normal mode
    vim.keymap.set("i", "jj", "<esc>")

    -- clear search with <esc>
    vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")

    -- save file
    vim.keymap.set({ "i", "v", "n", "s" }, "<leader>s", "<cmd>w<cr><esc>")

    -- new file
    vim.keymap.set("n", "<leader>e", "<cmd>enew<cr>")

    -- quit all windows
    vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>")

    -- go up/down more intuitievly on long lines that wrap
    vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
    vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

    -- buffer navigation
    vim.keymap.set("n", "<tab>", "<cmd>bnext<cr>")
    vim.keymap.set("n", "<s-tab>", "<cmd>bprevious<cr>")
    vim.keymap.set("n", "<c-i>", "<cmd>bnext<cr>")
    vim.keymap.set("n", "<c-u>", "<cmd>bprevious<cr>")

    -- resize splits using arrow keys
    vim.keymap.set("n", "<a-up>", "<cmd>resize +2<cr>")
    vim.keymap.set("n", "<a-down>", "<cmd>resize -2<cr>")
    vim.keymap.set("n", "<a-left>", "<cmd>vertical resize +2<cr>")
    vim.keymap.set("n", "<a-right>", "<cmd>vertical resize -2<cr>")

    -- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
    vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true })
    vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true })
    vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true })
    vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true })
    vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true })
    vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true })

    -- more intuitive indenting
    vim.keymap.set("v", "<", "<gv")
    vim.keymap.set("v", ">", ">gv")

    -- open plugin manager
    vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>")
  end
}
