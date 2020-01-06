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

"设置光标十字坐标，高亮当前行
set cursorline

"高亮当前行的背景颜色
hi cursorline guibg=#333333

"设置光标十字坐标，高亮当前列
set cursorcolumn

"高亮当前列的背景颜色
hi CursorColumn guibg=#333333

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

set t_Co=256

set guifont="DejaVu\ Sans\ Mono\ for\ Powerline.ttf" "use DejaVu Sans Mono for english on win/linux, Monaco for mac"

let s:plug_dir = '~/.vim/plugged'

let g:plug_shallow = 0
let g:plug_window  = 'enew'
let g:plug_pwindow = 'vertical rightbelow new'

call plug#begin(s:plug_dir)
Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-commentary'

Plug 'scrooloose/nerdtree'

Plug 'preservim/nerdcommenter'

Plug 'kien/ctrlp.vim'

Plug 'airblade/vim-gitgutter'

" 规格线
Plug 'Yggdroot/indentLine'

" 补全引号
Plug 'Raimondi/delimitMate'

Plug 'fatih/vim-go'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

Plug 'davidhalter/jedi-vim'

call plug#end()

filetype plugin indent on
" gruvbox
colorscheme gruvbox

" airline
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

let g:airline#extensions#tabline#enabled = 1      " 打开tabline
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 2
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1

let mapleader = ""
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

nnoremap gn :bn<CR>
nnoremap gp :bp<CR>
nnoremap gd :bd<CR>:bn<CR>
filetype off

filetype plugin indent on
" vim-commentary
autocmd FileType python,shell set commentstring=#\ %s
autocmd FileType php,js set commentstring=//\ %s
autocmd FileType phtml set commentstring=<!-- %s -->
autocmd FileType mako set cms=##\ %s

" nerdtree
let g:NERDTreeIgnore = ['\~$', 'vendor', 'node_modules', 'bower_components', 'dist', '\.pyc$', '__pycache__']

" ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|dist'

" indent line
let mapleader = "z"
map <leader>il :IndentLinesToggle<CR>

" trailing space
map <leader><space> :%s/\s\+$//<CR>

" line number open & close
map <leader>nu :set nu<CR>
map <leader>nonu :set nonu<CR>

" vim-go
autocmd FileType go nunmap <buffer> gd
autocmd FileType go nnoremap <buffer> <leader>gg :GoDef<CR>
autocmd FileType go nnoremap <buffer> <leader>gh :GoDefPop<CR>
setlocal omnifunc=go#complete#Complete
let g:go_fmt_command = "goimports"

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#python3_host_prog = '~/.pyenv/versions/3.7.2/bin/python3.7'
" let g:deoplete#sources#go#python3_host_prog = '~/.pyenv/versions/3.7.2/bin/python3.7'

autocmd FileType go inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
autocmd FileType go inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
autocmd FileType go inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" set completeopt+=noselect
" set completeopt+=noinsert
" set completeopt-=preview

autocmd FileType go setlocal completeopt+=noselect
autocmd FileType go setlocal completeopt+=noinsert
autocmd FileType go setlocal completeopt-=preview

" deoplete-go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
" 打开此选项会从-source中检索完成localpackage的补全但是会变得很慢 不建议
" let g:deoplete#sources#go#source_importer = 1
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = '~/.cache/deoplete/go/'

" jedi vim
let g:jedi#goto_command = "<leader>gd"
let g:jedi#goto_assignments_command = "<leader>gg"
let g:jedi#goto_definitions_command = "<leader>gf"
let g:jedi#documentation_command = "<leader>gk"
let g:jedi#usages_command = "<leader>gn"
let g:jedi#completions_command = "<leader>gc"
let g:jedi#rename_command = "<leader>gr"
autocmd FileType python setlocal completeopt-=preview

" Jump to last leave
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

filetype off
