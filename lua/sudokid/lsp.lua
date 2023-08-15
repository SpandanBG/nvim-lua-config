local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'rust_analyzer',
	'gopls'
})

-- Setup Keybindngs for auto complete selection
local cmp = require('cmp')
local cmp_select_opts = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
	mapping = {
		['<CR>'] = cmp.mapping.confirm({select = false }),
		['<Shift-Tab>'] = cmp.mapping.select_prev_item(cmp_select_opts),
		['<Tab>'] = cmp.mapping.select_next_item(cmp_select_opts),
	}
})

lsp.setup()
