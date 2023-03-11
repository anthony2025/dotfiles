return {
  setup = function()
    -- setup leader to spacebar early for correct key mappings
    vim.g.mapleader = ' '

    -- unset some problematic bindings
    vim.keymap.set('n', '<c-u>', '<noop>')
    vim.keymap.set('n', '<c-i>', '<noop>')

    -- -- quickly exit to normal mode
    vim.keymap.set('i', 'jj', '<esc>')

    -- -- clear search
    vim.keymap.set({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>')

    -- -- alternative way to save file
    vim.keymap.set('n', '<c-s>', '<cmd>silent! update | redraw<cr>')
    vim.keymap.set({ 'i', 'v' }, '<c-s>', '<esc><cmd>silent! update | redraw<cr>')

    -- -- new file
    vim.keymap.set('n', '<leader>e', '<cmd>enew<cr>')

    -- -- quit all windows
    vim.keymap.set({ 'i', 'n', 'v' }, '<a-q>', '<cmd>qa!<cr>')

    -- yank to system clipboard
    vim.keymap.set({ 'v', 'n' }, '<leader>y', '"+y')
    vim.keymap.set({ 'v', 'n' }, '<leader>p', '"+p')
    vim.keymap.set('n', '<leader>y', '"+yy')

    -- go up/down more intuitively on long lines that wrap
    vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
    vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

    -- focus on other window
    vim.keymap.set('n', '<leader>w', [[<c-\><c-n><c-w>]])

    -- resize splits using arrow keys
    vim.keymap.set({ 'i', 'n', 'v' }, '<c-up>', '<cmd>resize +2<cr>')
    vim.keymap.set({ 'i', 'n', 'v' }, '<c-down>', '<cmd>resize -2<cr>')
    vim.keymap.set({ 'i', 'n', 'v' }, '<c-left>', '<cmd>vertical resize +2<cr>')
    vim.keymap.set({ 'i', 'n', 'v' }, '<c-right>', '<cmd>vertical resize -2<cr>')

    -- add empty lines before and after cursor line
    vim.keymap.set('n', 'gO', "<cmd>call append(line('.') - 1, repeat([''], v:count1))<cr>")
    vim.keymap.set('n', 'go', "<cmd>call append(line('.'), repeat([''], v:count1))<cr>")

    -- reselect latest changed, put, or yanked text
    vim.keymap.set('n', 'gh', '"`[" . strpart(getregtype(), 0, 1) . "`]"', { expr = true })

    -- move with home row in insert mode
    vim.keymap.set('i', '<a-h>', '<left>', { silent = false })
    vim.keymap.set('i', '<a-l>', '<right>', { silent = false })
    vim.keymap.set('i', '<a-j>', '<down>', { silent = false })
    vim.keymap.set('i', '<a-k>', '<up>', { silent = false })

    -- better paste
    vim.keymap.set('v', 'p', '"_dP')

    -- repeat macros more easily
    vim.keymap.set({ 'n', 'v' }, "''", '@@')

    -- lsp common mappings
    vim.keymap.set('n', 'K', vim.lsp.buf.hover)
    vim.keymap.set('n', 'H', vim.lsp.buf.signature_help)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references)
    vim.keymap.set('n', 'gds', vim.lsp.buf.document_symbol)
    vim.keymap.set('n', 'gws', vim.lsp.buf.workspace_symbol)
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)
    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename)
    vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action)
    vim.keymap.set('n', '<leader>c', vim.lsp.codelens.run)
  end,
}
