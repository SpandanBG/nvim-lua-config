local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(_, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({ buffer = bufnr })
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- Setup Keybindngs for auto complete selection
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
    ['<Tab>'] = cmp_action.tab_complete(),
  }
})

local preferred = {
  -- optional: list preferred servers per filetype
  typescript = { 'ts_ls' },
}

local function rank(ft, name)
  local p = preferred[ft]
  if not p then return math.huge end
  for i, n in ipairs(p) do if n == name then return i end end
  return math.huge
end

local aug = vim.api.nvim_create_augroup('SingleLSP', {})
vim.api.nvim_create_autocmd('LspAttach', {
  group = aug,
  callback = function(ev)
    local bufnr   = ev.buf
    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    if #clients <= 1 then return end -- nothing to do

    -- Pick the keeper
    local keep = clients[1]
    for _, c in ipairs(clients) do
      local better =
          rank(vim.bo[bufnr].filetype, c.name) < rank(vim.bo[bufnr].filetype, keep.name) or
          (rank(vim.bo[bufnr].filetype, c.name) == rank(vim.bo[bufnr].filetype, keep.name) and c.id < keep.id)
      if better then keep = c end
    end

    -- Detach others after the current event loop tick
    vim.schedule(function()
      if not vim.api.nvim_buf_is_valid(bufnr) then return end
      for _, c in ipairs(clients) do
        if c.id ~= keep.id then
          pcall(vim.lsp.buf_detach_client, bufnr, c.id)
        end
      end
    end)
  end,
})

lsp.setup()

lsp.ensure_installed({
  'ts_ls',
  'rust_analyzer',
  'gopls',
  'htmx-lsp'
})
