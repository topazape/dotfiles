set nocompatible

" Mouse OFF
set mouse=

" Charcode
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,euc-jp
set fileformats=unix,dos,mac

" No files
set nobackup
set noswapfile
set viminfo=

" Search
set ignorecase
set wrapscan

" View settings
set number
set noruler
set wrap
set breakindent

"" highlighting
syntax on
set hlsearch
set showmatch

"" show control chars
set list
set listchars=tab:→\ ,trail:˽,eol:↓

"" filename completion
set wildmenu
set wildmode=full

"" completion
set completeopt=menu

" Deletion
set backspace=indent,eol,start
"" <DEL> by C-d
inoremap <C-d> <DEL>

" html
autocmd FileType html setlocal
	\ autoindent smartindent
	\ tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
autocmd BufRead,BufNewFile *.tpl setfiletype html
" htmldjango
autocmd FileType htmldjango setlocal
	\ autoindent smartindent
	\ tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
autocmd BufRead,BufNewFile *.tpl setfiletype html

" python
autocmd FileType python setlocal
	\ autoindent smartindent
	\ tabstop=8 softtabstop=4 shiftwidth=4 expandtab smarttab
if executable('yapf')
	autocmd FileType python nnoremap <Leader>y :0,$!yapf<Cr>
endif
if !exists('$VIRTUAL_ENV')
	let g:python3_host_prog = expand('$HOME') . '/.linuxbrew/bin/python3'
else
	let g:python3_host_prog = expand('$VIRTUAL_ENV') . '/bin/python3'
endif

" TERMINAL MODE
tnoremap <silent> <ESC> <C-\><C-n>

" load plugins
runtime! vim-plug.vim
