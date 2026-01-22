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
        '<c-t>',
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
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      {
        '<c-p>',
        function() require('fzf-lua').files() end,
        mode = { 'i', 'n', 'v' },
      },
    },
    opts = {
      files = {
        no_ignore = true,
      }
    }
  },
  {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    }
    -- keys = {
    --   {
    --     '<c-p>',
    --     function() require('fzf-lua').files() end,
    --     mode = { 'i', 'n', 'v' },
    --   },
    -- },
  },
  {
    'christoomey/vim-tmux-navigator',
    event = 'VeryLazy',
    init = function() vim.g.tmux_navigator_disable_when_zoomed = 1 end,
  },
}
