return {
  setup = function()
    -- setup leader to spacebar early for correct key mappings
    vim.g.mapleader = ' '
    vim.g.maplocalleader = ' '

    -- -- clear search
    vim.keymap.set('n', '<leader><esc>', '<cmd>noh<cr><esc>')

    -- alternative way to save file
    vim.keymap.set('n', '<c-s>', '<cmd>silent! update | redraw<cr>')

    -- new file
    vim.keymap.set('n', '<leader>e', '<cmd>enew<cr>')

    -- close the current window
    vim.keymap.set({ 'n', 'v' }, '<c-q>', '<cmd>wincmd q<cr>')

    -- -- quit all windows
    vim.keymap.set('n', '<leader><c-q>', '<cmd>qa!<cr>')

    -- -- quit all windows
    vim.keymap.set('n', '<leader><c-q>', '<cmd>qa!<cr>')

    -- yank to system clipboard
    vim.keymap.set({ 'v', 'n' }, '<leader>y', '"+y')
    vim.keymap.set({ 'v', 'n' }, '<leader>p', '"+p')
    vim.keymap.set('n', '<leader>yy', '"+yy')

    -- go up/down more intuitively on long lines that wrap
    vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
    vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

    -- resize splits using arrow keys
    vim.keymap.set({ 'i', 'n', 'v' }, '<leader><up>', '<cmd>resize +2<cr>')
    vim.keymap.set({ 'i', 'n', 'v' }, '<leader><down>', '<cmd>resize -2<cr>')
    vim.keymap.set({ 'i', 'n', 'v' }, '<leader><left>', '<cmd>vertical resize +2<cr>')
    vim.keymap.set({ 'i', 'n', 'v' }, '<leader><right>', '<cmd>vertical resize -2<cr>')

    -- add empty lines before and after cursor line
    vim.keymap.set('n', 'gO', "<cmd>call append(line('.') - 1, repeat([''], v:count1))<cr>")
    vim.keymap.set('n', 'go', "<cmd>call append(line('.'), repeat([''], v:count1))<cr>")

    -- reselect latest changed, put, or yanked text
    vim.keymap.set('n', '<leader>v', '"`[" . strpart(getregtype(), 0, 1) . "`]"', { expr = true })

    -- better paste
    --vim.keymap.set('v', 'p', '"_dP')

    -- repeat last macro more easily
    vim.keymap.set({ 'n', 'v' }, "''", '@@')

    -- lsp common mappings
    vim.keymap.set('n', 'gh', vim.lsp.buf.hover)
    vim.keymap.set('n', 'gH', vim.lsp.buf.signature_help)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references)
    vim.keymap.set('n', 'gf', vim.lsp.buf.format)
    vim.keymap.set('n', 'gn', vim.lsp.buf.rename)
    vim.keymap.set('n', 'ga', vim.lsp.buf.code_action)
    vim.keymap.set('n', 'gl', vim.lsp.codelens.display)
    vim.keymap.set('i', '<C-space>', '<C-x><C-o>') -- omnifunc


    -- open plugin manager
    vim.keymap.set('n', '<leader>pp', function() require('lazy').show() end)
  end,
}
