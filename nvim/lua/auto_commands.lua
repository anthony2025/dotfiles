return {
  setup = function()
    -- Check if we need to reload the file when it changed
    vim.api.nvim_create_autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
      group = vim.api.nvim_create_augroup('file_changed', {}),
      command = 'checktime',
    })

    -- Highlight on yank
    vim.api.nvim_create_autocmd('TextYankPost', {
      group = vim.api.nvim_create_augroup('file_changed', {}),
      callback = function() vim.highlight.on_yank() end,
    })

    -- resize splits if window got resized
    vim.api.nvim_create_autocmd('VimResized', {
      group = vim.api.nvim_create_augroup('resize_splits', {}),
      command = 'tabdo wincmd =',
    })

    -- go to last location when opening a buffer
    vim.api.nvim_create_autocmd('BufReadPost', {
      group = vim.api.nvim_create_augroup('last_location', {}),
      callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then pcall(vim.api.nvim_win_set_cursor, 0, mark) end
      end,
    })

    -- quick close some filetypes
    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('quick_close', {}),
      pattern = {
        'help',
        'spectre_panel',
        'quickfix',
      },
      callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
      end,
    })

    -- wrap and check for spell in text filetypes
    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('wrap_spell', {}),
      pattern = {
        'gitcommit',
        'markdown',
        'text',
      },
      callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
      end,
    })
  end,
}
