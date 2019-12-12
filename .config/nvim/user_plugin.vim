call plug#begin('~/nvim/bundle')
"Plug 'kshenoy/vim-signature'
"Plug 'SirVer/ultisnips'

Plug 'junegunn/vim-easy-align'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'liuchengxu/vim-which-key'
Plug 'rhysd/git-messenger.vim'

Plug 'Lokaltog/vim-easymotion'
"Plug 'git@github.com:kdurant/misc_mine'
Plug 'kdurant/misc_mine'
Plug 'kdurant/verilog_systemverilog.vim'
Plug 'kdurant/verilog-testbench'
Plug 'kdurant/DoxygenToolkit.vim'
Plug 'kdurant/nerdcommenter', {'frozen': 1}
Plug 'equalsraf/neovim-gui-shim'
Plug 'iamcco/markdown-preview.vim'
Plug 'amal-khailtash/vim-xdc-syntax'
Plug 'vim-scripts/ucf.vim'
Plug 'vim-python/python-syntax'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'rhysd/vim-clang-format'
Plug 'dhruvasagar/vim-table-mode'
Plug 'luochen1990/rainbow'
Plug 'voldikss/vim-floaterm'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'liuchengxu/vim-clap'
Plug 'Yggdroot/LeaderF'

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
call plug#end()

if g:is_win
let g:color_list = ["codeschool", "jellybeans", "one", 
                \ "quantum", "ayu", "apprentice",
                \ "material-monokai", "james", 
                \ "ceudah", "deus",
                \ "gruvbox", "PaperColor"
                \]
                "\ "snazzy", "github", 
                "\ "inkstained", 
                "\ "nova",
else
let g:color_list = ["jellybeans", "one", 
                \ "quantum", "ayu", "apprentice",
                \ "material-monokai",
                \ "deus",
                \ "gruvbox", "PaperColor",
                \ "snazzy",
                \ "inkstained", 
                \ "nova",
                \]
endif
if &rtp =~ 'mine'
    let s:colorscheme = g:color_list[strftime("%S")%(len(g:color_list))]
    exec 'colorscheme '. s:colorscheme
    hi Comment      gui=NONE | hi TabLine      gui=NONE | hi TabLineFill  gui=NONE | hi Boolean      gui=NONE
    hi TabLineSel   gui=NONE | hi StatusLine   gui=NONE | hi StatusLineNC gui=NONE | hi Folded       gui=NONE
    hi Character    gui=NONE | hi Exception    gui=NONE | hi Symbol       gui=NONE | hi Type         gui=NONE
else
    colorscheme evening
endif

function! AutoColorScheme(color_timer)
    if strftime("%M")%20 == 0 
        let b:colorscheme = g:color_list[(localtime()/100)%(len(g:color_list))]
        exec 'colorscheme '. b:colorscheme
        hi Comment      gui=NONE | hi TabLine      gui=NONE | hi TabLineFill  gui=NONE | hi Boolean      gui=NONE
        hi TabLineSel   gui=NONE | hi StatusLine   gui=NONE | hi StatusLineNC gui=NONE | hi Folded       gui=NONE
        hi Character    gui=NONE | hi Exception    gui=NONE | hi Symbol       gui=NONE | hi Type         gui=NONE
    endif
endfunction
"                               s   m
let color_timer = timer_start(1000*60, 'AutoColorScheme', {'repeat': -1})
