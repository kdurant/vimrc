if g:isvim
    map     ,se         :tabnew $MYVIMRC<cr>
    map     ,ma         :set fdm=manual<cr>
    map     ,in         :set fdm=indent<cr>
    map     ,sy         :set fdm=syntax<cr>
    map     <M-e>       ^zf%
    nmap     <silent><space> @=(foldlevel('.')?'za':"\<space>")<cr>
    map     ,so     :source $HOME/_vimrc<cr>
    map     ,se     :tabnew $HOME/_vimrc<cr>
else
    " 在terminal里使用<C-r>{register}
    tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
    if g:is_win
        map     ,so     :source $HOME/_nvimrc<cr>
        map     ,se     :tabnew $HOME/_nvimrc<cr>
    else
        map     ,so     :source ~/.config/nvim/init.vim<cr>
        map     ,se     :tabnew ~/.config/nvim/init.vim<cr>
    endif
    tnoremap <Esc>  <C-\><C-n>
endif

map     <M-j>       zj
map     <M-k>       zk

map     <M-d>w      :setlocal wrapscan!<cr>
map     <M-d>h      :noh<cr>
map     <M-h>       :h<space>
map     <M-a>       ggVG
map     <M-d>n      :setlocal modifiable!<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"window jump settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap     <C-k>       <C-W>k
nmap     <C-l>       <C-W>l
nmap     <C-h>       <C-W>h
nmap     <C-j>       <C-W>j
if g:isnvim
    tnoremap <C-k> <C-\><C-N><C-w>k
    tnoremap <C-l> <C-\><C-N><C-w>l
    tnoremap <C-h> <C-\><C-N><C-w>h
    tnoremap <C-j> <C-\><C-N><C-w>j
endif
map     <M-->       <C-W>-
map     <M-=>       <C-W>+
map     <M-c>       :close<cr>

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

" 删除
map     ,rm         :%s/\r//g<cr>:w<cr>
" 删除行尾空白符
map     ,rn         :%s/\s\+$//g<cr>
map     ,rg         :%s/^\n\+/\r/g<cr>
map     ,rc         :%s/\i\+/&/gn|noh

map     <C-P>       :cp<cr>
map     <C-N>       :cn<cr>
map     j           gj
map     k           gk
if g:isvim
    map <silent> <M-F12> :call MenuBar()<cr>
endif

if has('python3')
    command! -nargs=+ Calc :py3 print (<args>)
    py3 from math import *
    map     <M-w>   :Calc<space>
else
    if g:isvim
        map     <M-q>   :call job_start('calc')<cr>
    else
        map     <M-q>   :call jobstart('calc')<cr>
    endif
endif

map     Y       y$
map     K       \cr

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"git settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if g:isvim
    map     <M-v>a      :call job_start('gitk --all')<cr>
else
    map     <M-v>a      :call jobstart('gitk --all')<cr>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"tab settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map    <M-o>        :tabnew<cr>:setlocal buftype=nowrite<cr>
map    <M-1>        1gt
map    <M-2>        2gt
map    <M-3>        3gt
map    <M-4>        4gt
map    <M-5>        5gt
map    <M-6>        6gt
map    <M-7>        7gt
map    <M-8>        8gt
map    <M-9>        9gt

if g:isvim
    map     <F7>        :so $VIMSESSION<cr>
else
    autocmd VimLeave * exec  "mksession! ~/PluginConfig/nvim_session.vim"
    map     <F7>        :so ~/PluginConfig/nvim_session.vim<cr>
endif
"map     <M-d>p      :call system("pyinstaller -F -w " . expand('%'))
