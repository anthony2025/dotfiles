-- bootstrap plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require'options'
require'autocmds'
require'keybindings'

require'lazy'.setup("plugins", {
  defaults = {
    lazy = true, -- lazy load all plugins unless specified otherwise
    version = false -- use the latest git commit instead of release
  },
  concurrency = 4,
  checker = { enabled = true }, -- automatically check for plugin updates
  change_detection = { notify = false }, -- disable annoying messages
  install = { colorscheme = { "material" } }, -- try setting theme on first launch
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      }
    }
  }
})
