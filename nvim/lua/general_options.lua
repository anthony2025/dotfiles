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

    vim.opt.shortmess:append {
      I = true, -- disable start screen
      W = true,-- don't give "written" or "[w]" when writing a file
      F = true, -- don't give the file info when editing a file
      c = true, -- don't give ins-completion-menu messages
      C = true, -- don't give messages while scanning for ins-completion
      a = true, -- use abbreviations for some commands
      t = true, -- truncate messages when necessary
    }

    -- darken the row under the cursor
    vim.opt.cursorline = true

    -- draw a column after that many characters
    vim.opt.colorcolumn = "120"

    -- hide * markup for bold and italic
    vim.opt.conceallevel = 3

    -- dont show mode since we have a statusline
    vim.opt.showmode = false

    -- hide * markup for bold and italic
    vim.opt.conceallevel = 3

    -- confirm to save changes before exiting modified buffer
    vim.opt.confirm = true

    -- case insensitive searches
    vim.opt.ignorecase = true

    -- don't ignore case with capitals
    vim.opt.smartcase = true

    -- show some invisible characters (tabs...
    vim.opt.list = true

    -- dont wrap long lines
    vim.opt.wrap = false

    -- to which side to open new splits
    vim.opt.splitright = true
    vim.opt.splitbelow = true

    -- always show the signcolumn, otherwise it would shift the text each time
    vim.opt.signcolumn = "yes"

    -- insert indents automatically
    vim.opt.smartindent = true
    vim.opt.copyindent = true
    vim.opt.preserveindent = true

    -- languages to check spelling in
    vim.opt.spelllang = { "en", "es" }

    -- command-line completion mode
    vim.opt.wildmode = "longest:full,full"

    -- fix markdown indentation settings
    vim.g.markdown_recommended_style = 0
  end
}
