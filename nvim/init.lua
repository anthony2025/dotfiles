-- let plugins override our base options
require('general_options').setup()
require('key_bindings').setup()
require('auto_commands').setup()
require('lsp_configuration').setup()

-- bootstrap plugin manager
local path = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(path) then
  vim.fn.system {
    'git',
    'clone',
    'https://github.com/folke/lazy.nvim.git',
    path,
  }
end
vim.opt.rtp:prepend(path)

-- initialize plugin manager
require('lazy').setup {
  spec = {
    'folke/lazy.nvim', -- plugin manager manages itself
    { import = 'plugins' }, -- automatically import any file in plugins directory
  },
  ui = {
    border = 'rounded',
  },
  defaults = {
    lazy = true, -- lazy load all plugins unless specified otherwise
    version = false, -- use the latest git commit instead of release
  },
  concurrency = 8,
  change_detection = { notify = false }, -- disable annoying messages
  checker = { enabled = true }, -- automatically check for plugin updates
  install = { colorscheme = { 'tokyonight' } }, -- try setting theme on first launch
  performance = { -- disable unused runtime path plugins
    rtp = {
      disabled_plugins = {
        'gzip',
        'tarPlugin',
        'zipPlugin',
        'tohtml',
        'tutor', -- ha
        'netrwPlugin', -- let neotree take over
      },
    },
  },
}
