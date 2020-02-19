"1. 下载neovim，添加环境变量
"2. pip install neovim
"3. C:\Users\wj\AppData\Local\nvim\init.vim 里加载此文件   source $HOME/_nvimrc
"4. ginit.vim里修改字体     GuiFont! Monaco:h12       GuiTabline 0   GuiPopupmenu 0
"5. 不加载此文件C:\Neovim\share\nvim\runtime\autoload\provider\clipboard.vim
"
"UpdateRemotePlugins
"

"let g:python_host_prg = 'python.exe'
"let g:python3_host_prog = 'C:/Users/wj/AppData/Local/Programs/Python/Python36/python.exe'
let g:is_win = has('win32') || has('win64')
let g:is_unix = has('unix')
let g:isnvim = 1

let g:python3_host_skip_check=1
if g:is_win
    let g:python3_host_prog = exepath('python')
else
    let g:python3_host_prog = exepath('python3')
endif


source ~/.config/nvim/user_plugin.vim

autocmd VimLeave * exec  "mksession! ~/.config/nvim_session.vim"
map     <F7>        :so ~/.config/nvim_session.vim<cr>

"set tags+=C:/questasim64_10.6c/verilog_src/uvm-1.1d/src/tags
autocmd BufEnter *.sv  set tags+=C:/questasim64_10.6c/verilog_src/uvm-1.1d/src/tags
autocmd BufLeave *.sv  set tags-=C:/questasim64_10.6c/verilog_src/uvm-1.1d/src/tags
autocmd BufEnter *.svh  set tags+=C:/questasim64_10.6c/verilog_src/uvm-1.1d/src/tags
autocmd BufLeave *.svh  set tags-=C:/questasim64_10.6c/verilog_src/uvm-1.1d/src/tags

"set guifont=Monaco:h12
set number
set mouse=a
set clipboard+=unnamed
set clipboard+=unnamedplus
set scrolloff=3
set linebreak
set noswapfile
set nowritebackup
set wrap
set splitbelow
if g:is_win
    set fileformat=dos
    set fileformats=dos
elseif g:is_unix
    set fileformat=unix
    set fileformats=unix
endif
set confirm
set splitright
set cursorline

set cindent
set shiftwidth=4
set softtabstop=4
set expandtab
set autochdir
set virtualedit=block
set suffixesadd+=.v

set ignorecase
set smartcase

set completeopt+=noinsert
set completeopt-=preview

autocmd FocusGained * :checktime
autocmd BufRead,BufNewFile *.cmd set filetype=cmd
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.ucf set filetype=ucf
autocmd FileType lua  setlocal iskeyword+=.

autocmd BufNewFile .gitignore let @i = "#basic\n.vscode\n*.pdf\n*.doc\n*.docx\n*.rar\n*.txt\n*.html\n*.jpg\n*.chm\n*.log\n*.zip\n*.xml\ntmp\nGPATH\nGRTAGS\nGTAGS*" | exe "normal \"iP"

"""""""""""""""""""""""""""""""""""""""""""""""""""
if &rtp =~ 'vim-which-key'
    nnoremap <silent> <space> :WhichKey '<Space>'<CR>
    set timeoutlen=300
    call which_key#register('<Space>', "g:which_key_map")
    "autocmd! FileType which_key
    "autocmd  FileType which_key set laststatus=0 noshowmode noruler
                "\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
    let g:which_key_map =  {}

    let g:which_key_map.e = { 'name' : '+edit' }
    let g:which_key_map.e.m = 'toggle comment'
    let g:which_key_map.e.a = 'append comment'
    let g:which_key_map.e.g = 'select all text'

    let g:which_key_map.f = { 'name' : '+文件操作' }

    let g:which_key_map.w = { 'name' : '+window' }
    let g:which_key_map.w.n = 'toggle nerdtree'
    let g:which_key_map.w.q = 'close window'
    let g:which_key_map.w.j = 'vertical inc'
    let g:which_key_map.w.k = 'vertical dec'
    let g:which_key_map.w.h = 'horizontal inc'
    let g:which_key_map.w.l = 'horizontal dec'
    let g:which_key_map.w.o = '打开标签页'
    let g:which_key_map.w.t = '垂直打开终端'

    let g:which_key_map.c = { 'name' : '+coc' }

    let g:which_key_map.d = { 'name' : '+混合' }
    let g:which_key_map.d.v = 'compile source'

    let g:which_key_map.g = { 'name' : '+git相关' }
    let g:which_key_map.g.v = 'archive git file'
    let g:which_key_map.s = { 'name' : '+搜索' }
endif


source ~/.config/nvim/basic_map.vim
source ~/.config/nvim/self_fun.vim
source ~/.config/nvim/plugin_map.vim
source ~/.config/nvim/plugin_config.vim


