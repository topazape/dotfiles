" vim-plug
let g:plug_window = 'new'

call plug#begin('~/.local/share/nvim/plugged')
" lsp
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" toml
Plug 'cespare/vim-toml'
" decoration
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
" nardtree
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
" colorscheme
Plug 'nanotech/jellybeans.vim'
call plug#end()

" vim-lsp
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
		au!
		autocmd User lsp_setup call lsp#register_server({
			\ 'name': 'go-lang',
			\ 'cmd': {server_info->['gopls']},
			\ 'whitelist': ['go'],
			\ })
		autocmd FileType go setlocal omnifunc=lsp#complete
	augroup End
endif

"" lsp-Signs
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}
let g:lsp_highlight_references_enabled = 1

" lightline
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ }

" vim-markdowm
"" enable extensions
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
"" disable foliding
let g:vim_markdown_folding_disabled = 1
"" strikethrough
let g:vim_markdown_strikethrough = 1

" devicons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" colorscheme
colorscheme jellybeans
