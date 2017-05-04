map     ,so     :source $MYVIMRC<cr>
"map     ,se     :tabnew $MYVIMRC<cr>
map     ,se     :tabnew ~/_nvimrc<cr>



map     <M-j>       zj
map     <M-k>       zk

map     <M-d>w      :setlocal wrapscan!<cr>
map     <M-d>h      :noh<cr>

"map     <F6>        :call AgWrap()<cr>
"map     ,re         :call Replace()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"window jump settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map     <C-k>       <C-W>k
map     <C-l>       <C-W>l
map     <C-h>       <C-W>h
map     <C-j>       <C-W>j
map     <M-->       <C-W>-
map     <M-=>       <C-W>+
map     <H>         <C-W><
map     <L>         <C-W>>
map     <M-c>       :clo<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"others key map settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map     <F2>        @@

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
map     ,rm         :%s/\r//g<cr>:w<cr>
map     ,rn         :%s/\s\+$//g<cr>
map     ,rg         :%s/^\n\+/\r/g<cr>
map     ,rc         :%s/\i\+/&/gn|noh

map     <M-h>       :h<space>
map     <M-a>       ggVG

"map     <M-d>v      :call CompileFile()<cr>

map     <C-P>       :cp<cr>
map     <C-N>       :cn<cr>
map     j           gj
map     k           gk
map     <M-d>n      :setlocal modifiable!<cr>
imap    <M-o>       <esc>o

"map     <M-d>e      :call ChangeHead()<cr>

"map <silent> <M-F12> :call MenuBar()<cr>

if has('python3')
    command! -nargs=+ Calc :py3 print (<args>)
    py3 from math import *
    map     <M-q>   :Calc<space>
else
    map     <M-q>   :call job_start('calc')<cr>
endif

map     Y       y$
map     K       \cr

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"git settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map     <M-g>       :Git!<space>
"map     <M-v>a      :call job_start('gitk --all')<cr>
"map     <M-v>s      :Dit st<cr>

"map     <M-;>       :Dit<space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"tab settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map    <M-o>        :tabnew<cr>:setlocal buftype=nowrite<cr>
map    <M-t>        :tabm
map    <M-1>        1gt
map    <M-2>        2gt
map    <M-3>        3gt
map    <M-4>        4gt
map    <M-5>        5gt
map    <M-6>        6gt
map    <M-7>        7gt
map    <M-8>        8gt
map    <M-9>        9gt

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"session settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map     <F7>        :so ~/Session.vim<cr>
set viminfo+=!  " Save and restore global variables.
set sessionoptions=sesdir,help,tabpages,winsize,winpos,resize
autocmd VimLeave *  mksession! ~/Session.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"git settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map     ,sg     :exe "cd " . Search_root()<cr>:tabnew .gitignore<cr>

command! -nargs=1 Dit call GitCmd(<f-args>)
map     <M-g>       :Git!<space>
nmap    <M-v>a      :call jobstart('gitk --all')<cr>
nmap    <M-v>s      :Dit st<cr>

map     <M-;>       :Dit<space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NERD Comment settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map     <F3>    \ci
map     ,ca     \cA

map     <F6>        :call AgWrap()<cr>
map     ,re         :call Replace()<cr>

