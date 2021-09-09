-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd('packadd packer.nvim')

local packer = require('packer')
local util = require('packer.util')
packer.init({
  compile_path = util.join_paths(vim.fn.stdpath('cache'), 'plugin', 'packer_compiled.lua'),
})

-- return require('packer').startup(function()
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
  ---- lsp-ui
  use 'glepnir/lspsaga.nvim'
  ---- installer
  use 'kabouzeid/nvim-lspinstall'
  ---- LSP symbols
  use 'simrat39/symbols-outline.nvim'
  ---- auto-completion
  use 'nvim-lua/completion-nvim'

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

  -- operator/non-operator mappings
  use 'tyru/caw.vim'
end)
