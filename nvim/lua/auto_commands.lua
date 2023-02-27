return {
  setup = function()
    local function augroup(name)
      return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
    end

    -- Check if we need to reload the file when it changed
    vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
      group = augroup("file_changed"),
      command = "checktime"
    })

    -- Highlight on yank
    vim.api.nvim_create_autocmd("TextYankPost", {
      group = augroup("highlight_yank"),
      callback = function()
        vim.highlight.on_yank()
      end
    })

    -- resize splits if window got resized
    vim.api.nvim_create_autocmd({ "VimResized" }, {
      group = augroup("resize_splits"),
      command = "tabdo wincmd ="
    })

    -- go to last location when opening a buffer
    vim.api.nvim_create_autocmd("BufReadPost", {
      group = augroup("last_location"),
      callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
          pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
      end,
    })

    -- wrap and check for spell in text filetypes
    vim.api.nvim_create_autocmd("FileType", {
      group = augroup("wrap_spell"),
      pattern = { "gitcommit", "markdown" },
      callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
      end,
    })
  end
}
