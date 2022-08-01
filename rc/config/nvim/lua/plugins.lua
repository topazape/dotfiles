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
  use {
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim'
  }
  ---- add pictograms
  use 'onsails/lspkind.nvim'

  -- completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    }
  }

  -- Debug Adapter Protocol
  use {
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text'
  }

  -- tree-sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  -- rainbow
  use 'p00f/nvim-ts-rainbow'

  -- status line
  use 'hoob3rt/lualine.nvim'

  -- bufferline
  use {'akinsho/bufferline.nvim', tag = "v2.*"}

  -- indent
  use 'lukas-reineke/indent-blankline.nvim'

  -- colorscheme
  use 'EdenEast/nightfox.nvim'

  -- operator/non-operator mappings
  use 'tyru/caw.vim'

  -- rust
  use 'rust-lang/rust.vim'

  -- notify
  use 'rcarriga/nvim-notify'
end)
