-- Tint folded lines green (instead of the default purple `Folded`) when any
-- gitsigns hunk falls inside the fold range. Implemented with buffer
-- extmarks using `line_hl_group`, which overrides Folded's bg per-line.

local ns = vim.api.nvim_create_namespace('folded_dirty')

local function set_hl()
  -- dark green that contrasts cleanly against the purple Folded bg
  vim.api.nvim_set_hl(0, 'FoldedDirty', { bg = '#2D4F36' })
end

set_hl()
vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('folded_dirty_hl', { clear = true }),
  callback = set_hl,
})

local function refresh(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  if not vim.api.nvim_buf_is_valid(bufnr) then return end
  if vim.bo[bufnr].buftype ~= '' then return end

  vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

  local ok_gs, gs = pcall(require, 'gitsigns')
  if not ok_gs then return end
  local hunks = gs.get_hunks(bufnr)
  if not hunks or #hunks == 0 then return end

  local seen = {}
  vim.api.nvim_buf_call(bufnr, function()
    for _, hunk in ipairs(hunks) do
      local start_l = hunk.added and hunk.added.start or hunk.start
      local count   = (hunk.added and hunk.added.count) or hunk.count or 1
      local end_l   = start_l + math.max(count - 1, 0)
      for l = start_l, end_l do
        local fold_start = vim.fn.foldclosed(l)
        if fold_start ~= -1 and not seen[fold_start] then
          seen[fold_start] = true
          vim.api.nvim_buf_set_extmark(bufnr, ns, fold_start - 1, 0, {
            line_hl_group = 'FoldedDirty',
          })
        end
      end
    end
  end)
end

-- Debounce so rapid events (typing, scrolling) don't spam the work
local timer
local function schedule(bufnr)
  if timer then
    timer:stop()
    timer:close()
  end
  timer = vim.defer_fn(function()
    timer = nil
    refresh(bufnr)
  end, 50)
end

local group = vim.api.nvim_create_augroup('folded_dirty', { clear = true })
vim.api.nvim_create_autocmd(
  { 'BufWinEnter', 'BufEnter', 'TextChanged', 'CursorHold', 'CursorHoldI' },
  { group = group, callback = function(args) schedule(args.buf) end }
)
vim.api.nvim_create_autocmd('User', {
  group = group,
  pattern = 'GitSignsUpdate',
  callback = function(args) schedule(args.buf) end,
})
