""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""1st. vimrc config""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype plugin indent on
if has('win32') || has('win64')
    let g:is_win = 1 | let g:is_unix = 0
elseif has('unix')
    let g:is_unix = 1 | let g:is_win = 0
endif
if g:is_win  == 1
    "if empty(glob('~/vimfiles/autoload/plug.vim'))
        "!curl -fLo ~/vimfiles/autoload/plug.vim
                    "\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    "endif
    call plug#begin('~/vimfiles/bundle')
elseif g:is_unix == 1
    "if empty(glob('~/.vim/autoload/plug.vim'))
        "!curl -fLo ~/.vim/autoload/plug.vim
                    "\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    "endif
    call plug#begin('~/.vim/bundle')
endif
Plug 'asins/vimcdoc'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'edsono/vim-matchit'
Plug 'luochen1990/rainbow'
"Plug 'JazzCore/ctrlp-cmatcher'
Plug 'kdurant/AuthorInfo'
Plug 'kdurant/bookmark'
Plug 'kdurant/vim_colors'
Plug 'kdurant/CRefVim'
Plug 'kdurant/nerdcommenter'
Plug 'kdurant/verilog-testbench'
Plug 'tpope/vim-fugitive'
Plug 'kshenoy/vim-signature'
Plug 'mbriggs/mark.vim'
Plug 'Shougo/vimproc.vim' "make -f make_mingw32.mak
if g:is_win == 1
    Plug 'Shougo/neocomplete.vim'
elseif g:is_unix == 1
    Plug 'Valloric/YouCompleteMe'
endif
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'vim-scripts/colorsel.vim'
Plug 'vim-scripts/Align'
Plug 'vim-scripts/verilog_systemverilog.vim'
Plug 'vim-scripts/verilog.vim'
Plug 'vim-scripts/star-search'
Plug 'vim-scripts/cmdline-completion'
call plug#end()
if g:is_win == 1
    nmap	,so		:source ~/_vimrc<CR>
    nmap	,se		:tabnew<cr>:e ~/_vimrc<CR>
elseif g:is_unix == 1
    nmap	,so		:source ~/.vimrc<CR>
    nmap	,se		:tabnew<cr>:e ~/.vimrc<CR>
endif

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
if g:is_win == 1
    set guifont=Consolas:h13
    set guifontwide=YaHei\ Consolas\ Hybrid:h13
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"display settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme james
set guitablabel=%N\ %t
set shortmess=atI
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
if g:is_win == 1
    set fileformat=dos
    set fileformats=dos
elseif g:is_unix == 1
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
set foldnestmax=2
set foldcolumn=4
set fillchars=fold:\ ,diff:/
nmap    ,ma     :set fdm=manual<cr>
nmap    ,in     :set fdm=indent<cr>
nmap    ,sy     :set fdm=syntax<cr>
nmap    <M-e>       ^zf%

nmap <silent><space> @=(foldlevel('.')?'za':"\<space>")<cr>
"close all folds under the cursor recursively
nmap    zc      zC
"close all folds in the window
nmap    zm      zM
"open the all folds under the cursor recursively
nmap    zo      zO
"open all folds in the window
nmap    zr      zR
"Eliminate al folds in the window
nmap    ze      zE
nmap    <M-j>   zj
nmap    <M-k>   zk

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"search settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase
set smartcase
set incsearch
set hlsearch
nmap <M-d>w         :setlocal wrapscan!<cr>
nmap <M-d>h         :noh<cr>

"set grepprg=egrep\ -nwHR
set grepprg=grep\ -nwH
nmap <F6>   :call Search_Word()<cr>
nmap ,re    :call Replace()<cr>

set path+=../../
if g:is_win == 1
    set path+=E:/MinGW/include/
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"window jump settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap    <C-k>   <C-W>k
nmap    <C-l>   <C-W>l
nmap    <C-h>   <C-W>h
nmap    <C-j>   <C-W>j
nmap    <M-->   <C-W>-
nmap    <M-=>   <C-W>+
nmap    <M-c>   :close<cr>
if g:is_win == 1
    nmap    ,sx     :simalt ~x<cr>
    nmap    ,sr     :simalt ~r<cr>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"others key map settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap	<F2>	@@

noremap! <M-j> <Down>
noremap! <M-k> <Up>
noremap! <M-h> <left>
noremap! <M-l> <Right>

nmap	<C-s>	:w!<CR>
imap	<C-s>	<Esc>:w!<CR>

nmap		<M-r>	:bro e<CR>
"delete dos end-of-file and write
nmap		,rm		:%s/\r//g<CR>:w<CR>gg
"remove space of line end
nmap		,rn		:%s/[ \t\r]\+$//g<cr>gg

nmap        ,rc     :%s/\i\+/&/gn|noh

nmap		<M-h>	:h<space>
nmap		<M-a>	ggVG

nmap    <M-d>v         :call CompileFile()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"menu bar and tool bar settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guioptions-=m
set guioptions-=T
nmap <silent> <F12> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"others settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap    <C-P>       :cp<cr>
nmap    <C-N>       :cn<cr>
cmap    <c-h>       <S-Left>
cmap    <c-l>       <S-Right>
nmap    j           gj
nmap    k           gk
nmap    <M-d>n      :setlocal modifiable!<cr>
imap    <M-o>       <esc>o
vmap    <M-o>       <esc>o

cmap <C-v>  <C-r>+

"user define calculate command, need install python
command! -nargs=+ Calc :py print <args>
py from math import *
nmap    <M-q>   :Calc<space>

autocmd BufRead,BufNewFile *.cmd set filetype=cmd

if g:is_win == 1
    function! Astyle()
        "silent !astyle --add-brackets %
        silent !astyle  --style=ansi %
        silent !astyle -p %         "insert spaces padding around operators
        "silent !astyle --pad-oper %         "insert spaces padding around operators
        "silent !astyle --pad-paren-in %     "insert spaces padding around parenthesis on ther inside only
    endfunction
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""plugin config*************************************************
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"git map
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap    <M-g>   :Git!<space>
nmap    <M-v>a  :!gitk --all<cr>
nmap    <M-v>s  :Gstatus<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"airline settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='kolor'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = 'No Branch'
"let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"tab settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap    <M-o>   :tabnew<cr>:setlocal buftype=nowrite<cr>
nmap    <M-t>	:tabm
nmap    <M-1>   1gt
nmap    <M-2>   2gt
nmap    <M-3>   3gt
nmap    <M-4>   4gt
nmap    <M-5>   5gt
nmap    <M-6>   6gt
nmap    <M-7>   7gt
nmap    <M-8>   8gt
nmap    <M-9>   9gt

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"neocomplete settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if g:is_win == 1
    let g:neocomplete#enable_insert_char_pre = 1
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#auto_completion_start_length = 1
    let g:neocomplete#enable_auto_select = 1
    let g:neocomplete#enable_refresh_always = 1
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'
    let g:neocomplete#enable_ignore_case = 0
    "complete all buffers
    let g:neocomplete#same_filetypes = {}
    let g:neocomplete#same_filetypes._ = '_'

    let g:neocomplete#data_directory='$HOME\PluginConfig\neocomplete'

    let g:neocomplete#sources#dictionary#dictionaries = {
                \ 'default' : '',
                \ 'c' : $HOME.'/PluginConfig/neocomplete/c.dict',
                \ 'txt' : $HOME.'/PluginConfig/neocomplete/verilog.dict',
                \ 'verilog' : $HOME.'/PluginConfig/neocomplete/verilog.dict',
                \ }

    nmap     <M-b>   :NeoCompleteBufferMakeCache<cr>
    inoremap <expr><M-e>  neocomplete#cancel_popup()

    set completefunc=neocomplete#complete#auto_complete
elseif g:is_unix == 1
    "set completeopt=longest,menu                 " 关掉补全时的预览窗口
    let g:ycm_confirm_extra_conf = 0              " 不用每次提示加载.ycm_extra_conf.py文件
    let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
    let g:ycm_show_diagnostics_ui = 0               " 关闭ycm的syntastic
    let g:ycm_filetype_whitelist = {'c' : 1, 'cpp' : 1, 'java' : 1, 'python' : 1}
    let g:ycm_complete_in_comments = 1                " 评论中也应用补全
    let g:ycm_min_num_of_chars_for_completion = 2     " 两个字开始补全
    let g:ycm_seed_identifiers_with_syntax = 1
    let g:ycm_key_invoke_completion = '<C-Space>'
    let g:ycm_semantic_triggers =  {'c' : ['->', '.'], 'objc' : ['->', '.'], 'ocaml' : ['.', '#']}
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NERD Comment settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap	<F3>	\ci
vmap    <F3>	\ci
nmap    ,ca		\cA

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"session settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set viminfo+=!  " Save and restore global variables.
set sessionoptions=sesdir,help,tabpages,winsize,winpos,folds,resize
let $VIMSESSION = '~/PluginConfig/session.vim'
autocmd VimLeave * mksession! $VIMSESSION
autocmd VimLeave * let save_cursor = getpos(".")
autocmd VimEnter  call setpos('.', save_cursor)
nmap	<F7>	:so $VIMSESSION<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"mark settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mwAutoLoadMarks = 1			"autoload mark points settings
let g:mwDefaultHighlightingPalette = 'extended'			"use more colors
let g:mwAutoSaveMarks = 1			"auto save mark points
"search mark point
nmap	<M-i>	\*
nmap	<M-u>	\#
"set mark points
nmap		<M-m>   \mu
vmap		<M-m>   \mu
"clear all mark points
nmap		<M-n>	:MarkClear<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Ctags and cscope settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap    <M-F12>     :!ctags -R --c++-types=+p --fields=+iaS --extra=+q .<cr>
nmap    <C-F12>     :call GenerateCtags()<CR>
"兼容ctags,此设置会导致查找符号的时候不出现选择界面
"set cscopequickfix=s-,c-,d-,i-,t-,e-
set csto=0
set cscopetag
nmap <F9> :call Do_CsTag()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"authorinfo settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimrc_author='kdurant'
let g:vimrc_email='kdurant0725@gmail.com'
let g:vimrc_homepage=' '
nmap    <F4>    :AuthorInfoDetect<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"signature settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap	-	]`
nmap	0	[`

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vimwiki settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_camel_case = 1
let g:vimwiki_w32_dir_enc = 'utf-8'
let g:vimwiki_use_mouse = 1
let g:vimwiki_hl_cb_checked = 1
" 新建一个wiki并对其进行配置
let wiki                  = {}
let wiki.path             = '~/PluginConfig/vimwiki/wiki/'
let wiki.path_html        = '~/PluginConfig/vimwiki/html/'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'verilog': 'verilog'}
let wiki.template_path    = '~/PluginConfig/vimwiki/templates/'
let wiki.template_default = 'site'                         " 指定默认模板，后面我会提供一份给你做参考
let wiki.template_ext     = '.html'                        " 指定模板文件的后缀
let wiki.auto_export      = 1                              " 保存wiki源文件时自动编译成HTML
" 对新建的wiki进行注册
let g:vimwiki_list = [wiki]

"let g:vimwiki_list = [{'path': '~/PluginConfig/vimwiki',
                       "\ 'syntax': 'markdown', 'ext': '.md'}]
nmap <F5> :Vimwiki2HTMLBrowse<cr>

hi link VimwikiHeader1 Macro
hi link VimwikiHeader2 Number
hi link VimwikiHeader3 PreProc
hi link VimwikiHeader4 Conditional
hi link VimwikiHeader5 Statement
hi link VimwikiHeader6 Keyword


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"UltiSnips settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

if g:is_win == 1
    let g:UltiSnipsSnippetsDir="E:/Dropbox/home/PluginConfig/UltiSnipsDir/"
    let g:UltiSnipsSnippetDirectories=["E:/Dropbox/home/PluginConfig/UltiSnipsDir/"]
elseif g:is_unix == 1
    let g:UltiSnipsSnippetsDir="~/PluginConfig/UltiSnipsDir/"
    let g:UltiSnipsSnippetDirectories=["~/PluginConfig/UltiSnipsDir/"]
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ctrlp setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<M-d>f'
nmap <M-d>b     :CtrlPBuffer<cr>
nmap <M-d>d     :CtrlPBookmarkDir<cr>
let g:ctrlp_by_filename = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'bot,order:ttb,min:10,max:10'
let g:ctrlp_use_caching = 1
let g:ctrlp_cache_dir = $HOME.'/PluginConfig/ctrlp'
let g:ctrlp_custom_ignore = {
            \ 'dir': '\.git$\|\.hg$\|\.svn$\|release$\|work$\|PluginConfig/neocomplete$\|PluginConfig/ctrlp\|synthesize/db\|synthsize/incremental_db',
            \ 'file': '\v\.(o|pbi|cout|exe|so|dll|lnk|rpt|summary|.db)$',
            \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
            \ }
nmap <M-d>r     :CtrlPMRU<cr>
let g:ctrlp_mruf_include = '\.c$\|\.h$\|\.m$\|\.tcl$\|\.v$'
let g:ctrlp_root_markers = ['README.md']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ctrlp-match setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"hi  CtrlPMatch  guifg=#F92672
"hi  link    CtrlPMatch      Define
"let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"diff setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set diffopt=filler,context:4,vertical,foldcolumn:4
"set diffexpr=MyDiff()
autocmd BufWritePost * if &diff == 1 | diffupdate | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"align settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"align '<=#`DELAY
nmap    <silent>    ,<      :AlignCtrl lp4P1<cr>:AlignCtrl g <=#`DELAY <cr>:AlignCtrl W<cr>:%Align <=#`DELAY <cr>
"align '/' that in modelsim tcl scripts
nmap    <silent>    ,/      :AlignCtrl lp4P0<cr>:AlignCtrl g /<cr>:AlignCtrl W<cr>:%Align\s\zs\/\ze<cr>
"align '//' that in source code
nmap    <silent>    ,#      :AlignCtrl lp4P0<cr>:AlignCtrl g .\+\zs\/\/\ze\(\s*\w\+\)\@=<cr>:AlignCtrl W<cr>:%Align\/\/<cr>
"align '(' or ')' that in instance
nmap    <silent>    ,(      :AlignCtrl lp4P4<cr>:AlignCtrl g \.\w\+.*\zs(<cr>:AlignCtrl W<cr>:%Align(<cr>
nmap    <silent>    ,)      :AlignCtrl lp4P0<cr>:AlignCtrl g \.\w\+.*\zs(<cr>:AlignCtrl W<cr>:%Align)<cr>
"align '=' that in parameter, assign statement
nmap    <silent>    ,=      :AlignCtrl lp4P1<cr>:AlignCtrl g [^<\|^>]\s\zs=\ze\s.*;<cr>:AlignCtrl W<cr>:%Align[^<\|^>]\s\zs=\ze\s.*;<cr>

imap    <M-b>   begin<cr>end<esc>O

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""self function*************************************************
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"search word that is at current work path
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Search_Word()
    set autochdir
    echohl Number
    let select = input('Search current word with current file type, y or n ? ')
    if select == 'y'
        silent exe 'grep ' . expand("<cword>") . ' ' . getcwd() . '/*' . expand("%:e")
        if len(getqflist()) >= 1 && len(getqflist()) <= 10
            exe 'cw' . len(getqflist())
        elseif len(getqflist()) >= 11
            exe 'cw'
        endif
    elseif select == 'n'
        let word = input('Search string in path ' . getcwd() .":")
        if word != ''
            let file_type = input('Search string file suffix :')
            silent exe 'grep ' . word . ' ' . getcwd() . '/*' . file_type
        endif
        if len(getqflist()) >= 1 && len(getqflist()) <= 10
            exe 'cw' . len(getqflist())
        elseif len(getqflist()) >= 11
            exe 'cw'
        endif
    endif
    echo '' | echohl none
endfunction

function! Search_Word()
    set autochdir
    echohl Number
    let select = input('Search current word, [y]es or [n]o ? ')
    if select == 'y'
        call Find_project_root()
        silent exe 'grep ' . expand("<cword>") . ' *'
        exe 'cw'
    elseif select == 'n'
        call Find_project_root()
        let word = input('Search string in project root directory : ')
        if word != ''
            silent exe 'grep ' . word . ' ' . ' *'
        endif
        exe 'cw'
    endif
    echo '' | echohl none
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"replace current cursor word
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun! Replace()
    let word = input("Replace " . expand('<cword>') . " with: ")
    if word != ''
        exe '%s/\<' . expand('<cword>') . '\>/' . word . '/ge' . '| update'
    endif
    unlet! word
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"compile c, cpp, and verilog file
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CompileFile()
    if &filetype == 'verilog'
        if(isdirectory("work"))
            echohl comment | echo "Aleady has work!"
            set makeprg=vlog\ -work\ work\ %
            set errorformat=**\ Error:\ %f(%l):\ %m
            exe "make"
            exe "cw"
        else
            echohl ErrorMsg | echo "No work library!"
        endif
    elseif &filetype == 'c' || &filetype == 'cpp'
        if &filetype == 'c' | set makeprg=gcc\ -std=c99\ -Wall \Wconversion\ -o\ %<.exe\ %
        else                | set makeprg=g++\ -o\ %<.exe\ %
        endif
        silent exe "make"
        if getqflist() == []    "compile correct and no warning
            let WarnFlag = 0 | silent exe "ccl" | exe "!%<.exe"
        else
            for needle in getqflist()
                for value in values(needle)
                    if value =~ 'warning' | let WarnFlag = 1
                    elseif value =~ 'error' | let WarnFlag = 0
                    else | let WarnFlag = 0
                    endif
                endfor
            endfor
        endif
        if WarnFlag == 1
            let select = input('There are warnings! [r]un or [s]olve? ')
            if select ==  'r' | exe "!%<.exe" | exe "cw"
            elseif select == 's' | exe "cw"
            else | echohl ErrorMsg | echo "input error!"
            endif
        else | exe "cw"
        endif
    elseif &filetype == 'python'
        exe "!%<.py"
    elseif &filetype == 'vhdl'
        echohl comment | echo "Current don't support VHDL file!"
    elseif &filetype == 'lua'
        if g:is_win  == 1| exe "!luajit %"
        elseif g:is_unix == 1 | exe "!lua %"
        endif
    else
        echohl ErrorMsg | echo "This filetype can't be compiled !"
    endif
    echohl None
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"删除verilog临时的工作库
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! DeleteTmpWork()
    if &filetype == "verilog"
        let mpf=expand("*.mpf")
        if mpf =~ '\<mpf\>'
            echohl comment | echo "Work is necessary!"
        else
            exe "silent !rd /s /q work"
        endif
    else
        echohl ErrorMsg | echo "Can't delete directory!" | echohl None
    endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Usage:  :Rename[!] {newname}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=* -complete=file -bang Rename call Rename(<q-args>, '<bang>')

function! Rename(name, bang)
    let l:name    = a:name
    let l:oldfile = expand('%:p')

    if bufexists(fnamemodify(l:name, ':p'))
        if (a:bang ==# '!')
            silent exe bufnr(fnamemodify(l:name, ':p')) . 'bwipe!'
        else
            echohl ErrorMsg
            echomsg 'A buffer with that name already exists (use ! to override).'
            echohl None
            return 0
        endif
    endif

    let l:status = 1

    let v:errmsg = ''
    silent! exe 'saveas' . a:bang . ' ' . l:name

    if v:errmsg =~# '^$\|^E329'
        let l:lastbufnr = bufnr('$')

        if expand('%:p') !=# l:oldfile && filewritable(expand('%:p'))
            if fnamemodify(bufname(l:lastbufnr), ':p') ==# l:oldfile
                silent exe l:lastbufnr . 'bwipe!'
            else
                echohl ErrorMsg
                echomsg 'Could not wipe out the old buffer for some reason.' | echohl None
                let l:status = 0
            endif

            if delete(l:oldfile) != 0
                echohl ErrorMsg
                echomsg 'Could not delete the old file: ' . l:oldfile | echohl None
                let l:status = 0
            endif
        else
            echohl ErrorMsg
            echomsg 'Rename failed for some reason.' | echohl None
            let l:status = 0
        endif
    else
        echoerr v:errmsg
        let l:status = 0
    endif

    return l:status
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"look up project root directory
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !exists('g:project_root_marker')
  let g:project_root_marker = [".git", ".hg", ".svn", ".bzr", "_darcs", "CVS"]
endif

function! Find_project_root()
    let project_root = fnamemodify(".", ":p:h")

    if !empty(g:project_root_marker)
        let root_found = 0
        let candidate = fnamemodify(project_root, ":p:h")
        let last_candidate = ""

        while candidate != last_candidate
            for tags_dir in g:project_root_marker
                let tags_dir_path = candidate . "/" . tags_dir
                if filereadable(tags_dir_path) || isdirectory(tags_dir_path)
                    let root_found = 1
                    break
                endif
            endfor

            if root_found
                let project_root = candidate
                break
            endif

            let last_candidate = candidate
            let candidate = fnamemodify(candidate, ":p:h:h")
        endwhile

        return root_found ? project_root : fnamemodify(".", ":p:h")
    endif

    return project_root
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"generate cscope files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Do_CsTag()
    call Find_project_root()
    if &filetype == 'c' || &filetype == 'cpp'
        if(executable('cscope') && has("cscope") )
            if(has('unix'))
                silent! exe "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' > cscope.files"
            else
                "call system('dir /s/b *.c,*.cpp,*.h > cscope.files')
                silent! exe '!dir /s/b *.c,*.cpp,*.h > cscope.files'
            endif
            call Find_project_root()
            silent! exe 'cscope kill -1'
            call system('del cscope.out') | call system('cscope -Rb')
            if filereadable("cscope.out")
                exe 'cs add cscope.out'
            endif
        endif
    elseif &filetype == 'verilog'
        silent! exe '!dir /s/b *.v > cscope.files'
        silent! exe "cscope kill -1"
        call delete('cscope.out') | call system('cscope -Rb')
        if filereadable("cscope.out")
            exe 'cs add cscope.out'
        endif
    else
        echo "Can't generate cscope.out file!"
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <M-;>  :Dit<space>
command! -nargs=1 Dit call Wangjun(<f-args>)
function! Wangjun(git_cmd)
    if has('win32') || has('win64')
        exe "cd " . Find_project_root()
        echo iconv(system('git ' . a:git_cmd), "cp936", &enc)
        "echo iconv(system('git ' . a:git_cmd), "utf-8", &enc)
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"use system command and not prompt new window
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <M-s>  :Sys<space>
command! -nargs=1 Sys call System(<f-args>)
function! System(cmd)
    if g:is_win == 1
        call Find_project_root()
        echo iconv(system(a:cmd), "cp936", &enc)
    else
        echo "Don't complete this action!"
    endif
endfunction

function! GenerateCtags()
    exe "cd " . Find_project_root()
    if &filetype == 'c' || &filetype == 'cpp'
        call system('ctags -R --c++-types=+p --fields=+iaS --extra=+q .')
    elseif &filetype == "verilog"
        call system ('ctags --language-force=verilog -R .')
    else
        echohl  ErrorMsg | echo "Generate tags fail!" | echohl None
    endif
        exe 'set tags+=' . Find_project_root() .'/tags'
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



