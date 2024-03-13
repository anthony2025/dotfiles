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

    -- hybrid line numbering in the same column
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.signcolumn = 'number'

    -- use two spaces instead of tabs
    vim.opt.tabstop = 2 -- number of spaces to a tab
    vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
    vim.opt.softtabstop = 2 -- how many spaces to insert with tab key
    vim.opt.expandtab = true -- convert tabs to spaces, call :retab to manually trigger

    -- divide words on dash as well as underscore
    vim.opt.iskeyword:append '-'

    -- hide the most messages possible, dont truncate long messages, and disable the start screen
    --vim.opt.shortmess:append 'CWIOs'

    -- dont show mode since we have a statusline
    vim.opt.showmode = false

    -- darken the row under the cursor
    vim.opt.cursorline = true

    -- draw a column after this many characters
    vim.opt.colorcolumn = '120'

    -- case insensitive searches if only lower case
    vim.opt.ignorecase = true
    vim.opt.smartcase = true

    -- highlight search results while typing
    vim.opt.incsearch = true

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

    -- richer completion options
    vim.opt.completeopt = { 'menu', 'menuone', 'preview' }

    -- command-line completion mode
    vim.opt.wildmode = 'longest:full,full'

    -- dont wrap long lines
    vim.opt.wrap = false

    -- time for completions to appear
    vim.opt.updatetime = 800

    -- time to wait for next key
    vim.opt.timeoutlen = 400

    -- allow hidden buffers
    vim.opt.hidden = true

    -- lines of context to keep when scrolling
    vim.opt.scrolloff = 4
    vim.opt.sidescrolloff = 8

    -- always shw the signcolumn, otherwise it would shift the text
    vim.opt.signcolumn = 'yes'

    -- make builtin completion menus slightly transparent
    vim.opt.pumblend = 10

    -- make popup menu smaller
    vim.opt.pumheight = 10

    -- make floating windows slightly transparent
    vim.opt.winblend = 10

    -- define which helper symbols to show
    vim.opt.listchars = 'tab:>⋅,trail:·,extends:▷,precedes:◁,nbsp:␣'

    -- show some helper symbols
    vim.opt.list = true

    -- hide partial command in the last line of the screen
    vim.opt.showcmd = false

    -- hide the command bar below the status bar, it only took us 40 years to figure this out
    --vim.opt.cmdheight = 0

    -- global status bar
    vim.opt.laststatus = 3

    -- stabilize text when opening a split
    --vim.opt.splitkeep = 'screen'

    -- so that `` is visible in markdown files
    vim.opt.conceallevel = 0

    -- fix markdown indentation settings
    vim.g.markdown_recommended_style = 0
  end,
}
