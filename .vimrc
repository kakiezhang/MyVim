"关闭vi兼容模式
set nocompatible

set background=dark

set noswapfile

"显示行号
set number
"语法高亮
syntax on

"在状态栏显示正在输入的命令
set showcmd

""短时 esc timeout
"set timeoutlen=200
"set ttimeoutlen=5

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

filetype plugin indent on
let mapleader = "z"
nnoremap <Leader>crs :set cursorline! cursorcolumn!<CR>
filetype off

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

set undofile "maintain undo history between sessions
set undodir=~/.vim/undodir

" set guifont="DejaVu\ Sans\ Mono\ for\ Powerline.ttf" "use DejaVu Sans Mono for english on win/linux, Monaco for mac"
set guifont="FiraCode\ Nerd\ Font.ttf"

let s:plug_dir = '~/.vim/plugged'

let g:plug_shallow = 0
let g:plug_window  = 'enew'
let g:plug_pwindow = 'vertical rightbelow new'

call plug#begin(s:plug_dir)
Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

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

Plug 'preservim/tagbar'

" Plug 'deoplete-plugins/deoplete-jedi'

Plug 'davidhalter/jedi-vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Plug 'junegunn/limelight.vim'

Plug 'easymotion/vim-easymotion'

Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

Plug 'MarcWeber/vim-addon-manager'

call plug#end()

filetype plugin indent on
" easy-motion
let mapleader = "m"

let g:EasyMotion_do_mapping = 0

" " <Leader>f{char} to move to {char}
" map  <Leader>f <Plug>(easymotion-bd-f)
" nmap <Leader>f <Plug>(easymotion-overwin-f)

" Gif config
map  <Leader>f <Plug>(easymotion-sn)
omap <Leader>f <Plug>(easymotion-tn)

" " s{char}{char} to move to {char}{char}
" nmap <Leader>s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" " These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" " Without these mappings, `n` & `N` works fine. (These mappings just provide
" " different highlight method and have some other features )
" map <Leader>n <Plug>(easymotion-next)
" map <Leader>N <Plug>(easymotion-prev)

" Gif config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

filetype off

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

let g:airline_left_sep = "\uE0C0"
" let g:airline_left_sep = "\uE0C4"
let g:airline_right_sep = "\uE0C5"
" let g:airline_right_sep = "\uE0C7"

" set the CN (column number) symbol:
let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])

" airline主题
let g:airline_theme = 'powerlineish'

let g:airline#extensions#tabline#enabled = 1      " 打开tabline
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 2
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1

let mapleader = "t"
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader>d :bp<CR>:bd #<CR>
filetype off

filetype plugin indent on
" vim-commentary
autocmd FileType python,shell set commentstring=#\ %s
autocmd FileType php,js set commentstring=//\ %s
autocmd FileType phtml set commentstring=<!-- %s -->
autocmd FileType mako set cms=##\ %s

" nerdtree
let g:NERDTreeIgnore = ['\~$', '\.o$', 'vendor', 'node_modules', 'bower_components', 'dist', '\.pyc$', '__pycache__']

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

" set paste open & close
map <leader>pt :set paste<CR>
map <leader>nopt :set nopaste<CR>

" GoReferrers
map <Leader>gr :GoReferrers<CR>

" clear go build tags
map <Leader>cgt :GoBuildTags ""<CR>

" Git blame
map <Leader>gb :Git blame<CR>

" vim-rust & rust-racer
let g:rustfmt_autosave = 1
" set hidden
let g:racer_cmd = "~/.cargo/bin/racer"
let g:racer_experimental_completer = 1
augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> <leader>gg <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> <leader>gs <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> <leader>gv <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
    " autocmd FileType rust nmap <buffer> <leader>gt <Plug>(rust-def-tab)
augroup END

" vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
autocmd FileType go nunmap <buffer> gd
autocmd FileType go nnoremap <buffer> <leader>gg :GoDef<CR>
autocmd FileType go nnoremap <buffer> <leader>gh :GoDefPop<CR>
setlocal omnifunc=go#complete#Complete
au FileType go setlocal omnifunc=go#complete#GocodeComplete
let g:go_fmt_command = "goimports"
let g:go_doc_popup_window = 1

" deoplete
let g:deoplete#enable_at_startup = 1
" let g:deoplete#python3_host_prog = '/usr/local/opt/python@3.8/bin/python3'
let g:deoplete#python3_host_prog = '/usr/local/bin/python3.9'

" autocmd FileType go inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" autocmd FileType go inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" autocmd FileType go inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

set completeopt+=noselect
set completeopt+=noinsert
set completeopt-=preview

" autocmd FileType go setlocal completeopt+=noselect
" autocmd FileType go setlocal completeopt+=noinsert
" autocmd FileType go setlocal completeopt-=preview

" deoplete-go
" let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
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
" let g:python3_host_prog = expand('/usr/local/opt/python@3.8/bin/python3')
let g:python3_host_prog = expand('/usr/local/bin/python3.9')
autocmd FileType python setlocal completeopt-=preview

" " Disable Jedi-vim autocompletion and enable call-signatures options
" let g:jedi#auto_initialization = 0
" let g:jedi#completions_enabled = 0
" let g:jedi#smart_auto_mappings = 0
" let g:jedi#popup_on_dot = 0
" let g:jedi#show_call_signatures = "1"

" Jump to last leave
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" " Color name (:help cterm-colors) or ANSI code
" let g:limelight_conceal_ctermfg = 'gray'
" let g:limelight_conceal_ctermfg = 240

" " Color name (:help gui-colors) or RGB color
" let g:limelight_conceal_guifg = 'DarkGray'
" let g:limelight_conceal_guifg = '#777777'

" " default: 0.5
" let g:limelight_default_coefficient = 0.2

" " Number of preceding/following paragraphs to include (default: 0)
" let g:limelight_paragraph_span = 3

" " Highlighting priority (default: 10)
" "   Set it to -1 not to overrule hlsearch
" let g:limelight_priority = -1

" autocmd BufReadPost * Limelight
" let mapleader = "z"
" nnoremap <Leader>ll :Limelight!!<CR>

let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
" nmap <F8> :TagbarToggle<CR>
nmap <leader>L :TagbarToggle<CR>

let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }


" " start MarcWeber/vim-addon-manager
" syn on

" fun! SetupVAM()
"   let c = get(g:, 'vim_addon_manager', {})
"   let g:vim_addon_manager = c
"   let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'

"   " Force your ~/.vim/after directory to be last in &rtp always:
"   " let g:vim_addon_manager.rtp_list_hook = 'vam#ForceUsersAfterDirectoriesToBeLast'

"   " most used options you may want to use:
"   " let c.log_to_buf = 1
"   " let c.auto_install = 0
"   let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
"   if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
"     execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
"         \       shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
"   endif

"   " This provides the VAMActivate command, you could be passing plugin names, too
"   call vam#ActivateAddons([], {})
" endfun
" call SetupVAM()

" ACTIVATING PLUGINS

" " OPTION 1, use VAMActivate
" VAMActivate PLUGIN_NAME PLUGIN_NAME ..

" " OPTION 2: use call vam#ActivateAddons
" call vam#ActivateAddons([PLUGIN_NAME], {})
" " use <c-x><c-p> to complete plugin names

" " OPTION 3: Create a file ~/.vim-scripts putting a PLUGIN_NAME into each line (# for comments)
" " See lazy loading plugins section in README.md for details
" call vam#Scripts('~/.vim-scripts', {'tag_regex': '.*'})
" end MarcWeber/vim-addon-manager






" ActivateAddons vim-snippets snipmate

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<C-f>"
" let g:UltiSnipsJumpForwardTrigger="<C-f>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


filetype off
