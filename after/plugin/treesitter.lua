-- neovim-treesitter/nvim-treesitter (incompatible rewrite, replaces archived original)
-- Requires: tree-sitter CLI (`cargo install tree-sitter-cli`), curl, tar, C compiler
require('nvim-treesitter').setup {
  install_dir = vim.fn.stdpath('data') .. '/site',
}

-- Install parsers if missing — no-op when already installed, runs async
require('nvim-treesitter').install {
  'c', 'lua', 'json', 'yaml', 'go', 'rust', 'javascript', 'typescript', 'proto',
  'markdown', 'markdown_inline', -- required by render-markdown.nvim
}

-- Enable treesitter features per filetype
local ts_filetypes = {
  'c', 'lua', 'json', 'yaml', 'go', 'rust', 'javascript', 'typescript', 'proto',
}
vim.api.nvim_create_autocmd('FileType', {
  pattern = ts_filetypes,
  callback = function()
    local ok = pcall(vim.treesitter.start)
    if not ok then
      local ft = vim.bo.filetype
      require('nvim-treesitter').install { ft }
      vim.notify('[treesitter] Installing parser for "' .. ft .. '", reopen buffer when done.', vim.log.levels.INFO)
      return
    end
    -- Folding is handled by nvim-ufo (after/plugin/ufo.lua); don't set
    -- foldmethod/foldexpr here, or ufo's provider won't take effect.
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
