""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"airline settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &rtp =~ 'airline'
    let g:airline_extensions = ['branch', 'tabline']
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
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"deopltete settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &rtp =~ 'deoplete'
    "let g:deoplete#enable_at_startup = 1
    " 减少启动时 VimEnter autocommands 部分的时间(150ms)
    let g:deoplete#enable_at_startup = 0
    autocmd InsertEnter * call deoplete#enable()
    let g:deoplete#ignore_sources = {}
    let g:deoplete#ignore_sources._ = ['tag', 'around']
    "call deoplete#custom#source('ultisnips', 'buffer', 'rank', 9999)
    call deoplete#custom#source('ultisnips', 'rank', 1000)
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NERD Comment settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map     <space>em   \ci
map     <space>ea   \cA

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"mark settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &rtp =~ 'mark'
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
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"authorinfo settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map     <F4>    :AuthorInfoDetect<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"signature settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &rtp =~ 'signature'
    nmap    -   ]`
    nmap    0   [`
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"UltiSnips settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &rtp =~ 'UltiSnips'
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
endif
"let g:UltiSnipsSnippetDirectories=["UltiSnipsDir"]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ctrlp setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &rtp =~ 'ctrlp'
    let g:ctrlp_by_filename = 1
    let g:ctrlp_clear_cache_on_exit = 1
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_match_window = 'bot,order:ttb,min:10,max:10'
    let g:ctrlp_use_caching = 1
    let g:ctrlp_cache_dir = $HOME.'/PluginConfig/ctrlp'
    "if executable('git')
    "    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
    "    "let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard']
    "endif
    if executable('rg')
        set grepprg=rg\ --color=never
        let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
        let g:ctrlp_use_caching = 0

        let g:ackprg = 'rg --vimgrep'
        map <space>fw      :exe "cd " . Search_root()<cr>:Ack! 
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

    let g:ctrlp_map = '<space>fg'
    map <space>fb      :CtrlPBuffer<cr>
    map <space>fm      :CtrlPMRUFiles<cr>

endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"align settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &rtp =~ 'align'
    "align '<=#`DELAY
    nmap    <silent>    ,<      :AlignCtrl lp4P1<cr>:AlignCtrl g <=#`DELAY <cr>:AlignCtrl W<cr>:%Align <=#`DELAY <cr>
    "align '/' that in modelsim tcl scripts
    nmap    <silent>    ,/      :AlignCtrl lp4P0<cr>:AlignCtrl g /<cr>:AlignCtrl W<cr>:%Align\s\zs\/\ze<cr>
    "align '//' that in source code
    nmap    <silent>    ,#      :AlignCtrl lp4P0<cr>:AlignCtrl g \S\+.\+\zs\/\/\ze\(\s*\S\+\)\@=<cr>:AlignCtrl W<cr>:%Align\/\/<cr>
    "align '(' or ')' that in instance
    nmap    <silent>    ,(      :AlignCtrl lp4P4<cr>:AlignCtrl g ^\s\+\.\w\+.*\zs(<cr>:AlignCtrl W<cr>:%Align(<cr>
    nmap    <silent>    ,)      :AlignCtrl lp4P0<cr>:AlignCtrl g ^\s\+\.\w\+.*\zs(<cr>:AlignCtrl W<cr>:%Align)<cr>
    "align '=' that in parameter, assign statement
    nmap    <silent>    ,=      :AlignCtrl lp4P1<cr>:AlignCtrl g [^<\|^>]\s\zs=\ze\s.*;<cr>:AlignCtrl W<cr>:%Align[^<\|^>]\s\zs=\ze\s.*;<cr>
    
    imap    <M-b>   begin<cr>end<esc>k
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vCoolor settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vcoolor_map = '<M-d>c'
let g:vcool_ins_rgb_map = '<M-F1>'
let g:vcool_ins_hsl_map = '<M-F2>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"easymotion settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &rtp =~ 'easymotion'
    nmap    f       <Plug>(easymotion-s)
    nmap    ;       <Plug>(easymotion-next)
    nmap    ,       <Plug>(easymotion-prev)
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" executable('ag.exe')类似语句会增加启动时间
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-grep settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &rtp =~ 'vim-grep'
    let g:grepper           = {}
    let g:grepper.tools = ['git', 'ag', 'grep']
    let g:grepper.dir = 'repo,file'
    let g:grepper.repo = ['.git', '.hg', '.svn']
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nerdtree settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &rtp =~ 'nerdtree'
    let NERDTreeShowBookmarks=1
    let NERDTreeShowLineNumbers=1
    "nmap    <space>wn   :NERDTreeCWD<cr>
    nmap    <space>wn   :NERDTreeToggle<cr>
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endif


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

let g:python_highlight_all = 1

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

if &rtp =~ 'fzf'
    let g:fzf_layout = { 'down': '~30%' }
    let g:fzf_colors =
                \ { 'fg':      ['fg', 'Normal'],
                \ 'bg':      ['bg', 'Normal'],
                \ 'hl':      ['fg', 'Comment'],
                \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
                \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
                \ 'hl+':     ['fg', 'Statement'],
                \ 'info':    ['fg', 'PreProc'],
                \ 'border':  ['fg', 'Ignore'],
                \ 'prompt':  ['fg', 'Conditional'],
                \ 'pointer': ['fg', 'Exception'],
                \ 'marker':  ['fg', 'Keyword'],
                \ 'spinner': ['fg', 'Label'],
                \ 'header':  ['fg', 'Comment'] }
    " An action can be a reference to a function that processes selected lines
    function! s:build_quickfix_list(lines)
        call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
        copen
        cc
    endfunction

    let g:fzf_action = {
                \ 'ctrl-q': function('s:build_quickfix_list'),
                \ 'ctrl-t': 'tab split',
                \ 'ctrl-x': 'split',
                \ 'ctrl-v': 'vsplit' }
    autocmd! FileType fzf
    autocmd  FileType fzf set laststatus=0 noshowmode noruler
                \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif

if &rtp =~ 'vim-grepper'
    let g:grepper.repo = ['.git']
    let g:grepper.tools = ['rg', 'git']
endif

if &rtp =~ 'LeaderF'
let g:Lf_WindowHeight = 0.4
let g:Lf_WorkingDirectoryMode ='Ac'
let g:Lf_DefaultMode = 'NameOnly'
let g:Lf_CommandMap = {'<C-U>': ['<C-W>']}

map <space>fg      :LeaderfFile<cr>
map <space>fb      :LeaderfBuffer<cr>
map <space>fm      :LeaderfMru<cr>
map <space>fw      :Leaderf rg<cr>
map <space>fa      :LeaderfRgInteractive<cr>
endif
