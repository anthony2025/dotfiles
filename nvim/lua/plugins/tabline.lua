return {
  {
    'romgrk/barbar.nvim',
    lazy = false,
    priority = 70,
    version = '*',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'folke/tokyonight.nvim',
    },
    keys = {
      { '<s-tab>', '<cmd>BufferPrevious<cr>' },
      { '<tab>', '<cmd>BufferNext<cr>' },
      { '<c-m', '<cmd>BufferMovePrevious<cr>' },
      { '<c-n>', '<cmd>BufferMoveNext<cr>' },

      { '<c-c>', '<cmd>BufferClose<cr>' },
      { '<c-u>', '<cmd>BufferPick<cr>' },

      { '<leader>bn', '<cmd>BufferOrderByBufferNumber<cr>' },
      { '<leader>bd', '<cmd>BufferOrderByDirectory<cr>' },
      { '<leader>bl', '<cmd>BufferOrderByLanguage<cr>' },
      { '<leader>bw', '<cmd>BufferOrderByWindowNumber<cr>' },

      { '<a-1>', '<cmd>BufferGoto 1<cr>' },
      { '<a-2>', '<cmd>BufferGoto 2<cr>' },
      { '<a-3>', '<cmd>BufferGoto 3<cr>' },
      { '<a-4>', '<cmd>BufferGoto 4<cr>' },
      { '<a-5>', '<cmd>BufferGoto 5<cr>' },
      { '<a-6>', '<cmd>BufferGoto 6<cr>' },
      { '<a-7>', '<cmd>BufferGoto 7<cr>' },
      { '<a-8>', '<cmd>BufferGoto 8<cr>' },
      { '<a-9>', '<cmd>BufferGoto 9<cr>' },
      { '<a-0>', '<cmd>BufferLast<cr>' },
    },
    config = function()
      require('bufferline').setup {
        no_name_title = 'New File',
        icons = {
          buffer_index = true,
          filetype = { enabled = true },
        },
        icon_custom_colors = true,
        hide = { extensions = true },
        highlight_inactive_file_icons = true,
      }
    end,
  },
}
