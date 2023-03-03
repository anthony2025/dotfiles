return {
  {
    'folke/noice.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      cmdline = {
        view = 'cmdline',
        format = {
          search_down = {
            view = 'cmdline',
          },
          search_up = {
            view = 'cmdline',
          },
        },
      },
      messages = {
        view = 'mini',
        view_error = 'mini',
        view_warn = 'mini',
      },
      routes = {
        {
          filter = {
            event = 'msg_show',
            kind = '',
            find = 'written',
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = 'msg_show',
            kind = '',
            find = 'modified',
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = 'msg_show',
            kind = '',
            find = 'lines',
          },
          opts = { skip = true },
        },
      },
      presets = {
        inc_rename = true,
        lsp_doc_border = true,
      },
    },
  },
}
