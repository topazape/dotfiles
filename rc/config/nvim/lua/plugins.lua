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

  -- icons
  use 'ryanoasis/vim-devicons'
  use 'kyazdani42/nvim-web-devicons'

  -- file explore
  use 'kyazdani42/nvim-tree.lua'

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

  -- status line
  use 'hoob3rt/lualine.nvim'

  -- colorscheme
  use 'folke/tokyonight.nvim'

  -- operator/non-operator mappings
  use 'tyru/caw.vim'

  -- lexima
  use 'mattn/vim-lexiv'

  -- visual-indent
  use 'Yggdroot/indentLine'
end)
