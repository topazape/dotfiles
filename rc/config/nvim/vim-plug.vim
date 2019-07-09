" vim-plug
let g:plug_window = 'new'

call plug#begin('~/.local/share/nvim/plugged')
" lsp
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
" decoration
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
" nardtree
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" vim-lsp
"" python
if executable('pyls')
	au User lsp_setup call lsp#register_server({
		\ 'name': 'pyls',
		\ 'cmd': {server_info->['pyls']},
		\ 'whitelist': ['python'],
		\ })
endif

"" Signs
let g:lsp_signs_enabled = 1
let g:lsp_diagnostic_echo_curosr = 1

let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}
let g:asyncomplete_completion_delay = 1

" lightline
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ }

" devicons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" colors
set termguicolors
