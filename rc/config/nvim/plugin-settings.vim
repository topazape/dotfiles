" packer
autocmd BufWritePost plugins.lua PackerCompile

" nvim-tree
runtime! nvim-tree.vim
" lsp
"" lsp-config
lua require('_lspconfig')
"" lspsaga
lua require('_lspsaga')
"" lsp install
lua require('_lspinstall')
"" snippets
lua require('snippets').use_suggested_mappings()
"" completion-nvim
autocmd BufEnter * lua require('completion').on_attach()
""" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
""" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
""" Avoid showing message extra message when using completion
set shortmess+=c
""" enable snipetts
let g:completion_enable_snippets = 'snippets.nvim'
""" symbols-outline
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

" status line
lua require('_lualine')

" nvim-treesitter
lua require('_treesitter')

" indent-blankline
let g:indent_blankline_char_list = ['│', '┊', '┆', '¦', '⋮']

" Colors
"" colorscheme
colorscheme tokyonight
