" packer
autocmd BufWritePost plugins.lua PackerCompile

lua require('_cmp')
lua require('_mason')
lua require('_lualine')
lua require('_tree')
lua require('_treesitter')
lua require('_dap')


" symbols-outline
nnoremap <M-o> :SymbolsOutline<CR>

" nvim-tree
nnoremap <M-e> :NvimTreeToggle<CR>
lua require('_tree')
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif

" indent-blankline
let g:indent_blankline_char_list = ['│', '┊', '┆', '⁞']

" colorscheme
lua << EOF
require('nightfox').setup({
  options = {
    styles = {
      comments = 'italic',
      conditionals = 'NONE',
      constants = 'NONE',
      functions = 'NONE',
      keywords = 'bold',
      numbers = 'NONE',
      operators = 'NONE',
      strings = 'NONE',
      types = 'italic,bold',
      variables = 'NONE',
    },
  }
})
EOF
colorscheme duskfox
