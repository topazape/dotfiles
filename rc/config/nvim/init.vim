" Mouse OFF
set mouse=

" Charcode
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,euc-jp
set fileformats=unix,dos,mac

" No files
set nobackup
set noswapfile

" Search
set ignorecase
set wrapscan
"" enable very magic to default
nnoremap / /\v

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
set listchars=tab:›\ ,trail:˽,eol:¬,extends:»,precedes:«,nbsp:·


" Filename completion
set wildmenu
set wildmode=full

" Deletion
set backspace=indent,eol,start
" <DEL> by C-d
inoremap <C-d> <DEL>

" Hide -- INSERT --
set noshowmode

" Register
"" do not store in register by deletion
nnoremap x "_x
"" but dd can store
"nnoremap dd "_dd

" allow emacs key-bind in INSERT mode
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>

" ~/.config/nvim/.netrwhist to ~/.cache/nvim/.netrwhist
let g:netrw_home = expand('$XDG_CACHE_HOME') . '/nvim'

" FileType Setting
filetype plugin on
" vim script
autocmd FileType vim setlocal tabstop=4 shiftwidth=4 expandtab
" sql
autocmd FileType sql setlocal tabstop=4 shiftwidth=4 expandtab
" html
autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab
" yaml
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 expandtab
" javascript
autocmd FileType javascript,typescript,json setlocal tabstop=4 shiftwidth=4 expandtab
" PHP
autocmd FileType php setlocal tabstop=4 shiftwidth=4 expandtab


" for Python Environment
if exists('$VIRTUAL_ENV')
    let g:python3_host_prog = expand('$VIRTUAL_ENV') . '/bin/python3'
else
    let g:python3_host_prog = trim(system('which python3'))
endif

" Terminal Mode
"" map the terminal mode escape command (<C-\><C-n>) to ESC
tnoremap <silent> <ESC> <C-\><C-n>
"" always insert mode
autocmd TermOpen * startinsert
"" open terminal under current window (:T)
command! -nargs=* T split | wincmd j | resize 15 | terminal <args>

" load plugins
runtime! vim-plug.vim
