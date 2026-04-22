-- Check if Neovim is not running in a GUI mode
if vim.fn.has('gui_running') == 0 then
  vim.o.ttimeoutlen = 10

  local group = vim.api.nvim_create_augroup('FastEscape', { clear = true })
  vim.api.nvim_create_autocmd('InsertEnter', {
    group = group,
    callback = function() vim.o.timeoutlen = 0 end,
  })
  vim.api.nvim_create_autocmd('InsertLeave', {
    group = group,
    callback = function() vim.o.timeoutlen = 1000 end,
  })
end
