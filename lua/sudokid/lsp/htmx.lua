local lspconfig = require('lspconfig')

-- plain HTML language server (vscode-html-language-server)
lspconfig.html.setup({})

-- HTMX attribute completions on top of HTML
lspconfig.htmx.setup({
  filetypes = { "html" }, -- attach whenever you open .html
  single_file_support = true,
})
