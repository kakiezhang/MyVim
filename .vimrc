
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

set backspace=indent,eol,start

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

set wildignore+=*.o,.svn,.git,*.rbc,*.pyc,__pycache__

"开启插件
filetype plugin indent on 



""""""""""""""""""""""""""""""
" php语法提示
""""""""""""""""""""""""""""""
" autocmd BufNewFile,Bufread *.ros,*.inc,*.php,*.phtml set keywordprg="help"
" set runtimepath+=/Users/kakie/.vim/phpdoc
" au FileType php setlocal dict+=/Users/kakie/.vim/phpdoc/funclist.txt
" au FileType php set complete+=k


"-- Taglist setting --
"let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
"let Tlist_Ctags_Cmd='/usr/local/bin/ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8/bin/ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=0 "让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
let Tlist_Process_File_Always=1 "实时更新tags
let Tlist_Inc_Winwidth=0
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Auto_Highlight_Tag = 1

nnoremap <F8> :TlistToggle<CR>

"for phpcomplete tips
imap <C-L> <C-X><C-O>




"开始使用Vundle的必须配置
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"使用Vundle来管理Vundle
Bundle 'gmarik/vundle'

Bundle 'shawncplus/phpcomplete.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'

" let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|dist'

Bundle 'mileszs/ack.vim'
let g:ackprg="ack2 -H --nocolor --nogroup"
" Bundle 'mattn/zencoding-vim'
" Bundle 'mattn/emmet-vim'
" Bundle 'yonchu/accelerated-smooth-scroll'

Bundle 'editorconfig/editorconfig-vim'

Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
colorscheme molokai
" let g:molokai_original = 1
" syntax enable
" set background=dark
" colorscheme solarized
" let g:solarized_termcolors=256

Bundle 'majutsushi/tagbar'
nnoremap <F9> :TagbarToggle<CR>


Bundle "airblade/vim-gitgutter"
"规格线
Bundle "Yggdroot/indentLine"
"Set mapleader
let mapleader = "z"
map <leader>il :IndentLinesToggle<CR>

Bundle "tpope/vim-commentary"
"设置Python注释字符
autocmd FileType python,shell set commentstring=#\ %s
"autocmd FileType php set commentstring=/* %s */
autocmd FileType php,js set commentstring=//\ %s
autocmd FileType phtml set commentstring=<!-- %s -->
autocmd FileType mako set cms=##\ %s

" filetype plugin on
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"补全引号
Bundle "Raimondi/delimitMate"

" Bundle 'bling/vim-airline'
" airline settings
" let g:airline_powerline_fonts=1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'


Bundle 'tpope/vim-fugitive'

Bundle 'bling/vim-airline'

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

let g:airline_powerline_fonts=1

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" airline主题
let g:airline_theme = 'powerlineish' 

set t_Co=256
set guifont="DejaVu\ Sans\ Mono\ for\ Powerline.ttf" "use DejaVu Sans Mono for english on win/linux, Monaco for mac"

map <leader><space> :%s/\s\+$//<CR>

"PowerLine插件 状态栏增强展示
" Bundle 'Lokaltog/vim-powerline'
"vim有一个状态栏 加上powline则有两个状态栏
" set laststatus=2
" set t_Co=256
" let g:Powline_symbols='fancy'
" let Powerline_symbols='compatible'
" let g:airline_powerline_fonts=1
" set guifont="DejaVu\ Sans\ Mono\ for\ Powerline.ttf" "use DejaVu Sans Mono for english on win/linux, Monaco for mac"

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

Bundle "Valloric/YouCompleteMe"
Bundle "hynek/vim-python-pep8-indent"
Bundle "scrooloose/nerdcommenter"

Bundle "vim-scripts/TabBar"

let g:Tb_MaxSize = 2
let g:Tb_TabWrap = 1

nnoremap tn :bn<CR>
nnoremap tp :bp<CR>

" 跳转到申明处
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
" 跳转到定义处
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_error_symbol = '>>'                                   " 编译错误标识符
let g:ycm_warning_symbol = '>*'                                 " 编译警告标识符
let g:ycm_confirm_extra_conf=0                                  " 关闭加载.ycm_extra_conf.py提示
let g:ycm_collect_identifiers_from_tags_files=1                 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2                     " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0                                      " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1                        " 语法关键字补全
let g:ycm_complete_in_comments = 1                              " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                               " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0     " 注释和字符串中的文字也会被收入补全
" let g:ycm_semantic_triggers = {}
" let g:ycm_semantic_triggers.c = ['->', '.', ' ', '(', '[', '&']
set completeopt=longest,menu                                    " 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif         " 离开插入模式后自动关闭预览窗口
" 回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

" YCM 补全菜单配色
" highlight Pmenu ctermfg=2 ctermbg=3 guifg=SeaGreen guibg=darkgreen    " 菜单
" highlight PmenuSel ctermfg=2 ctermbg=3 guifg=SeaGreen guibg=darkgreen " Select



" "开启插件
" filetype plugin indent on 


" " """"""""""""""""""""""""""""""
" " " php语法提示
" " """"""""""""""""""""""""""""""
" " autocmd BufNewFile,Bufread *.ros,*.inc,*.php,*.phtml set keywordprg="help"
" " set runtimepath+=/Users/kakie/.vim/phpdoc
" " au FileType php setlocal dict+=/Users/kakie/.vim/phpdoc/funclist.txt
" " au FileType php set complete+=k


" " 只有在是PHP文件时，才启用PHP补全
" au FileType php call AddPHPFuncList()
" function AddPHPFuncList()
"     set dictionary-=/Users/kakie/.vim/phpdoc/funclist.txt dictionary+=/Users/kakie/.vim/phpdoc/funclist.txt
"     set complete-=k complete+=k
" endfunction

