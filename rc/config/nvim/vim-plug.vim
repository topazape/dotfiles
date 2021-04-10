" vim-plug
let g:plug_window = 'new'

call plug#begin('~/.local/share/nvim/plugged')
" useful plugins
" file explore
Plug 'preservim/nerdtree'
" comment out
Plug 'tyru/caw.vim'
" lexima
Plug 'mattn/vim-lexiv'
" lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
" toml
Plug 'cespare/vim-toml'
" decoration
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
" colorscheme
Plug 'ghifarit53/tokyonight-vim'
call plug#end()


" nerdtree
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-f> :NERDTreeFind<CR>
"" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
"" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" asyncomplete
set completeopt=menuone,noinsert,noselect,preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" vim-lsp
nnoremap <Leader>lf :LspDocumentFormat<CR>
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_signs_error = {'text': 'x'}
let g:lsp_signs_warning = {'text': '!'}
let g:lsp_textprop_enabled = 1
let g:lsp_highlight_references_enabled = 1
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
