-- TODO: move to neo-tree.nvim, some day.
return {
  {
    {
      "jason0x43/vim-wildgitignore",
      event = "VeryLazy",
      config = function()
        vim.cmd "NERDTreeRefreshRoot"
      end
    },
    {
      'preservim/nerdtree',
      dependencies = {
        "ryanoasis/vim-devicons",
        "johnstef99/vim-nerdtree-syntax-highlight",
      },
      keys = {
        { "<c-p>", "<cmd>NERDTreeToggle<cr>" },
        { "<c-y>", "<cmd>NERDTreeFind<cr>" } -- select file in tree
      },
      cmd = { "NERDTree", "NERDTreeRefreshRoot" },
      init = function()
        -- if another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
        vim.api.nvim_create_autocmd("BufEnter", {
          command = [[ if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute 'normal! \<C-W>w' | execute 'buffer'.buf | endif ]]
        })

        -- close tree if it is the only tab left
        vim.api.nvim_create_autocmd("BufEnter", {
          command = "if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif"
        })

        -- start tree if no arguments passed
        vim.api.nvim_create_autocmd("VimEnter", {
          command = "if argc() == 0 | execute 'NERDTree' | wincmd p | enew | endif"
        })

        -- hijack netrw if it is a directory
        vim.api.nvim_create_autocmd("VimEnter", {
          command = "if argc() == 1 && isdirectory(argv()[0]) | execute 'cd '.argv()[0] | execute 'NERDTree' argv()[0] | wincmd p | execute 'bdelete' | wincmd c | endif"
        })

        -- turn on color highlights
        vim.g.NERDTreeFileExtensionHighlightFullName = 1
        vim.g.NERDTreePatternMatchHighlightFullName = 1
        vim.g.NERDTreeExactMatchHighlightFullName = 1

        -- replace netrw with tree
        vim.g.NERDTreeHijackNetrw = 1

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
