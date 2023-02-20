-- set our general options before anything else
require'options'

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

-- configure package manager
local package_manager_opts = {
  defaults = {
    lazy = true,
  },
  concurrency = 4,
  change_detection = {
    notify = false
  },
  install = {
    colorscheme = { "material" }
  }
}

-- initialize package manager
require'lazy'.setup({{
  "folke/lazy.nvim",
  { import = "asthetics" },
  { import = "syntax" },
  { import = "navigation" },
  { import = "explorer" },
  { import = "editing" },
  { import = "diagnostics" },
  { import = "language" },
}}, package_manager_opts)
