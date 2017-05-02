"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"airline settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = 'No Repo'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"UltiSnips settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetsDir="~/PluginConfig/UltiSnipsDir/"
let g:UltiSnipsSnippetDirectories=["E:/home/PluginConfig/UltiSnipsDir/"]
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ctrlp setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<M-d>f'
map <M-d>b      :CtrlPBuffer<cr>
map <M-d>d      :CtrlPBookmarkDir<cr>
map <M-d>r      :CtrlPMRU<cr>
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"deopltete settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always=1
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#enable_debug=1
let g:deoplete#sources#padawan#add_parentheses = 1
let g:deoplete#sources#padawan#auto_update = 1
let g:deoplete#skip_chars = ['$']


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"easymotion settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap    f       <Plug>(easymotion-s)
nmap    ;       <Plug>(easymotion-next)
nmap    ,       <Plug>(easymotion-prev)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ctrlp setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<M-d>f'
map <M-d>b      :CtrlPBuffer<cr>
map <M-d>d      :CtrlPBookmarkDir<cr>
map <M-d>r      :CtrlPMRU<cr>
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"signature settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap    -   ]`
nmap    0   [`
