return {
  setup = function()
    -- enable 24 bit color support
    vim.opt.termguicolors = true

    -- disable temporal files
    vim.opt.swapfile = false
    vim.opt.backup = false
    vim.opt.writebackup = false

    -- enable persistent undo history
    vim.opt.undofile = true

    -- hybrid line numbering by default
    vim.opt.number = true
    vim.opt.relativenumber = true

    -- use two spaces instead of tabs
    vim.opt.tabstop = 2 -- number of spaces to a tab
    vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
    vim.opt.softtabstop = 2 -- how many spaces to insert with tab key
    vim.opt.expandtab = true -- convert tabs to spaces, call :retab to manually trigger

    -- divide words on dash as well as underscore
    vim.opt.iskeyword:append '-'

    -- we hide the most messages possible, dont truncate, and disable the start screen
    vim.api.nvim_command 'set shortmess=CWIOs'

    -- line below tabline
    vim.opt.cmdheight = 2

    -- darken the row under the cursor
    vim.opt.cursorline = true

    -- draw a column after that many characters
    vim.opt.colorcolumn = '120'

    -- dont show mode since we have a statusline
    vim.opt.showmode = false

    -- case insensitive searches by default
    vim.opt.ignorecase = true

    -- dont ignore case if pattern has upper case
    vim.opt.smartcase = true

    -- show search results while typing
    vim.opt.incsearch = true

    vim.opt.completeopt = { 'menu', 'menuone', 'preview' }

    -- infer letter cases for a richer built-in keyword completion
    vim.opt.infercase = true

    -- to which side to open new splits
    vim.opt.splitright = true
    vim.opt.splitbelow = true

    -- indent wrapped lines to match line start
    vim.opt.breakindent = true

    -- wrap long lines more intelligently
    vim.opt.linebreak = true

    -- insert indents automatically
    vim.opt.smartindent = true
    vim.opt.copyindent = true
    vim.opt.preserveindent = true
    vim.opt.shiftround = true

    -- activate spell checking by default
    vim.opt.spell = true
    vim.opt.spelllang = { 'en', 'es' }

    -- command-line completion mode
    vim.opt.wildmode = 'longest:full,full'

    -- dont wrap long lines
    vim.opt.wrap = false

    vim.o.timeout = true
    vim.opt.updatetime = 500 -- time to wait for completions
    vim.opt.timeoutlen = 300 -- time to wait for next key

    -- allow hidden buffers
    vim.opt.hidden = true

    -- lines of context to keep when scrolling
    vim.opt.scrolloff = 4
    vim.opt.sidescrolloff = 8

    -- always shw the signcolumn, otherwise it would shift the text
    vim.opt.signcolumn = 'yes'

    -- reduce scroll during window split
    vim.opt.splitkeep = 'screen'

    -- make builtin completion menus slightly transparent
    vim.opt.pumblend = 10

    -- make popup menu smaller
    vim.opt.pumheight = 10

    -- make floating windows slightly transparent
    vim.opt.winblend = 10

    -- define which helper symbols to show
    vim.opt.listchars = 'extends:…,precedes:…,nbsp:␣'

    -- show some helper symbols
    vim.opt.list = true

    -- so that `` is visible in markdown files
    vim.opt.conceallevel = 0

    -- hide partial command in the last line of the screen
    vim.opt.showcmd = false

    -- fix markdown indentation settings
    vim.g.markdown_recommended_style = 0
  end,
}
