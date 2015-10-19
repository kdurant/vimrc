set nocompatible
filetype plugin indent on
let g:is_win = has('win32') || has('win64')
let g:is_unix = has('unix')
if g:is_win
    call plug#begin('~/vimfiles/bundle')
elseif g:is_unix
    call plug#begin('~/.vim/bundle')
endif
Plug 'asins/vimcdoc', {'frozen': 1}
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'edsono/vim-matchit', {'frozen': 1}
Plug 'kdurant/Asciitable.vim'", {'frozen': 1}
Plug 'kdurant/AuthorInfo', {'frozen': 1}
Plug 'git@github.com:kdurant/DoxygenToolkit.vim'
Plug 'git@github.com:kdurant/LanguageRefVim'
Plug 'git@github.com:kdurant/misc_mine'
Plug 'kdurant/nerdcommenter', {'frozen': 1}
Plug 'kdurant/verilog-testbench', {'frozen': 1}
Plug 'kshenoy/vim-signature'
Plug 'KabbAmine/vCoolor.vim'
Plug 'mbriggs/mark.vim', {'frozen': 1}
"Plug 'ntpeters/vim-better-whitespace'
Plug 'Shougo/vimproc.vim' "make -f make_mingw32.mak
if g:is_win
    Plug 'Shougo/neocomplete.vim'
elseif g:is_unix
    Plug 'Valloric/YouCompleteMe'
endif
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive', {'frozen': 1}
Plug 'tpope/vim-surround', {'frozen': 1}
Plug 'vim-scripts/Align', {'frozen': 1}
Plug 'vim-scripts/verilog_systemverilog.vim', {'frozen': 1}
Plug 'Lokaltog/vim-easymotion'
Plug 'rking/ag.vim'
call plug#end()

map     ,so     :source $MYVIMRC<cr>
map     ,se     :tabnew $MYVIMRC<cr>

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"font settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ambiwidth=double
"set guifont=YaHei_Mono:h13
if g:is_win
    set guifont=Consolas:h13
    "set guifontwide=YaHei\ Consolas\ Hybrid:h13
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"display settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme james
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
map     ,ma         :set fdm=manual<cr>
map     ,in         :set fdm=indent<cr>
map     ,sy         :set fdm=syntax<cr>
map     <M-e>       ^zf%

nmap     <silent><space> @=(foldlevel('.')?'za':"\<space>")<cr>
map     <M-j>       zj
map     <M-k>       zk

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"search settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set grepprg=ag\ --nogroup\ --nocolor
set ignorecase
set smartcase
set incsearch
set hlsearch
map     <M-d>w      :setlocal wrapscan!<cr>
map     <M-d>h      :noh<cr>

map     <F6>        :call AgWrap()<cr>
map     ,re         :call Replace()<cr>

if executable('mingw32-gcc')
    set path+=E:/MinGW/include/
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"window jump settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map     <C-k>       <C-W>k
map     <C-l>       <C-W>l
map     <C-h>       <C-W>h
map     <C-j>       <C-W>j
map     <M-->       <C-W>-
map     <M-=>       <C-W>+
map     <M-c>       :clo<cr>
if g:is_win
    map     ,sx     :call Maximize()<cr>
    map     ,st     :call Topmost()<cr>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"others key map settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map     <F2>        @@

map!    <M-j>       <Down>
map!    <M-k>       <Up>
map!    <M-h>       <left>
map!    <M-l>       <Right>

map!    <C-v>       <C-r>+
map!    <c-h>       <S-Left>
map!    <c-l>       <S-Right>

map     <C-s>       :w!<cr>
imap    <C-s>       <esc>:w!<cr>

map     <M-r>       :bro e<cr>
map     ,rm         :%s/\r//g<cr>:w<cr>
map     ,rn         :%s/\s\+$//g<cr>
map     ,rg         :%s/^\n\+/\r/g<cr>
map     ,rc         :%s/\i\+/&/gn|noh

map     <M-h>       :h<space>
map     <M-a>       ggVG

map     <M-d>v      :call CompileFile()<cr>

map     <C-P>       :cp<cr>
map     <C-N>       :cn<cr>
map     j           gj
map     k           gk
map     <M-d>n      :setlocal modifiable!<cr>
imap    <M-o>       <esc>o

map     <M-d>e      :call ChangeHead()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"menu bar and tool bar settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set go-=m
set go-=T
map <silent> <M-F12> :call MenuBar()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"others settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('python')
    command! -nargs=+ Calc :py print <args>
    py from math import *
    map     <M-q>   :Calc<space>
else
    map     <M-q>   :!start calc<cr>
endif

map     Y       y$
map     K       \cr
autocmd BufRead,BufNewFile *.cmd set filetype=cmd
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd FileType lua  setlocal iskeyword+=.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"git settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map     <M-g>       :Git!<space>
map     <M-v>a      :!start /b gitk --all<cr>
map     <M-v>s      :Dit st<cr>

map     <M-;>       :Dit<space>
"if use this function, airline don't refresh branch
command! -nargs=1 Dit call GitCmd(<f-args>)
function! GitCmd(git_cmd)
    if has('win32') || has('win64')
        exe "cd " . Search_root()
        echo iconv(system('git ' . a:git_cmd), "utf-8", &enc)
    endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"session settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set viminfo+=!  " Save and restore global variables.
"set sessionoptions=sesdir,help,tabpages,winsize,winpos,folds,resize
set sessionoptions=sesdir,help,tabpages,winsize,winpos,resize
let $VIMSESSION = '~/PluginConfig/session.vim'
autocmd VimLeave *  mksession! $VIMSESSION
autocmd VimLeave *  let save_cursor = getpos(".")
autocmd VimEnter    call setpos('.', save_cursor)
map     <F7>        :so $VIMSESSION<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"tab settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map    <M-o>        :tabnew<cr>:setlocal buftype=nowrite<cr>
map    <M-t>        :tabm
map    <M-1>        1gt
map    <M-2>        2gt
map    <M-3>        3gt
map    <M-4>        4gt
map    <M-5>        5gt
map    <M-6>        6gt
map    <M-7>        7gt
map    <M-8>        8gt
map    <M-9>        9gt


function! QfMakeConv()
   let qflist = getqflist()
   for i in qflist
      let i.text = iconv(i.text, "cp936", "utf-8")
   endfor
   call setqflist(qflist)
endfunction
au QuickfixCmdPost make call QfMakeConv()

source ~/PluginConfig/plugin_config.vim
source ~/PluginConfig/self_fun.vim
