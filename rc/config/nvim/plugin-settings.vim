" packer
autocmd BufWritePost plugins.lua PackerCompile

" nvim-treesitter
lua require('_treesitter')

" status line
lua require('_lualine')

" lsp
"" lsp install
lua require('_lspinstaller')
"" lsp-config
lua require('_lspconfig')
" lsp_signature.nvim
lua require('_lsp_signature')

" completion
lua require('_cmp')

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
lua require('_tree')

" indent-blankline
let g:indent_blankline_char_list = ['│', '┊', '┆', '¦']

" Colors
"" colorscheme
colorscheme tokyonight
