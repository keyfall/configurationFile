call plug#begin('~/.vim/plugged')
Plug 'beanworks/vim-phpfmt' 
Plug 'scrooloose/nerdtree'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'vim-airline/vim-airline'
Plug 'tell-k/vim-autopep8'
Plug 'tmhedberg/SimpylFold'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'

call plug#end()
syntax enable
syntax on
set encoding=utf-8
set nu
set t_Co=256
set number
"替换buffer中切换tab
nnoremap <C-h> :bp<CR>
nnoremap <C-l> :bn<CR>
"鼠标支持
"set mouse=a

"开启代码折叠
set foldmethod=indent
set foldlevel=99

"设置F8代替:Autopep8: 
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

"Ctrl+d显示自动补全
inoremap <C-d> <C-x><C-l>

"F5运行代码
map <F5> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
        exec "w"
if &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
elseif &filetype == 'python'
            exec "!time python3 %"
elseif &filetype == 'html'
            exec "!firefox % &"
endif
    endfunc

"高亮状态栏
let g:airline#extensions#tabline#enabled = 1   " 是否打开tabline
set laststatus=2  "永远显示状态栏
let g:airline_powerline_fonts = 1  " 支持 powerline 字体
let g:airline#extensions#tabline#enabled = 1 " 显示窗口tab和buffer
let g:airline_theme='bubblegum' "选择主题
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'

"设置F3替换：NERDTreeToggle打开文件树
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

"自动补全omnicomplete
filetype plugin indent on 
autocmd FileType python set omnifunc=python3complete#Complete

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete


"缩进
set autoindent "换行时自动缩排
set tabstop=4  "tab宽度为4个字符
set shiftwidth=4 
set expandtab  "用space替代tab的输入
retab

"更改交换文件保存时间频率
set updatetime=60000
set updatecount=400

"Vim运行文件(ctrl-m)
 autocmd BufReadPre *.py noremap <buffer> <C-m> :w<CR>:!python %:p <CR>


colorscheme grimoire
"搜索显示高亮
set hlsearch

highlight Search ctermbg=green ctermfg=white 
highlight IncSearch ctermbg=black ctermfg=black 
highlight MatchParen cterm=underline ctermbg=green ctermfg=blue


" 当输入查找命令时，再启用高亮
 noremap n :set hlsearch<cr>n
 noremap N :set hlsearch<cr>N
 noremap / :set hlsearch<cr>/
 noremap ? :set hlsearch<cr>?
 noremap * :set hlsearch<cr>*
 noremap # :set hlsearch<cr>#



 nnoremap <c-h> :call DisableHighlight()<cr>
 function! DisableHighlight()
         set nohlsearch
 endfunc


