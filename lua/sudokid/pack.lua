-- Plugin management via vim.pack (built-in, Neovim 0.12+)
-- Run :vim.pack.update() to update all plugins

-- Build hook: run :TSUpdate after nvim-treesitter installs or updates
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.spec.name == 'nvim-treesitter' and
        (ev.data.kind == 'install' or ev.data.kind == 'update') then
      if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
      vim.cmd('TSUpdate')
    end
  end,
})

local function essential()
  -- Fuzzy Finder
  vim.pack.add({
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope-live-grep-args.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
  })

  -- Tree Sitter (fork at neovim-treesitter org — original was archived April 2026)
  -- playground dropped: use built-in :InspectTree instead
  vim.pack.add({
    'https://github.com/neovim-treesitter/treesitter-parser-registry',
    'https://github.com/neovim-treesitter/nvim-treesitter',
    'https://github.com/nvim-treesitter/nvim-treesitter-context',
  })

  -- Git
  vim.pack.add({
    'https://github.com/airblade/vim-gitgutter',
    'https://github.com/tpope/vim-fugitive',
  })

  -- LSP
  vim.pack.add({
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/williamboman/mason.nvim',
    'https://github.com/williamboman/mason-lspconfig.nvim',
  })

  -- Autocompletion
  vim.pack.add({
    'https://github.com/hrsh7th/nvim-cmp',
    'https://github.com/hrsh7th/cmp-nvim-lsp',
    'https://github.com/L3MON4D3/LuaSnip',
  })

  -- LSP Telescope handler
  vim.pack.add({
    'https://github.com/gbrlsnchs/telescope-lsp-handlers.nvim',
  })

  -- DAPs
  vim.pack.add({
    'https://github.com/mfussenegger/nvim-dap',
    'https://github.com/nvim-telescope/telescope-dap.nvim',
    'https://github.com/leoluz/nvim-dap-go',
    'https://github.com/theHamsta/nvim-dap-virtual-text',
    'https://github.com/nvim-neotest/nvim-nio',
    'https://github.com/rcarriga/nvim-dap-ui',
    'https://github.com/mxsdev/nvim-dap-vscode-js',
  })

  -- OIL for file management
  vim.pack.add({
    'https://github.com/stevearc/oil.nvim',
  })

  -- File Icons
  vim.pack.add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-tree/nvim-tree.lua',
  })
end

local function theme()
  -- Status bar
  vim.pack.add({
    'https://github.com/nvim-lualine/lualine.nvim',
  })

  -- Color Scheme
  vim.pack.add({
    'https://github.com/rebelot/kanagawa.nvim',
  })
end

local function utilities()
  -- Tabs
  vim.pack.add({
    'https://github.com/gcmt/taboo.vim',
  })

  -- Undo Tree
  vim.pack.add({
    'https://github.com/mbbill/undotree',
  })

  -- Harpoon
  vim.pack.add({
    'https://github.com/ThePrimeagen/harpoon',
  })

  -- Vim Commentary: Comment and Uncomment lines / selections
  -- `gcc` to comment & `gcgc` to uncomment
  -- in visual mode `gc` toggles between comment and uncomment
  vim.pack.add({
    'https://github.com/tpope/vim-commentary',
  })

  -- MINI tools
  vim.pack.add({
    'https://github.com/echasnovski/mini.nvim',
  })
end

essential()
theme()
utilities()
