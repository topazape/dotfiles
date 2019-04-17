" vim-plug
let g:plug_window = 'new'

call plug#begin('~/.local/share/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'zchee/deoplete-jedi'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'fuenor/qfixhowm'
call plug#end()

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0


" devicons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" QFixHowm
"" home directory
let homw_dir = '~/howm'
"" Set file Extention to markdown
let howm_filename = '%Y/%m/%Y-%m-%d-%H%M%S.md'
"" Set filetype to markdowm
let QFixHowm_FileType = 'markdown'
"" Set Title Symbol #
let QFixHowm_Title = '#'
