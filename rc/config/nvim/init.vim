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

" Highlighting
syntax on
set hlsearch
set showmatch

" Show control chars
set list
set listchars=tab:→\ ,trail:˽,eol:¬

" Filename completion
set wildmenu
set wildmode=full

" Completion
set completeopt=menuone,preview

" Deletion
set backspace=indent,eol,start
" <DEL> by C-d
inoremap <C-d> <DEL>

" Hide -- INSERT --
set noshowmode

" FileType Setting
filetype plugin on

" for Python Environment
if exists('$VIRTUAL_ENV')
	let g:python3_host_prog = expand('$VIRTUAL_ENV') . '/bin/python3'
else
	let g:python3_host_prog = expand('$HOME') . '/.linuxbrew/bin/python3'
endif

" TERMINAL MODE
tnoremap <silent> <ESC> <C-\><C-n>

" load plugins
runtime! vim-plug.vim
