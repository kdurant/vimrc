""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""self function*************************************************
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"search word that is at current work path
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
        exe '%s/\C\<' . expand('<cword>') . '\>/' . l:word . '/ge | update'
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"compile c, cpp, and verilog file
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CompileFile()
    if &filetype == 'verilog'
        set makeprg=vlog\ -work\ work\ %
        set errorformat=**\ Error:\ %f(%l):\ %m
        if(isdirectory("work"))
            exe "make" | exe "cw"
        else
            call job_start('vlib work')
            exe "make" | exe "cw"
            call delete('work', 'rf')
            "echohl ErrorMsg | echo "No work library!"
        endif
    elseif &filetype == 'systemverilog'
        if(isdirectory("work"))
            set makeprg=vlog\ -work\ work\ -sv\ %
            set errorformat=**\ Error:\ %f(%l):\ %m
            exe "make" | exe "cw"
        else
            echohl ErrorMsg | echo "No work library!"
        endif
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
        exe "!%<.py"
    elseif &filetype == 'vhdl'
        echohl comment | echo "Current don't support VHDL file!"
    elseif &filetype == 'lua'
        if executable("lua")
            echo iconv(system("lua " . expand('%')), "cp936", &enc)
            "exe "!lua %"
        else
            echohl ErrorMsg | echo "No lua Compiler"
        endif
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
    exe "cd " . Search_root()
    if &filetype == 'c' || &filetype == 'cpp'
        if(executable('cscope') && has("cscope") )
            if(has('unix'))
                silent! exe "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' > cscope.files"
            else
                "call system('dir /s/b *.c,*.cpp,*.h > cscope.files')
                silent! exe '!dir /s/b *.c,*.cpp,*.h > cscope.files'
            endif
            exe "cd " . Search_root()
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
        call job_start('ctags -R --c++-types=+p --fields=+iaS --extra=+q .')
    elseif &filetype == "verilog"
        call system ('ctags --language-force=verilog -R .')
    else
        echohl  ErrorMsg | echo "Generate tags fail!" | echohl None
    endif
    exe 'set tags+=' . substitute(Search_root(), " ", '\\ ', "g") .'/tags'
endfunction

autocmd BufWritePost *.c call GenerateCtags()
autocmd BufWritePost *.h call GenerateCtags()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vimtweak settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=0 Lucency call LUcency()
let g:tweak_value = 235
function! LUcency()
    if executable("vimtweak.dll")
        call libcallnr("vimtweak.dll", "SetAlpha", g:tweak_value)
        if(g:tweak_value == 235) | let g:tweak_value = 255
        else | let g:tweak_value = 235
        endif
    endif
endfunction

let g:maximize = 1
function! Maximize()
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
endfunction

let g:topmost = 1
function! Topmost()
    if executable("vimtweak.dll")
        call libcallnr("vimtweak.dll", "EnableTopMost", g:topmost)
        let g:topmost = !g:topmost
    endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" find c project include dir and add it to $PATH
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Search_Inc()
    exe "cd " . Search_root()

    if !empty(finddir("include", "**", -1))
        for l:idx in finddir("include", "**", -1)
            exe "set path+=" . fnamemodify(l:idx, ":p")
        endfor
    endif

    if !empty(finddir("inc", "**", -1))
        for l:idx in finddir("inc", "**", -1)
            exe "set path+=" . fnamemodify(l:idx, ":p")
        endfor
    endif
endfunction


let g:src_pos = []
let g:head_pos =[]
function! ChangeHead()
    exe "cd " . Search_root()
    if &filetype == 'c'
        if !empty(findfile(expand("%:t:r") . '.h', "**"))
            let g:src_pos = getpos('.')
            exe "edit " . fnamemodify(findfile(expand("%:t:r") . '.h', "**"), ":p")
            call setpos('.', g:head_pos)
        else
            echohl ErrorMsg | echo "Not find head file!" | echohl NONE
        endif
    else
        if !empty(findfile(expand("%:t:r") . '.c', "**"))
            let g:head_pos = getpos('.')
            exe "edit " . fnamemodify(findfile(expand("%:t:r") . '.c', "**"), ":p")
            call setpos('.', g:src_pos)
        else
            echohl ErrorMsg | echo "Not find source file!" | echohl NONE
        endif
    endif
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if executable('astyle')
    function! Astyle()
        "silent !astyle --add-brackets %
        silent !astyle  --style=ansi --suffix=none -p %
        " --pad-oper %         "insert spaces padding around operators
        " --pad-paren-in %     "insert spaces padding around parenthesis on ther inside only
        " --suffix=none  不保存原始文件
    endfunction
endif

function! MenuBar()
    if &go =~# 'T' | set go-=T | set go-=m
    else | set go+=T | set go+=m
    endif
endfunction

if !exists('g:ag_file_types')
  let g:ag_file_types = " --verilog --cc --asm "
endif
function! AgWrap()
    if &filetype != 'verilog' && &filetype != 'c' && &filetype != 'asm' && &filetype != 'cpp'
        echohl ErrorMsg | echo "Filetype don't match" | echohl none | return
    else
        let key_word = input('Search current word, [y] or [n] or [other]? ')

        if key_word == 'y'
            exe "cd " . Search_root()
            exe "Ag! -w " . g:ag_file_types . expand("<cword>")
        elseif key_word == 'n'
            echohl Function | echo "Abolish search!" | echohl none | return
        elseif key_word == ''
            echohl Function | echo "No input!" | echohl none | return
        else
            exe "cd " . Search_root()
            exe "Ag! -w " . g:ag_file_types . key_word
        endif
    endif
endfunction
