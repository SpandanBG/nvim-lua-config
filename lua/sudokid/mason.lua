-- Install the following DAPs using `:Mason`
-- cpptools
-- codelldb


-- Ensure the following are installed with Mason
require("mason-lspconfig").setup {
    ensure_installed = { "gopls", "rust_analyzer" },
}
