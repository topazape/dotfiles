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
set fillchars+=eob:◦

" Filename completion
set wildmenu
set wildmode=full

" Deletion
set backspace=indent,eol,start
" <DEL> by C-d
inoremap <C-d> <DEL>

" Hide -- INSERT --
set noshowmode

" Buffers
nnoremap <C-j> :bnext<CR>
nnoremap <C-k> :bprev<CR>

" :sp, :vsp
set noequalalways

" Register
"" do not store in register by deletion
nnoremap x "_x
"" but dd can store
"nnoremap dd "_dd

" Disable recording
nnoremap q <Nop>

" Mapping of window oparations like tmux
nnoremap <C-w>- :split<CR><C-w>j
nnoremap <C-w>{ <C-w><C-x>
nnoremap <C-w>J <C-w>+
nnoremap <C-w>K <C-w>-

" allow emacs key-bind in INSERT mode
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>

" ~/.config/nvim/.netrwhist to ~/.cache/nvim/.netrwhist
let g:netrw_home = expand('$XDG_CACHE_HOME') . '/nvim'

" FileType Setting
filetype plugin indent on
"" digdag
autocmd BufNewFile,BufRead *.dig set filetype=yaml
"" html
autocmd FileType html setlocal tabstop=4 shiftwidth=4 expandtab
"" js, ts, json
autocmd FileType javascript,typescript,json setlocal tabstop=4 shiftwidth=4 expandtab
"" svelte
autocmd FileType svelte setlocal tabstop=4 shiftwidth=4 expandtab

" for Python Virtual Environment
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
"" disable linenumbers in terminal window
autocmd TermOpen * setlocal nonumber
"" open terminal under current window (:T)
command! -nargs=* T split | wincmd j | resize 20 | terminal <args>

"" packer.lua
lua require('plugins')
runtime! plugin-settings.vim
