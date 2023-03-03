return {
  {
    'nvim-neo-tree/neo-tree.nvim',
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
            reveal_force_cwd = true,
          }
        end,
        mode = { 'i', 'n', 'v' },
      },
    },
    opts = {
      close_if_last_window = true,
      hijack_netrw_behavior = 'disabled',
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
        hijack_netrw_behavior = 'disabled',
        scan_mode = 'deep',
        search_limit = 100,
        bind_to_cwd = true,
        follow_current_file = true,
        group_empty_dirs = true,
        use_libuv_file_watcher = true,
        find_by_full_path_words = true,
      },
    },
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      local arg_count = vim.fn.argc()
      if arg_count == 0 then
        -- not passed any arguments
        require('neo-tree.command').execute {
          action = 'show',
          position = 'right',
        }
      elseif arg_count == 1 then
        local path = vim.fn.argv(0)
        local path_exists = vim.fn.filereadable(path)
        if path_exists then
          local path_kind = vim.loop.fs_stat(vim.fn.resolve(path)) and vim.loop.fs_stat(vim.fn.resolve(path)).type
          if path_kind == 'file' then
            -- passed an existing file
            require('neo-tree.command').execute {
              action = 'show',
              position = 'right',
              reveal_force_cwd = true,
            }
          elseif path_kind == 'directory' then
            -- passed an existing directory
            require('neo-tree.command').execute {
              action = 'focus',
              position = 'float',
              dir = path,
            }
          end
        end
      end
    end,
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
