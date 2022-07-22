-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local packer = require('packer')

return packer.startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- file explore
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- lsp
  use 'neovim/nvim-lspconfig'
  ---- installer
  use 'williamboman/nvim-lsp-installer'
  ---- LSP symbols
  use 'simrat39/symbols-outline.nvim'
  ---- lsp_signature
  use 'ray-x/lsp_signature.nvim'

  -- completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
    }
  }

  -- Debug Adapter Protocol
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'mfussenegger/nvim-dap-python'

  -- tree-sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  -- rainbow
  use 'p00f/nvim-ts-rainbow'

  -- status line
  use 'hoob3rt/lualine.nvim'

  -- indent
  use 'lukas-reineke/indent-blankline.nvim'

  -- colorscheme
  use 'folke/tokyonight.nvim'
  use 'ellisonleao/gruvbox.nvim'

  -- operator/non-operator mappings
  use 'tyru/caw.vim'

  -- rust
  use 'rust-lang/rust.vim'
end)
