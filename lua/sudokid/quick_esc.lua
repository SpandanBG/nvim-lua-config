-- Check if Neovim is not running in a GUI mode
if vim.fn.has('gui_running') == 0 then
  -- Set 'ttimeoutlen' to 10
  vim.o.ttimeoutlen = 10

  -- Create an autocmd group named FastEscape
  vim.cmd [[ augroup FastEscape ]]
  -- Clear old autocmds in FastEscape group
  vim.cmd [[ autocmd! ]]
  -- Set 'timeoutlen' to 0 when entering Insert mode
  vim.cmd [[ autocmd InsertEnter * set timeoutlen=0 ]]
  -- Set 'timeoutlen' to 1000 when leaving Insert mode
  vim.cmd [[ autocmd InsertLeave * set timeoutlen=1000 ]]
  -- Close the autocmd group
  vim.cmd [[ augroup END ]]
end
