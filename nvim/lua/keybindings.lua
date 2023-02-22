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
  end
}
