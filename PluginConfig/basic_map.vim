if g:isvim
    map     ,se         :tabnew $MYVIMRC<cr>
    map     ,ma         :set fdm=manual<cr>
    map     ,in         :set fdm=indent<cr>
    map     ,sy         :set fdm=syntax<cr>
    "nmap     <silent><space> @=(foldlevel('.')?'za':"\<space>")<cr>
    map     ,so         :source $HOME/_vimrc<cr>
    map     ,se         :tabnew $HOME/_vimrc<cr>
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
    nmap <C-6>          :e #<cr>
endif

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
nmap    <space>wj   <C-W>-
nmap    <space>wk   <C-W>+
nmap    <space>wh   <C-W>>
nmap    <space>wl   <C-W><
autocmd FileType qf noremap <buffer> <esc> :close<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"others key map settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map     <F2>        @@
imap    <M-;>       <Esc>A;<Esc>
nmap    <M-;>       <Esc>A;<Esc>

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

if has('python3')
    command! -nargs=+ Calc :py3 print (<args>)
    "py3 from math import *  " 此语句导致启动窗口变小
    map     <space>dc   :Calc<space>
else
    if g:isvim
        map     <space>dc   :call job_start('calc')<cr>
    else
        map     <space>dc   :call jobstart('calc')<cr>
    endif
endif
let g:which_key_map.d.c = '计算器'

map     Y       y$
map     K       \cr
"map     <M-d>p      :call system("pyinstaller -F -w " . expand('%'))


"tab settings
map     <space>wt        :vs<cr>:e term://bash<cr>:set filetype=modelsim<cr>
map     <space>wo        :tabnew ~/.cache/tmp.txt<cr>
map     <space>1         1gt
map     <space>2         2gt
map     <space>3         3gt
map     <space>4         4gt
map     <space>5         5gt
map     <space>6         6gt
map     <space>7         7gt
map     <space>8         8gt
map     <space>9         9gt
nmap    <tab>            :tabn<cr>
nmap    <S-tab>          :tabp<cr>

map    <space>dw        :setlocal wrapscan!<cr>
map    <space>dh        :noh<cr>
map    <space>dn        :setlocal modifiable!<cr>
map    <space>eg        ggVG
map    <space>wq        :close<cr>

map!    <M-j>           <Down>
map!    <M-k>           <Up>
map!    <M-h>           <left>
map!    <M-l>           <Right>

nnoremap <silent> <F5> :update<Bar>silent !start chrome.exe "file://%:p"<CR>

nmap <space>fo  :call system('explorer .')<cr>
let g:which_key_map.f.o = '打开当前文件目录'

