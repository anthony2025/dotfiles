require'general_options'.setup()
require'autocommands'.setup()
require'keybindings'.setup()

-- bootstrap plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=main",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- initialize pplugin manager
require'lazy'.setup(
  {
    "folke/lazy.nvim",
    { import = "plugins" }
  },
  {
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
  }
)
