" vim-plug
let g:plug_window = 'new'

call plug#begin('~/.local/share/nvim/plugged')
" file explore
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
" comment out
Plug 'tyru/caw.vim'
" lexima
Plug 'mattn/vim-lexiv'
" lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
"" LSP symbols
Plug 'liuchengxu/vista.vim'
" javascript
Plug 'pangloss/vim-javascript'
" toml
Plug 'cespare/vim-toml'
" decoration
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
" colorscheme
Plug 'ghifarit53/tokyonight-vim'
call plug#end()


" NERDTree
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-n><C-f> :NERDTreeFind<CR>
let g:NERDTreeBookMarksFile= expand(($XDG_CACHE_HOME . '/nvim/NERDTreeBookmarks'))
"" Start NERDTree. If a file is specified, move the cursor to its window.
augroup NERD
    au!
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
    autocmd VimEnter * call lightline#update()
augroup END
"" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" asyncomplete
set completeopt=menuone,noinsert,noselect,preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" vim-lsp
let g:lsp_diagnostics_enabled = 1
let g:lsp_document_highlight_enabled = 1
"" vim-lsp debug
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')

"" lsp-python
if executable('pyls')
    augroup LspPython
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'pyls',
            \ 'cmd': {server_info->['pyls']},
            \ 'whitelist': ['python'],
            \ })
        autocmd Filetype python setlocal omnifunc=lsp#complete
    augroup End
endif

" vista.vim
nnoremap <C-n> :Vista vim_lsp<CR>

" lightline
let g:lightline = {
    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
    \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
    \ 'colorscheme': 'wombat',
    \ }

" indentLine
"" change conceal setting for json
let g:indentLine_concealcursor = ''
let g:indentLine_conceallevel = 1

" Colors
"" colorscheme
colorscheme tokyonight
