-- Configure LSP clients
return {
  setup = function()
    -- Set default root markers for all clients
    vim.lsp.config('*', {
      root_markers = { '.git' },
    })

    -- Set configuration for typescript language server
    vim.lsp.config('ts_ls', {
      cmd = { 'typescript-language-server', '--stdio' },
      filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    })
    vim.lsp.enable('ts_ls')

    -- Set configuration for lua language server
    vim.lsp.config('luals', {
      cmd = {'lua-language-server'},
      filetypes = {'lua'},
      root_markers = {'.luarc.json', '.luarc.jsonc'},
    })
    vim.lsp.enable('luals')
  end
}
