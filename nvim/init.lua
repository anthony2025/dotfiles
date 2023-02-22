require'general_options'.setup()
require'auto_commands'.setup()
require'key_bindings'.setup()

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

-- initialize plugin manager
require'lazy'.setup(
  {
    "folke/lazy.nvim", -- plugin manager manages itself
    { import = "plugins" } -- automatically import any file in plugins directory
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
    performance = { -- disable unused plugins
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
