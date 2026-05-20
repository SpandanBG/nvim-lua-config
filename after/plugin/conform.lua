local ok, conform = pcall(require, 'conform')
if not ok then return end

local prettier = { 'prettierd', 'prettier', stop_after_first = true }

conform.setup({
  formatters_by_ft = {
    javascript      = prettier,
    javascriptreact = prettier,
    typescript      = prettier,
    typescriptreact = prettier,
    vue             = prettier,
    svelte          = prettier,
    css             = prettier,
    scss            = prettier,
    less            = prettier,
    html            = prettier,
    json            = prettier,
    jsonc           = prettier,
    yaml            = prettier,
    markdown        = prettier,
    graphql         = prettier,
    lua             = { 'stylua' },
    go              = { 'goimports', 'gofmt' },
    rust            = { 'rustfmt' },
    python          = { 'ruff_format' },
  },
})
