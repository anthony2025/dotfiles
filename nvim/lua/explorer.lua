return {
  {
    {
      "jason0x43/vim-wildgitignore",
      event = "VeryLazy",
      config = function()
        vim.cmd ":NERDTreeRefreshRoot"
      end
    },
    {
      'preservim/nerdtree',
      dependencies = {
        "ryanoasis/vim-devicons",
        "johnstef99/vim-nerdtree-syntax-highlight",
      },
      keys = {
        { "<c-p>", ":NERDTreeToggle<cr>" },
        { "<c-y>", ":NERDTreeFind<cr>" } -- select file in tree
      },
      cmd = "NERDTree",
      init = function()
        -- close tree if it is the only tab left
        vim.api.nvim_create_autocmd("BufEnter", {
          command = "if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif"
        })

        -- start tree if no arguments passed
        vim.api.nvim_create_autocmd("VimEnter", {
          command = "if argc() == 0 | execute 'NERDTree' | wincmd p | endif"
        })

        -- turn on color highlights
        vim.g.NERDTreeFileExtensionHighlightFullName = 1
        vim.g.NERDTreePatternMatchHighlightFullName = 1
        vim.g.NERDTreeExactMatchHighlightFullName = 1

        -- keep netrw for remote files support
        vim.g.NERDTreeHijackNetrw = 0

        -- sync with vim internal working directory with
        vim.g.NERDTreeChDirMode = 3

        -- hide default banner
        vim.g.NERDTreeMinimalUI = 1

        -- dont ask for confirmation when deleting files
        vim.g.NERDTreeAutoDeleteBuffer = 1

        -- hide undesired files
        vim.g.NERDTreeRespectWildIgnore = 1
      end
    }
  }
}
