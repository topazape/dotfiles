" vim-plug
let g:plug_window = 'new'

call plug#begin('~/.local/share/nvim/plugged')
" lsp
Plug 'prabirshrestha/async.vim'
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
" dadbod
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
call plug#end()

" vim-lsp
"" lsp-debug
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/.vim-lsp.log')
"" lsp-signs
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}
let g:lsp_highlight_references_enabled = 1
"" lsp-python
if executable('pyls')
	augroup LspPython
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
		autocmd User lsp_setup call lsp#register_server({
			\ 'name': 'go-lang',
			\ 'cmd': {server_info->['gopls']},
			\ 'whitelist': ['go'],
			\ })
		autocmd FileType go setlocal omnifunc=lsp#complete
	augroup End
endif

" lightline
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ }

" devicons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" colorscheme
colorscheme jellybeans
