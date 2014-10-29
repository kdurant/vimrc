""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""1st. vimrc config""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype plugin indent on
let g:is_win = has('win32') || has('win64')
let g:is_unix = has('unix')
if g:is_win
    "if empty(glob('~/vimfiles/autoload/plug.vim'))
        "!curl -fLo ~/vimfiles/autoload/plug.vim
                    "\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    "endif
    call plug#begin('~/vimfiles/bundle')
elseif g:is_unix
    "if empty(glob('~/.vim/autoload/plug.vim'))
        "!curl -fLo ~/.vim/autoload/plug.vim
                    "\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    "endif
    call plug#begin('~/.vim/bundle')
endif
Plug 'asins/vimcdoc', {'frozen': 1}
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'edsono/vim-matchit', {'frozen': 1}
Plug 'kdurant/Asciitable.vim'", {'frozen': 1}
Plug 'kdurant/AuthorInfo', {'frozen': 1}
Plug 'kdurant/bookmark'
Plug 'kdurant/CRefVim'
Plug 'kdurant/nerdcommenter', {'frozen': 1}
Plug 'kdurant/verilog-testbench', {'frozen': 1}
Plug 'kdurant/vim_colors', {'frozen': 1}
Plug 'kshenoy/vim-signature'
Plug 'mbriggs/mark.vim', {'frozen': 1}
Plug 'ntpeters/vim-better-whitespace'
Plug 'sergey-vlasov/ctrlp-hibuff'
Plug 'Shougo/vimproc.vim' "make -f make_mingw32.mak
if g:is_win
    Plug 'Shougo/neocomplete.vim'
elseif g:is_unix
    Plug 'Valloric/YouCompleteMe'
endif
Plug 'SirVer/ultisnips'
Plug 'KabbAmine/vCoolor.vim'
Plug 'tpope/vim-fugitive', {'frozen': 1}
Plug 'tpope/vim-surround', {'frozen': 1}
Plug 'vimwiki/vimwiki', {'frozen': 1}
Plug 'vim-scripts/Align', {'frozen': 1}
Plug 'vim-scripts/cmdline-completion', {'frozen': 1}
Plug 'vim-scripts/star-search', {'frozen': 1}
Plug 'vim-scripts/verilog_systemverilog.vim', {'frozen': 1}
Plug 'vim-scripts/verilog.vim', {'frozen': 1}
call plug#end()
if g:is_win
    map     ,so     :source ~/_vimrc<cr>
    map     ,se     :tabnew ~/_vimrc<cr>
elseif g:is_unix
    map     ,so     :source ~/.vimrc<cr>
    map     ,se     :tabnew ~/.vimrc<cr>
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
if g:is_win
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
set foldnestmax=2
set foldcolumn=4
set fillchars=fold:\ ,diff:/
nmap    ,ma         :set fdm=manual<cr>
nmap    ,in         :set fdm=indent<cr>
nmap    ,sy         :set fdm=syntax<cr>
nmap    <M-e>       ^zf%

nmap    <silent><space> @=(foldlevel('.')?'za':"\<space>")<cr>
nmap    <M-j>       zj
nmap    <M-k>       zk

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"search settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set grepprg=egrep\ -nwHR
set grepprg=grep\ -nwHr
set ignorecase
set smartcase
set incsearch
set hlsearch
nmap    <M-d>w      :setlocal wrapscan!<cr>
nmap    <M-d>h      :noh<cr>

nmap    <F6>        :call Search_Word()<cr>
nmap    ,re         :call Replace()<cr>

if g:is_win
    set path+=E:/MinGW/include/
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"window jump settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap    <C-k>       <C-W>k
nmap    <C-l>       <C-W>l
nmap    <C-h>       <C-W>h
nmap    <C-j>       <C-W>j
nmap    <M-->       <C-W>-
nmap    <M-=>       <C-W>+
nmap    <M-c>       :clo<cr>
if g:is_win
    if !executable("vimtweak.dll")
        map     ,sx     :simalt ~x<cr>
        map     ,sr     :simalt ~r<cr>
    else
        map     ,sx     :call Maximize()<cr>
        map     ,st     :call Topmost()<cr>
    endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"others key map settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap    <F2>        @@

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
"delete dos end-of-file and write
map     ,rm         :%s/\r//g<cr>:w<cr>
"remove space of line end
map     ,rn         :%s/\s\+$//g<cr>
map     ,rg         :%s/^\n\+/\r/g<cr>
map     ,rc         :%s/\i\+/&/gn|noh

map     <M-h>       :h<space>
map     <M-a>       ggVG

map     <M-d>v      :call CompileFile()<cr>

nmap    <C-P>       :cp<cr>
nmap    <C-N>       :cn<cr>
nmap    j           gj
nmap    k           gk
nmap    <M-d>n      :setlocal modifiable!<cr>
imap    <M-o>       <esc>o

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"menu bar and tool bar settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set go-=m
set go-=T
map <silent> <F12> :call MenuBar()<cr>
function! MenuBar()
    if &go =~# 'T' | set go-=T | set go-=m
    else | set go+=T | set go+=m
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"others settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('python')
    command! -nargs=+ Calc :py print <args>
    py from math import *
    map     <M-q>   :Calc<space>
endif

autocmd BufRead,BufNewFile *.cmd set filetype=cmd

if g:is_win
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
map     K       \cr
autocmd FileType lua  setlocal iskeyword+=.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"git settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap    <M-g>   :Git!<space>
nmap    <M-v>a  :!gitk --all<cr>

nmap <C-;>  :!git<space>
nmap <M-;>  :Dit<space>
"if use this function, airline don't refresh branch
command! -nargs=1 Dit call GitCmd(<f-args>)
function! GitCmd(git_cmd)
    if has('win32') || has('win64')
        exe "cd " . Search_root()
        echo iconv(system('git ' . a:git_cmd), "cp936", &enc)
    endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"session settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set viminfo+=!  " Save and restore global variables.
set sessionoptions=sesdir,help,tabpages,winsize,winpos,folds,resize
let $VIMSESSION = '~/PluginConfig/session.vim'
autocmd VimLeave * mksession! $VIMSESSION
autocmd VimLeave * let save_cursor = getpos(".")
autocmd VimEnter  call setpos('.', save_cursor)
nmap    <F7>    :so $VIMSESSION<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"airline settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='kolor'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = 'No Repo'
"let g:airline#extensions#whitespace#enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"tab settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map    <M-o>    :tabnew<cr>:setlocal buftype=nowrite<cr>
map    <M-t>    :tabm
map    <M-1>    1gt
map    <M-2>    2gt
map    <M-3>    3gt
map    <M-4>    4gt
map    <M-5>    5gt
map    <M-6>    6gt
map    <M-7>    7gt
map    <M-8>    8gt
map    <M-9>    9gt

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"neocomplete settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if g:is_win
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

    nmap     <M-b>   :NeoCompleteBufferMakeCache<cr>
    inoremap <expr><M-e>  neocomplete#cancel_popup()

    set completefunc=neocomplete#complete#auto_complete
elseif g:is_unix
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
map     <F3>    \ci
nmap    ,ca     \cA

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"mark settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mwAutoLoadMarks = 1           "autoload mark points settings
let g:mwDefaultHighlightingPalette = 'extended'         "use more colors
let g:mwAutoSaveMarks = 1           "auto save mark points
"search mark point
nmap        <M-i>   \*
nmap        <M-u>   \#
"set mark points
map         <M-m>   \mu
"clear all mark points
nmap        <M-n>   :MarkClear<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Ctags and cscope settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap    <M-F12>     :!ctags -R --c++-types=+p --fields=+iaS --extra=+q .<cr>
nmap    <C-F12>     :call GenerateCtags()<cr>
"兼容ctags,此设置会导致查找符号的时候不出现选择界面
"set cscopequickfix=s-,c-,d-,i-,t-,e-
set csto=0
set cscopetag
nmap <F9> :call Do_CsTag()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"authorinfo settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map     <F4>    :AuthorInfoDetect<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"signature settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap    -   ]`
nmap    0   [`

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

let g:UltiSnipsSnippetsDir="~/PluginConfig/UltiSnipsDir/"
let g:UltiSnipsSnippetDirectories=["E:/home/PluginConfig/UltiSnipsDir/"]
"let g:UltiSnipsSnippetDirectories=["UltiSnipsDir"]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ctrlp setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<M-d>f'
"nmap <M-d>b     :CtrlPBuffer<cr>
map <M-d>b      :CtrlPHiBuff<cr>
map <M-d>d      :CtrlPBookmarkDir<cr>
map <M-d>r      :CtrlPMRU<cr>
let g:ctrlp_by_filename = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'bot,order:ttb,min:10,max:10'
let g:ctrlp_use_caching = 1
let g:ctrlp_cache_dir = $HOME.'/PluginConfig/ctrlp'
let g:ctrlp_custom_ignore = {
            \ 'dir': '\.git$\|\.hg$\|\.svn$\|release$\|work$\|PluginConfig/neocomplete$\|PluginConfig/ctrlp\|synthesize/db\|synthsize/incremental_db',
            \ 'file': '\v\.(o|pbi|cout|exe|so|dll|lnk|rpt|summary|db)$',
            \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
            \ }
let g:ctrlp_mruf_include = '\.c$\|\.h$\|\.m$\|\.tcl$\|\.v$'
let g:ctrlp_root_markers = ['README.md']
hi  link    CtrlPMatch      Define

"diff setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set diffopt=filler,context:4,vertical,foldcolumn:4
"set diffexpr=MyDiff()
autocmd BufWritePost * if &diff | diffupdate | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"align settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"align '<=#`DELAY
nmap    <silent>    ,<      :AlignCtrl lp4P1<cr>:AlignCtrl g <=#`DELAY <cr>:AlignCtrl W<cr>:%Align <=#`DELAY <cr>
"align '/' that in modelsim tcl scripts
nmap    <silent>    ,/      :AlignCtrl lp4P0<cr>:AlignCtrl g /<cr>:AlignCtrl W<cr>:%Align\s\zs\/\ze<cr>
"align '//' that in source code
nmap    <silent>    ,#      :AlignCtrl lp4P0<cr>:AlignCtrl g \S\+.\+\zs\/\/\ze\(\s*\S\+\)\@=<cr>:AlignCtrl W<cr>:%Align\/\/<cr>
"align '(' or ')' that in instance
nmap    <silent>    ,(      :AlignCtrl lp4P4<cr>:AlignCtrl g \.\w\+.*\zs(<cr>:AlignCtrl W<cr>:%Align(<cr>
nmap    <silent>    ,)      :AlignCtrl lp4P0<cr>:AlignCtrl g \.\w\+.*\zs(<cr>:AlignCtrl W<cr>:%Align)<cr>
"align '=' that in parameter, assign statement
nmap    <silent>    ,=      :AlignCtrl lp4P1<cr>:AlignCtrl g [^<\|^>]\s\zs=\ze\s.*;<cr>:AlignCtrl W<cr>:%Align[^<\|^>]\s\zs=\ze\s.*;<cr>

imap    <M-b>   begin<cr>end<esc>O


let g:vcoolor_map = '<M-d>c'
let g:vcool_ins_rgb_map = '<M-F1>'
let g:vcool_ins_hsl_map = '<M-F2>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""self function*************************************************
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"search word that is at current work path
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:quick_list = []
let g:quick_dic ={}
function! Search_Word()
    if !empty((glob($VIMRUNTIME. "\\grep.exe")))
        set autochdir
        echohl Function
        if input('Search current word with current filetype, y or n ? ') == 'y'
            exe "cd " . Search_root()
            exe 'grep ' . expand("<cword>") . ' ' . '**/*'
            exe 'cw'
            " 遍历列表，找到里面的每个字典 " haskey() 找到不符合要求的
        endif
        echo '' | echohl none
    else
        echohl ErrorMsg | echo "No grep.exe. Please put it into $VIMRUNTIME" | echohl none
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"replace current cursor word
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun! Replace()
    let l:word = input("Replace " . expand('<cword>') . " with: ")
    if l:word != ''
        exe '%s/\<' . expand('<cword>') . '\>/' . l:word . '/ge | update'
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"compile c, cpp, and verilog file
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CompileFile()
    if &filetype == 'verilog'
        if(isdirectory("work"))
            set makeprg=vlog\ -work\ work\ %
            set errorformat=**\ Error:\ %f(%l):\ %m
            exe "make" | exe "cw"
        else
            echohl ErrorMsg | echo "No work library!"
        endif
    elseif &filetype == 'c' || &filetype == 'cpp'
        if &filetype == 'c' | set makeprg=gcc\ -std=c99\ -Wall\ -Wconversion\ -o\ %<.exe\ %
        else                | set makeprg=g++\ -o\ %<.exe\ %
        endif
        silent exe "make"
        if getqflist() == []    "compile correct and no warning
            let l:flag = 0 | silent exe "ccl" | exe "!%<.exe"
        else
            for l:inx in getqflist()
                for l:val in values(l:inx)
                    if l:val =~ 'error' | let l:flag = 1 | break
                    elseif l:val =~ 'warning' | let l:flag = 2
                    else | let l:flag = 0
                    endif
                endfor
                if l:val =~ 'error' | break | endif
            endfor
        endif
        if l:flag == 1| exe "cw"
        elseif l:flag == 2
            let l:select = input('There are warnings! [r]un or [s]olve? ')
            if l:select ==  'r' | exe "!%<.exe" | exe "cw"
            elseif l:select == 's' | exe "cw"
            else | echohl ErrorMsg | echo "input error!"
            endif
        else | exe "cw"
        endif
    elseif &filetype == 'python'
        exe "!%<.py"
    elseif &filetype == 'vhdl'
        echohl comment | echo "Current don't support VHDL file!"
    elseif &filetype == 'lua' && executable("lua")
        exe "!lua %"
    else
        echohl ErrorMsg | echo "This filetype can't be compiled !"
    endif
    echohl None
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Usage:  :Rename[!] {newname}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=* -complete=customlist,SiblingFiles -bang Rename :call Rename("<args>", "<bang>")
cabbrev rename <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Rename" : "rename"<CR>
function! SiblingFiles(A, L, P)
    return map(split(globpath(expand("%:h") . "/", a:A . "*"), "\n"), 'fnamemodify(v:val, ":t")')
endfunction
function! Rename(name, bang)
    let l:curfile = expand("%:p")
    let l:curpath = expand("%:h") . "/"
    let v:errmsg = ""
    silent! exe "saveas" . a:bang . " " . fnameescape(l:curpath . a:name)
    if v:errmsg =~# '^$\|^E329'
        let l:oldfile = l:curfile
        let l:curfile = expand("%:p")
        if l:curfile !=# l:oldfile && filewritable(l:curfile)
            silent exe "bwipe! " . fnameescape(l:oldfile)
            if delete(l:oldfile)
                echoerr "Could not delete " . l:oldfile
            endif
        endif
    else
        echoerr v:errmsg
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"look up project root directory
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !exists('g:root_marker')
  let g:root_marker = [".git"]
endif

function! Search_root()
    let l:root = fnamemodify(".", ":p:h")

    if !empty(g:root_marker)
        let root_found = 0
        let l:cur_dir = fnamemodify(l:root, ":p:h")
        let l:prev_dir = ""
        while l:cur_dir != l:prev_dir
            for tags_dir in g:root_marker
                let l:tag_path = l:cur_dir . "/" . tags_dir
                if filereadable(l:tag_path) || isdirectory(l:tag_path)
                    let root_found = 1 | break
                endif
            endfor

            if root_found
                let l:root = l:cur_dir | break
            endif

            let l:prev_dir = l:cur_dir
            let l:cur_dir = fnamemodify(l:cur_dir, ":p:h:h")
        endwhile

        return root_found ? l:root : fnamemodify(".", ":p:h")
    endif

    return l:root
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"generate cscope files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Do_CsTag()
    call Search_root()
    if &filetype == 'c' || &filetype == 'cpp'
        if(executable('cscope') && has("cscope") )
            if(has('unix'))
                silent! exe "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' > cscope.files"
            else
                "call system('dir /s/b *.c,*.cpp,*.h > cscope.files')
                silent! exe '!dir /s/b *.c,*.cpp,*.h > cscope.files'
            endif
            call Search_root()
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
"use system command and not prompt new window
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <M-s>  :Sys<space>
command! -nargs=1 Sys call System(<f-args>)
function! System(cmd)
    if g:is_win
        call Search_root()
        echo iconv(system(a:cmd), "cp936", &enc)
    else
        echo "Don't complete this action!"
    endif
endfunction

function! GenerateCtags()
    exe "cd " . Search_root()
    if &filetype == 'c' || &filetype == 'cpp'
        call system('ctags -R --c++-types=+p --fields=+iaS --extra=+q .')
    elseif &filetype == "verilog"
        call system ('ctags --language-force=verilog -R .')
    else
        echohl  ErrorMsg | echo "Generate tags fail!" | echohl None
    endif
        exe 'set tags+=' . Search_root() .'/tags'
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vimtweak settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=1 Lucency call LUcency(<f-args>)
function! LUcency(value)
    echo a:value
    call libcallnr("vimtweak.dll", "SetAlpha", a:value)
endfunction

let g:maximize = 1
function! Maximize()
    call libcallnr("vimtweak.dll", "EnableMaximize", g:maximize)
    if g:maximize == 0
        set lines=38 columns=85
        exe "winpos 570 0" | endif
    let g:maximize = !g:maximize
endfunction

let g:topmost = 1
function! Topmost()
    call libcallnr("vimtweak.dll", "EnableTopMost", g:topmost)
    let g:topmost = !g:topmost
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
