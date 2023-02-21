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

-- setup general options before anything else
require'options'

-- setup general autocmds
require'autocmds'

-- setup general keymaps
require'keymaps'

-- initialize package manager
require'lazy'.setup({
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
  },
  spec = {
    "folke/lazy.nvim", -- package manager manages itself
    { import = "theme" },
    { import = "statusline" },
    { import = "syntax" },
    { import = "files" },
    { import = "editing" },
    { import = "explorer" },
    { import = "lsp" },
    { import = "autocompletion" },
    { import = "diagnostics" },
  },
})
