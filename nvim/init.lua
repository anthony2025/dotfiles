-- let plugins override our base options
require('general_options').setup()
require('key_bindings').setup()
require('auto_commands').setup()

-- setup a binding for our plugin manager
vim.keymap.set('n', '<leader>l', function() require('lazy').show() end)

-- bootstrap plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

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
  performance = { -- disable unused rtp plugins
    rtp = {
      disabled_plugins = {
        'gzip',
        'matchit',
        'matchparen',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
        'netrwPlugin',
      },
    },
  },
}