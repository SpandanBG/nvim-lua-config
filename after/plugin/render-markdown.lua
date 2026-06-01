local ok, render_markdown = pcall(require, 'render-markdown')
if not ok then return end

render_markdown.setup({
  render_modes = true,
})

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('sudokid_render_markdown', { clear = true }),
  pattern = { 'markdown' },
  callback = function(args)
    vim.schedule(function() vim.cmd('RenderMarkdown buf_disable') end)
    vim.keymap.set('n', '<leader>mr', '<cmd>RenderMarkdown buf_toggle<cr>', {
      buffer = args.buf,
      desc = 'Toggle markdown render (read/write mode)',
    })
  end,
})
