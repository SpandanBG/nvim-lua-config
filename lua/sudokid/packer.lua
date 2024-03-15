-- Adding Packer as the package manager

-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'


  -- Fuzzy Finder for file finding
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- Color Scheme
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use('marko-cerovac/material.nvim')

  -- Tree Sitter
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' });
  use('nvim-treesitter/nvim-treesitter-context');

  -- Tabs
  use('gcmt/taboo.vim');

  -- Undo Tree
  use('mbbill/undotree');

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

  -- Auto pair brackets, parent, quotes
  use('townk/vim-autoclose')

  -- DAPs
  use('mfussenegger/nvim-dap')
  use('nvim-telescope/telescope-dap.nvim')
  use('leoluz/nvim-dap-go')
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

  -- Harpoon
  use('ThePrimeagen/harpoon')
end)
