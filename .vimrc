
"关闭vi兼容模式
set nocompatible 

set background=dark

"显示行号
set number
"语法高亮
syntax on

"在状态栏显示正在输入的命令
set showcmd

"增量式搜索
set incsearch 
"高亮搜索
set hlsearch 

"制表符占4个空格
set tabstop=4

"我的状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\ %*%=\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l/%L,%c][%p%%]\ %{strftime(\"%Y/%m/%d\ -\ %H:%M\")}
"总是显示状态行
set laststatus=2
"命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2

"设置搜索时忽略大小写
set ignorecase

"突出显示当前行
"set cursorline 
"设定 << 和 >> 命令移动时的宽度为 4
set shiftwidth=4 

"开启插件
filetype plugin indent on 



""""""""""""""""""""""""""""""
" php语法提示
""""""""""""""""""""""""""""""
autocmd BufNewFile,Bufread *.ros,*.inc,*.php,*.phtml set keywordprg="help"
set runtimepath+=/home/kakiezhang/.vim/phpdoc
au FileType php setlocal dict+=/home/kakiezhang/.vim/phpdoc/funclist.txt
au FileType php set complete+=k


"-- Taglist setting --
"let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Ctags_Cmd='/usr/local/bin/ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=0 "让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
let Tlist_Process_File_Always=1 "实时更新tags
let Tlist_Inc_Winwidth=0
let Tlist_Auto_Open = 1
let Tlist_Auto_Update = 1
let Tlist_Auto_Highlight_Tag = 1

nnoremap <F8> :TlistToggle<CR>





"开始使用Vundle的必须配置
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"使用Vundle来管理Vundle
Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/zencoding-vim'


Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
colorscheme molokai

Bundle 'majutsushi/tagbar'
nnoremap <F9> :TagbarToggle<CR>


Bundle "airblade/vim-gitgutter"
"规格线
Bundle "Yggdroot/indentLine"
"Set mapleader
let mapleader = ","
map <leader>il :IndentLinesToggle<CR>

Bundle "tpope/vim-commentary"
"设置Python注释字符
autocmd FileType python,shell set commentstring=#\ %s
"autocmd FileType php set commentstring=/* %s */
autocmd FileType php,js set commentstring=//\ %s
autocmd FileType phtml set commentstring=<!-- %s -->
autocmd FileType mako set cms=##\ %s

"补全引号
Bundle "Raimondi/delimitMate"

"PowerLine插件 状态栏增强展示
Bundle 'Lokaltog/vim-powerline'
"vim有一个状态栏 加上powline则有两个状态栏
set laststatus=2
set t_Co=256
let g:Powline_symbols='fancy'
let Powerline_symbols='compatible'
let g:airline_powerline_fonts=1

"Vundle配置必须 开启插件
filetype plugin indent on


map <leader>nu :set nu<CR>
map <leader>nonu :set nonu<CR>


"设置光标十字坐标，高亮当前行
set cursorline
"高亮当前行的背景颜色
hi cursorline guibg=#333333
"设置光标十字坐标，高亮当前列
set cursorcolumn
"高亮当前列的背景颜色
hi CursorColumn guibg=#333333


