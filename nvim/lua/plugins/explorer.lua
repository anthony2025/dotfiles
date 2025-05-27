return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = "v3.x",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons',
      's1n7ax/nvim-window-picker',
    },
    keys = {
      {
        '<c-e>',
        function()
          require('neo-tree.command').execute {
            action = 'focus',
            position = 'right',
            toggle = true,
          }
        end,
        mode = { 'i', 'n', 'v' },
      },
      {
        '<c-f>',
        function()
          require('neo-tree.command').execute {
            action = 'focus',
            position = 'float',
            toggle = true,
          }
        end,
        mode = { 'i', 'n', 'v' },
      },
    },
    opts = {
      close_if_last_window = true,
      source_selector = {
        winbar = true,
      },
      filesystem = {
        bind_to_cwd = true,
        group_empty_dirs = true,
        use_libuv_file_watcher = true,
        find_by_full_path_words = true,
        follow_current_file = {
          enabled = true
        },
      },
    },
    init = function() vim.g.neo_tree_remove_legacy_commands = 1 end,
  },
  {
    's1n7ax/nvim-window-picker',
    config = function()
      require('window-picker').setup {
        use_winbar = 'always',
        other_win_hl_color = '#e35e4f',
        filter_rules = {
          bo = {
            filetype = {
              'help',
              'neo-tree',
              'trouble',
              'lazy',
              'fzf',
              'toggleterm',
              'quickfix',
            },
          },
        },
      }
    end,
  },
  {
    'antosha417/nvim-lsp-file-operations',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
}
