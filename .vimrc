" ~/.vimrc

"""""""""""""""""""""""""""""""""" Vundle """"""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.


""""""""""" auto-pairs
Plugin 'jiangmiao/auto-pairs'
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'


""""""""""" ctrlp.vim
Plugin 'kien/ctrlp.vim'
set wildignore+=*/tmp/*,*.a,*.la,*.so,*.so.*,*.swp,*.zip,*.tar.gz,.git,.svn,*.deb,*.rpm


"""""""""""  minibufexpl.vim
Plugin 'fholgado/minibufexpl.vim'

"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplorerMoreThanOne = 0
"let g:miniBufExplUseSingleClick = 1
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplVSplit = 30
"let g:miniBufExplSplitBelow= 1

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

map <Leader>e :MBEOpen<cr>
map <Leader>c :MBEClose<cr>
map <Leader>t :MBEToggle<cr>
nnoremap <F12> :MBEToggle<CR>

" MiniBufExpl Colors
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg


""""""""""" nerdcommenter
Plugin 'scrooloose/nerdcommenter'

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"使用语法高亮定义代码折叠
set foldmethod=syntax
"打开文件是默认不折叠代码
set foldlevelstart=99"


""""""""""" nerdtree
Plugin 'scrooloose/nerdtree'
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


""""""""""" numbers.vim
Plugin 'myusuf3/numbers.vim'
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>


""""""""""" rainbow
Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}


""""""""""" SQLComplete.vim
Plugin 'vim-scripts/SQLComplete.vim'


""""""""""" syntastic
Plugin 'scrooloose/syntastic'


""""""""""" tagbar
Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>


""""""""""" vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

set t_Co=256
set laststatus=2
let g:airline_theme = "tomorrow"
"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

function! AccentDemo()
  let keys = ['l','u','o','x','u','3','4','@']
  for k in keys
    call airline#parts#define_text(k, k)
  endfor
  call airline#parts#define_accent('l', 'red')
  call airline#parts#define_accent('u', 'green')
  call airline#parts#define_accent('o', 'blue')
  call airline#parts#define_accent('x', 'yellow')
  call airline#parts#define_accent('u', 'orange')
  call airline#parts#define_accent('3', 'purple')
  call airline#parts#define_accent('4', 'bold')
  call airline#parts#define_accent('@', 'italic')
  let g:airline_section_a = airline#section#create(keys)
endfunction
autocmd VimEnter * call AccentDemo()


""""""""""" vim-colors-solarized
Plugin 'altercation/vim-colors-solarized'


""""""""""" vim-fugitive
Plugin 'tpope/vim-fugitive'


""""""""""" vim-indent-guides
Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626   ctermbg=235 "238
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#262626   ctermbg=235 "235
nnoremap <F10> :IndentGuidesToggle<CR>


""""""""""" vim-plugins
" Plugin 'WolfgangMehner/vim-plugins'


""""""""""" vim-tmux-navigator
Plugin 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>


""""""""""" YouCompleteMe
"Plugin 'Valloric/YouCompleteMe'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"""""""""""""""""""""""""""""""""" Custom Config """"""""""""""""""""""""""""""""""

syntax enable           " 开启语法高亮功能
syntax on               " 允许用指定语法高亮配色方案替换默认方案

filetype on
filetype plugin on
filetype indent on

colorscheme solarized
set background=dark

set mouse=

set history=50                  " 保留历史命令个数
set number                      " 显示行号
set cursorline                  " 突出显示当前行
set autochdir                   " 自动切换当前目录为当前文件所在的目录
set showcmd                     " 显示命令

set expandtab                   " 空格替换TAB
set shiftwidth=4                " 缩进空格数
set tabstop=4                   " 硬TAB
set softtabstop=4               " 软TAB
set smarttab                    " 智能TAB
set shiftwidth=4                " 设定 << 和 >> 命令移动时的宽度为 4

set autoindent                  " 自动缩进
set cindent
set smartindent
set wrap                        " 自动换行

set ignorecase                  " 搜索时忽略大小写
set smartcase
set hlsearch
set incsearch
set nolazyredraw                " Don't redraw while executing macros
set magic                       " Set magic on, for regular expressions

set showmatch                   " 插入括号时，短暂地跳转到匹配的对应括号
set matchtime=2                 " 匹配括号高亮的时间（单位是十分之一秒）

set scrolloff=8                 " 光标上下两侧最少保留的屏幕行数
set sidescrolloff=8             " 如果设置 'nowrap'，光标左右两侧保留的最少屏幕列数

set ambiwidth=double            " 防止特殊符号无法正常显示。
set fileformat=unix             " 设置<EOL>格式
set fileformats=unix,dos,mac    " 设置<EOL>格式

set encoding=utf8
set fileencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gbk,gb2312,cp936,usc-bom,euc-jp,gb18030

let mapleader = ","

" insert模式下光标移动快捷键
inoremap <C-b> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>

" insert模式下使用backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Turn off backups and undo
set nobackup
set nowb
set noswapfile

" 记住上次编辑的位置
autocmd BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("normal '\"")|else|exe "normal $"|endif|endif

"vim -b : 用xxd格式编辑二进制文件
augroup Binary
    autocmd!
    autocmd BufReadPre  *.bin,*.o,*.so,*.a let &bin=1
    autocmd BufReadPost *.bin,*.o,*.so,*.a if &bin | %!xxd
    autocmd BufReadPost *.bin,*.o,*.so,*.a set ft=xxd | endif
    autocmd BufWritePre *.bin,*.o,*.so,*.a if &bin | %!xxd -r
    autocmd BufWritePre *.bin,*.o,*.so,*.a endif
    autocmd BufWritePost *.bin,*.o,*.so,*.a if &bin | %!xxd
    autocmd BufWritePost *.bin,*.o,*.so,*.a set nomod | endif
augroup End

