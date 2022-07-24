" packer
autocmd BufWritePost plugins.lua PackerCompile

lua require('_cmp')
lua require('_lspinstaller')
lua require('_lualine')
lua require('_tree')
lua require('_treesitter')
lua require('_dapui')
lua require('_dap_python')


" symbols-outline
nnoremap <M-o> :SymbolsOutline<CR>

" nvim-tree
nnoremap <M-e> :NvimTreeToggle<CR>
lua require('_tree')
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif

" indent-blankline
let g:indent_blankline_char_list = ['│', '┊', '┆', '⁞']

" Colors
"" colorscheme
" colorscheme tokyonight
set background=dark
colorscheme gruvbox
