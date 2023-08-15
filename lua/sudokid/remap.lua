-- Set " " as the <leader>
vim.g.mapleader = " "

-- Add "<leader>e" to open file exporler
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Add keymaps to control tabs
vim.keymap.set("n", "<C-j>", vim.cmd.tabprevious)
vim.keymap.set("n", "<C-k>", vim.cmd.tabnext)
vim.keymap.set("n", "<leader>tt", function()
  vim.cmd.TabooOpen(vim.fn.input("tab name > "))
end)
vim.keymap.set("n", "<leader>tr", function()
  vim.cmd.TabooRename(vim.fn.input("rename tab > "))
end)

-- Add copy-paste form clipboard
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>p", '"+p')

-- Move highlighted line up / down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep searched items on the middle of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Replace highlighted with copied text
vim.keymap.set("x", "<leader>P", '"_dP')

-- Remove the annoying `Q` -_-
vim.keymap.set("n", "Q", "<nop>")

-- Format code
vim.keymap.set("n", "<C-f>", function()
  vim.lsp.buf.format()
end)

-- Rename current word
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gcI<Left><Left><Left><Left>]])
