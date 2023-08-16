local builtin = require('telescope.builtin')

-- Find all Files
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- Find Files in only watched by Git
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})

-- Find keyword in all files (requires `ripgrep`)
vim.keymap.set('n', '<leader>pf', builtin.live_grep, {})

-- Find keyword in all git file
vim.keymap.set('n', '<leader>gf', function() 
  local git_dir = vim.api.nvim_exec("!git rev-parse --show-toplevel", false);
  local opts = {
    cmd = git_dir
  };
  builtin.live_grep(opts);
end)
