" vim-plug
let g:plug_window = 'new'

call plug#begin('~/.local/share/nvim/plugged')
" lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" toml
Plug 'cespare/vim-toml'
" decoration
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
" nardtree
Plug 'scrooloose/nerdtree'
" colorscheme
Plug 'nanotech/jellybeans.vim'
Plug 'cocopon/iceberg.vim'
Plug 'arcticicestudio/nord-vim'
" dadbod
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
call plug#end()

" vim-lsp
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_popup_delay = 100
let g:lsp_text_edit_enabled = 1
set completeopt=menuone,noinsert,noselect,preview
inoremap <expr><CR> pumvisible() ? "<C-y>" : "<CR>"
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
            \ 'whitelist': ['go'],
            \ 'workspace_config': {'gopls': {
            \    'staticcheck': v:true,
            \    'completeUnimported': v:true,
            \    'caseSensitiveCompletion': v:true,
            \    'usePlaceholders': v:true,
            \    'completionDocumentation': v:true,
            \    'watchFileChanges': v:true,
            \    'hoverKind': 'SingleLine',
            \   }},
            \ })
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
"colorscheme iceberg
"colorscheme nord
