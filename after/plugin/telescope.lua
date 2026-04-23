-- Add multi-selected (or current) Telescope entries to Harpoon
-- Usage: <Tab> to mark files, then <C-h> to add all to Harpoon
local function add_to_harpoon(prompt_bufnr)
  local action_state = require('telescope.actions.state')
  local actions = require('telescope.actions')
  local picker = action_state.get_current_picker(prompt_bufnr)
  local selections = picker:get_multi_selection()
  if #selections == 0 then
    selections = { action_state.get_selected_entry() }
  end
  actions.close(prompt_bufnr)
  local harpoon = require('harpoon')
  for _, entry in ipairs(selections) do
    local filepath = entry.path or entry.filename or entry.value
    harpoon:list():add({ value = filepath, context = { row = 1, col = 0 } })
  end
end

-- Setup Telescope
require('telescope').setup {
  defaults = {
    path_display = { shorten = 4 },
    mappings = {
      i = { ['<C-h>'] = add_to_harpoon },
      n = { ['<C-h>'] = add_to_harpoon },
    },
  }
}

local builtin = require('telescope.builtin')

-- Add Telescope LSP Handlers
require('telescope').load_extension('lsp_handlers')

-- Add mapping for lsp 
vim.keymap.set('n', 'gr', builtin.lsp_references, {})

-- Add DAP Handler
require('telescope').load_extension('dap')

-- Add Live Grep Args Handler
require('telescope').load_extension('live_grep_args')

-- Find all Files
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- Find Files in only watched by Git
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})

-- Find keyword in all files (requires `ripgrep`)
vim.keymap.set('n', '<leader>pf', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", {})

-- Find keyword in all git file
vim.keymap.set('n', '<leader>gf', function()
  local git_dir = vim.api.nvim_exec2("!git rev-parse --show-toplevel", {});
  local opts = {
    cmd = git_dir
  };
  builtin.live_grep(opts);
end)

-- Find keyword in current file
vim.keymap.set('n', "<leader>cf", function()
  builtin.live_grep({ search_dirs = { "%:p" } })
end)

-- Set `goto defination` to Telescope
vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { desc = 'Telescope LSP definitions' })
