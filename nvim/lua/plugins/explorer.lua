-- TODO: add window picker
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      {
        "<c-e>",
        function()
          require("neo-tree.command").execute {
            action = "focus",
            position = "right",
            toggle = true,
            reveal_force_cwd = true,
          }
        end,
        mode = { "i", "n", "v" },
      },
      {
        "<c-y>",
        function()
          require("neo-tree.command").execute {
            action = "focus",
            position = "float",
            toggle = true,
            reveal_force_cwd = true,
          }
        end,
        mode = { "i", "n", "v" },
      }
    },
    opts = {
      close_if_last_window = true,
      filesystem = {
        bind_to_cwd = true,
        follow_current_file = true,
        group_empty_dirs = true,
        use_libuv_file_watcher = true,
      }
    },
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      local no_args = vim.fn.argc() == 0
      if no_args then
        require("neo-tree.command").execute({
          action = "show",
          position = "right"
        })
      else
        local file_path = vim.fn.argv(0) --- @diagnostic disable-next-line:param-type-mismatch
        local is_directory = vim.loop.fs_stat(file_path) and vim.loop.fs_stat(file_path).type == 'directory'
        if is_directory then
          require("neo-tree.command").execute {
            action = "focus",
            position = "float",
            reveal = true,
            reveal_force_cwd = true
          }
        end
      end
    end
  }
}
