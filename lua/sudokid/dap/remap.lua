-- DAP Keymaps
vim.keymap.set("n", "<F5>", ":lua require('dap').run_last()<CR>")
vim.keymap.set("n", "<F6>", ":lua require('dap').continue()<CR>")
vim.keymap.set("n", "<F7>", ":lua require('dap').terminate()<CR>")
vim.keymap.set("n", "<F8>", ":lua require('dap-go').debug_test()<CR>")
vim.keymap.set("n", "<F9>", ":lua require('dap').step_over()<CR>")
vim.keymap.set("n", "<F10>", ":lua require('dap').step_into()<CR>")
vim.keymap.set("n", "<F11>", ":lua require('dap').step_out()<CR>")
vim.keymap.set("n", "<F3>", ":lua require('dap').toggle_breakpoint()<CR>")
vim.keymap.set("n", "<F4>", ":lua require('dap').clear_breakpoints()<CR>")
vim.keymap.set("n", "<leader><F3>", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>")

-- DAP UI
vim.keymap.set("n", "<leader>=", ":lua require('dapui').toggle()<CR>")
