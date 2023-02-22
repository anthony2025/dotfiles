return {
  setup = function()
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
    vim.opt.iskeyword:append("-")

    -- disable start screen
    vim.opt_global.shortmess:append("I")

    -- darken the row under the cursor
    vim.opt.cursorline = true

    -- draw a column after that many characters
    vim.opt.colorcolumn = "120" 

    -- Hide * markup for bold and italic
    vim.opt.conceallevel = 3

    -- Dont show mode since we have a statusline
    vim.opt.showmode = false

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
  end
}
