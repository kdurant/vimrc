""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"airline settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = 'No Repo'
"let g:airline#extensions#whitespace#enabled = 1
if g:isnvim
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
    let g:airline#extensions#tabline#show_tab_nr = 1
    let g:airline#extensions#tabline#show_tab_type = 0
    let g:airline#extensions#tabline#formatter = 'default'
    let g:airline#extensions#tabline#buffer_nr_show = 0
    let g:airline#extensions#tabline#fnametruncate = 16
    let g:airline#extensions#tabline#fnamecollapse = 2
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    let g:airline#extensions#tabline#fnamemod = ':p:t'
    let g:airline#extensions#hunks#enabled = 0
    let g:airline#extensions#tabline#show_buffers = 0
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"neocomplete settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if g:isvim
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

    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

    let g:neocomplete#data_directory='$HOME\PluginConfig\neocomplete'

    nmap     <M-b>   :NeoCompleteBufferMakeCache<cr>
    inoremap <expr><M-e>  neocomplete#cancel_popup()

    set completefunc=neocomplete#complete#auto_complete

    if has('python3')
        autocmd FileType python setlocal omnifunc=python3complete#Complete
    else
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    endif
else
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "deopltete settings
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let g:deoplete#enable_at_startup = 1
    "let g:deoplete#enable_refresh_always=1
    "let g:deoplete#auto_completion_start_length = 1
    "let g:deoplete#enable_debug=1
    "let g:deoplete#sources#padawan#add_parentheses = 1
    "let g:deoplete#sources#padawan#auto_update = 1
    "let g:deoplete#skip_chars = ['$']
    let g:deoplete#ignore_sources = {}
    let g:deoplete#ignore_sources._ = ['tag', 'around']
    "call deoplete#custom#source('ultisnips', 'buffer', 'rank', 9999)
    call deoplete#custom#source('ultisnips', 'rank', 1000)
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NERD Comment settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map     <F3>    \ci
map     ,ca     \cA

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
map         <M-n>   :MarkClear<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Ctags and cscope settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent> <F12>     :call GenerateCtags()<cr>
map <silent> <F11>     :if &filetype == 'c' <bar> exe "!%<.exe" <bar> endif <bar><cr>
"兼容ctags,此设置会导致查找符号的时候不出现选择界面
"set cscopequickfix=s-,c-,d-,i-,t-,e-
set csto=0
set cscopetag
map         <F9> :call Do_CsTag()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"authorinfo settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map     <F4>    :AuthorInfoDetect<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"signature settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap    -   ]`
nmap    0   [`

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"UltiSnips settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

if g:is_win
    let g:UltiSnipsSnippetsDir="~/PluginConfig/UltiSnipsDir/"
    let g:UltiSnipsSnippetDirectories=["C:/home/PluginConfig/UltiSnipsDir/"]
else
    let g:UltiSnipsSnippetsDir="~/config/nvimPluginConfig/UltiSnipsDir/"
    let g:UltiSnipsSnippetDirectories=["~/config/nvimPluginConfig/UltiSnipsDir/"]
endif

autocmd FileType snippets  setlocal expandtab
"let g:UltiSnipsSnippetDirectories=["UltiSnipsDir"]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ctrlp setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<space>f'
map <space>b      :CtrlPBuffer<cr>
map <space>m      :CtrlPMRU<cr>
let g:ctrlp_by_filename = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'bot,order:ttb,min:10,max:10'
let g:ctrlp_use_caching = 1
let g:ctrlp_cache_dir = $HOME.'/PluginConfig/ctrlp'
if executable('git')
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
    "let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard']
endif
"let g:ctrlp_custom_ignore = {
            "\ 'dir': '\.git$\|\.hg$\|\.svn$\|release$\|work$\|PluginConfig/neocomplete$\|PluginConfig/ctrlp\|output_files\|incremental_db\|db',
            "\ 'file': '\v\.(o|pbi|cout|exe|so|dll|ppf|lnk|qip|rpt|csv|wlf|)$',
            "\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
            "\ }
let g:ctrlp_mruf_include = '\.c$\|.h$\|\.m$\|\.tcl$\|\.v$\|\.java$\|\.lua$\|'
let g:ctrlp_root_markers = ['README.md']
hi  link    CtrlPMatch      Define
hi  link    CtrlPBufferPath PreProc

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

imap    <M-b>   begin<cr>end<esc>k

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vCoolor settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vcoolor_map = '<M-d>c'
let g:vcool_ins_rgb_map = '<M-F1>'
let g:vcool_ins_hsl_map = '<M-F2>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"easymotion settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap    f       <Plug>(easymotion-s)
nmap    ;       <Plug>(easymotion-next)
nmap    ,       <Plug>(easymotion-prev)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ag settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:ag_prg="git grep -n"
let g:ag_highlight=1
let g:ag_mapping_message = 0
"au FileType qf set ft=c

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-grep settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:grepper           = {}
let g:grepper.tools = ['git', 'ag', 'grep']
let g:grepper.dir = 'repo,file'
let g:grepper.repo = ['.git', '.hg', '.svn']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nerdtree settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowBookmarks=1
let NERDTreeShowLineNumbers=1
nmap    <M-b>   :NERDTreeCWD<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"astyle settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap    <M-f>   :call FormatCode()<cr>
func! FormatCode()  
    if executable('astyle')
        if &filetype == 'c' || &filetype == 'h'  || &filetype == 'cpp'
            echo iconv(system("astyle --style=ansi --ascii -pnU " . expand("%")), "utf-8", &enc)
        endif  
    else
        echoerr "Please check astyle.exe in execute path"
    endif
endfunc  


"           """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"           "gutentags settings
"           """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"           let g:gutentags_modules = ['ctags', 'gtags_cscope']
"           " gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
"           let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
"           
"           " 所生成的数据文件的名称
"           let g:gutentags_ctags_tagfile = '.tags'
"           
"           " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
"           let s:vim_tags = expand('~/.cache/tags')
"           let g:gutentags_cache_dir = s:vim_tags
"           
"           " 配置 ctags 的参数
"           let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
"           let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
"           let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
"           
"           " 检测 ~/.cache/tags 不存在就新建
"           if !isdirectory(s:vim_tags)
"              silent! call mkdir(s:vim_tags, 'p')
"           endif
