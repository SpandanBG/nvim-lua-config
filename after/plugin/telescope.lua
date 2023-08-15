local builtin = require('telescope.builtin')

-- Find all Files
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- Find Files in only watched by Git
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})

-- Find keyword in all files (requires `ripgrep`
vim.keymap.set('n', '<leader>pf', builtin.live_grep, {})
