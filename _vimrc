set nocompatible
filetype plugin indent on
let g:is_win = has('win32') || has('win64')
let g:is_unix = has('unix')
let g:isvim = 1
if g:is_win
    call plug#begin('~/vimfiles/bundle')
elseif g:is_unix
    call plug#begin('~/.vim/bundle')
endif
"Plug 'asins/vimcdoc', {'frozen': 1}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'edsono/vim-matchit', {'frozen': 1}
Plug 'kdurant/misc_mine'
Plug 'kdurant/verilog-testbench'
Plug 'hdima/python-syntax'
Plug 'kdurant/Asciitable.vim'", {'frozen': 1}
Plug 'kdurant/AuthorInfo', {'frozen': 1}
Plug 'kdurant/nerdcommenter', {'frozen': 1}
Plug 'kshenoy/vim-signature'
Plug 'KabbAmine/vCoolor.vim'
"Plug 'ntpeters/vim-better-whitespace'
if g:is_win
    Plug 'Shougo/neocomplete.vim'
elseif g:is_unix
    Plug 'Valloric/YouCompleteMe'
endif
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive', {'frozen': 1}
Plug 'tpope/vim-surround', {'frozen': 1}
Plug 'vim-scripts/Align', {'frozen': 1}
Plug 'Lokaltog/vim-easymotion'
Plug 'rking/ag.vim'
Plug 'iamcco/markdown-preview.vim'
"Plug 'WeiChungWu/vim-SystemVerilog'
Plug 'skywind3000/asyncrun.vim'
Plug 'amal-khailtash/vim-xdc-syntax'
Plug 'vim-scripts/ucf.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'joshdick/onedark.vim'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"file coding settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"lang messages zh_CN.UTF-8
lang C
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,latin1
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
behave xterm
set helplang=cn
set rop=type:directx

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"font settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ambiwidth=double
if g:is_win
    "set guifont=Consolas:h13
    set guifont=Monaco:h11
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"display settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme james
"exec 'colorscheme '.["bubblegum-256-light","solarized","Tomorrow","molokai","bubblegum-256-dark","molokai"][strftime("%S")%6]
exec 'colorscheme '.["codeschool", "james"][strftime("%H")%2]
set guitablabel=%N\ %t
set shortmess=atT
set lines=38 columns=90
winpos 570 0
set number
set showcmd
set noerrorbells
set laststatus=2
set iskeyword+=$,@
set display=lastline
set scrolloff=3

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"normal settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shellslash
set clipboard+=unnamed
set linebreak
set nobackup
set noswapfile
if g:is_win
    set fileformat=dos
    set fileformats=dos
elseif g:is_unix
    set fileformat=unix
    set fileformats=unix
endif
set backspace=indent,eol,start
set confirm
set wildmenu
set report=0
set history=500
set splitright
set browsedir=buffer

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"program edit settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set autoread
set textwidth=999
set nowrap
set cursorline
"set colorcolumn=80
set autoindent
set cindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab                           " Use the appropriate number of spaces to insert a <Tab>
set magic
set autochdir
set virtualedit=block
set completeopt=longest,menuone
set suffixesadd=.v

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"fold settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nofoldenable
set foldnestmax=1
set foldcolumn=4
set fillchars=fold:\ ,diff:/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"search settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set grepprg=ag\ --nogroup\ --nocolor
set ignorecase
set smartcase
set incsearch
set hlsearch
if executable('mingw32-gcc')
    set path+=E:/MinGW/include/
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"menu bar and tool bar settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set go-=m
set go-=T

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"others settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead,BufNewFile *.cmd set filetype=cmd
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.ucf set filetype=ucf
autocmd FileType lua  setlocal iskeyword+=.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"session settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set viminfo+=!  " Save and restore global variables.
set sessionoptions=sesdir,help,tabpages,winsize,winpos,resize
let $VIMSESSION = '~/PluginConfig/session.vim'
autocmd VimLeave *  mksession! $VIMSESSION
autocmd VimLeave *  let save_cursor = getpos(".")
autocmd VimEnter    call setpos('.', save_cursor)

let python_highlight_all = 1
let g:vcoolor_disable_mappings=1
source ~/PluginConfig/plugin_config.vim
source ~/PluginConfig/self_fun.vim
source ~/PluginConfig/map.vim

