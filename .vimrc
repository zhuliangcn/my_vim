" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Initialize plugin system
call plug#end()

"正确设置vimrc，读取tags（当前目录，否则向上级目录查找添加 .tags）
set tags=./.tags;,.tags

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 设置NerdTree
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

" 表示按一个tab之后，显示出来的相当于几个空格，默认的是8个
set ts=4
" 表示在编辑模式的时候按退格键的时候退回缩进的长度
set softtabstop=4
" 
set shiftwidth=4
" 当设置成 expandtab 时，缩进用空格来表示
set expandtab

set nu

set autoindent   " 打开自动缩进
set smartindent   " 打开智能缩进
