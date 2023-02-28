return {
  {
    "echasnovski/mini.trailspace",
    event = "BufWrite",
    init = function()
      vim.api.nvim_create_autocmd("BufWrite", {
        group = vim.api.nvim_create_augroup("trim_whitespace", {}),
        callback = function()
          require'mini.trailspace'.trim()
        end
      })
    end,
    config = function()
      require'mini.trailspace'.setup()
    end
  },
  {
    "lambdalisue/suda.vim",
    event = "VeryLazy",
    init = function()
      vim.g.suda_smart_edit = 1
    end
  },
  {
    "echasnovski/mini.bufremove",
    keys = {
      { "<c-c>", function() require'mini.bufremove'.wipeout(0, false) end },
      { "<c-x>", function() require'mini.bufremove'.wipeout(0, true) end },
    },
    config = function()
      require'mini.bufremove'.setup()
    end
  },
  {
    "ibhagwan/fzf-lua",
    keys = {
      { "<c-t>", function() require'fzf-lua'.files() end }
    }
  },
}
