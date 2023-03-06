-- TODO: add border to tree
return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    cmd = 'Neotree',
    branch = 'v2.x',
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
            reveal_force_cwd = true,
          }
        end,
        mode = { 'i', 'n', 'v' },
      },
      {
        '<c-y>',
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
      window = {
        position = 'right',
      },
      source_selector = {
        winbar = true,
        tab_labels = {
          filesystem = ' Files',
          buffers = ' Buffers',
          git_status = ' Git',
        },
      },
      filesystem = {
        scan_mode = 'deep',
        search_limit = 100,
        bind_to_cwd = true,
        follow_current_file = true,
        group_empty_dirs = true,
        use_libuv_file_watcher = true,
        find_by_full_path_words = true,
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
              'spectre_panel',
              'toggleterm',
              'quickfix',
            },
          },
        },
      }
    end,
  },
}
