local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(_, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- Setup Keybindngs for auto complete selection
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	mapping = {
		['<CR>'] = cmp.mapping.confirm({select = false }),
		['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
		['<Tab>'] = cmp_action.tab_complete(),
	}
})

lsp.setup()

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'rust_analyzer',
	'gopls',
  'html',
  'htmx-lsp'
})

