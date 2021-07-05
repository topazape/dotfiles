" vim-plug
let g:plug_window = 'new'

call plug#begin('~/.local/share/nvim/plugged')
" file explore
Plug 'preservim/nerdtree'
" icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
" comment out
Plug 'tyru/caw.vim'
" lexima
Plug 'mattn/vim-lexiv'
" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'mattn/vim-lsp-settings'
"" LSP symbols
Plug 'liuchengxu/vista.vim'
" auto-completion
Plug 'nvim-lua/completion-nvim'
" tree-sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" status line
Plug 'hoob3rt/lualine.nvim'
" visual-indent
Plug 'Yggdroot/indentLine'
" colorscheme
Plug 'ghifarit53/tokyonight-vim'
call plug#end()


" NERDTree
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-n><C-f> :NERDTreeFind<CR>
let g:NERDTreeBookMarksFile= expand(($XDG_CACHE_HOME . '/nvim/NERDTreeBookmarks'))
"" Start NERDTree. If a file is specified, move the cursor to its window.
augroup NERDStart
    au!
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
augroup END
"" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" vista.vim
nnoremap <C-n><C-v> :Vista vim_lsp<CR>

" status line
lua require('_lualine')

" indentLine
"" change conceal setting for json
let g:indentLine_concealcursor = ''
let g:indentLine_conceallevel = 1

" Colors
"" colorscheme
colorscheme tokyonight
