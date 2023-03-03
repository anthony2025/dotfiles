return {
  {
    'romgrk/barbar.nvim',
    lazy = false,
    priority = 70,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'folke/tokyonight.nvim',
    },
    keys = {
      { '<c-u>', '<cmd>bprevious<cr>' },
      { '<c-i>', '<cmd>bnext<cr>' },
      { '<c-c>', '<cmd>BufferWipeout<cr>' },
      { '<c-q>', '<cmd>BufferPick<cr>' },
      { '<a-u>', '<cmd>BufferMovePrevious<cr>' },
      { '<a-i>', '<cmd>BufferMoveNext<cr>' },
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
        icon_custom_colors = true,
      }
    end,
  },
}
