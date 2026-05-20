local ok, ufo = pcall(require, 'ufo')
if not ok then return end

-- ufo wants a high foldlevel so nothing is closed on enter.
-- foldlevelstart applies to every new window; foldlevel is the current
-- window's level; foldenable ensures folding is on.
vim.opt.foldlevel      = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable     = true

-- 1-char fold gutter so open/close chevrons appear next to the line numbers.
-- `fold = ' '` (space) replaces the default `-` filler so the Folded
-- highlight covers the whole virtual line cleanly instead of being broken
-- by dashes. Triangle glyphs are 1-codepoint and widely supported — SPUA
-- nerd-font icons trip nvim's "wrong number of characters" check here.
vim.opt.foldcolumn = '1'
local fc = vim.opt.fillchars:get()
fc.fold      = ' '
fc.foldopen  = '▾'
fc.foldclose = '▸'
fc.foldsep   = ' '
vim.opt.fillchars = fc

-- Folded lines get a muted plum bg. We deliberately do NOT set `fg` — ufo
-- renders the folded line's text via extmarks, and an explicit fg would
-- override the original syntax highlighting and make the line unreadable.
-- Reapplied on ColorScheme so theme reloads don't reset it.
local function set_fold_hl()
  vim.api.nvim_set_hl(0, 'Folded', { bg = '#3D2D5C' })
end
set_fold_hl()
vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('ufo_folded_hl', { clear = true }),
  callback = set_fold_hl,
})

ufo.setup({
  -- Treesitter (folds.scm queries, async + cached — far more stable than the
  -- old `foldexpr=vim.treesitter.foldexpr()`) with indent as the terminal
  -- fallback. The chain is only 2 deep; `indent` never throws so the
  -- UfoFallbackException can't escape on filetypes with no TS parser.
  provider_selector = function(_, _, _)
    return { 'treesitter', 'indent' }
  end,
})
