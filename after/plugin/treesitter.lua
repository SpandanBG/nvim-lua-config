-- neovim-treesitter/nvim-treesitter (incompatible rewrite, replaces archived original)
require('nvim-treesitter').setup {
  install_dir = vim.fn.stdpath('data') .. '/site',
}

-- Enable treesitter features per filetype
-- Run :TSInstall to install parsers, :TSUpdate to update them
-- (highlighting, folds, and indentation are no longer global — set per buffer)
local ts_filetypes = {
  'c', 'lua', 'json', 'yaml', 'go', 'rust', 'javascript', 'typescript', 'proto',
}
vim.api.nvim_create_autocmd('FileType', {
  pattern = ts_filetypes,
  callback = function()
    vim.treesitter.start()  -- syntax highlighting
    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr   = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo.foldlevel  = 99  -- open all folds on enter
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
