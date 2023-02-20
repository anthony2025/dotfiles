-- bootstrap package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
--
-- setup general options before anything else
require'options'

-- setup general autocmds
require'autocmds'

-- setup general keymaps
require'keymaps'

-- initialize package manager
require'lazy'.setup({
  spec = {
    "folke/lazy.nvim", -- package manager manages itself
    { import = "asthetics" },
    { import = "syntax" },
    { import = "navigation" },
    { import = "explorer" },
    { import = "editing" },
    { import = "diagnostics" },
    { import = "language" },
  },
  defaults = {
    lazy = true, -- lazy load all plugins unless specified otherwise
    version = false -- use the latest git commit instead of release
  },
  concurrency = 4,
  checker = { enabled = true }, -- automatically check for plugin updates
  change_detection = { notify = false }, -- disable annoying messages
  install = { colorscheme = { "material" } } -- try setting theme on first launch
})
