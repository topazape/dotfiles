" packer
autocmd BufWritePost plugins.lua PackerCompile

lua require('_cmp')
lua require('_lspconfig')
lua require('_lspinstaller')
lua require('_lualine')
lua require('_tree')
lua require('_treesitter')
lua require('_symbolsoutline')


" symbols-outline
nnoremap <C-o> :SymbolsOutline<CR>

" nvim-tree
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
lua require('_tree')
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif

" indent-blankline
let g:indent_blankline_char_list = ['│', '┊', '┆', '⁞']

" Colors
"" colorscheme
" colorscheme tokyonight
set background=dark
colorscheme gruvbox
