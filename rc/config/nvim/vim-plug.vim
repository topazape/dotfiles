" vim-plug
let g:plug_window = 'new'

call plug#begin('~/.local/share/nvim/plugged')
" useful plugins
"" comment out
Plug 'tyru/caw.vim'
"" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"" lexima
Plug 'mattn/vim-lexiv'

" lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" toml
Plug 'cespare/vim-toml'
" decoration
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
" colorscheme
Plug 'nanotech/jellybeans.vim'
Plug 'cocopon/iceberg.vim'
Plug 'arcticicestudio/nord-vim'
" dadbod
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
call plug#end()

" fzf
nnoremap [FZF] <Nop>
nmap <Leader>f [FZF]
nnoremap [FZF]f :<C-u>Files<CR>
nnoremap [FZF]g :<C-u>GFiles<CR>
nnoremap [FZF]b :<C-u>Buffers<CR>


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
"" lsp-golang
if executable('gopls')
    augroup LspGo
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'go-lang',
            \ 'cmd': {server_info->['gopls']},
            \ 'initializaion_options': {
            \   'diagnostics': v:true,
            \   'completeUnimported': v:true,
            \   'matcher': 'fuzzy',
            \ },
            \ 'whitelist': ['go'],
            \ })
        autocmd BufWritePre *.go LspDocumentFormatSync
        autocmd FileType go setlocal omnifunc=lsp#complete
    augroup End
endif

" vim-dadbod-ui
autocmd FileType dbui setlocal shiftwidth=2

" lightline
let g:lightline = {
    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
    \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
    \ 'colorscheme': 'wombat',
    \ }

" Colors
"" colorscheme
colorscheme jellybeans
