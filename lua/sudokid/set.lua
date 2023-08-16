vim.opt.nu = true        			      -- Show line number 
vim.opt.cul = true                  -- Highlight current line
vim.opt.ruler = true 				        -- Show the line and column number of the cursor
vim.opt.textwidth = 0 				      -- Hard wrap long line as you type them
vim.opt.linespace = 0 				      -- Set line space to 0
vim.opt.splitbelow = true           -- Set horizontal split below of current
vim.opt.splitright = true           -- Set vertical split right of current
vim.opt.scrolloff = 3 				      -- Show next 3 lines while scrolling
vim.opt.sidescrolloff = 5 			    -- Show next 5 column while side scrolling
vim.opt.showmode = true             -- Show which mode vim is running in
vim.opt.cmdheight = 2               -- Set cmd height at 2
vim.opt.updatetime = 100            -- Set quicker update time
vim.opt.signcolumn = "yes"          -- Show sign column
vim.opt.colorcolumn = "80"          -- Set column color at 80
vim.opt.termguicolors = true        -- Use good colors

-- Set tab to 2 whitespaces
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Configure undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Set smart case unless search pattern contains uppercase
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Map leader key
vim.g.mapleader = " "

-- Enable fold and unfold using treesitter
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldenable = false
-- quick fix for treesitter fold cause broken by telescope
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*" },
  command = "normal zx"
})
vim.cmd[[autocmd BufWinEnter * setlocal nofoldenable]]
