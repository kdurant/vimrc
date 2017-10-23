""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"airline settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='kolor'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = 'No Repo'
"let g:airline#extensions#whitespace#enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"neocomplete settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !empty(glob($HOME. "/vimfiles/bundle/neocomplete.vim"))
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

let g:UltiSnipsSnippetsDir="~/PluginConfig/UltiSnipsDir/"
let g:UltiSnipsSnippetDirectories=["C:/home/PluginConfig/UltiSnipsDir/"]

autocmd FileType snippets  setlocal expandtab
"let g:UltiSnipsSnippetDirectories=["UltiSnipsDir"]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ctrlp setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<M-d>f'
map <M-d>b      :CtrlPBuffer<cr>
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
au FileType qf set ft=c
