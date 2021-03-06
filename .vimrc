" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'KeitaNakamura/neodark.vim'
Plug 'projectfluent/fluent.vim'
call plug#end()

set incsearch
set hlsearch
"set number relativenumber

syntax on
filetype plugin indent on

syntax enable
colorscheme neodark
