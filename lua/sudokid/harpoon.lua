-- Add to Telescope
require("telescope").load_extension('harpoon')

-- Harpoon Keymaps
vim.keymap.set("n", "<F1>", ":lua require('harpoon.mark').add_file()<CR>")
vim.keymap.set("n", "<leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
vim.keymap.set("n", "<leader>th", ":Telescope harpoon marks<CR>")
vim.keymap.set("n", "<leader>[", ":lua require('harpoon.ui').nav_prev()<CR>")
vim.keymap.set("n", "<leader>]", ":lua require('harpoon.ui').nav_next()<CR>")
