return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    cmd = "Neotree",
    keys = {
      { "<c-p>", function() require'neo-tree.command'.execute{ toggle = true, reveal = true } end }
    },
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then -- passed a directory
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require'neo-tree'
        end
      end
      if vim.fn.argc() == 0 then -- no arguments passed
        require'neo-tree.command'.execute{ toggle = true, dir = vim.loop.cwd() }
      end
    end,
    opts = {
      close_if_last_window = true,
      source_selector = {
        winbar = true,
      },
      filesystem = {
        bind_to_cwd = true,
        follow_current_file = true,
        group_empty_dirs = true,
        use_libuv_file_watcher = true
      }
    },
    deactivate = function()
      vim.cmd "Neotree close"
    end
  }
}
