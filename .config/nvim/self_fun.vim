""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"replace current cursor word
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun! Replace()
    let l:word = input("Replace " . expand('<cword>') . " with: ")
    if l:word != ''
        exe '%s/\C\<' . expand('<cword>') . '\>/' . l:word . '/ge | update'
    endif
endfunction
map     ,re         :call Replace()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"compile c, cpp, and verilog file
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CompileFile()
    if &filetype == 'verilog'
        set makeprg=vlog\ -work\ $HOME\.cache\work\ -quiet\ -lint\ %
        set errorformat=**\ Error:\ %s\ %f(%l):\ %m
        set errorformat+=**\ Error:\ %f(%l):\ %m
        set errorformat+=**\ Error:\ %f(%l):\ %s\ %m
        exe "make" | exe "cw"
    elseif &filetype == 'systemverilog'
        set makeprg=vlog\ -work\ ~\.cache\work\ -sv\ %
        set errorformat=**\ Error:\ %s\ %f(%l):\ %m
        exe "make" | exe "cw"
    elseif &filetype == 'rust'
        if iconv(system("rustc " . expand('%')), "cp936", &enc) !~ 'error'
            if g:is_win | exe "!%<.exe" | else | exe "!./%<" | endif
        else
            echo iconv(system("rustc " . expand('%')), "cp936", &enc)
        endif

    elseif &filetype == 'c' || &filetype == 'cpp' || &filetype == 'java'

        if file_readable('makefile')
            set makeprg=make
        else
            if &filetype == 'c' | set makeprg=gcc\ -std=c99\ %
            else | set makeprg=g++\ %
            endif
        endif
        silent exe "make"

        " l:flag = 0, 没有错误和警告；
        " l:flag = 1，有警告，但没有错误
        " l:flag = 2, 有错误
        if getqflist() == []    "compile correct and no warning
            let l:flag = 0 | silent exe "ccl" |
        else
            for l:inx in getqflist()
                for l:val in values(l:inx)
                    if l:val =~ 'error' | let l:flag = 2 | break
                    elseif l:val =~ 'warning' | let l:flag = 1
                    else | let l:flag = 0
                    endif
                endfor
                if l:val =~ 'error' | break | endif
            endfor
        endif

        if l:flag == 1
            let l:select = input('There are warnings! [r]un or [s]olve? ')
            if l:select ==  'r'
                if g:is_win | exe "!a.exe"
                else | exe "!./a.out" | endif
            elseif l:select == 's' | exe "cw"
            else | echohl ErrorMsg | echo "input error!"
            endif
        elseif l:flag == 2
            exe "copen"
        else 
            if g:is_win | exe "!a.exe"
            else | exe "!./a.out" | endif
        endif
    elseif &filetype == 'cs'
        set makeprg = csc\ \nologo\ %
        silent exe "make"
    elseif &filetype == 'python'
        if executable("python")
            set autochdir
            echo iconv(system("python " . expand('%')), "cp936", &enc)
        else
            echohl ErrorMsg | echo "No python Compiler"
        endif
        "exe "!%<.py"
    elseif &filetype == 'vhdl'
        echohl comment | echo "Current don't support VHDL file!"
    elseif &filetype == 'lua'
        if executable("lua")
            echo iconv(system("lua " . expand('%')), "cp936", &enc)
            "exe "!lua %"
        else
            echohl ErrorMsg | echo "No lua Compiler"
        endif
    elseif &filetype == 'dosbatch'
        echo iconv(system(expand('%')), "cp936", &enc)
    elseif &filetype == 'javascript' || &filetype == 'typescript'
        echo iconv(system("node " . expand('%')), "cp936", &enc)
    else
        echohl ErrorMsg | echo "This filetype can't be compiled !"
    endif
    echohl None
endfunction
map     <space>dv      :call CompileFile()<cr>

function! PacketPythonExe()
    if &filetype == 'python'
        "call system("pyinstaller -F -w " . expand('%'))
        exe "!pyinstaller -F -w  %"
    else
        echohl ErrorMsg | echo "Can't packet this filetype!"
    endif
endfunction
map     <space>dp      :call PacketPythonExe()<cr>

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
map     ,sg     :exe "cd " . Search_root()<cr>:tabnew .gitignore<cr>


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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vimtweak settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:maximize = 1
function! Maximize()
    call GuiWindowMaximized(g:maximize)
    let g:maximize = !g:maximize
endfunction

if g:is_win
    map     <M-x>   :call Maximize()<cr>
endif


" 加载时间很长(50ms)
"   if executable('astyle')   
"       function! Astyle()
"           "silent !astyle --add-brackets %
"           silent !astyle  --style=ansi --suffix=none -p %
"           " --pad-oper %         "insert spaces padding around operators
"           " --pad-paren-in %     "insert spaces padding around parenthesis on ther inside only
"           " --suffix=none  不保存原始文件
"       endfunction
"   endif

function! GitCmd(git_cmd)
    exe "cd " . Search_root()
    echo iconv(system('git ' . a:git_cmd), "utf-8", &enc)
    set autochdir
endfunction
command! -nargs=1 Dit call GitCmd(<f-args>)
noremap     <space>;       :Dit<space>

nmap     <space>gg      :call jobstart('gitk --all')<cr>
let g:which_key_map.g.g = '打开GUI视图'
nmap     <space>gl      :echo iconv(system('git log ' . expand("%:p")), "utf-8", &enc)<cr>
let g:which_key_map.g.l = '显示当前文件修改历史记录'

nmap    <space>gv      :Dit archive -o master.zip HEAD
let g:which_key_map.g.v = '打包当前commit'
nmap    <space>gc      :echo iconv(system('git checkout ' . expand("%")), "utf-8", &enc)<cr>
let g:which_key_map.g.c = '撤销工作区文件修改'
nmap    <space>gr      :echo iconv(system('git reset HEAD ' . expand("%")), "utf-8", &enc)<cr>
let g:which_key_map.g.r = '撤销暂存区文件修改'
nmap    <space>ga      :Dit add .<cr>
let g:which_key_map.g.a = '提交工作区'

function! QfMakeConv()
   let qflist = getqflist()
   for i in qflist
      "let i.text = iconv(i.text, "cp936", "utf-8")
      let i.text = substitute(i.text, '\r', '', 'g')
   endfor
   call setqflist(qflist)
endfunction
au QuickfixCmdPost * call QfMakeConv()

function! BuildTabLine()
    let result = ''
    for i in range(tabpagenr('$'))
        let tab     = i + 1
        let winnr   = tabpagewinnr(tab)
        let winlen  = tabpagewinnr(tab, '$')
        let buflist = tabpagebuflist(tab)
        let bufnr   = buflist[winnr - 1]
        "let bufname = fnamemodify(bufname(bufnr), ':p:~:.')
        let bufname = fnamemodify(bufname(bufnr), ':t')

        " tab color
        let result .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')

        " tab label
        let result .= ' ' . tab . '. '
        " pathname/filename
        if (bufname != '')
            let fnames = split(bufname, '/')
            let flen = len(fnames)
            let fname = fnames[flen - 1]
            let result .= flen > 1 ? (fnames[flen - 2] . '/' . fname) : fname
        else
            let result .= '[No Name]'
        endif

        " buflist modified
        for winindex in range(winlen)
            if getbufvar(buflist[winindex], "&modified")
                let result .= (buflist[winindex] == bufnr ? '[+]' : '[~]')
                break
            endif
        endfor

        let result .= ' '
    endfor
    let result .= '%T%#TabLineFill#%='
    return result
endfunction
set tabline=%!BuildTabLine()


function! Semicolon()
    let s:len = strlen(getline('.'))
    let s:cursor = col('.')
    let s:line = getline('.')

    let @z = ";"
    if (&filetype == 'c' || &filetype == 'cpp' || &filetype == 'rust' ) && (s:line !~# "for")
        if s:line[s:cursor] == ')' || s:line[s:cursor] == '"' || s:line[s:cursor] == "'" || s:line[s:cursor] == "]"
            if s:line[s:len-1] != ';'
                exe "normal $\"zp"
            else
                exe "normal \"zp"
            endif
        else
            exe "normal \"zp"
        endif
    else
        exe "normal \"zp"
    endif
endfunction
inoremap ; <Esc>:call Semicolon()<cr>a
"imap    <M-;>       <Esc>A;<Esc>
"nmap    <M-;>       <Esc>A;<Esc>
