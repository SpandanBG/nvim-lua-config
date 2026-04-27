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
    local tb = require('telescope.builtin')
    map('n', 'gd', tb.lsp_definitions)
    map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    map('n', 'gi', tb.lsp_implementations)
    map('n', 'go', tb.lsp_type_definitions)
    map('n', 'gr', tb.lsp_references)
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

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
  },
  mapping = {
    ['<CR>']    = cmp.mapping.confirm({ select = false }),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<Tab>']   = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
      else
        fallback()
      end
    end, { 'i', 's' }),
  }
})
