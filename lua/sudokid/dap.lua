require("dapui").setup()
require("dap-go").setup()

-- DAP Keymaps
vim.keymap.set("n", "<leader>4", ":lua require('dap').run_last()<CR>")
vim.keymap.set("n", "<leader>5", ":lua require('dap').continue()<CR>")
vim.keymap.set("n", "<leader>6", ":lua require('dap').terminate()<CR>")
vim.keymap.set("n", "<leader>8", ":lua require('dap').step_over()<CR>")
vim.keymap.set("n", "<leader>9", ":lua require('dap').step_into()<CR>")
vim.keymap.set("n", "<leader>0", ":lua require('dap').step_out()<CR>")
vim.keymap.set("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>cb", ":lua require('dap').clear_breakpoints()<CR>")

-- DAP Go Keymaps
vim.keymap.set("n", "<leader>dgt", ":lua require('dap-go').debug_test()<CR>")

-- DAP UI
vim.keymap.set("n", "<leader>duo", ":lua require('dapui').open()<CR>")
vim.keymap.set("n", "<leader>duq", ":lua require('dapui').close()<CR>")

