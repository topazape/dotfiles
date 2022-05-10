" packer
autocmd BufWritePost plugins.lua PackerCompile

lua require('_cmp')
lua require('_lsp_signature')
lua require('_lspconfig')
lua require('_lspinstaller')
lua require('_lualine')
lua require('_neogen')
lua require('_tree')
lua require('_treesitter')


" symbols-outline
let g:symbols_outline = {
    \ 'highlight_hovered_item': v:true,
    \ 'show_guides': v:true,
    \ 'position': 'right',
    \ 'auto_preview': v:true,
    \ 'show_numbers': v:false,
    \ 'show_relative_numbers': v:false,
    \ 'show_symbol_details': v:true,
    \ 'keymaps': {
        \ 'close': '<Esc>',
        \ 'goto_location': '<Cr>',
        \ 'focus_location': 'o',
        \ 'hover_symbol': '<C-space>',
        \ 'rename_symbol': 'r',
        \ 'code_actions': 'a',
    \ },
    \ 'lsp_blacklist': [],
\ }
nnoremap <C-n>o :SymbolsOutline<CR>

" nvim-tree
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
let g:nvim_tree_symlink_arrow = ' → '
lua require('_tree')
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif

" indent-blankline
let g:indent_blankline_char_list = ['│', '┊', '┆', '¦']

" Colors
"" colorscheme
" colorscheme tokyonight
set background=dark
colorscheme gruvbox
