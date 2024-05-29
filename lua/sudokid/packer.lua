-- Adding Packer as the package manager

-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local function essential(use)
  -- Fuzzy Finder for file finding
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- Tree Sitter
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' });
  use('nvim-treesitter/nvim-treesitter-context');
  use('nvim-treesitter/playground');

  -- Git
  use('airblade/vim-gitgutter');
  use('tpope/vim-fugitive');

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    }
  }

  -- LSP Telescope handler
  use('gbrlsnchs/telescope-lsp-handlers.nvim')

  -- DAPs
  use('mfussenegger/nvim-dap')
  use('nvim-telescope/telescope-dap.nvim')
  use('leoluz/nvim-dap-go')
  use('theHamsta/nvim-dap-virtual-text')
  use { "rcarriga/nvim-dap-ui", requires = {
    { "mfussenegger/nvim-dap" }, -- Required
    { "nvim-neotest/nvim-nio" }  -- Required
  } }
  use { "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } }
  use {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install && npx gulp vsDebugServerBundle && mv dist out"
  }
end

local function theme(use)
  -- Color Scheme
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  -- use('marko-cerovac/material.nvim')
  use('rebelot/kanagawa.nvim')
end

local function utilities(use)
  -- Tabs
  use('gcmt/taboo.vim');

  -- Undo Tree
  use('mbbill/undotree');

  -- Harpoon
  use('ThePrimeagen/harpoon')

  -- Vim Commantry: Comment and Uncomment lines / selections
  -- `gcc` to comment & `gcgc` to uncomment
  -- in select move `gc` toggles between comment and uncomment
  use('tpope/vim-commentary')

  -- MINI tools
  use('echasnovski/mini.nvim')
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  essential(use)
  theme(use)
  utilities(use)
end)
