call plug#begin('~/nvim/bundle')
Plug 'kshenoy/vim-signature'
Plug 'SirVer/ultisnips'

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'mileszs/ack.vim'
Plug 'wsdjeg/FlyGrep.vim'

Plug 'Lokaltog/vim-easymotion'
Plug 'git@github.com:kdurant/misc_mine'
Plug 'git@github.com:kdurant/verilog_systemverilog.vim'
Plug 'git@github.com:kdurant/verilog-testbench'
Plug 'kdurant/AuthorInfo', {'frozen': 1}
Plug 'kdurant/nerdcommenter', {'frozen': 1}
Plug 'equalsraf/neovim-gui-shim'
Plug 'iamcco/markdown-preview.vim'
Plug 'vim-scripts/Align', {'frozen': 1}
Plug 'amal-khailtash/vim-xdc-syntax'
Plug 'ianva/vim-youdao-translater'
Plug 'vim-scripts/ucf.vim'
Plug 'vim-python/python-syntax'
Plug 'itchyny/lightline.vim'

"Plug 'qxxxb/vim-searchhi'

"Plug 'airblade/vim-rooter'

Plug 'joshdick/onedark.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'rakr/vim-one'
Plug 'connorholyday/vim-snazzy'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'skielbasa/vim-material-monokai'
Plug 'yuttie/inkstained-vim'
Plug 'cormacrelf/vim-colors-github'
Plug 'emhaye/ceudah.vim'
Plug 'ajmwagar/vim-deus'
Plug 'trevordmiller/nova-vim'   "不是很喜欢
Plug 'ayu-theme/ayu-vim'
Plug 'romainl/Apprentice'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'

            "Plug 'tpope/vim-fugitive', {'frozen': 1}
            "Plug 'vim-airline/vim-airline'      "增加100ms左右启动时间(opening buffers)
            "Plug 'vim-airline/vim-airline-themes'
            "Plug 'scrooloose/nerdtree'
            "Plug 'vim-scripts/vim-do-syntax'
            "Plug 'rking/ag.vim'
            "Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
            "Plug 'junegunn/fzf.vim'
            "Plug 'eugen0329/vim-esearch'
call plug#end()

let g:color_list = ["codeschool", "github", "jellybeans", "one", "snazzy", "quantum", "ayu", "apprentice",
                \ "material-monokai", "james", "inkstained", "ceudah", "deus", "nova",
                \ "gruvbox", "PaperColor"
                \]
if &rtp =~ 'mine'
    exec 'colorscheme '. g:color_list[strftime("%S")%(len(g:color_list))]
    hi Comment      gui=NONE | hi TabLine      gui=NONE | hi TabLineFill  gui=NONE | hi Boolean      gui=NONE
    hi TabLineSel   gui=NONE | hi StatusLine   gui=NONE | hi StatusLineNC gui=NONE | hi Folded       gui=NONE
    hi Character    gui=NONE | hi Exception    gui=NONE | hi Symbol       gui=NONE | hi Type         gui=NONE
else
    colorscheme evening
endif

function! AutoColorScheme(color_timer)
    if strftime("%M") == 0 || strftime("%M") == 30
        exec 'colorscheme '. g:color_list[localtime()%(len(g:color_list))]
        hi Comment      gui=NONE | hi TabLine      gui=NONE | hi TabLineFill  gui=NONE | hi Boolean      gui=NONE
        hi TabLineSel   gui=NONE | hi StatusLine   gui=NONE | hi StatusLineNC gui=NONE | hi Folded       gui=NONE
        hi Character    gui=NONE | hi Exception    gui=NONE | hi Symbol       gui=NONE | hi Type         gui=NONE
    endif
endfunction
"                               s   m
let color_timer = timer_start(1000*60, 'AutoColorScheme', {'repeat': -1})
