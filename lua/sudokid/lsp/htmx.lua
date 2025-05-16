require("lspconfig").emmet_ls.setup({
  filetypes = { "html", "css", "javascript", "typescriptreact", "javascriptreact" },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true
      }
    }
  }
})
