-- setup leader the earliest for correct key mappings
vim.g.mapleader = " "
vim.g.maplocalleader = " "
--
-- essential key mappings
vim.keymap.set("n", "<esc>", ":noh<cr>") -- disable search highlighting
vim.keymap.set("i", "jj", "<esc>") -- quickly exit to normal mode

-- enable 24 bit color support
vim.opt.termguicolors = true

-- disable temporal files
vim.opt.swapfile = false
vim.opt.undofile = false

-- hybrid line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- use spaces overe tabs, call :retab from visual mode to convert tabs to spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 0
vim.opt.expandtab = true

-- divide words on dash as well as underscore
vim.cmd "set iskeyword+=-"

-- disable start screen
vim.opt_global.shortmess:append("I")

-- darken the row under the cursor
vim.opt.cursorline = true

-- draw a column after that many characters
-- vim.opt.colorcolumn = "80" --javascript
vim.opt.colorcolumn = "120" -- scala

vim.opt.ignorecase = true
vim.opt.hidden = false
vim.opt.wrap = false

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.updatetime = 250
vim.opt.timeoutlen = 500

vim.opt.smartindent = true
vim.opt.copyindent = true
vim.opt.preserveindent = true
