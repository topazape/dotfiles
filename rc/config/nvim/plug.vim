" vim-plug
let g:plug_window = 'new'

call plug#begin('~/.local/share/nvim/plugged')
" file explore
Plug 'kyazdani42/nvim-tree.lua'

" icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" operator/non-operator mappings
Plug 'tyru/caw.vim'

" lexima
Plug 'mattn/vim-lexiv'

" lsp
Plug 'neovim/nvim-lspconfig'
"" lsp-ui
Plug 'glepnir/lspsaga.nvim'
"" installer
Plug 'kabouzeid/nvim-lspinstall'
"" LSP symbols
Plug 'simrat39/symbols-outline.nvim'
"" auto-completion
Plug 'nvim-lua/completion-nvim'

" tree-sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" status line
Plug 'hoob3rt/lualine.nvim'
" visual-indent
Plug 'Yggdroot/indentLine'
" colorscheme
Plug 'folke/tokyonight.nvim'
call plug#end()


" NERDTree
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-n><C-f> :NERDTreeFind<CR>
" let g:NERDTreeBookMarksFile= expand(($XDG_CACHE_HOME . '/nvim/NERDTreeBookmarks'))
" "" Start NERDTree. If a file is specified, move the cursor to its window.
" augroup NERDStart
"     au!
"     autocmd StdinReadPre * let s:std_in=1
"     autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" augroup END
" "" Exit Vim if NERDTree is the only window left.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" "" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
" autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" nvim-tree
runtime! nvim-tree.vim

" lsp
"" lsp-config
lua require('_lspconfig')
"" lspsaga
lua require('_lspsaga')
"" lsp install
lua require('_lspinstall')
""" completion-nvim 
autocmd BufEnter * lua require'completion'.on_attach()
"""" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"""" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
"""" Avoid showing message extra message when using completion
set shortmess+=c
""" symbols-outline
let g:symbols_outline = {
    \ "highlight_hovered_item": v:true,
    \ "show_guides": v:true,
    \ "position": 'right',
    \ "auto_preview": v:true,
    \ "show_numbers": v:false,
    \ "show_relative_numbers": v:false,
    \ "show_symbol_details": v:true,
    \ "keymaps": {
        \ "close": "<Esc>",
        \ "goto_location": "<Cr>",
        \ "focus_location": "o",
        \ "hover_symbol": "<C-space>",
        \ "rename_symbol": "r",
        \ "code_actions": "a",
    \ },
    \ "lsp_blacklist": [],
\ }
nnoremap <C-n><C-o> :SymbolsOutline<CR>

" status line
lua require('_lualine')

" nvim-treesitter
lua require('_treesitter')

" indentLine
"" change conceal setting for json
let g:indentLine_concealcursor = ''
let g:indentLine_conceallevel = 1

" Colors
"" colorscheme
colorscheme tokyonight
