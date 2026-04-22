-- DAP Keymaps
vim.keymap.set("n", "<F5>",  function() require('dap').run_last() end)
vim.keymap.set("n", "<F6>",  function() require('dap').continue() end)
vim.keymap.set("n", "<F7>",  function() require('dap').terminate() end)
vim.keymap.set("n", "<F9>",  function() require('dap').step_over() end)
vim.keymap.set("n", "<F10>", function() require('dap').step_into() end)
vim.keymap.set("n", "<F11>", function() require('dap').step_out() end)
vim.keymap.set("n", "<F3>",  function() require('dap').toggle_breakpoint() end)
vim.keymap.set("n", "<leader><F3>", function()
  require('dap').set_breakpoint(vim.fn.input('Breakpoint Condition: '))
end)
vim.keymap.set("n", "<F4>", function() require('dap').clear_breakpoints() end)

-- DAP Go Keymaps
vim.keymap.set("n", "<F8>", function() require('dap-go').debug_test() end)

-- DAP UI
vim.keymap.set("n", "<leader>=", function() require('dapui').toggle() end)
