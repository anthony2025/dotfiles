return {
  {
    'nvim-treesitter/nvim-treesitter',
    version = '*',
    event = { 'BufReadPost', 'BufNewFile' },
    build = function() require('nvim-treesitter.install').update { with_sync = true }() end,
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'arduino',
          'bash',
          'fish',
          'vim',
          'python',
          'nix',
          'markdown',
          'markdown_inline',
          'yaml',
          'json',
          'javascript',
          'typescript',
          'tsx',
          'html',
          'go',
          'gitignore',
          'gitcommit',
          'dockerfile',
          'scala',
          'help',
          'java',
          'diff',
          'lua',
          'python',
          'regex',
          'css',
          'scss',
        },
        auto_install = true,
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        autopairs = {
          enable = true,
        },
        context_commentstring = {
          enable = true,
          enable_autocmd = true,
        },
      }
    end,
  },
  {
    'echasnovski/mini.comment',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('mini.comment').setup {
        hooks = {
          pre = function() require('ts_context_commentstring.internal').update_commentstring {} end,
        },
        options = {
          ignore_blank_line = true,
        },
      }
    end,
  },
}
