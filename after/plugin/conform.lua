local ok, conform = pcall(require, 'conform')
if not ok then return end

local prettier = { 'prettierd', 'prettier', stop_after_first = true }

conform.setup({
  format_on_save = function(bufnr)
    -- Skip if the buffer-local or global flag is set (per-buffer escape hatch)
    if vim.b[bufnr].disable_autoformat or vim.g.disable_autoformat then
      return
    end
    return { lsp_fallback = true, timeout_ms = 3000 }
  end,
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

-- :FormatDisable / :FormatEnable to toggle format-on-save (buffer or global with !)
vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then vim.g.disable_autoformat = true else vim.b.disable_autoformat = true end
end, { bang = true, desc = "Disable format-on-save (buffer; ! for global)" })

vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, { desc = "Re-enable format-on-save" })
