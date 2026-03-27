-- plain HTML language server (vscode-html-language-server)
vim.lsp.config('html', {})
vim.lsp.enable('html')

-- HTMX attribute completions on top of HTML
vim.lsp.config('htmx', {
  filetypes = { 'html' },
  single_file_support = true,
})
vim.lsp.enable('htmx')
