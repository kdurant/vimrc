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
    call deoplete#custom#source('ultisnips', 'rank', 9000)
    call deoplete#custom#source('buffer', 'rank', 2000)

    "call deoplete#custom#option('sources', {
                "\ '_': ['ultisnips', 'buffer'],
                "\})
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
        "let g:ctrlp_user_command = 'rg %s --no-ignore --files --color=never --glob ""'
        let g:ctrlp_use_caching = 0

        set grepprg=rg\ --color=never
        let g:ackprg = 'rg --vimgrep'
        map <space>sw      :exe "cd " . Search_root()<cr>:Ack! 
        let g:which_key_map.s.w = 'git file'
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

    map <space>fg      :let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'<cr>:CtrlP<cr>
    map <space>fa      :let g:ctrlp_user_command = 'rg %s --no-ignore --files --color=never --glob ""'<cr>:CtrlP<cr>
    map <space>fb      :CtrlPBuffer<cr>
    map <space>fm      :CtrlPMRUFiles<cr>
    let g:which_key_map.f.g = 'git file'
    let g:which_key_map.f.a = 'all file'
    let g:which_key_map.f.b = 'vim buffers'
    let g:which_key_map.f.m = 'MRU'

endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"align settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &rtp =~ 'vim-easy-align'
    "align '<=#`DELAY
    nmap    <silent>    ,<      :AlignCtrl lp4P1<cr>:AlignCtrl g <=#`DELAY <cr>:AlignCtrl W<cr>:%Align <=#`DELAY <cr>
    "align '/' that in modelsim tcl scripts
    nmap    <silent>    ,/      :AlignCtrl lp4P0<cr>:AlignCtrl g /<cr>:AlignCtrl W<cr>:%Align\s\zs\/\ze<cr>
    "align '//' that in source code
    nmap    <silent>    ,#      :AlignCtrl lp4P0<cr>:AlignCtrl g \S\+.\+\zs\/\/\ze\(\s*\S\+\)\@=<cr>:AlignCtrl W<cr>:%Align\/\/<cr>

    "align '(' or ')' that in instance
    nmap    <space>a(      :normal ml<cr>:0,$EasyAlign /\..*\zs(\ze.*)/ {'left_margin': 4, 'right_margin':2}<cr>'l
    nmap    <space>a)      :normal ml<cr>:0,$EasyAlign /\..*(.*\zs)\ze/ {'left_margin': 4, 'right_margin':0}<cr>'l
    xmap <space>aa  <Plug>(EasyAlign)
    nmap <space>aa  <Plug>(EasyAlign)

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

if &rtp =~ 'FlyGrep'
    "map <space>s/      :exe "cd " . Search_root()<cr>:FlyGrep<cr>
endif

if &rtp =~ 'coc.nvim'
    set updatetime=300
    set hidden
    nmap <silent> <space>gd <Plug>(coc-definition)
    "nmap <silent> <space>gy <Plug>(coc-type-definition)
    "nmap <silent> <space>gi <Plug>(coc-implementation)
    "nmap <silent> <space>gr <Plug>(coc-references)

    call coc#add_extension(
                \ 'coc-json', 
                \ 'coc-snippets', 
                \ 'coc-tag', 
                \ 'coc-calc', 
                \ 'coc-syntax', 
                \ 'coc-lists', 
                \ 'coc-pairs', 
                \ 'coc-marketplace'
                \ )
    "autocmd CursorHold * call CocActionAsync('doHover')
    vmap <space>ef  <Plug>(coc-format-selected)
    nmap <space>ef  <Plug>(coc-format-selected)

    "inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : \<TAB>" 

    hi link CocFloating DiffAdd
    augroup mygroup
        autocmd!
        " Setup formatexpr specified filetype(s).
        autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
        " Update signature help on jump placeholder
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    nmap <space>df  <Plug>(coc-translator-p)
    let g:which_key_map.d.f = 'translator'

    "nmap <space>fg      :CocList gfiles<cr>
    nmap <space>fa      :exe "cd " . Search_root()<cr>:CocList files<cr>
    nmap <space>fm      :CocList mru<cr>
    let g:which_key_map.f.a = 'all file'
    let g:which_key_map.f.m = 'MRU'

    nmap <space>cr      :CocRestart<cr>
    let g:which_key_map.c.r = 'restart coc'
endif

if &rtp =~ 'lightline.vim'
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             ['cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }
endif

if &rtp =~ 'searchhi'
    nmap n <Plug>(searchhi-n)
    nmap N <Plug>(searchhi-N)
    nmap * <Plug>(searchhi-*)
    nmap g* <Plug>(searchhi-g*)
    nmap # <Plug>(searchhi-#)
    nmap g# <Plug>(searchhi-g#)
    nmap gd <Plug>(searchhi-gd)
    nmap gD <Plug>(searchhi-gD)

    vmap n <Plug>(searchhi-v-n)
    vmap N <Plug>(searchhi-v-N)
    vmap * <Plug>(searchhi-v-*)
    vmap g* <Plug>(searchhi-v-g*)
    vmap # <Plug>(searchhi-v-#)
    vmap g# <Plug>(searchhi-v-g#)
    vmap gd <Plug>(searchhi-v-gd)
    vmap gD <Plug>(searchhi-v-gD)

    nmap <silent> <C-L> <Plug>(searchhi-clear-all)
    vmap <silent> <C-L> <Plug>(searchhi-v-clear-all)
endif

if &rtp =~ 'git-messenger'
    nmap <space>gm <Plug>(git-messenger)
    let g:which_key_map.g.m = '显示git信息'
endif

if &rtp =~'vim-clang-format'
    let g:clang_format#auto_format = 1
    let g:clang_format#command = 'D:\Program\LLVM\bin\clang-format.exe'
    let g:clang_format#style_options = {
                \ "AlignConsecutiveAssignments" : "true",
                \ "AlignConsecutiveDeclarations" : "true",
                \ "AllowShortBlocksOnASingleLine" : "false",
                \ "AllowShortCaseLabelsOnASingleLine" : "false",
                \ "AllowShortFunctionsOnASingleLine" : "None",
                \ "AllowShortIfStatementsOnASingleLine" : "false",
                \ "AllowShortLoopsOnASingleLine" : "false",
                \ "ColumnLimit" : 0,
                \ "MaxEmptyLinesToKeep" : 1,
                \ "BreakBeforeBraces" : "Allman",
                \ "SpaceBeforeParens" : "Never",
                \ "AccessModifierOffset" : -4,
                \ "AlwaysBreakTemplateDeclarations" : "true",
                \ "SortIncludes" : "false",
                \ "UseTab" : "Never",
                \ "Standard" : "C++11"}
endif

if exists('g:fvim_loaded')
    set guifont=Monaco:h17
    " 1st param = blink animation
    " 2nd param = move animation
    set guifont=FiraCode\ NF:h17
    nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
    nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>
    nnoremap <M-x> :call rpcnotify(1, 'ToggleFullScreen', 1)<CR>
    "call rpcnotify(1, 'SetCursorAnimation', v:true, v:true)
    "
    call coc#config('suggest.completionItemKindLabels', {
                \ "text": "t",
                \ "method": ":",
                \ "function": "f",
                \ "constructor": "c",
                \ "field": ".",
                \ "variable": "v",
                \ "class": "C",
                \ "interface": "I",
                \ "module": "M",
                \ "property": "p",
                \ "unit": "U",
                \ "value": "l",
                \ "enum": "E",
                \ "keyword": "k",
                \ "snippet": "s",
                \ "color": "K",
                \ "file": "F",
                \ "reference": "r",
                \ "folder": "d",
                \ "enumMember": "m",
                \ "constant": "0",
                \ "struct": "S",
                \ "event": "e",
                \ "operator": "o",
                \ "typeParameter": "T"
                \ })
endif

if &rtp =~ 'rainbow'
    let g:rainbow_active = 1
endif

if &rtp =~ 'ack'
    if executable('rg')
        set grepprg=rg\ --color=never
        let g:ackprg = 'rg --vimgrep'
        map <space>sw      :exe "cd " . Search_root()<cr>:Ack! 
        let g:which_key_map.s.w = 'search word'
    endif
endif

if &rtp =~ 'DoxygenToolkit'
    nmap <space>ed      :Dox<cr>
    let g:which_key_map.e.d = 'c function comment'
endif

if &rtp =~ 'vim-table-mode'
    nmap <space>dt  :TableModeToggle<cr>
endif

if &rtp =~ 'floaterm'
    nmap <space>dg  :FloatermToggle<cr>
endif

if &rtp =~ 'vim-clap'
    nmap <space>sw      :Clap grep<cr>
    let g:which_key_map.s.w = 'search word input'
    nmap <space>ss      :Clap grep <cword><cr>
    let g:which_key_map.s.s = 'search word under cursor'
    nmap <space>fg      :Clap gfiles<cr>
    let g:which_key_map.f.g = 'git file'
    nmap <space>fb      :Clap buffers<cr>
    let g:which_key_map.f.b = 'vim buffers'
endif

