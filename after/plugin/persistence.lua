local ok, persistence = pcall(require, 'persistence')
if not ok then return end

persistence.setup({
  -- Save sessions under stdpath('state')/sessions/ keyed by cwd
  options = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help' },
})

-- Auto-restore session for cwd when nvim is launched with no file args.
-- `argc(-1) == 0` means bare `nvim`; `nvim file.txt` or `nvim .` will NOT restore.
vim.api.nvim_create_autocmd('VimEnter', {
  group = vim.api.nvim_create_augroup('persistence_autoload', { clear = true }),
  nested = true,
  callback = function()
    if vim.fn.argc(-1) == 0 then
      require('persistence').load()
    end
  end,
})
