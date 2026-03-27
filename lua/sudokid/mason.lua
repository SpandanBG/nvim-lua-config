-- Install the following DAPs using `:Mason`
-- cpptools
-- codelldb

require("mason").setup()

require("mason-lspconfig").setup({
    automatic_enable = true,
    ensure_installed = { "ts_ls", "rust_analyzer", "gopls", "lua_ls" },
})
