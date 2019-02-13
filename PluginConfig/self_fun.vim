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
        set makeprg=vlog\ -work\ ~\.cache\work\ %
        set errorformat=**\ Error:\ %s\ %f(%l):\ %m
        set errorformat+=**\ Error:\ %f(%l):\ %m
        set errorformat+=**\ Error:\ %f(%l):\ %s\ %m
        exe "make" | exe "cw"
    elseif &filetype == 'systemverilog'
        set makeprg=vlog\ -work\ ~\.cache\work\ -sv\ %
        set errorformat=**\ Error:\ %s\ %f(%l):\ %m
        exe "make" | exe "cw"
    elseif &filetype == 'c' || &filetype == 'cpp' || &filetype == 'java'
        if &filetype == 'c' | set makeprg=gcc\ -std=c99\ -o\ %<.exe\ %
        elseif &filetype == 'java' | set makeprg=javac\ %
        else                | set makeprg=g++\ -o\ %<.exe\ %
        endif
        silent exe "make"
        if getqflist() == []    "compile correct and no warning
            let l:flag = 0 | silent exe "ccl" |
            if &filetype == 'java'
                echo iconv(system("java " . expand('%:r')), "utf-8", &enc)
            else
                exe "!%<.exe"
            endif
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
            if l:select ==  'r'
                if &filetype == 'java'
                    echo iconv(system("java " . expand('%:r')), "utf-8", &enc)
                else
                    exe "!%<.exe"
                    exe "cw"
                endif
            elseif l:select == 's' | exe "cw"
            else | echohl ErrorMsg | echo "input error!"
            endif
        else | exe "cw"
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

function! GenerateCtags()
    exe "cd " . Search_root()
    if &filetype == 'c' || &filetype == 'cpp'
        if g:isvim
            call job_start('ctags -R --c++-types=+p --fields=+iaS --extra=+q .')
        else
            call jobstart('ctags -R --c++-types=+p --fields=+iaS --extra=+q .')
        endif
    elseif &filetype == "verilog"
        call system ('ctags --language-force=verilog -R .')
    else
        echohl  ErrorMsg | echo "Generate tags fail!" | echohl None
    endif
    exe 'set tags+=' . substitute(Search_root(), " ", '\\ ', "g") .'/tags'
endfunction
map <silent> <F12>     :call GenerateCtags()<cr>
map <silent> <F11>     :if &filetype == 'c' <bar> exe "!%<.exe" <bar> endif <bar><cr>
"兼容ctags,此设置会导致查找符号的时候不出现选择界面
"set cscopequickfix=s-,c-,d-,i-,t-,e-
set csto=0
set cscopetag


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vimtweak settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:maximize = 1
function! Maximize()
    if g:isvim
        if executable("vimtweak.dll")
            call libcallnr("vimtweak.dll", "EnableMaximize", g:maximize)
            if g:maximize == 0
                set lines=38 columns=85
                exe "winpos 570 0"
            endif
            let g:maximize = !g:maximize
        else
            if g:maximize == 1
                exec "simalt ~x"
            else
                set lines=38 columns=85
                exe "winpos 570 0"
            endif
            let g:maximize = !g:maximize
        endif
    else
        call GuiWindowMaximized(g:maximize)
        let g:maximize = !g:maximize
    endif
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
    if has('win32') || has('win64')
        exe "cd " . Search_root()
        echo iconv(system('git ' . a:git_cmd), "utf-8", &enc)
    endif
endfunction
command! -nargs=1 Dit call GitCmd(<f-args>)
nmap    <space>dr      :Dit archive -o master.zip HEAD
nmap    <space>vc      :echo iconv(system('git checkout ' . expand("%")), "utf-8", &enc)<cr>
noremap     <space>;       :Dit<space>


function! QfMakeConv()
   let qflist = getqflist()
   for i in qflist
      "let i.text = iconv(i.text, "cp936", "utf-8")
      let i.text = substitute(i.text, '\r', '', 'g')
   endfor
   call setqflist(qflist)
endfunction
au QuickfixCmdPost * call QfMakeConv()


function! AutoColorScheme(color_timer)
    if strftime("%M") == 0
        exec 'colorscheme '.["codeschool", "quantum", "james"][strftime("%H")%3]
    endif
endfunction
"                               s   m
let color_timer = timer_start(1000*60, 'AutoColorScheme',
            \ {'repeat': -1})


function! OpenFileDir()
    if g:isnvim
        call jobstart('start '.expand("%:p:h"))
    else
        call job_start('start '.expand("%:p:h"))
    endif
endfunction
nmap <space>fo  :call OpenFileDir()<cr>

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
