-- Keymaps on LSP attach (replaces lsp-zero default_keymaps)
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local buf = ev.buf
    local map = function(m, lhs, rhs)
      vim.keymap.set(m, lhs, rhs, { buffer = buf })
    end

    map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    map('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
    map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
    map('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
    map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
    map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
    -- map('n', '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
    -- map('x', '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
    -- map('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    -- map('x', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
  end,
})

-- Configure lua language server for neovim
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      telemetry = { enable = false },
      runtime = {
        version = 'LuaJIT',
        path = (function()
          local p = vim.split(package.path, ';')
          table.insert(p, 'lua/?.lua')
          table.insert(p, 'lua/?/init.lua')
          return p
        end)(),
      },
      diagnostics = { globals = { 'vim' } },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.fn.expand('$VIMRUNTIME/lua'),
          vim.fn.stdpath('config') .. '/lua',
        },
      },
    },
  },
})
vim.lsp.enable('lua_ls')

-- Setup keybindings for auto complete selection
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    ['<CR>']    = cmp.mapping.confirm({ select = false }),
    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
    ['<Tab>']   = cmp_action.tab_complete(),
  }
})
