return {
  setup = function()
    -- setup leader the earliest for correct key mappings
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "

    -- disable search highlighting
    vim.keymap.set("n", "<esc>", "<cmd>noh<cr>")

    -- quickly exit to normal mode
    vim.keymap.set("i", "jj", "<esc>")

    -- go up/down more intuitievly on long lines that wrap
    vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
    vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

    -- buffer navigation
    vim.keymap.set("n", "<tab>", "<cmd>bnext<cr>")
    vim.keymap.set("n", "<s-tab>", "<cmd>bprevious<cr>")
    vim.keymap.set("n", "<c-i>", "<cmd>bnext<cr>")
    vim.keymap.set("n", "<c-u>", "<cmd>bprevious<cr>")

    -- resize window using <ctrl> arrow keys
    vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>")
    vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>")
    vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
    vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>")

    -- move Lines ala Sublime Text
    vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==")
    vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==")
    vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi")
    vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi")
    vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv")
    vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv")
  end
}
