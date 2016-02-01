" Vim global plugin for using IAR to build a project 
" Last Change: 2013-02-12T15:23 
" Maintainer: Michael Conrad Tadpol Tilsra <tadpol@tadpol.org> 
" Revision: 0.1 


if exists("loaded_buildwithiar") 
    finish 
endif 
let loaded_buildwithiar = 1 


" requirements, you must have these enabled or this is useless. 
if(  !has('modify_fname') ) 
    finish 
endif 


let s:save_cpo = &cpo 
set cpo&vim 


if !exists("g:iarbuild_path") 
    let g:iarbuild_path = '"C:\Program Files (x86)\IAR Systems\Embedded Workbench 7.2\common\bin\IarBuild.exe"' 
endif 


if !exists("g:iarbuild_config") 
    let g:iarbuild_config = "Debug" 
endif 


"== 
" windowdir 
"  Gets the directory for the file in the current window 
"  Or the current working dir if there isn't one for the window. 
"  Use tr to allow that other OS paths, too 
function s:windowdir() 
    if winbufnr(0) == -1 
        let unislash = getcwd() 
    else  
        let unislash = fnamemodify(bufname(winbufnr(0)), ':p:h') 
    endif 
    return tr(unislash, '\', '/') 
endfunc 
" 
"== 
" Find_in_parent 
" find the file argument and returns the path to it. 
" Starting with the current working dir, it walks up the parent folders 
" until it finds the file, or it hits the stop dir. 
" If it doesn't find it, it returns "Nothing" 
function s:Find_in_parent(fln,flsrt,flstp,paths) 
    let here = a:flsrt 
    let pathlist = split(a:paths, ',') 
    "  if empty(pathlist) 
    "    let pathlist = ["."] 
    "  elseif get(pathlist, 0) != "." 
    "    insert(pathlist, ".") 
    "  endif 
    while ( strlen( here) > 0 ) 
        let paths = join(map(copy(pathlist), 'here . "/" . v:val'), ',') 
        let files = split(globpath(paths, a:fln, 1), "\n") 
        if !empty(files) 
            return files[0] 
        endif 
        let fr = match(here, "/[^/]*$") 
        if fr == -1 
            break 
        endif 
        let here = strpart(here, 0, fr) 
        if here == a:flstp 
            break 
        endif 
    endwhile 
    return "Nothing" 
endfunc 
" 
function BuildWithIAR(action) 
    let buildcmd = [g:iarbuild_path] 
    let projectfile = s:Find_in_parent("*.ewp", s:windowdir(), $HOME, ".,iar") 
    if projectfile == "" 
        let v:errmsg = "IARBUILD: Cannot find a project file!" 
        return 
    endif 
    let buildcmd += [projectfile] 
    if a:action == "clean" 
        let buildcmd += ["-clean"] 
    elseif a:action == "rebuild" 
        let buildcmd += ["-build"] 
    else 
        let buildcmd += ["-make"] 
    endif 
    let buildcmd += [g:iarbuild_config, "-log all"] 

    echo buildcmd

    let &makeprg = join(buildcmd, ' ') 
    make 
    " This works. But what I really want is to have the act of expanding makeprg 
    " automatically call a function that fills in the pieces. 
    " Perhaps look into QuickFixCmdPre ? 
    " 
    " Look into running this on file/buffer load/save and setting the local 
    " makeprg. Will that do what I want? 
endfunc 


command! -bang IM wa<bang> | call BuildWithIAR("make") 
command! -bang IB wa<bang> | call BuildWithIAR("rebuild") 
command! -bang IC wa<bang> | call BuildWithIAR("clean") 


let &cpo = s:save_cpo 
" vim: set ai cin et sw=2 ts=2 : 

